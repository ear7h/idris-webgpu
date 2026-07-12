import System
import Data.List.Quantifiers
import Data.Buffer
import System.File.ReadWrite
import System.File.Buffer
import Control.Monad.Either
import Control.Monad.Trans
import Data.Either

import Graphics.WGPU.Sys
import Graphics.GLFW.Sys
import Graphics.GLFW3WebGPU
import Graphics.Wavefront
import Math

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
    WGPUBuffer ->
    IO ()
render window adapter surface texture device queue pipeline bunny = runScoped $ do
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


    bunnysiz <- primIO $ wgpuBufferGetSize bunny
    primIO $ wgpuRenderPassEncoderSetVertexBuffer pass 0 bunny 0 bunnysiz
    primIO $ wgpuRenderPassEncoderSetPipeline pass pipeline

    primIO $ wgpuRenderPassEncoderDraw
      pass
      (cast $ div bunnysiz (3 * 4)) 1
      0 0

    putStrLn $ "draw \{ show $ div bunnysiz (3 * 4) } vertices"

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
    @location(1) color: vec4f,
    @builtin(position) position: vec4f,
};

@vertex
fn vert_main(
  @location(0) vert: vec3f,
  @builtin(vertex_index) vidx: u32,
) -> VertexOutput {
    var ret : VertexOutput;

    ret.color = vec4f(
      1.0,
      clamp(vert.y, 0.0, 1.0),
      0.0,
      1.0,
    );

    ret.position = vec4f(
      vert.x * 10,
      vert.z * 10 - 1.0,
      0.5,
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

public export
Result : Type -> Type
Result a = Either String a

tris2buf : HasIO io => List (Face 3 Vec3) -> io (Result Buffer)
tris2buf tris = runEitherT $ do
  buf <- MkEitherT $ maybeToEither "failed to alloc" <$> newBuffer (9 * 4 * (cast { to = Int } $ length tris))
  _ <- lift $ foldlM (\i, x => setFace buf (i*9) x >> pure (i + 1)) 0 tris
  pure buf
  where
  setList : Buffer -> Int -> List Double -> io ()
  setList buf i xs = do
    _ <- foldlM (\i', x => setFloat buf (cast i') x >> pure (i' + 1)) i xs
    pure ()

  setFace : Buffer -> Int -> Face 3 Vec3 -> io ()
  setFace buf idx tri = setList buf idx $ toList $ Data.Vect.concat tri.v

loadBunny : HasIO io => io (Result Buffer)
loadBunny = mapFst show <$> createBufferFromFile "data/bunny.obj.bin"

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

    Right bunny <- loadBunny
      | Left msg => putStrLn "error: \{ msg }"

    putStrLn $ "bunny loaded"

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
                , 1 -- buf count
                , !(alloc'
                    [ WGPUVertexStepMode_Vertex
                    , the Bits64 $ 3 * 4
                    , 1
                    , !(alloc'
                        [ WGPUVertexFormat_Float32x3
                        , 0
                        , 0 -- bufs
                        ])
                    ])
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

        bunnySiz <- rawSize bunny
        bunny' <- primIO $ wgpuDeviceCreateBuffer
          device
          !(alloc'
            [ NULL
            , !(allocStr "bunny-buffer")
            , WGPUBufferUsage_Vertex
            , cast bunnySiz
            , 1
            ])

        bunnyMapped <- primIO $ wgpuBufferGetMappedRange bunny' 0 (cast bunnySiz)

        primIO $ prim__memcpy (prim__forgetPtr bunnyMapped) !(primIO $ buf2ptr bunny) bunnySiz

        primIO $ wgpuBufferUnmap bunny'

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
          bunny'

        liftIO $ while
          (do
            putStrLn $ "poll"
            primIO $ glfwPollEvents
            putStrLn $ "polled"
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
                bunny'
              )

            primIO $ wgpuTextureRelease (getField surfaceTex "texture")
          )


