import System
import Data.List.Quantifiers

import Graphics.WGPU.Sys
import Graphics.GLFW.Sys
import Graphics.GLFW3WebGPU

import Utils.CTypes

{-
%foreign ""
prim__allocStructGLFWgamepadstate : allocStructPrimType GLFWgamepadstate
%foreign_impl prim__allocStructGLFWgamepadstate (allocStructPrimCodegen GLFWgamepadstate)

AllocStruct WGPUChainedStruct where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUChainedStruct xs
-}


loop : Ptr GLFWwindow -> WGPUSurface -> IO ()
loop window surface = do
  close <- primIO $ glfwWindowShouldClose window
  if close > 0
    then pure ()
    else do
      _ <- primIO $ glfwPollEvents
      loop window surface

export
main : IO ()
main = do -- putStrLn "starting"
    instance <- primIO $ wgpuCreateInstance NULL
    putStrLn "got wgpu"
    initOk <- primIO $ glfwInit
    putStrLn $ "init glfw " ++ (show initOk)
    window <- primIO $ glfwCreateWindow 200 200 !(string2bytes "hello") NULL NULL
    putStrLn "got window"
    surface <- primIO $ glfwCreateWindowWGPUSurface instance window
    putStrLn "got surface"

{-
    adapter <- wgpuInstanceRequestAdapter instance
        ( MkStructOf
            [ NULL
            , WGPUFeatureLevel_Core
            , WGPUPowerPreference_HighPerformance
            , 0
            , WGPUBackendType_Null
            , NULL
            ]
        )
-}

    loop window surface



