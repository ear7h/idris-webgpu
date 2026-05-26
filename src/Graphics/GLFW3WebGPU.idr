import System.FFI
import Graphics.WGPU.Sys
import Graphics.GLFW.Sys

export
%foreign "C:glfwCreateWindowWGPUSurface,libglfw3webgpu"
glfwCreateWindowWGPUSurface : WGPUInstance -> Ptr GLFWwindow -> PrimIO WGPUSurface
