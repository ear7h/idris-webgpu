
module Graphics.GLFW.Sys

import public System.FFI
import Data.Bits

import public Utils.CTypes



public export
GLFWglproc : Type
GLFWglproc = Ptr (() -> ())

public export
GLFWvkproc : Type
GLFWvkproc = Ptr (() -> ())

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
GLFWallocatefun = Ptr (U64 -> Ptr (()) -> Ptr (()))

public export
GLFWreallocatefun : Type
GLFWreallocatefun = Ptr (Ptr (()) -> U64 -> Ptr (()) -> Ptr (()))

public export
GLFWdeallocatefun : Type
GLFWdeallocatefun = Ptr (Ptr (()) -> Ptr (()) -> ())

public export
GLFWerrorfun : Type
GLFWerrorfun = Ptr (I64 -> Ptr (U8) -> ())

public export
GLFWwindowposfun : Type
GLFWwindowposfun = Ptr (Ptr (GLFWwindow) -> I64 -> I64 -> ())

public export
GLFWwindowsizefun : Type
GLFWwindowsizefun = Ptr (Ptr (GLFWwindow) -> I64 -> I64 -> ())

public export
GLFWwindowclosefun : Type
GLFWwindowclosefun = Ptr (Ptr (GLFWwindow) -> ())

public export
GLFWwindowrefreshfun : Type
GLFWwindowrefreshfun = Ptr (Ptr (GLFWwindow) -> ())

public export
GLFWwindowfocusfun : Type
GLFWwindowfocusfun = Ptr (Ptr (GLFWwindow) -> I64 -> ())

public export
GLFWwindowiconifyfun : Type
GLFWwindowiconifyfun = Ptr (Ptr (GLFWwindow) -> I64 -> ())

public export
GLFWwindowmaximizefun : Type
GLFWwindowmaximizefun = Ptr (Ptr (GLFWwindow) -> I64 -> ())

public export
GLFWframebuffersizefun : Type
GLFWframebuffersizefun = Ptr (Ptr (GLFWwindow) -> I64 -> I64 -> ())

public export
GLFWwindowcontentscalefun : Type
GLFWwindowcontentscalefun = Ptr (Ptr (GLFWwindow) -> F32 -> F32 -> ())

public export
GLFWmousebuttonfun : Type
GLFWmousebuttonfun = Ptr (Ptr (GLFWwindow) -> I64 -> I64 -> I64 -> ())

public export
GLFWcursorposfun : Type
GLFWcursorposfun = Ptr (Ptr (GLFWwindow) -> F64 -> F64 -> ())

public export
GLFWcursorenterfun : Type
GLFWcursorenterfun = Ptr (Ptr (GLFWwindow) -> I64 -> ())

public export
GLFWscrollfun : Type
GLFWscrollfun = Ptr (Ptr (GLFWwindow) -> F64 -> F64 -> ())

public export
GLFWkeyfun : Type
GLFWkeyfun = Ptr (Ptr (GLFWwindow) -> I64 -> I64 -> I64 -> I64 -> ())

public export
GLFWcharfun : Type
GLFWcharfun = Ptr (Ptr (GLFWwindow) -> U64 -> ())

public export
GLFWcharmodsfun : Type
GLFWcharmodsfun = Ptr (Ptr (GLFWwindow) -> U64 -> I64 -> ())

public export
GLFWdropfun : Type
GLFWdropfun = Ptr (Ptr (GLFWwindow) -> I64 -> List (Ptr (U8)) -> ())

public export
GLFWmonitorfun : Type
GLFWmonitorfun = Ptr (Ptr (GLFWmonitor) -> I64 -> ())

public export
GLFWjoystickfun : Type
GLFWjoystickfun = Ptr (I64 -> I64 -> ())

public export
GLFWvidmode : Type
GLFWvidmode = Struct "GLFWvidmode" [("width",  (I64)),("height",  (I64)),("redBits",  (I64)),("greenBits",  (I64)),("blueBits",  (I64)),("refreshRate",  (I64))]

public export
GLFWgammaramp : Type
GLFWgammaramp = Struct "GLFWgammaramp" [("red", Ptr (U16)),("green", Ptr (U16)),("blue", Ptr (U16)),("size",  (U64))]

public export
GLFWimage : Type
GLFWimage = Struct "GLFWimage" [("width",  (I64)),("height",  (I64)),("pixels", Ptr (U8))]

public export
GLFWgamepadstate : Type
GLFWgamepadstate = Struct "GLFWgamepadstate" [("buttons",  (List (U8))),("axes",  (List (F32)))]

public export
GLFWallocator : Type
GLFWallocator = Struct "GLFWallocator" [("allocate",  (GLFWallocatefun)),("reallocate",  (GLFWreallocatefun)),("deallocate",  (GLFWdeallocatefun)),("user", Ptr (()))]

%foreign "C:glfwInit,libglfw"
export
glfwInit : PrimIO (I64)
    

%foreign "C:glfwTerminate,libglfw"
export
glfwTerminate : PrimIO (())
    

%foreign "C:glfwInitHint,libglfw"
export
glfwInitHint : I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwInitAllocator,libglfw"
export
glfwInitAllocator : Ptr (GLFWallocator) -> PrimIO (())
    

%foreign "C:glfwGetVersion,libglfw"
export
glfwGetVersion : Ptr (I64) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwGetVersionString,libglfw"
export
glfwGetVersionString : PrimIO (Ptr (U8))
    

%foreign "C:glfwGetError,libglfw"
export
glfwGetError : Ptr (Ptr (U8)) -> PrimIO (I64)
    

%foreign "C:glfwSetErrorCallback,libglfw"
export
glfwSetErrorCallback : GLFWerrorfun -> PrimIO (GLFWerrorfun)
    

%foreign "C:glfwGetPlatform,libglfw"
export
glfwGetPlatform : PrimIO (I64)
    

%foreign "C:glfwPlatformSupported,libglfw"
export
glfwPlatformSupported : I64 -> PrimIO (I64)
    

%foreign "C:glfwGetMonitors,libglfw"
export
glfwGetMonitors : Ptr (I64) -> PrimIO (Ptr (Ptr (GLFWmonitor)))
    

%foreign "C:glfwGetPrimaryMonitor,libglfw"
export
glfwGetPrimaryMonitor : PrimIO (Ptr (GLFWmonitor))
    

%foreign "C:glfwGetMonitorPos,libglfw"
export
glfwGetMonitorPos : Ptr (GLFWmonitor) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwGetMonitorWorkarea,libglfw"
export
glfwGetMonitorWorkarea : Ptr (GLFWmonitor) -> Ptr (I64) -> Ptr (I64) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwGetMonitorPhysicalSize,libglfw"
export
glfwGetMonitorPhysicalSize : Ptr (GLFWmonitor) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwGetMonitorContentScale,libglfw"
export
glfwGetMonitorContentScale : Ptr (GLFWmonitor) -> Ptr (F32) -> Ptr (F32) -> PrimIO (())
    

%foreign "C:glfwGetMonitorName,libglfw"
export
glfwGetMonitorName : Ptr (GLFWmonitor) -> PrimIO (Ptr (U8))
    

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
glfwGetVideoModes : Ptr (GLFWmonitor) -> Ptr (I64) -> PrimIO (Ptr (GLFWvidmode))
    

%foreign "C:glfwGetVideoMode,libglfw"
export
glfwGetVideoMode : Ptr (GLFWmonitor) -> PrimIO (Ptr (GLFWvidmode))
    

%foreign "C:glfwSetGamma,libglfw"
export
glfwSetGamma : Ptr (GLFWmonitor) -> F32 -> PrimIO (())
    

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
glfwWindowHint : I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwWindowHintString,libglfw"
export
glfwWindowHintString : I64 -> Ptr (U8) -> PrimIO (())
    

%foreign "C:glfwCreateWindow,libglfw"
export
glfwCreateWindow : I64 -> I64 -> Ptr (U8) -> Ptr (GLFWmonitor) -> Ptr (GLFWwindow) -> PrimIO (Ptr (GLFWwindow))
    

%foreign "C:glfwDestroyWindow,libglfw"
export
glfwDestroyWindow : Ptr (GLFWwindow) -> PrimIO (())
    

%foreign "C:glfwWindowShouldClose,libglfw"
export
glfwWindowShouldClose : Ptr (GLFWwindow) -> PrimIO (I64)
    

%foreign "C:glfwSetWindowShouldClose,libglfw"
export
glfwSetWindowShouldClose : Ptr (GLFWwindow) -> I64 -> PrimIO (())
    

%foreign "C:glfwGetWindowTitle,libglfw"
export
glfwGetWindowTitle : Ptr (GLFWwindow) -> PrimIO (Ptr (U8))
    

%foreign "C:glfwSetWindowTitle,libglfw"
export
glfwSetWindowTitle : Ptr (GLFWwindow) -> Ptr (U8) -> PrimIO (())
    

%foreign "C:glfwSetWindowIcon,libglfw"
export
glfwSetWindowIcon : Ptr (GLFWwindow) -> I64 -> Ptr (GLFWimage) -> PrimIO (())
    

%foreign "C:glfwGetWindowPos,libglfw"
export
glfwGetWindowPos : Ptr (GLFWwindow) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwSetWindowPos,libglfw"
export
glfwSetWindowPos : Ptr (GLFWwindow) -> I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwGetWindowSize,libglfw"
export
glfwGetWindowSize : Ptr (GLFWwindow) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwSetWindowSizeLimits,libglfw"
export
glfwSetWindowSizeLimits : Ptr (GLFWwindow) -> I64 -> I64 -> I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwSetWindowAspectRatio,libglfw"
export
glfwSetWindowAspectRatio : Ptr (GLFWwindow) -> I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwSetWindowSize,libglfw"
export
glfwSetWindowSize : Ptr (GLFWwindow) -> I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwGetFramebufferSize,libglfw"
export
glfwGetFramebufferSize : Ptr (GLFWwindow) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwGetWindowFrameSize,libglfw"
export
glfwGetWindowFrameSize : Ptr (GLFWwindow) -> Ptr (I64) -> Ptr (I64) -> Ptr (I64) -> Ptr (I64) -> PrimIO (())
    

%foreign "C:glfwGetWindowContentScale,libglfw"
export
glfwGetWindowContentScale : Ptr (GLFWwindow) -> Ptr (F32) -> Ptr (F32) -> PrimIO (())
    

%foreign "C:glfwGetWindowOpacity,libglfw"
export
glfwGetWindowOpacity : Ptr (GLFWwindow) -> PrimIO (F32)
    

%foreign "C:glfwSetWindowOpacity,libglfw"
export
glfwSetWindowOpacity : Ptr (GLFWwindow) -> F32 -> PrimIO (())
    

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
glfwSetWindowMonitor : Ptr (GLFWwindow) -> Ptr (GLFWmonitor) -> I64 -> I64 -> I64 -> I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwGetWindowAttrib,libglfw"
export
glfwGetWindowAttrib : Ptr (GLFWwindow) -> I64 -> PrimIO (I64)
    

%foreign "C:glfwSetWindowAttrib,libglfw"
export
glfwSetWindowAttrib : Ptr (GLFWwindow) -> I64 -> I64 -> PrimIO (())
    

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
glfwWaitEventsTimeout : F64 -> PrimIO (())
    

%foreign "C:glfwPostEmptyEvent,libglfw"
export
glfwPostEmptyEvent : PrimIO (())
    

%foreign "C:glfwGetInputMode,libglfw"
export
glfwGetInputMode : Ptr (GLFWwindow) -> I64 -> PrimIO (I64)
    

%foreign "C:glfwSetInputMode,libglfw"
export
glfwSetInputMode : Ptr (GLFWwindow) -> I64 -> I64 -> PrimIO (())
    

%foreign "C:glfwRawMouseMotionSupported,libglfw"
export
glfwRawMouseMotionSupported : PrimIO (I64)
    

%foreign "C:glfwGetKeyName,libglfw"
export
glfwGetKeyName : I64 -> I64 -> PrimIO (Ptr (U8))
    

%foreign "C:glfwGetKeyScancode,libglfw"
export
glfwGetKeyScancode : I64 -> PrimIO (I64)
    

%foreign "C:glfwGetKey,libglfw"
export
glfwGetKey : Ptr (GLFWwindow) -> I64 -> PrimIO (I64)
    

%foreign "C:glfwGetMouseButton,libglfw"
export
glfwGetMouseButton : Ptr (GLFWwindow) -> I64 -> PrimIO (I64)
    

%foreign "C:glfwGetCursorPos,libglfw"
export
glfwGetCursorPos : Ptr (GLFWwindow) -> Ptr (F64) -> Ptr (F64) -> PrimIO (())
    

%foreign "C:glfwSetCursorPos,libglfw"
export
glfwSetCursorPos : Ptr (GLFWwindow) -> F64 -> F64 -> PrimIO (())
    

%foreign "C:glfwCreateCursor,libglfw"
export
glfwCreateCursor : Ptr (GLFWimage) -> I64 -> I64 -> PrimIO (Ptr (GLFWcursor))
    

%foreign "C:glfwCreateStandardCursor,libglfw"
export
glfwCreateStandardCursor : I64 -> PrimIO (Ptr (GLFWcursor))
    

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
glfwJoystickPresent : I64 -> PrimIO (I64)
    

%foreign "C:glfwGetJoystickAxes,libglfw"
export
glfwGetJoystickAxes : I64 -> Ptr (I64) -> PrimIO (Ptr (F32))
    

%foreign "C:glfwGetJoystickButtons,libglfw"
export
glfwGetJoystickButtons : I64 -> Ptr (I64) -> PrimIO (Ptr (U8))
    

%foreign "C:glfwGetJoystickHats,libglfw"
export
glfwGetJoystickHats : I64 -> Ptr (I64) -> PrimIO (Ptr (U8))
    

%foreign "C:glfwGetJoystickName,libglfw"
export
glfwGetJoystickName : I64 -> PrimIO (Ptr (U8))
    

%foreign "C:glfwGetJoystickGUID,libglfw"
export
glfwGetJoystickGUID : I64 -> PrimIO (Ptr (U8))
    

%foreign "C:glfwSetJoystickUserPointer,libglfw"
export
glfwSetJoystickUserPointer : I64 -> Ptr (()) -> PrimIO (())
    

%foreign "C:glfwGetJoystickUserPointer,libglfw"
export
glfwGetJoystickUserPointer : I64 -> PrimIO (Ptr (()))
    

%foreign "C:glfwJoystickIsGamepad,libglfw"
export
glfwJoystickIsGamepad : I64 -> PrimIO (I64)
    

%foreign "C:glfwSetJoystickCallback,libglfw"
export
glfwSetJoystickCallback : GLFWjoystickfun -> PrimIO (GLFWjoystickfun)
    

%foreign "C:glfwUpdateGamepadMappings,libglfw"
export
glfwUpdateGamepadMappings : Ptr (U8) -> PrimIO (I64)
    

%foreign "C:glfwGetGamepadName,libglfw"
export
glfwGetGamepadName : I64 -> PrimIO (Ptr (U8))
    

%foreign "C:glfwGetGamepadState,libglfw"
export
glfwGetGamepadState : I64 -> Ptr (GLFWgamepadstate) -> PrimIO (I64)
    

%foreign "C:glfwSetClipboardString,libglfw"
export
glfwSetClipboardString : Ptr (GLFWwindow) -> Ptr (U8) -> PrimIO (())
    

%foreign "C:glfwGetClipboardString,libglfw"
export
glfwGetClipboardString : Ptr (GLFWwindow) -> PrimIO (Ptr (U8))
    

%foreign "C:glfwGetTime,libglfw"
export
glfwGetTime : PrimIO (F64)
    

%foreign "C:glfwSetTime,libglfw"
export
glfwSetTime : F64 -> PrimIO (())
    

%foreign "C:glfwGetTimerValue,libglfw"
export
glfwGetTimerValue : PrimIO (U64)
    

%foreign "C:glfwGetTimerFrequency,libglfw"
export
glfwGetTimerFrequency : PrimIO (U64)
    

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
glfwSwapInterval : I64 -> PrimIO (())
    

%foreign "C:glfwExtensionSupported,libglfw"
export
glfwExtensionSupported : Ptr (U8) -> PrimIO (I64)
    

%foreign "C:glfwGetProcAddress,libglfw"
export
glfwGetProcAddress : Ptr (U8) -> PrimIO (GLFWglproc)
    

%foreign "C:glfwVulkanSupported,libglfw"
export
glfwVulkanSupported : PrimIO (I64)
    

%foreign "C:glfwGetRequiredInstanceExtensions,libglfw"
export
glfwGetRequiredInstanceExtensions : Ptr (U32) -> PrimIO (Ptr (Ptr (U8)))
    
