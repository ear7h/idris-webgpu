module Example.Triangle1

-- import System
import Data.List.Quantifiers
import Data.Buffer
-- import System.File.ReadWrite
import Control.Monad.Maybe
import Control.Monad.Trans

import Graphics.WGPU.Sys
import Graphics.GLFW.Sys
import Graphics.GLFW3WebGPU
import Graphics.Wavefront

import Utils.FFI

import System.ScopedIO

-- %ambiguity_depth 6
-- %auto_implicit_depth 200
-- %search_timeout 2000

TODO : String -> a
TODO msg = assert_total $ idris_crash $ "TODO: " ++ msg

dbg : Show a => a -> a
dbg x = unsafePerformIO $ do
  putStrLn "dbg: \{ show x }\n"
  pure x

Show (Ptr t) where
  show p = show $ the (Int64) $ believe_me p

Show (Ref _ t) where
  show p = show $ the (Int64) $ believe_me p

while :
  (0 a' : Lifetime) ->
  ((0 b' : Lifetime) -> ( 0 p1 : AtLeastAsLong a' b' ) -> ScopedIO b' Bool) ->
  ((0 c' : Lifetime) -> ( 0 p2 : AtLeastAsLong a' c' ) -> ScopedIO c' ()) ->
  ScopedIO a' ()
while a' cond body = do
  cond' <- runSubScopedIO a' cond
  when cond' (runSubScopedIO a' body *> while a' cond body)

wgpuStringRef : String -> ScopedIO a' (Ref a' WGPUStringView)
wgpuStringRef s = do
  newRef
    { cty = WGPUStringView }
    ( !(stringRef s)
    , cast { to = Bits64 } $ strLength s
    )

wgpuChainedNULL : Ptr WGPUChainedStruct
wgpuChainedNULL = NULL

%ambiguity_depth 6

render :
    (0 b' : Lifetime) ->
    Ptr GLFWwindow ->
    WGPUAdapter ->
    WGPUSurface ->
    Ptr2Ref a' WGPUTexture ->
    WGPUDevice ->
    WGPUQueue ->
    WGPURenderPipeline ->
    { auto 0 p : AtLeastAsLong a' b' } ->
    ScopedIO b' ()
render b' window adapter surface texture device queue pipeline = do
    enc <- safeFFI
      wgpuDeviceCreateCommandEncoder
      [ device
      , !(newRef
          { cty = WGPUCommandEncoderDescriptor }
          ( mkNULL WGPUChainedStruct
          , !(wgpuStringRef "command-encoder")
          ))
      ]

    putStrLn $ "wgpuTextureCreateView"

    view <- safeFFI
      wgpuTextureCreateView
      [ shortenRef b' texture
      , mkNULL WGPUTextureViewDescriptor
      ]

    putStrLn $ "wgpuCommandEncoderBeginRenderPass"

    pass <- safeFFI
      wgpuCommandEncoderBeginRenderPass
      [ enc
      , !(newRef
        { cty = WGPURenderPassDescriptor }
        ( mkNULL WGPUChainedStruct
        , !(wgpuStringRef "render-pass")
        , 1
        , !(newRef
          { cty = WGPURenderPassColorAttachment }
          ( mkNULL WGPUChainedStruct
          , view
          , 0xffffffff -- depth slice undefined macro
          , the WGPUTextureView NULL
          , WGPULoadOp_Load
          , WGPUStoreOp_Store
          , !(newRef
            { cty = WGPUColor }
            (0.0, 1.1, 0.0, 1.0))
          ))
        , mkNULL WGPURenderPassDepthStencilAttachment
        , the WGPUQuerySet NULL
        , mkNULL WGPURenderPassTimestampWrites
        ))
      ]

    safeFFI
      wgpuRenderPassEncoderSetPipeline
      [pass, pipeline]

    safeFFI
      wgpuRenderPassEncoderDraw
      [ pass
      , 3, 1
      , 0, 0
      ]

    safeFFI wgpuRenderPassEncoderEnd [pass]
    safeFFI wgpuRenderPassEncoderRelease [pass]

    buf <- safeFFI
      wgpuCommandEncoderFinish
      [ enc
      , !(newRef
        -- { cty = WGPUCommandBufferDescriptor }
        ( mkNULL WGPUChainedStruct
        , !(wgpuStringRef "command-buffer")
        ))
      ]

    Just bufbuf <- newBuffer 8
      | Nothing => TODO "buf nothing"

    setInt64 bufbuf 0 (cast $ ptr2int buf)

    putStrLn "wgpuQueueSubmit"
    safeFFI
      wgpuQueueSubmit
      [ queue
      , 1
      , (prim__castPtr { t = WGPUCommandBuffer } !(primIO $ buf2ptr bufbuf))
      ]

    _ <- primIO $ wgpuSurfacePresent surface

    safeFFI wgpuCommandBufferRelease [buf]
    safeFFI wgpuCommandEncoderRelease [enc]
    safeFFI wgpuTextureViewRelease [view]


SHADER : String
SHADER = """

struct VertexOutput {
    @location(0) color: vec4f,
    @builtin(position) position: vec4f,
};

@vertex
fn vert_main(
  @builtin(vertex_index) vidx: u32,
) -> VertexOutput {
    var ret : VertexOutput;


    ret.color = vec4f(
      f32(vidx == 0),
      f32(vidx == 1),
      f32(vidx == 2),
      1.0,
    );

    ret.position = vec4f(
      f32(i32(vidx) - 1),
      f32(i32(vidx & 1u) * 2 - 1),
      0.0,
      1.0,
    );

  return ret;
}

@fragment
fn frag_main(
  v : VertexOutput,
) -> @location(0) vec4f {
    return v.color;
}
"""

mkDevice : WGPUInstance -> WGPUAdapter -> ScopedIO a' WGPUDevice
mkDevice instance adapter = do
  safeFFI
    wgpuAdapterRequestDeviceSync
    [ instance
    , adapter
    , !(newRef
        -- { cty = WGPUDeviceDescriptor }
        ( mkNULL WGPUChainedStruct
        , !(wgpuStringRef "device")
        , the Bits64 0
        , NULL { t = WGPUFeatureName } -- no extra features
        , NULL { t = WGPULimits } -- default limits
        , !(newRef
            { cty = WGPUQueueDescriptor }
            ( wgpuChainedNULL
            , !(wgpuStringRef "default-queue")
            )
          )
        , !(newRef
            { cty = WGPUDeviceLostCallbackInfo }
            ( mkNULL WGPUChainedStruct
            , WGPUCallbackMode_AllowSpontaneous
            , !(map dbg $ primIO $ mkWGPUDeviceLostCallback $
                \device, reason, msg, data1, data2 => toPrim $ putStrLn "device lost cb")
            , prim__getNullAnyPtr
            , prim__getNullAnyPtr
            )
          )
        , !(newRef
            { cty = WGPUUncapturedErrorCallbackInfo }
            ( mkNULL WGPUChainedStruct
            , !(primIO $ mkWGPUUncapturedErrorCallback $
                \device, error, msg, data1, data2 => toPrim $ do
                  msg' <- primIO $ wgpuStringClone msg
                  putStrLn msg'
              )
            , prim__getNullAnyPtr
            , prim__getNullAnyPtr
            )
          )
        )
      )
    ]


mkPipeline : WGPUDevice -> WGPUShaderModule -> ScopedIO a' WGPURenderPipeline
mkPipeline device shader = do
  safeFFI
    wgpuDeviceCreateRenderPipeline
    [ device
    , !(newRef
        { cty = WGPURenderPipelineDescriptor } -- render pipeline descriptor
        ( mkNULL WGPUChainedStruct
        , !(wgpuStringRef "render-pipeline")
        , !(safeFFI
              wgpuDeviceCreatePipelineLayout
              [ device
              , !(newRef
                { cty = WGPUPipelineLayoutDescriptor }
                ( wgpuChainedNULL
                , !(wgpuStringRef "pipeline-layout-descriptor")
                , 0 -- bind group layout count
                , mkNULL WGPUBindGroupLayout
                ))
              ]
          )
        , !(newRef
            { cty = WGPUVertexState }
            ( mkNULL WGPUChainedStruct
            , shader
            , !(wgpuStringRef "vert_main")
            , 0 -- const count
            , mkNULL WGPUConstantEntry
            , 0 -- buf count
            , mkNULL WGPUVertexBufferLayout
            ))
        , !(newRef -- primitive state
            { cty = WGPUPrimitiveState }
            ( mkNULL WGPUChainedStruct
            , WGPUPrimitiveTopology_TriangleList
            , WGPUIndexFormat_Undefined
            , WGPUFrontFace_CCW
            , WGPUCullMode_None
            , 0
            ))
        , NULL { t = WGPUDepthStencilState }
        , !(newRef
           { cty = WGPUMultisampleState }
            ( mkNULL WGPUChainedStruct
           , 1
           , 0xffffffff
           , 0
           ))
        , !(newRef
            { cty = WGPUFragmentState }
            ( mkNULL WGPUChainedStruct
            , shader
            , !(wgpuStringRef "frag_main")
            , 0 -- const count
            , mkNULL WGPUConstantEntry
            , 1 -- color targets
            , !(newRef
              { cty = WGPUColorTargetState }
              ( mkNULL WGPUChainedStruct
              , WGPUTextureFormat_BGRA8UnormSrgb
              , mkNULL WGPUBlendState
              , WGPUColorWriteMask_All
              ))
            ))
        ))
    ]


export
main : IO ()
main = runScopedIO { io = IO } $ \a' => do -- putStrLn "starting"
    _ <- safeFFI wgpuSetupLogging [1]
    _ <- safeFFI wgpuSetLogLevel [WGPULogLevel_Error]

    initOk <- safeFFI glfwInit []
    putStrLn $ "init glfw " ++ (show initOk)

    instance <- safeFFI wgpuCreateInstance [NULL { t = WGPUInstanceDescriptor } ]
    putStrLn "got wgpu"

    _ <- safeFFI glfwWindowHint [GLFW_CLIENT_API_, GLFW_NO_API_]
    putStrLn "a"

    window <- runSubScopedIO _ $ \_, _ => do
        s <- stringRef "hello"
        safeFFI
          glfwCreateWindow
          [ 200
          , 200
          , s
          , NULL { t = GLFWmonitor }
          , NULL { t = GLFWwindow }
          ]

    putStrLn "got window"


    surface <- safeFFI glfwCreateWindowWGPUSurface [instance, window]
    putStrLn $ "got surface "  ++ (show $ ptr2int surface)

    putStrLn "get adapter sync"

    opts <- newRef
      -- { cty = WGPURequestAdapterOptions }
      ( mkNULL WGPUChainedStruct
      , WGPUFeatureLevel_Core
      , WGPUPowerPreference_HighPerformance
      , 0
      , WGPUBackendType_Metal
      , surface
      )

    putStrLn "main"

    putStrLn $ show $ WGPUBackendType_Metal
    putStrLn $ show $ ptr2int $ unsafeRefPtr opts
    putStrLn $ show $ ptr2int $ unsafeRefPtr $ the (Ref _ WGPUSurface) $ getField opts "compatibleSurface"
    putStrLn $ show $ ptr2int $ surface

    adapter <- safeFFI
      wgpuInstanceRequestAdapterSync
      [ instance
      , opts
      ]

    putStrLn "get device sync"


    device <- mkDevice instance adapter

    putStrLn "got device"

    queue <- primIO $ wgpuDeviceGetQueue device

    putStrLn "got queue"

    shaderSource <- newRef
      { cty = WGPUShaderSourceWGSL }
      ( !(newRef { cty = WGPUChainedStruct } (NULL { t = Struct "WGPUChainedStruct" []}, WGPUSType_ShaderSourceWGSL))
      , !(wgpuStringRef SHADER)
      )


    shader <- safeFFI
      wgpuDeviceCreateShaderModule
      [ device
      , !(newRef
         { cty = WGPUShaderModuleDescriptor }
          ( the (Ptr WGPUChainedStruct) $ believe_me shaderSource -- TODO: better handling of chained structs
          , !(wgpuStringRef "shader")
          ))
      ]

    putStrLn "got shader"

    pipeline <- mkPipeline device shader

    putStrLn $ "before wgpuSurfaceConfigHelper"

    safeFFI
      wgpuSurfaceConfigHelper
      [ window
      , adapter
      , device
      , surface
      ]

    putStrLn $ "after wgpuSurfaceConfigHelper"

    _ <- safeFFI
          glfwSetFramebufferSizeCallback
          [ window
          , !(primIO $ mkGLFWframebuffersizefun $
            \window, width, height => toPrim $ do
              putStrLn "resized"
              primIO $ wgpuSurfaceConfigHelper
                window
                adapter
                device
                surface
              pure ()
            )
          ]

    putStrLn $ "after glfwSetFramebufferSizeCallback"

    surfaceTex <- newRef
      { cty = WGPUSurfaceTexture }
      ( mkNULL WGPUChainedStructOut
      , the WGPUTexture $ mkNULL _ -- WGPUTexture
      , WGPUSurfaceGetCurrentTextureStatus_Lost
      )

    putStrLn "before getCurrentTexture 1"

    safeFFI
      wgpuSurfaceGetCurrentTexture
      [surface, dbg surfaceTex]

    putStrLn "after getCurrentTexture 1"

    safeFFI wgpuTextureRelease
      [!(getPtr $ getField surfaceTex "texture")]

    runSubScopedIO a'
      (\b', _ => do
        while b'
          (\c', _ => do
            liftIO $ putStrLn "poll"
            safeFFI glfwPollEvents []
            x <- safeFFI glfwWindowShouldClose [window]
            pure $ x == 0
          )
          (\d', _ =>
            do
              putStrLn "before wgpuSurfaceGetCurrentTexture 2"

              safeFFI
                wgpuSurfaceGetCurrentTexture
                [ surface
                , dbg $ shortenRef d' surfaceTex
                ]

              putStrLn "after wgpuSurfaceGetCurrentTexture 2"

              status <- readRef $ getField surfaceTex "status"
              ok <- pure $
                   status == WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal
                || status == WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal

              when (status /= 1) (putStrLn $ "status " ++ show status)

              -- putStrLn $ "surfacetex " ++ (show $ ptr2int $ the WGPUTexture $ getField surfaceTex "texture")
              -- putStrLn $ "surfacetex " ++ (show $ ptr2int $ the WGPUTexture $ getField surfaceTex "texture")

              when
                (not ok)
                (do
                  putStrLn $ "before wgpuSurfaceConfigHelper"
                  safeFFI
                    wgpuSurfaceConfigHelper
                    [ window
                    , adapter
                    , device
                    , surface
                    ]
                  putStrLn $ "after wgpuSurfaceConfigHelper"
                )

              when ok $
                render d' -- { p = ALALTrans ab' bd' }
                  window
                  adapter
                  surface
                  !(getPtr $ getField surfaceTex "texture")
                  device
                  queue
                  pipeline

              safeFFI wgpuTextureRelease
                [!(getPtr $ getField (shortenRef d' surfaceTex) "texture")]
          )
      )
