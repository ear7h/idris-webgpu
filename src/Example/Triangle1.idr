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

%foreign "scheme:(lambda (erased x) (display \"in scheme\") (display x) x)"
dbg' : a -> a

%foreign "scheme:(lambda (erased x) (ftype-pointer-address x))"
ftype2ptr : a -> a

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

wgpuStringNULL : ScopedIO a' (Ref a' WGPUStringView)
wgpuStringNULL = do
  dbg <$> newRef
    { cty = WGPUStringView }
    ( mkNULL Bits8
    , cast { to = Bits64 } 0
    )

wgpuChainedNULL : Ptr WGPUChainedStruct
wgpuChainedNULL = NULL

%ambiguity_depth 6

%foreign "C:printf,libc"
prim__printf : WGPUStringView -> PrimIO Int

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
    enc <- safeFFIDrop
      wgpuDeviceCreateCommandEncoder
      (primIO . wgpuCommandEncoderRelease)
      [ device
      , !(newRef
          { cty = WGPUCommandEncoderDescriptor }
          ( mkNULL WGPUChainedStruct
          , !(wgpuStringRef "command-encoder")
          ))
      ]

    putStrLn $ "wgpuTextureCreateView"

    view <- safeFFIDrop
      wgpuTextureCreateView
      (primIO . wgpuTextureViewRelease)
      [ shortenRef b' texture
      , mkNULL WGPUTextureViewDescriptor
      ]

    putStrLn $ "wgpuCommandEncoderBeginRenderPass"

    -- _ <- safeFFI prim__printf [ !(wgpuStringRef "\n\nrender-pass\n\n %d") ]

    pass <- safeFFI
      wgpuCommandEncoderBeginRenderPass
      [ enc
      , !(newRef
        { cty = WGPURenderPassDescriptor }
        ( mkNULL WGPUChainedStruct
        , !(wgpuStringRef "render-pass")
        -- , !wgpuStringNULL
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

    putStrLn $ "wgpuRenderPassEncoderSetPipeline"

    safeFFI
      wgpuRenderPassEncoderSetPipeline
      [pass, pipeline]

    putStrLn $ "wgpuRenderPassEncoderDraw"

    safeFFI
      wgpuRenderPassEncoderDraw
      [ pass
      , 3, 1
      , 0, 0
      ]

    putStrLn $ "wgpuRenderPassEncoderEnd"

    safeFFI wgpuRenderPassEncoderEnd [pass]
    putStrLn $ "wgpuRenderPassEncoderRelease"
    safeFFI wgpuRenderPassEncoderRelease [pass]

    putStrLn $ "wgpuCommandEncoderFinish"

    cbd <- newRef
        { cty = WGPUCommandBufferDescriptor }
        ( mkNULL WGPUChainedStruct
        , dbg' (dbg !wgpuStringNULL) -- !(wgpuStringRef "command-buffer")
        )

    putStrLn $ "after cbd"
    putStrLn $ "dbg enc"
    _ <- pure $ dbg enc
    putStrLn $ "after dbg enc"

    buf <- safeFFI
      wgpuCommandEncoderFinish
      [ enc
      , cbd
      ]

    putStrLn $ "new buffer"

    Just bufbuf <- newBuffer 8
      | Nothing => TODO "buf nothing"

    putStrLn $ "setInt64"

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
  safeFFIDrop
    wgpuAdapterRequestDeviceSync
    (\device => do
      putStrLn "device drop"
      primIO $ wgpuDeviceRelease device
    )
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
                  msg' <- primIO $ wgpuStringClone (dbg' $ ftype2ptr msg)
                  putStrLn "uncaptured error!!!"
                  putStrLn msg'
              )
            , prim__getNullAnyPtr
            , prim__getNullAnyPtr
            )
          )
        )
      )
    ]


mkPipeline : WGPUDevice -> WGPUShaderModule -> WGPUTextureFormat -> ScopedIO a' WGPURenderPipeline
mkPipeline device shader format = do
  safeFFIDrop
    wgpuDeviceCreateRenderPipeline
    (primIO . wgpuRenderPipelineRelease)
    [ device
    , !(newRef
        { cty = WGPURenderPipelineDescriptor } -- render pipeline descriptor
        ( mkNULL WGPUChainedStruct
        , !(wgpuStringRef "render-pipeline")
        , !(safeFFIDrop
              wgpuDeviceCreatePipelineLayout
              (primIO . wgpuPipelineLayoutRelease)
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
              , format
              , mkNULL WGPUBlendState
              , WGPUColorWriteMask_All
              ))
            ))
        ))
    ]


export
main : IO ()
main = runScopedIO { io = IO } $ \a' => do
    putStrLn "starting"
    _ <- safeFFI wgpuSetupLogging [1]
    _ <- safeFFI wgpuSetLogLevel [WGPULogLevel_Error]

    initOk <- safeFFI glfwInit []
    putStrLn $ "init glfw " ++ (show initOk)
    defer (primIO glfwTerminate)

    instance <- safeFFIDrop wgpuCreateInstance
      (primIO . wgpuInstanceRelease)
      [NULL { t = WGPUInstanceDescriptor } ]
    putStrLn "got wgpu"

    _ <- safeFFI glfwWindowHint [GLFW_CLIENT_API_, GLFW_NO_API_]
    putStrLn "a"

    window <-
        safeFFIDrop
          glfwCreateWindow
          (primIO . glfwDestroyWindow)
          [ 200
          , 200
          , !(stringRef "hello")
          , NULL { t = GLFWmonitor }
          , NULL { t = GLFWwindow }
          ]

    putStrLn "got window"


    surface <- safeFFIDrop
      glfwCreateWindowWGPUSurface
      (primIO . wgpuSurfaceRelease)
      [instance, window]
    putStrLn $ "got surface "  ++ (show $ ptr2int surface)

    putStrLn "get adapter sync"

    opts <- newRef
      -- { cty = WGPURequestAdapterOptions }
      ( mkNULL WGPUChainedStruct
      , WGPUFeatureLevel_Core
      , WGPUPowerPreference_HighPerformance
      , 0
      -- , WGPUBackendType_Metal
      , WGPUBackendType_OpenGL
      , surface
      )

    putStrLn "main"

    putStrLn $ show $ WGPUBackendType_Metal
    putStrLn $ show $ ptr2int $ unsafeRefPtr opts
    putStrLn $ show $ ptr2int $ unsafeRefPtr $ the (Ref _ WGPUSurface) $ getField opts "compatibleSurface"
    putStrLn $ show $ ptr2int $ surface

    adapter <- safeFFIDrop
      wgpuInstanceRequestAdapterSync
      (const $ pure())
      [ instance
      , opts
      ]

    putStrLn "get device sync"


    device <- mkDevice instance adapter

    putStrLn "got device"

    queue <- safeFFIDrop
      wgpuDeviceGetQueue
      (const $ pure())
      [device]

    putStrLn "got queue"

    shaderSource <- newRef
      { cty = WGPUShaderSourceWGSL }
      ( !(newRef { cty = WGPUChainedStruct } (NULL { t = Struct "WGPUChainedStruct" []}, WGPUSType_ShaderSourceWGSL))
      , !(wgpuStringRef SHADER)
      )


    shader <- safeFFIDrop
      wgpuDeviceCreateShaderModule
      (const $ pure())
      [ device
      , !(newRef
         { cty = WGPUShaderModuleDescriptor }
          ( the (Ptr WGPUChainedStruct) $ believe_me shaderSource -- TODO: better handling of chained structs
          , !(wgpuStringRef "shader")
          ))
      ]

    putStrLn "got shader"


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

    format <- safeFFI
      wgpuTextureGetFormat
      [ !(getPtr $ getField surfaceTex "texture") ]

    pipeline <- mkPipeline device shader format

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
    putStrLn "done"
