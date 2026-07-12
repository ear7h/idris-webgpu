-- TODO: rename to something like "WGPUGlue" or "Support"

import System.FFI

import Graphics.WGPU.Sys
import Graphics.GLFW.Sys

import Utils.CTypes

export
%foreign "C:glfwCreateWindowWGPUSurface,libidris_wgpu_support"
glfwCreateWindowWGPUSurface : WGPUInstance -> Ptr GLFWwindow -> PrimIO WGPUSurface

export
%foreign "C:wgpuInstanceRequestAdapterSync,libidris_wgpu_support"
wgpuInstanceRequestAdapterSync : WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> PrimIO WGPUAdapter

export
%foreign "C:wgpuAdapterRequestDeviceSync,libidris_wgpu_support"
wgpuAdapterRequestDeviceSync : WGPUInstance -> WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> PrimIO WGPUDevice

export
%foreign "C:wgpuSetupLogging,libidris_wgpu_support"
wgpuSetupLogging : Int -> PrimIO ()

export
allocStr : String -> Scope $ WGPUStringView
allocStr s = do
  byt <- (string2bytes s) >>= cleanup
  alloc [byt, cast $ strLength s]

export
%foreign "C:wgpuStringClone,libidris_wgpu_support"
wgpuStringClone : WGPUStringView -> PrimIO String

export
%foreign "C:wgpuSurfaceConfigHelper,libidris_wgpu_support"
wgpuSurfaceConfigHelper :
  Ptr GLFWwindow ->
  WGPUAdapter ->
  WGPUDevice ->
  WGPUSurface ->
  PrimIO ()

