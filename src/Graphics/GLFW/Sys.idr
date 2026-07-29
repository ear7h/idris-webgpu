
module Graphics.GLFW.Sys

import Data.Bits

import System.ScopedIO
import Utils.FFI


public export
GLFWglproc : Type
GLFWglproc = Ptr (() -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWglproc : (() -> PrimIO (())) -> PrimIO $ GLFWglproc

public export
GLFWvkproc : Type
GLFWvkproc = Ptr (() -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWvkproc : (() -> PrimIO (())) -> PrimIO $ GLFWvkproc

public export
GLFWmonitor : Type
GLFWmonitor = Struct "GLFWmonitor" []


public export
GLFWwindow : Type
GLFWwindow = Struct "GLFWwindow" []


public export
GLFWcursor : Type
GLFWcursor = Struct "GLFWcursor" []


public export
GLFWallocatefun : Type
GLFWallocatefun = Ptr (Bits64 -> Ptr (()) -> PrimIO (Ptr (())))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWallocatefun : (Bits64 -> Ptr (()) -> PrimIO (Ptr (()))) -> PrimIO $ GLFWallocatefun

public export
GLFWreallocatefun : Type
GLFWreallocatefun = Ptr (Ptr (()) -> Bits64 -> Ptr (()) -> PrimIO (Ptr (())))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWreallocatefun : (Ptr (()) -> Bits64 -> Ptr (()) -> PrimIO (Ptr (()))) -> PrimIO $ GLFWreallocatefun

public export
GLFWdeallocatefun : Type
GLFWdeallocatefun = Ptr (Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWdeallocatefun : (Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ GLFWdeallocatefun

public export
GLFWerrorfun : Type
GLFWerrorfun = Ptr (Int32 -> Ptr (Bits8) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWerrorfun : (Int32 -> Ptr (Bits8) -> PrimIO (())) -> PrimIO $ GLFWerrorfun

public export
GLFWwindowposfun : Type
GLFWwindowposfun = Ptr (Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowposfun : (Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWwindowposfun

public export
GLFWwindowsizefun : Type
GLFWwindowsizefun = Ptr (Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowsizefun : (Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWwindowsizefun

public export
GLFWwindowclosefun : Type
GLFWwindowclosefun = Ptr (Ptr (GLFWwindow) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowclosefun : (Ptr (GLFWwindow) -> PrimIO (())) -> PrimIO $ GLFWwindowclosefun

public export
GLFWwindowrefreshfun : Type
GLFWwindowrefreshfun = Ptr (Ptr (GLFWwindow) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowrefreshfun : (Ptr (GLFWwindow) -> PrimIO (())) -> PrimIO $ GLFWwindowrefreshfun

public export
GLFWwindowfocusfun : Type
GLFWwindowfocusfun = Ptr (Ptr (GLFWwindow) -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowfocusfun : (Ptr (GLFWwindow) -> Int32 -> PrimIO (())) -> PrimIO $ GLFWwindowfocusfun

public export
GLFWwindowiconifyfun : Type
GLFWwindowiconifyfun = Ptr (Ptr (GLFWwindow) -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowiconifyfun : (Ptr (GLFWwindow) -> Int32 -> PrimIO (())) -> PrimIO $ GLFWwindowiconifyfun

public export
GLFWwindowmaximizefun : Type
GLFWwindowmaximizefun = Ptr (Ptr (GLFWwindow) -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowmaximizefun : (Ptr (GLFWwindow) -> Int32 -> PrimIO (())) -> PrimIO $ GLFWwindowmaximizefun

public export
GLFWframebuffersizefun : Type
GLFWframebuffersizefun = Ptr (Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWframebuffersizefun : (Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWframebuffersizefun

public export
GLFWwindowcontentscalefun : Type
GLFWwindowcontentscalefun = Ptr (Ptr (GLFWwindow) -> Float -> Float -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWwindowcontentscalefun : (Ptr (GLFWwindow) -> Float -> Float -> PrimIO (())) -> PrimIO $ GLFWwindowcontentscalefun

public export
GLFWmousebuttonfun : Type
GLFWmousebuttonfun = Ptr (Ptr (GLFWwindow) -> Int32 -> Int32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWmousebuttonfun : (Ptr (GLFWwindow) -> Int32 -> Int32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWmousebuttonfun

public export
GLFWcursorposfun : Type
GLFWcursorposfun = Ptr (Ptr (GLFWwindow) -> Double -> Double -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWcursorposfun : (Ptr (GLFWwindow) -> Double -> Double -> PrimIO (())) -> PrimIO $ GLFWcursorposfun

public export
GLFWcursorenterfun : Type
GLFWcursorenterfun = Ptr (Ptr (GLFWwindow) -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWcursorenterfun : (Ptr (GLFWwindow) -> Int32 -> PrimIO (())) -> PrimIO $ GLFWcursorenterfun

public export
GLFWscrollfun : Type
GLFWscrollfun = Ptr (Ptr (GLFWwindow) -> Double -> Double -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWscrollfun : (Ptr (GLFWwindow) -> Double -> Double -> PrimIO (())) -> PrimIO $ GLFWscrollfun

public export
GLFWkeyfun : Type
GLFWkeyfun = Ptr (Ptr (GLFWwindow) -> Int32 -> Int32 -> Int32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWkeyfun : (Ptr (GLFWwindow) -> Int32 -> Int32 -> Int32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWkeyfun

public export
GLFWcharfun : Type
GLFWcharfun = Ptr (Ptr (GLFWwindow) -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWcharfun : (Ptr (GLFWwindow) -> Bits32 -> PrimIO (())) -> PrimIO $ GLFWcharfun

public export
GLFWcharmodsfun : Type
GLFWcharmodsfun = Ptr (Ptr (GLFWwindow) -> Bits32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWcharmodsfun : (Ptr (GLFWwindow) -> Bits32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWcharmodsfun

public export
GLFWdropfun : Type
GLFWdropfun = Ptr (Ptr (GLFWwindow) -> Int32 -> Ptr (Ptr (Bits8)) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWdropfun : (Ptr (GLFWwindow) -> Int32 -> Ptr (Ptr (Bits8)) -> PrimIO (())) -> PrimIO $ GLFWdropfun

public export
GLFWmonitorfun : Type
GLFWmonitorfun = Ptr (Ptr (GLFWmonitor) -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWmonitorfun : (Ptr (GLFWmonitor) -> Int32 -> PrimIO (())) -> PrimIO $ GLFWmonitorfun

public export
GLFWjoystickfun : Type
GLFWjoystickfun = Ptr (Int32 -> Int32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkGLFWjoystickfun : (Int32 -> Int32 -> PrimIO (())) -> PrimIO $ GLFWjoystickfun

public export
GLFWvidmode : Type
GLFWvidmode = Struct "GLFWvidmode" [("width",  (Int32)),("height",  (Int32)),("redBits",  (Int32)),("greenBits",  (Int32)),("blueBits",  (Int32)),("refreshRate",  (Int32))]


public export
GLFWgammaramp : Type
GLFWgammaramp = Struct "GLFWgammaramp" [("red", Ptr (Bits16)),("green", Ptr (Bits16)),("blue", Ptr (Bits16)),("size",  (Bits32))]


public export
GLFWimage : Type
GLFWimage = Struct "GLFWimage" [("width",  (Int32)),("height",  (Int32)),("pixels", Ptr (Bits8))]


public export
GLFWgamepadstate : Type
GLFWgamepadstate = Struct "GLFWgamepadstate" [("buttons",  (CArray 15 (Bits8))),("axes",  (CArray 6 (Float)))]


public export
GLFWallocator : Type
GLFWallocator = Struct "GLFWallocator" [("allocate",  (GLFWallocatefun)),("reallocate",  (GLFWreallocatefun)),("deallocate",  (GLFWdeallocatefun)),("user", Ptr (()))]


%foreign "C:glfwInit,libglfw"
export
glfwInit : PrimIO (Int32)
    

%foreign "C:glfwTerminate,libglfw"
export
glfwTerminate : PrimIO (())
    

%foreign "C:glfwInitHint,libglfw"
export
glfwInitHint : Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwInitAllocator,libglfw"
export
glfwInitAllocator : Ptr (GLFWallocator) -> PrimIO (())
    

%foreign "C:glfwGetVersion,libglfw"
export
glfwGetVersion : Ptr (Int32) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwGetVersionString,libglfw"
export
glfwGetVersionString : PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetError,libglfw"
export
glfwGetError : Ptr (Ptr (Bits8)) -> PrimIO (Int32)
    

%foreign "C:glfwSetErrorCallback,libglfw"
export
glfwSetErrorCallback : GLFWerrorfun -> PrimIO (GLFWerrorfun)
    

%foreign "C:glfwGetPlatform,libglfw"
export
glfwGetPlatform : PrimIO (Int32)
    

%foreign "C:glfwPlatformSupported,libglfw"
export
glfwPlatformSupported : Int32 -> PrimIO (Int32)
    

%foreign "C:glfwGetMonitors,libglfw"
export
glfwGetMonitors : Ptr (Int32) -> PrimIO (Ptr (Ptr (GLFWmonitor)))
    

%foreign "C:glfwGetPrimaryMonitor,libglfw"
export
glfwGetPrimaryMonitor : PrimIO (Ptr (GLFWmonitor))
    

%foreign "C:glfwGetMonitorPos,libglfw"
export
glfwGetMonitorPos : Ptr (GLFWmonitor) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwGetMonitorWorkarea,libglfw"
export
glfwGetMonitorWorkarea : Ptr (GLFWmonitor) -> Ptr (Int32) -> Ptr (Int32) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwGetMonitorPhysicalSize,libglfw"
export
glfwGetMonitorPhysicalSize : Ptr (GLFWmonitor) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwGetMonitorContentScale,libglfw"
export
glfwGetMonitorContentScale : Ptr (GLFWmonitor) -> Ptr (Float) -> Ptr (Float) -> PrimIO (())
    

%foreign "C:glfwGetMonitorName,libglfw"
export
glfwGetMonitorName : Ptr (GLFWmonitor) -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwSetMonitorUserPointer,libglfw"
export
glfwSetMonitorUserPointer : Ptr (GLFWmonitor) -> Ptr (()) -> PrimIO (())
    

%foreign "C:glfwGetMonitorUserPointer,libglfw"
export
glfwGetMonitorUserPointer : Ptr (GLFWmonitor) -> PrimIO (Ptr (()))
    

%foreign "C:glfwSetMonitorCallback,libglfw"
export
glfwSetMonitorCallback : GLFWmonitorfun -> PrimIO (GLFWmonitorfun)
    

%foreign "C:glfwGetVideoModes,libglfw"
export
glfwGetVideoModes : Ptr (GLFWmonitor) -> Ptr (Int32) -> PrimIO (Ptr (GLFWvidmode))
    

%foreign "C:glfwGetVideoMode,libglfw"
export
glfwGetVideoMode : Ptr (GLFWmonitor) -> PrimIO (Ptr (GLFWvidmode))
    

%foreign "C:glfwSetGamma,libglfw"
export
glfwSetGamma : Ptr (GLFWmonitor) -> Float -> PrimIO (())
    

%foreign "C:glfwGetGammaRamp,libglfw"
export
glfwGetGammaRamp : Ptr (GLFWmonitor) -> PrimIO (Ptr (GLFWgammaramp))
    

%foreign "C:glfwSetGammaRamp,libglfw"
export
glfwSetGammaRamp : Ptr (GLFWmonitor) -> Ptr (GLFWgammaramp) -> PrimIO (())
    

%foreign "C:glfwDefaultWindowHints,libglfw"
export
glfwDefaultWindowHints : PrimIO (())
    

%foreign "C:glfwWindowHint,libglfw"
export
glfwWindowHint : Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwWindowHintString,libglfw"
export
glfwWindowHintString : Int32 -> Ptr (Bits8) -> PrimIO (())
    

%foreign "C:glfwCreateWindow,libglfw"
export
glfwCreateWindow : Int32 -> Int32 -> Ptr (Bits8) -> Ptr (GLFWmonitor) -> Ptr (GLFWwindow) -> PrimIO (Ptr (GLFWwindow))
    

%foreign "C:glfwDestroyWindow,libglfw"
export
glfwDestroyWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwWindowShouldClose,libglfw"
export
glfwWindowShouldClose : Ptr (GLFWwindow) -> PrimIO (Int32)
    

%foreign "C:glfwSetWindowShouldClose,libglfw"
export
glfwSetWindowShouldClose : Ptr (GLFWwindow) -> Int32 -> PrimIO (())
    

%foreign "C:glfwGetWindowTitle,libglfw"
export
glfwGetWindowTitle : Ptr (GLFWwindow) -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwSetWindowTitle,libglfw"
export
glfwSetWindowTitle : Ptr (GLFWwindow) -> Ptr (Bits8) -> PrimIO (())
    

%foreign "C:glfwSetWindowIcon,libglfw"
export
glfwSetWindowIcon : Ptr (GLFWwindow) -> Int32 -> Ptr (GLFWimage) -> PrimIO (())
    

%foreign "C:glfwGetWindowPos,libglfw"
export
glfwGetWindowPos : Ptr (GLFWwindow) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwSetWindowPos,libglfw"
export
glfwSetWindowPos : Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwGetWindowSize,libglfw"
export
glfwGetWindowSize : Ptr (GLFWwindow) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwSetWindowSizeLimits,libglfw"
export
glfwSetWindowSizeLimits : Ptr (GLFWwindow) -> Int32 -> Int32 -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwSetWindowAspectRatio,libglfw"
export
glfwSetWindowAspectRatio : Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwSetWindowSize,libglfw"
export
glfwSetWindowSize : Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwGetFramebufferSize,libglfw"
export
glfwGetFramebufferSize : Ptr (GLFWwindow) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwGetWindowFrameSize,libglfw"
export
glfwGetWindowFrameSize : Ptr (GLFWwindow) -> Ptr (Int32) -> Ptr (Int32) -> Ptr (Int32) -> Ptr (Int32) -> PrimIO (())
    

%foreign "C:glfwGetWindowContentScale,libglfw"
export
glfwGetWindowContentScale : Ptr (GLFWwindow) -> Ptr (Float) -> Ptr (Float) -> PrimIO (())
    

%foreign "C:glfwGetWindowOpacity,libglfw"
export
glfwGetWindowOpacity : Ptr (GLFWwindow) -> PrimIO (Float)
    

%foreign "C:glfwSetWindowOpacity,libglfw"
export
glfwSetWindowOpacity : Ptr (GLFWwindow) -> Float -> PrimIO (())
    

%foreign "C:glfwIconifyWindow,libglfw"
export
glfwIconifyWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwRestoreWindow,libglfw"
export
glfwRestoreWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwMaximizeWindow,libglfw"
export
glfwMaximizeWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwShowWindow,libglfw"
export
glfwShowWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwHideWindow,libglfw"
export
glfwHideWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwFocusWindow,libglfw"
export
glfwFocusWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwRequestWindowAttention,libglfw"
export
glfwRequestWindowAttention : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwGetWindowMonitor,libglfw"
export
glfwGetWindowMonitor : Ptr (GLFWwindow) -> PrimIO (Ptr (GLFWmonitor))
    

%foreign "C:glfwSetWindowMonitor,libglfw"
export
glfwSetWindowMonitor : Ptr (GLFWwindow) -> Ptr (GLFWmonitor) -> Int32 -> Int32 -> Int32 -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwGetWindowAttrib,libglfw"
export
glfwGetWindowAttrib : Ptr (GLFWwindow) -> Int32 -> PrimIO (Int32)
    

%foreign "C:glfwSetWindowAttrib,libglfw"
export
glfwSetWindowAttrib : Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwSetWindowUserPointer,libglfw"
export
glfwSetWindowUserPointer : Ptr (GLFWwindow) -> Ptr (()) -> PrimIO (())
    

%foreign "C:glfwGetWindowUserPointer,libglfw"
export
glfwGetWindowUserPointer : Ptr (GLFWwindow) -> PrimIO (Ptr (()))
    

%foreign "C:glfwSetWindowPosCallback,libglfw"
export
glfwSetWindowPosCallback : Ptr (GLFWwindow) -> GLFWwindowposfun -> PrimIO (GLFWwindowposfun)
    

%foreign "C:glfwSetWindowSizeCallback,libglfw"
export
glfwSetWindowSizeCallback : Ptr (GLFWwindow) -> GLFWwindowsizefun -> PrimIO (GLFWwindowsizefun)
    

%foreign "C:glfwSetWindowCloseCallback,libglfw"
export
glfwSetWindowCloseCallback : Ptr (GLFWwindow) -> GLFWwindowclosefun -> PrimIO (GLFWwindowclosefun)
    

%foreign "C:glfwSetWindowRefreshCallback,libglfw"
export
glfwSetWindowRefreshCallback : Ptr (GLFWwindow) -> GLFWwindowrefreshfun -> PrimIO (GLFWwindowrefreshfun)
    

%foreign "C:glfwSetWindowFocusCallback,libglfw"
export
glfwSetWindowFocusCallback : Ptr (GLFWwindow) -> GLFWwindowfocusfun -> PrimIO (GLFWwindowfocusfun)
    

%foreign "C:glfwSetWindowIconifyCallback,libglfw"
export
glfwSetWindowIconifyCallback : Ptr (GLFWwindow) -> GLFWwindowiconifyfun -> PrimIO (GLFWwindowiconifyfun)
    

%foreign "C:glfwSetWindowMaximizeCallback,libglfw"
export
glfwSetWindowMaximizeCallback : Ptr (GLFWwindow) -> GLFWwindowmaximizefun -> PrimIO (GLFWwindowmaximizefun)
    

%foreign "C:glfwSetFramebufferSizeCallback,libglfw"
export
glfwSetFramebufferSizeCallback : Ptr (GLFWwindow) -> GLFWframebuffersizefun -> PrimIO (GLFWframebuffersizefun)
    

%foreign "C:glfwSetWindowContentScaleCallback,libglfw"
export
glfwSetWindowContentScaleCallback : Ptr (GLFWwindow) -> GLFWwindowcontentscalefun -> PrimIO (GLFWwindowcontentscalefun)
    

%foreign "C:glfwPollEvents,libglfw"
export
glfwPollEvents : PrimIO (())
    

%foreign "C:glfwWaitEvents,libglfw"
export
glfwWaitEvents : PrimIO (())
    

%foreign "C:glfwWaitEventsTimeout,libglfw"
export
glfwWaitEventsTimeout : Double -> PrimIO (())
    

%foreign "C:glfwPostEmptyEvent,libglfw"
export
glfwPostEmptyEvent : PrimIO (())
    

%foreign "C:glfwGetInputMode,libglfw"
export
glfwGetInputMode : Ptr (GLFWwindow) -> Int32 -> PrimIO (Int32)
    

%foreign "C:glfwSetInputMode,libglfw"
export
glfwSetInputMode : Ptr (GLFWwindow) -> Int32 -> Int32 -> PrimIO (())
    

%foreign "C:glfwRawMouseMotionSupported,libglfw"
export
glfwRawMouseMotionSupported : PrimIO (Int32)
    

%foreign "C:glfwGetKeyName,libglfw"
export
glfwGetKeyName : Int32 -> Int32 -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetKeyScancode,libglfw"
export
glfwGetKeyScancode : Int32 -> PrimIO (Int32)
    

%foreign "C:glfwGetKey,libglfw"
export
glfwGetKey : Ptr (GLFWwindow) -> Int32 -> PrimIO (Int32)
    

%foreign "C:glfwGetMouseButton,libglfw"
export
glfwGetMouseButton : Ptr (GLFWwindow) -> Int32 -> PrimIO (Int32)
    

%foreign "C:glfwGetCursorPos,libglfw"
export
glfwGetCursorPos : Ptr (GLFWwindow) -> Ptr (Double) -> Ptr (Double) -> PrimIO (())
    

%foreign "C:glfwSetCursorPos,libglfw"
export
glfwSetCursorPos : Ptr (GLFWwindow) -> Double -> Double -> PrimIO (())
    

%foreign "C:glfwCreateCursor,libglfw"
export
glfwCreateCursor : Ptr (GLFWimage) -> Int32 -> Int32 -> PrimIO (Ptr (GLFWcursor))
    

%foreign "C:glfwCreateStandardCursor,libglfw"
export
glfwCreateStandardCursor : Int32 -> PrimIO (Ptr (GLFWcursor))
    

%foreign "C:glfwDestroyCursor,libglfw"
export
glfwDestroyCursor : Ptr (GLFWcursor) -> PrimIO (())
    

%foreign "C:glfwSetCursor,libglfw"
export
glfwSetCursor : Ptr (GLFWwindow) -> Ptr (GLFWcursor) -> PrimIO (())
    

%foreign "C:glfwSetKeyCallback,libglfw"
export
glfwSetKeyCallback : Ptr (GLFWwindow) -> GLFWkeyfun -> PrimIO (GLFWkeyfun)
    

%foreign "C:glfwSetCharCallback,libglfw"
export
glfwSetCharCallback : Ptr (GLFWwindow) -> GLFWcharfun -> PrimIO (GLFWcharfun)
    

%foreign "C:glfwSetCharModsCallback,libglfw"
export
glfwSetCharModsCallback : Ptr (GLFWwindow) -> GLFWcharmodsfun -> PrimIO (GLFWcharmodsfun)
    

%foreign "C:glfwSetMouseButtonCallback,libglfw"
export
glfwSetMouseButtonCallback : Ptr (GLFWwindow) -> GLFWmousebuttonfun -> PrimIO (GLFWmousebuttonfun)
    

%foreign "C:glfwSetCursorPosCallback,libglfw"
export
glfwSetCursorPosCallback : Ptr (GLFWwindow) -> GLFWcursorposfun -> PrimIO (GLFWcursorposfun)
    

%foreign "C:glfwSetCursorEnterCallback,libglfw"
export
glfwSetCursorEnterCallback : Ptr (GLFWwindow) -> GLFWcursorenterfun -> PrimIO (GLFWcursorenterfun)
    

%foreign "C:glfwSetScrollCallback,libglfw"
export
glfwSetScrollCallback : Ptr (GLFWwindow) -> GLFWscrollfun -> PrimIO (GLFWscrollfun)
    

%foreign "C:glfwSetDropCallback,libglfw"
export
glfwSetDropCallback : Ptr (GLFWwindow) -> GLFWdropfun -> PrimIO (GLFWdropfun)
    

%foreign "C:glfwJoystickPresent,libglfw"
export
glfwJoystickPresent : Int32 -> PrimIO (Int32)
    

%foreign "C:glfwGetJoystickAxes,libglfw"
export
glfwGetJoystickAxes : Int32 -> Ptr (Int32) -> PrimIO (Ptr (Float))
    

%foreign "C:glfwGetJoystickButtons,libglfw"
export
glfwGetJoystickButtons : Int32 -> Ptr (Int32) -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetJoystickHats,libglfw"
export
glfwGetJoystickHats : Int32 -> Ptr (Int32) -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetJoystickName,libglfw"
export
glfwGetJoystickName : Int32 -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetJoystickGUID,libglfw"
export
glfwGetJoystickGUID : Int32 -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwSetJoystickUserPointer,libglfw"
export
glfwSetJoystickUserPointer : Int32 -> Ptr (()) -> PrimIO (())
    

%foreign "C:glfwGetJoystickUserPointer,libglfw"
export
glfwGetJoystickUserPointer : Int32 -> PrimIO (Ptr (()))
    

%foreign "C:glfwJoystickIsGamepad,libglfw"
export
glfwJoystickIsGamepad : Int32 -> PrimIO (Int32)
    

%foreign "C:glfwSetJoystickCallback,libglfw"
export
glfwSetJoystickCallback : GLFWjoystickfun -> PrimIO (GLFWjoystickfun)
    

%foreign "C:glfwUpdateGamepadMappings,libglfw"
export
glfwUpdateGamepadMappings : Ptr (Bits8) -> PrimIO (Int32)
    

%foreign "C:glfwGetGamepadName,libglfw"
export
glfwGetGamepadName : Int32 -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetGamepadState,libglfw"
export
glfwGetGamepadState : Int32 -> Ptr (GLFWgamepadstate) -> PrimIO (Int32)
    

%foreign "C:glfwSetClipboardString,libglfw"
export
glfwSetClipboardString : Ptr (GLFWwindow) -> Ptr (Bits8) -> PrimIO (())
    

%foreign "C:glfwGetClipboardString,libglfw"
export
glfwGetClipboardString : Ptr (GLFWwindow) -> PrimIO (Ptr (Bits8))
    

%foreign "C:glfwGetTime,libglfw"
export
glfwGetTime : PrimIO (Double)
    

%foreign "C:glfwSetTime,libglfw"
export
glfwSetTime : Double -> PrimIO (())
    

%foreign "C:glfwGetTimerValue,libglfw"
export
glfwGetTimerValue : PrimIO (Bits64)
    

%foreign "C:glfwGetTimerFrequency,libglfw"
export
glfwGetTimerFrequency : PrimIO (Bits64)
    

%foreign "C:glfwMakeContextCurrent,libglfw"
export
glfwMakeContextCurrent : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwGetCurrentContext,libglfw"
export
glfwGetCurrentContext : PrimIO (Ptr (GLFWwindow))
    

%foreign "C:glfwSwapBuffers,libglfw"
export
glfwSwapBuffers : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwSwapInterval,libglfw"
export
glfwSwapInterval : Int32 -> PrimIO (())
    

%foreign "C:glfwExtensionSupported,libglfw"
export
glfwExtensionSupported : Ptr (Bits8) -> PrimIO (Int32)
    

%foreign "C:glfwGetProcAddress,libglfw"
export
glfwGetProcAddress : Ptr (Bits8) -> PrimIO (GLFWglproc)
    

%foreign "C:glfwVulkanSupported,libglfw"
export
glfwVulkanSupported : PrimIO (Int32)
    

%foreign "C:glfwGetRequiredInstanceExtensions,libglfw"
export
glfwGetRequiredInstanceExtensions : Ptr (Bits32) -> PrimIO (Ptr (Ptr (Bits8)))
    

public export
GLFW_CLIENT_API_ : Int32
GLFW_CLIENT_API_ = 0x00022001

public export
GLFW_NO_API_ : Int32
GLFW_NO_API_ = 0
