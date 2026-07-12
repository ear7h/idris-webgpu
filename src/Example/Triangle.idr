import System
import Data.List.Quantifiers
import Data.Buffer
import System.File.ReadWrite
import Control.Monad.Maybe
import Control.Monad.Trans

import Graphics.WGPU.Sys
import Graphics.GLFW.Sys
import Graphics.GLFW3WebGPU
import Graphics.Wavefront

import Utils.CTypes


TODO : String -> a
TODO msg = assert_total $ idris_crash $ "TODO: " ++ msg

dbg : Show a => a -> a
dbg x = unsafePerformIO $ do
  putStrLn "dbg: \{ show x }\n"
  pure x

while : IO Bool -> IO () -> IO ()
while cond body = do
  b <- cond
  when b (body *> while cond body)

render :
    Ptr GLFWwindow ->
    WGPUAdapter ->
    WGPUSurface ->
    WGPUTexture ->
    WGPUDevice ->
    WGPUQueue ->
    WGPURenderPipeline ->
    IO ()
render window adapter surface texture device queue pipeline = runScoped $ do
    enc <- primIO $ wgpuDeviceCreateCommandEncoder
      device
      !(alloc'
        [ NULL
        , !(allocStr "command-encoder")
        ])

    putStrLn $ "wgpuTextureCreateView"

    view <- primIO $ wgpuTextureCreateView texture NULL

    putStrLn $ "wgpuCommandEncoderBeginRenderPass"

    pass <- primIO $ wgpuCommandEncoderBeginRenderPass
      enc
      !(alloc'
        [ NULL
        , !(allocStr "render-pass")
        , 1
        , !(alloc' -- color attachment
            [ NULL
            , view
            , 0xffffffff -- depth slice undefined macro
            , NULL
            , WGPULoadOp_Load
            , WGPUStoreOp_Store
            , !(alloc [0.0, 1.1, 0.0, 1.0])
            ])
        , NULL -- depth stencil
        , NULL -- query set
        , NULL -- timestamp writes
        ])


    primIO $ wgpuRenderPassEncoderSetPipeline pass pipeline

    primIO $ wgpuRenderPassEncoderDraw
      pass
      3 1
      0 0

    primIO $ wgpuRenderPassEncoderEnd pass
    primIO $ wgpuRenderPassEncoderRelease pass

    buf <- primIO $ wgpuCommandEncoderFinish
      enc
      !(alloc'
        [ NULL
        , !(allocStr "command-buffer")
        ])

    Just bufbuf <- newBuffer 8
      | Nothing => TODO "buf nothing"

    setInt64 bufbuf 0 (cast $ ptr2int buf)

    putStrLn "wgpuQueueSubmit"
    primIO $ wgpuQueueSubmit
      queue
      1
      (prim__castPtr !(primIO $ buf2ptr bufbuf))

    _ <- primIO $ wgpuSurfacePresent surface

    primIO $ wgpuCommandBufferRelease buf
    primIO $ wgpuCommandEncoderRelease enc
    primIO $ wgpuTextureViewRelease view


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

tris2buf : HasIO io => List (Face 3 Vec3) -> io (Maybe Buffer)
tris2buf tris = runMaybeT $ do
  buf <- MkMaybeT $ newBuffer (9 * 4 * (cast { to = Int } $ length tris))
  _ <- lift $ foldlM (\i, x => setFace buf (i*9) x >> pure (i + 1)) 0 tris
  pure buf
  where
  setList : Buffer -> Int -> List Double -> io ()
  setList buf i xs = do
    _ <- foldlM (\i', x => setFloat buf (cast $ dbg i') x >> pure (i' + 1)) i xs
    pure ()

  setFace : Buffer -> Int -> Face 3 Vec3 -> io ()
  setFace buf idx tri = setList buf idx $ toList $ Data.Vect.concat tri.v

export
main : IO ()
main = do -- putStrLn "starting"
    _ <- primIO $ wgpuSetupLogging 1
    _ <- primIO $ wgpuSetLogLevel WGPULogLevel_Error

    initOk <- primIO $ glfwInit
    putStrLn $ "init glfw " ++ (show initOk)

    instance <- primIO $ wgpuCreateInstance NULL
    putStrLn "got wgpu"

    _ <- primIO $ glfwWindowHint GLFW_CLIENT_API_ GLFW_NO_API_

    window <- runScoped $ do
        s <- cleanup !(string2bytes "hello")
        liftIO $ primIO $ glfwCreateWindow 200 200 s NULL NULL
    putStrLn "got window"

    surface <- primIO $ glfwCreateWindowWGPUSurface instance window
    putStrLn $ "got surface "  ++ (show $ ptr2int surface)

    runScoped $ do
        putStrLn "get adapter sync"
        opts <- (alloc
                [ NULL
                , WGPUFeatureLevel_Core
                , WGPUPowerPreference_HighPerformance
                , 0
                , WGPUBackendType_Metal
                , surface
                ]
            )

        putStrLn "main"
        putStrLn $ show $ WGPUBackendType_Metal
        putStrLn $ show $ ptr2int $ !(toPtr opts)
        putStrLn $ show $ ptr2int $ the (WGPUSurface) $ getField opts "compatibleSurface"
        putStrLn $ show $ ptr2int $ surface

        adapter <- primIO $ wgpuInstanceRequestAdapterSync
            instance
            !(toPtr opts)

        putStrLn "get device sync"

        device <- primIO $ wgpuAdapterRequestDeviceSync
          instance
          adapter
          !(alloc'
            [ NULL
            , !(allocStr "device")
            , 0
            , NULL -- no extra features
            , NULL -- default limits
            , !(alloc
                [ NULL
                , !(allocStr "default-queue")
                ]) -- queue descriptor
            , !(alloc
                  [ NULL
                  , WGPUCallbackMode_AllowSpontaneous
                  , !(primIO $ mkWGPUDeviceLostCallback $ \device, reason, msg, data1, data2 => toPrim $ putStrLn "device lost cb")
                  , NULL
                  , NULL
                  ]) -- device lost callback info
            , !(alloc
                [ NULL
                , !(primIO $ mkWGPUUncapturedErrorCallback $
                    \device, error, msg, data1, data2 => toPrim $ do
                      msg' <- primIO $ wgpuStringClone msg
                      putStrLn msg'
                  )
                , NULL
                , NULL
                ]) -- uncaptured error callback info
            ]
          )

        queue <- primIO $ wgpuDeviceGetQueue device

        shaderSource <- the (Scope $ Ptr WGPUShaderSourceWGSL) $ alloc'
          [ !(alloc [ NULL, WGPUSType_ShaderSourceWGSL ])
          , !(allocStr SHADER)
          ]

        shader <- primIO $ wgpuDeviceCreateShaderModule
          device
          !(alloc'
            [ believe_me shaderSource -- TODO: better handling of chained structs
            , !(allocStr "shader")
            ]
          )



        pipeline <- primIO $ wgpuDeviceCreateRenderPipeline
          device
          !(alloc' -- render pipeline descriptor
            [ NULL
            , !(allocStr "render-pipeline")
            , !(primIO $ wgpuDeviceCreatePipelineLayout
                device
                !(alloc' -- pipeline layout descriptor
                  [ NULL
                  , !(allocStr "pipeline-layout-descriptor")
                  , 0 -- bind group layout count
                  , NULL -- bind group layouts
                  ])
              )
            , !(alloc -- vert state
                [ NULL
                , shader
                , !(allocStr "vert_main")
                , 0 -- const count
                , NULL -- consts
                , 0 -- buf count
                , NULL -- bufs
                ])
            , !(alloc -- primitive state
                [ NULL
                , WGPUPrimitiveTopology_TriangleList
                , WGPUIndexFormat_Undefined
                , WGPUFrontFace_CCW
                , WGPUCullMode_None
                , 0
                ])
            , NULL -- no depth stencil
            , !(alloc -- multisample state
               [ NULL
               , 1
               , 0xffffffff
               , 0
               ])
            , !(alloc' -- fragment state
                [ NULL
                , shader
                , !(allocStr "frag_main")
                , 0 -- const count
                , NULL -- consts
                , 1 -- color targets
                , !(alloc'
                   [ NULL
                   , WGPUTextureFormat_BGRA8UnormSrgb
                   , NULL
                   , WGPUColorWriteMask_All
                   ])
                ])
            ])

        putStrLn $ "before wgpuSurfaceConfigHelper"
        primIO $ wgpuSurfaceConfigHelper
          window
          adapter
          device
          surface
        putStrLn $ "after wgpuSurfaceConfigHelper"

        _ <- primIO $
            glfwSetFramebufferSizeCallback
              window
              !(primIO $ mkGLFWframebuffersizefun $
                \ window, width, height => toPrim $ do
                  putStrLn "resized"
                  primIO $ wgpuSurfaceConfigHelper
                    window
                    adapter
                    device
                    surface
                  pure ()
              )

        surfaceTex <- (alloc
          [ NULL
          , NULL
          , WGPUSurfaceGetCurrentTextureStatus_Lost
          ])

        primIO $ wgpuSurfaceGetCurrentTexture surface !(toPtr surfaceTex)

        liftIO $ render
          window
          adapter
          surface
          (getField surfaceTex "texture")
          device
          queue
          pipeline

        liftIO $ while
          (do
            putStrLn $ "poll"
            primIO $ glfwPollEvents
            x <- primIO $ glfwWindowShouldClose window
            pure $ x == 0
          )
          (do

            -- putStrLn "wgpuSurfaceGetCurrentTexture"
            primIO $ wgpuSurfaceGetCurrentTexture surface !(toPtr surfaceTex)

            status <- pure $ getField surfaceTex "status"
            ok <- pure $
                 status == WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal
              || status == WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal

            when (status /= 1) (putStrLn $ "status " ++ show status)
            putStrLn $ "surfacetex " ++ (show $ ptr2int $ the WGPUTexture $ getField surfaceTex "texture")

            liftIO $ when
              (not ok)
              (do
                putStrLn $ "before wgpuSurfaceConfigHelper"
                primIO $ wgpuSurfaceConfigHelper
                  window
                  adapter
                  device
                  surface
                putStrLn $ "after wgpuSurfaceConfigHelper"
              )

            liftIO $ when
              ok
              (render
                window
                adapter
                surface
                (getField surfaceTex "texture")
                device
                queue
                pipeline
              )

            primIO $ wgpuTextureRelease (getField surfaceTex "texture")
          )

