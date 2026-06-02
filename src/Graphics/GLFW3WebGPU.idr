import System.FFI
import Graphics.WGPU.Sys
import Graphics.GLFW.Sys

export
%foreign "C:glfwCreateWindowWGPUSurface,libidris_wgpu_support"
glfwCreateWindowWGPUSurface : WGPUInstance -> Ptr GLFWwindow -> PrimIO WGPUSurface
