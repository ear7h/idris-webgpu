#include <stdbool.h>
#include <assert.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#include <webgpu/wgpu.h>
// TODO: patch glfw3webgpu? or set this portably

#ifdef __APPLE__
#define GLFW_EXPOSE_NATIVE_COCOA
#else
#define GLFW_EXPOSE_NATIVE_WAYLAND
#endif

#include <glfw3webgpu.c>

struct TestStruct {
    uint8_t a;
    uint16_t b;
    uint32_t c;
    uint64_t d;
};

void printStruct(
    struct TestStruct c
) {
    printf("%hhd\n", c.a);
    printf("%hd\n", c.b);
    printf("%d\n", c.c);
    printf("%lld\n", c.d);
}

static void wgpuInstanceRequestAdapterSync_cb(
    WGPURequestAdapterStatus status,
    WGPUAdapter adapter,
    WGPUStringView message,
    void *userdata1,
    void *userdata2
) {
    // TODO: log the status, error handling
    printf("in wgpuInstanceRequestAdapterSync_cb %d %p\n", status, adapter);
    printf("%.*s\n", (int) message.length, message.data);
    *(WGPUAdapter *) userdata1 = adapter;
}

WGPUAdapter wgpuInstanceRequestAdapterSync(
    WGPUInstance instance,
    WGPURequestAdapterOptions * options
) {
    printf("options: %ld\n", options);
    printf("backend type: %d\n", options->backendType);
    printf("adapter options surface: %ld\n", options->compatibleSurface);

    WGPUAdapter adapter = NULL;

    WGPUFuture fut = wgpuInstanceRequestAdapter(
        instance,
        options,
        (struct WGPURequestAdapterCallbackInfo) {
            .nextInChain = NULL,
            .mode = WGPUCallbackMode_AllowProcessEvents,
            .callback = wgpuInstanceRequestAdapterSync_cb,
            .userdata1 = &adapter,
            .userdata2 = NULL
        }
    );

    printf("adpter requested\n");

    // TODO: should use wgpuInstanceWaitAny once implemented
    while (adapter == NULL) {
        printf("calling wgpuInstanceProcessEvents\n");
        wgpuInstanceProcessEvents(instance);
        printf("returned wgpuInstanceProcessEvents\n");
        sleep(1);
    }

    return adapter;
}

void wgpuInstanceRequestDeviceSync_cb(
    WGPURequestDeviceStatus status,
    WGPUDevice device,
    WGPUStringView message,
    void *userdata1,
    void *userdata2
) {
    // TODO: log the status, error handling
    printf("in wgpuInstanceRequestDeviceSync_cb %d %p\n", status, device);
    printf("%.*s\n", (int) message.length, message.data);
    *(WGPUDevice *) userdata1 = device;
}


WGPUDevice wgpuAdapterRequestDeviceSync(
    WGPUInstance instance,
    WGPUAdapter adapter,
    WGPUDeviceDescriptor const * descriptor
) {
    WGPUDevice device = NULL;

    WGPUFuture fut = wgpuAdapterRequestDevice(
        adapter,
        descriptor,
        (WGPURequestDeviceCallbackInfo) {
            .nextInChain = NULL,
            .mode = WGPUCallbackMode_AllowProcessEvents,
            .callback = wgpuInstanceRequestDeviceSync_cb,
            .userdata1 = &device,
            .userdata2 = NULL
        }
    );

    // TODO: should use wgpuInstanceWaitAny once implemented
    while (adapter == NULL) {
        printf("calling wgpuInstanceProcessEvents\n");
        wgpuInstanceProcessEvents(instance);
        printf("returned wgpuInstanceProcessEvents\n");
        sleep(1);
    }

    return device;
}

void* mkFunctionPtr(void * f) {
    return f;
}


// https://github.com/gfx-rs/wgpu-native/blob/3c721aa403aa08d90a1b46c5001e6e012e3c02ee/examples/framework/framework.c#L3-L27
static void log_callback(
    WGPULogLevel level,
    WGPUStringView message,
    void *userdata
) {
    char *level_str;
    switch (level) {
        case WGPULogLevel_Error:
            level_str = "error";
            break;
        case WGPULogLevel_Warn:
            level_str = "warn";
            break;
        case WGPULogLevel_Info:
            level_str = "info";
            break;
        case WGPULogLevel_Debug:
            level_str = "debug";
            break;
        case WGPULogLevel_Trace:
            level_str = "trace";
            break;
        default:
            level_str = "unknown_level";
    }
    fprintf(stderr, "[wgpu] [%s] %.*s\n", level_str, (int) message.length, message.data);
}


void wgpuSetupLogging(int dummy) {
    wgpuSetLogCallback(log_callback, NULL);
    wgpuSetLogLevel(WGPULogLevel_Trace);
}

char * wgpuStringClone(WGPUStringView v) {
    char * ret = malloc(v.length + 1);
    ret[v.length] = 0;
    memcpy(ret, v.data, v.length);
    return ret;
}

void wgpuSurfaceConfigHelper(
    GLFWwindow * window,
    WGPUAdapter adapter,
    WGPUDevice device,
    WGPUSurface surface
) {
    printf("get window size\n");
    int width, height;
    glfwGetWindowSize(window, &width, &height);

    printf("get cap\n");
    WGPUSurfaceCapabilities cap;
    wgpuSurfaceGetCapabilities(surface, adapter, &cap);

    WGPUSurfaceConfiguration conf = (WGPUSurfaceConfiguration){
        .device = device,
        .usage = WGPUTextureUsage_RenderAttachment,
        .format = cap.formats[0],
        .presentMode = WGPUPresentMode_Fifo,
        .alphaMode = cap.alphaModes[0],
        .width = width,
        .height = height,
    };

    printf("configure\n");
    wgpuSurfaceConfigure(surface, &conf);
    wgpuSurfaceCapabilitiesFreeMembers(cap);
}
