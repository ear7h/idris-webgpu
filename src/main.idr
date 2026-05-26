import System

import Graphics.WGPU.Sys
import Graphics.GLFW.Sys
import Graphics.GLFW3WebGPU

NULL : Ptr t
NULL = (prim__castPtr prim__getNullAnyPtr)

loop : Ptr GLFWwindow -> IO ()
loop window = do
  close <- primIO $ glfwWindowShouldClose window
  if close > 0
    then pure ()
    else do
      _ <- primIO $ glfwPollEvents ()
      loop window

main : IO ()
main = do
    -- putStrLn "starting"
    wgpu <- primIO $ wgpuCreateInstance NULL
    putStrLn "got wgpu"
    initOk <- primIO $ glfwInit
    putStrLn $ "init glfw " ++ (show initOk)
    window <- primIO $ glfwCreateWindow 200 200 NULL NULL NULL
    putStrLn "got window"
    surface <- primIO $ glfwCreateWindowWGPUSurface wgpu window
    putStrLn "got surface"
    sleep 10
