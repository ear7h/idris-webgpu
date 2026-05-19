
import System.FFI

U8 : Type
U8 = Bits8

I8 : Type
I8 = Bits8

U16 : Type
U16 = Bits16

I16 : Type
I16 = Bits16

U32 : Type
U32 = Bits32

I32 : Type
I32 = Bits32

U64 : Type
U64 = Bits64

I64 : Type
I64 = Bits64

Enum : Type
Enum = Bits32

F32 : Type
F32 = Bits32

F64 : Type
F64 = Bits64


WGPUFlags : Type
WGPUFlags = U64

WGPUBool : Type
WGPUBool = U32

WGPUStringView : Type
WGPUStringView = Struct "WGPUStringView" [("data", Ptr (U8)),("length",  (U64))]

WGPUAdapter : Type
WGPUAdapter = Ptr (Struct "WGPUAdapterImpl" [])

WGPUBindGroup : Type
WGPUBindGroup = Ptr (Struct "WGPUBindGroupImpl" [])

WGPUBindGroupLayout : Type
WGPUBindGroupLayout = Ptr (Struct "WGPUBindGroupLayoutImpl" [])

WGPUBuffer : Type
WGPUBuffer = Ptr (Struct "WGPUBufferImpl" [])

WGPUCommandBuffer : Type
WGPUCommandBuffer = Ptr (Struct "WGPUCommandBufferImpl" [])

WGPUCommandEncoder : Type
WGPUCommandEncoder = Ptr (Struct "WGPUCommandEncoderImpl" [])

WGPUComputePassEncoder : Type
WGPUComputePassEncoder = Ptr (Struct "WGPUComputePassEncoderImpl" [])

WGPUComputePipeline : Type
WGPUComputePipeline = Ptr (Struct "WGPUComputePipelineImpl" [])

WGPUDevice : Type
WGPUDevice = Ptr (Struct "WGPUDeviceImpl" [])

WGPUInstance : Type
WGPUInstance = Ptr (Struct "WGPUInstanceImpl" [])

WGPUPipelineLayout : Type
WGPUPipelineLayout = Ptr (Struct "WGPUPipelineLayoutImpl" [])

WGPUQuerySet : Type
WGPUQuerySet = Ptr (Struct "WGPUQuerySetImpl" [])

WGPUQueue : Type
WGPUQueue = Ptr (Struct "WGPUQueueImpl" [])

WGPURenderBundle : Type
WGPURenderBundle = Ptr (Struct "WGPURenderBundleImpl" [])

WGPURenderBundleEncoder : Type
WGPURenderBundleEncoder = Ptr (Struct "WGPURenderBundleEncoderImpl" [])

WGPURenderPassEncoder : Type
WGPURenderPassEncoder = Ptr (Struct "WGPURenderPassEncoderImpl" [])

WGPURenderPipeline : Type
WGPURenderPipeline = Ptr (Struct "WGPURenderPipelineImpl" [])

WGPUSampler : Type
WGPUSampler = Ptr (Struct "WGPUSamplerImpl" [])

WGPUShaderModule : Type
WGPUShaderModule = Ptr (Struct "WGPUShaderModuleImpl" [])

WGPUSurface : Type
WGPUSurface = Ptr (Struct "WGPUSurfaceImpl" [])

WGPUTexture : Type
WGPUTexture = Ptr (Struct "WGPUTextureImpl" [])

WGPUTextureView : Type
WGPUTextureView = Ptr (Struct "WGPUTextureViewImpl" [])

WGPUAdapterType : Type
WGPUAdapterType = Enum

WGPUAdapterType_DiscreteGPU : WGPUAdapterType
WGPUAdapterType_DiscreteGPU = 0x00000001

WGPUAdapterType_IntegratedGPU : WGPUAdapterType
WGPUAdapterType_IntegratedGPU = 0x00000002

WGPUAdapterType_CPU : WGPUAdapterType
WGPUAdapterType_CPU = 0x00000003

WGPUAdapterType_Unknown : WGPUAdapterType
WGPUAdapterType_Unknown = 0x00000004

WGPUAdapterType_Force32 : WGPUAdapterType
WGPUAdapterType_Force32 = 0x7FFFFFFF

WGPUAddressMode : Type
WGPUAddressMode = Enum

WGPUAddressMode_Undefined : WGPUAddressMode
WGPUAddressMode_Undefined = 0x00000000

WGPUAddressMode_ClampToEdge : WGPUAddressMode
WGPUAddressMode_ClampToEdge = 0x00000001

WGPUAddressMode_Repeat : WGPUAddressMode
WGPUAddressMode_Repeat = 0x00000002

WGPUAddressMode_MirrorRepeat : WGPUAddressMode
WGPUAddressMode_MirrorRepeat = 0x00000003

WGPUAddressMode_Force32 : WGPUAddressMode
WGPUAddressMode_Force32 = 0x7FFFFFFF

WGPUBackendType : Type
WGPUBackendType = Enum

WGPUBackendType_Undefined : WGPUBackendType
WGPUBackendType_Undefined = 0x00000000

WGPUBackendType_Null : WGPUBackendType
WGPUBackendType_Null = 0x00000001

WGPUBackendType_WebGPU : WGPUBackendType
WGPUBackendType_WebGPU = 0x00000002

WGPUBackendType_D3D11 : WGPUBackendType
WGPUBackendType_D3D11 = 0x00000003

WGPUBackendType_D3D12 : WGPUBackendType
WGPUBackendType_D3D12 = 0x00000004

WGPUBackendType_Metal : WGPUBackendType
WGPUBackendType_Metal = 0x00000005

WGPUBackendType_Vulkan : WGPUBackendType
WGPUBackendType_Vulkan = 0x00000006

WGPUBackendType_OpenGL : WGPUBackendType
WGPUBackendType_OpenGL = 0x00000007

WGPUBackendType_OpenGLES : WGPUBackendType
WGPUBackendType_OpenGLES = 0x00000008

WGPUBackendType_Force32 : WGPUBackendType
WGPUBackendType_Force32 = 0x7FFFFFFF

WGPUBlendFactor : Type
WGPUBlendFactor = Enum

WGPUBlendFactor_Undefined : WGPUBlendFactor
WGPUBlendFactor_Undefined = 0x00000000

WGPUBlendFactor_Zero : WGPUBlendFactor
WGPUBlendFactor_Zero = 0x00000001

WGPUBlendFactor_One : WGPUBlendFactor
WGPUBlendFactor_One = 0x00000002

WGPUBlendFactor_Src : WGPUBlendFactor
WGPUBlendFactor_Src = 0x00000003

WGPUBlendFactor_OneMinusSrc : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrc = 0x00000004

WGPUBlendFactor_SrcAlpha : WGPUBlendFactor
WGPUBlendFactor_SrcAlpha = 0x00000005

WGPUBlendFactor_OneMinusSrcAlpha : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrcAlpha = 0x00000006

WGPUBlendFactor_Dst : WGPUBlendFactor
WGPUBlendFactor_Dst = 0x00000007

WGPUBlendFactor_OneMinusDst : WGPUBlendFactor
WGPUBlendFactor_OneMinusDst = 0x00000008

WGPUBlendFactor_DstAlpha : WGPUBlendFactor
WGPUBlendFactor_DstAlpha = 0x00000009

WGPUBlendFactor_OneMinusDstAlpha : WGPUBlendFactor
WGPUBlendFactor_OneMinusDstAlpha = 0x0000000A

WGPUBlendFactor_SrcAlphaSaturated : WGPUBlendFactor
WGPUBlendFactor_SrcAlphaSaturated = 0x0000000B

WGPUBlendFactor_Constant : WGPUBlendFactor
WGPUBlendFactor_Constant = 0x0000000C

WGPUBlendFactor_OneMinusConstant : WGPUBlendFactor
WGPUBlendFactor_OneMinusConstant = 0x0000000D

WGPUBlendFactor_Src1 : WGPUBlendFactor
WGPUBlendFactor_Src1 = 0x0000000E

WGPUBlendFactor_OneMinusSrc1 : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrc1 = 0x0000000F

WGPUBlendFactor_Src1Alpha : WGPUBlendFactor
WGPUBlendFactor_Src1Alpha = 0x00000010

WGPUBlendFactor_OneMinusSrc1Alpha : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrc1Alpha = 0x00000011

WGPUBlendFactor_Force32 : WGPUBlendFactor
WGPUBlendFactor_Force32 = 0x7FFFFFFF

WGPUBlendOperation : Type
WGPUBlendOperation = Enum

WGPUBlendOperation_Undefined : WGPUBlendOperation
WGPUBlendOperation_Undefined = 0x00000000

WGPUBlendOperation_Add : WGPUBlendOperation
WGPUBlendOperation_Add = 0x00000001

WGPUBlendOperation_Subtract : WGPUBlendOperation
WGPUBlendOperation_Subtract = 0x00000002

WGPUBlendOperation_ReverseSubtract : WGPUBlendOperation
WGPUBlendOperation_ReverseSubtract = 0x00000003

WGPUBlendOperation_Min : WGPUBlendOperation
WGPUBlendOperation_Min = 0x00000004

WGPUBlendOperation_Max : WGPUBlendOperation
WGPUBlendOperation_Max = 0x00000005

WGPUBlendOperation_Force32 : WGPUBlendOperation
WGPUBlendOperation_Force32 = 0x7FFFFFFF

WGPUBufferBindingType : Type
WGPUBufferBindingType = Enum

WGPUBufferBindingType_BindingNotUsed : WGPUBufferBindingType
WGPUBufferBindingType_BindingNotUsed = 0x00000000

WGPUBufferBindingType_Undefined : WGPUBufferBindingType
WGPUBufferBindingType_Undefined = 0x00000001

WGPUBufferBindingType_Uniform : WGPUBufferBindingType
WGPUBufferBindingType_Uniform = 0x00000002

WGPUBufferBindingType_Storage : WGPUBufferBindingType
WGPUBufferBindingType_Storage = 0x00000003

WGPUBufferBindingType_ReadOnlyStorage : WGPUBufferBindingType
WGPUBufferBindingType_ReadOnlyStorage = 0x00000004

WGPUBufferBindingType_Force32 : WGPUBufferBindingType
WGPUBufferBindingType_Force32 = 0x7FFFFFFF

WGPUBufferMapState : Type
WGPUBufferMapState = Enum

WGPUBufferMapState_Unmapped : WGPUBufferMapState
WGPUBufferMapState_Unmapped = 0x00000001

WGPUBufferMapState_Pending : WGPUBufferMapState
WGPUBufferMapState_Pending = 0x00000002

WGPUBufferMapState_Mapped : WGPUBufferMapState
WGPUBufferMapState_Mapped = 0x00000003

WGPUBufferMapState_Force32 : WGPUBufferMapState
WGPUBufferMapState_Force32 = 0x7FFFFFFF

WGPUCallbackMode : Type
WGPUCallbackMode = Enum

WGPUCallbackMode_WaitAnyOnly : WGPUCallbackMode
WGPUCallbackMode_WaitAnyOnly = 0x00000001

WGPUCallbackMode_AllowProcessEvents : WGPUCallbackMode
WGPUCallbackMode_AllowProcessEvents = 0x00000002

WGPUCallbackMode_AllowSpontaneous : WGPUCallbackMode
WGPUCallbackMode_AllowSpontaneous = 0x00000003

WGPUCallbackMode_Force32 : WGPUCallbackMode
WGPUCallbackMode_Force32 = 0x7FFFFFFF

WGPUCompareFunction : Type
WGPUCompareFunction = Enum

WGPUCompareFunction_Undefined : WGPUCompareFunction
WGPUCompareFunction_Undefined = 0x00000000

WGPUCompareFunction_Never : WGPUCompareFunction
WGPUCompareFunction_Never = 0x00000001

WGPUCompareFunction_Less : WGPUCompareFunction
WGPUCompareFunction_Less = 0x00000002

WGPUCompareFunction_Equal : WGPUCompareFunction
WGPUCompareFunction_Equal = 0x00000003

WGPUCompareFunction_LessEqual : WGPUCompareFunction
WGPUCompareFunction_LessEqual = 0x00000004

WGPUCompareFunction_Greater : WGPUCompareFunction
WGPUCompareFunction_Greater = 0x00000005

WGPUCompareFunction_NotEqual : WGPUCompareFunction
WGPUCompareFunction_NotEqual = 0x00000006

WGPUCompareFunction_GreaterEqual : WGPUCompareFunction
WGPUCompareFunction_GreaterEqual = 0x00000007

WGPUCompareFunction_Always : WGPUCompareFunction
WGPUCompareFunction_Always = 0x00000008

WGPUCompareFunction_Force32 : WGPUCompareFunction
WGPUCompareFunction_Force32 = 0x7FFFFFFF

WGPUCompilationInfoRequestStatus : Type
WGPUCompilationInfoRequestStatus = Enum

WGPUCompilationInfoRequestStatus_Success : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Success = 0x00000001

WGPUCompilationInfoRequestStatus_InstanceDropped : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_InstanceDropped = 0x00000002

WGPUCompilationInfoRequestStatus_Error : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Error = 0x00000003

WGPUCompilationInfoRequestStatus_Unknown : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Unknown = 0x00000004

WGPUCompilationInfoRequestStatus_Force32 : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Force32 = 0x7FFFFFFF

WGPUCompilationMessageType : Type
WGPUCompilationMessageType = Enum

WGPUCompilationMessageType_Error : WGPUCompilationMessageType
WGPUCompilationMessageType_Error = 0x00000001

WGPUCompilationMessageType_Warning : WGPUCompilationMessageType
WGPUCompilationMessageType_Warning = 0x00000002

WGPUCompilationMessageType_Info : WGPUCompilationMessageType
WGPUCompilationMessageType_Info = 0x00000003

WGPUCompilationMessageType_Force32 : WGPUCompilationMessageType
WGPUCompilationMessageType_Force32 = 0x7FFFFFFF

WGPUCompositeAlphaMode : Type
WGPUCompositeAlphaMode = Enum

WGPUCompositeAlphaMode_Auto : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Auto = 0x00000000

WGPUCompositeAlphaMode_Opaque : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Opaque = 0x00000001

WGPUCompositeAlphaMode_Premultiplied : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Premultiplied = 0x00000002

WGPUCompositeAlphaMode_Unpremultiplied : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Unpremultiplied = 0x00000003

WGPUCompositeAlphaMode_Inherit : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Inherit = 0x00000004

WGPUCompositeAlphaMode_Force32 : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Force32 = 0x7FFFFFFF

WGPUCreatePipelineAsyncStatus : Type
WGPUCreatePipelineAsyncStatus = Enum

WGPUCreatePipelineAsyncStatus_Success : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_Success = 0x00000001

WGPUCreatePipelineAsyncStatus_InstanceDropped : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_InstanceDropped = 0x00000002

WGPUCreatePipelineAsyncStatus_ValidationError : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_ValidationError = 0x00000003

WGPUCreatePipelineAsyncStatus_InternalError : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_InternalError = 0x00000004

WGPUCreatePipelineAsyncStatus_Unknown : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_Unknown = 0x00000005

WGPUCreatePipelineAsyncStatus_Force32 : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_Force32 = 0x7FFFFFFF

WGPUCullMode : Type
WGPUCullMode = Enum

WGPUCullMode_Undefined : WGPUCullMode
WGPUCullMode_Undefined = 0x00000000

WGPUCullMode_None : WGPUCullMode
WGPUCullMode_None = 0x00000001

WGPUCullMode_Front : WGPUCullMode
WGPUCullMode_Front = 0x00000002

WGPUCullMode_Back : WGPUCullMode
WGPUCullMode_Back = 0x00000003

WGPUCullMode_Force32 : WGPUCullMode
WGPUCullMode_Force32 = 0x7FFFFFFF

WGPUDeviceLostReason : Type
WGPUDeviceLostReason = Enum

WGPUDeviceLostReason_Unknown : WGPUDeviceLostReason
WGPUDeviceLostReason_Unknown = 0x00000001

WGPUDeviceLostReason_Destroyed : WGPUDeviceLostReason
WGPUDeviceLostReason_Destroyed = 0x00000002

WGPUDeviceLostReason_InstanceDropped : WGPUDeviceLostReason
WGPUDeviceLostReason_InstanceDropped = 0x00000003

WGPUDeviceLostReason_FailedCreation : WGPUDeviceLostReason
WGPUDeviceLostReason_FailedCreation = 0x00000004

WGPUDeviceLostReason_Force32 : WGPUDeviceLostReason
WGPUDeviceLostReason_Force32 = 0x7FFFFFFF

WGPUErrorFilter : Type
WGPUErrorFilter = Enum

WGPUErrorFilter_Validation : WGPUErrorFilter
WGPUErrorFilter_Validation = 0x00000001

WGPUErrorFilter_OutOfMemory : WGPUErrorFilter
WGPUErrorFilter_OutOfMemory = 0x00000002

WGPUErrorFilter_Internal : WGPUErrorFilter
WGPUErrorFilter_Internal = 0x00000003

WGPUErrorFilter_Force32 : WGPUErrorFilter
WGPUErrorFilter_Force32 = 0x7FFFFFFF

WGPUErrorType : Type
WGPUErrorType = Enum

WGPUErrorType_NoError : WGPUErrorType
WGPUErrorType_NoError = 0x00000001

WGPUErrorType_Validation : WGPUErrorType
WGPUErrorType_Validation = 0x00000002

WGPUErrorType_OutOfMemory : WGPUErrorType
WGPUErrorType_OutOfMemory = 0x00000003

WGPUErrorType_Internal : WGPUErrorType
WGPUErrorType_Internal = 0x00000004

WGPUErrorType_Unknown : WGPUErrorType
WGPUErrorType_Unknown = 0x00000005

WGPUErrorType_Force32 : WGPUErrorType
WGPUErrorType_Force32 = 0x7FFFFFFF

WGPUFeatureLevel : Type
WGPUFeatureLevel = Enum

WGPUFeatureLevel_Compatibility : WGPUFeatureLevel
WGPUFeatureLevel_Compatibility = 0x00000001

WGPUFeatureLevel_Core : WGPUFeatureLevel
WGPUFeatureLevel_Core = 0x00000002

WGPUFeatureLevel_Force32 : WGPUFeatureLevel
WGPUFeatureLevel_Force32 = 0x7FFFFFFF

WGPUFeatureName : Type
WGPUFeatureName = Enum

WGPUFeatureName_Undefined : WGPUFeatureName
WGPUFeatureName_Undefined = 0x00000000

WGPUFeatureName_DepthClipControl : WGPUFeatureName
WGPUFeatureName_DepthClipControl = 0x00000001

WGPUFeatureName_Depth32FloatStencil8 : WGPUFeatureName
WGPUFeatureName_Depth32FloatStencil8 = 0x00000002

WGPUFeatureName_TimestampQuery : WGPUFeatureName
WGPUFeatureName_TimestampQuery = 0x00000003

WGPUFeatureName_TextureCompressionBC : WGPUFeatureName
WGPUFeatureName_TextureCompressionBC = 0x00000004

WGPUFeatureName_TextureCompressionBCSliced3D : WGPUFeatureName
WGPUFeatureName_TextureCompressionBCSliced3D = 0x00000005

WGPUFeatureName_TextureCompressionETC2 : WGPUFeatureName
WGPUFeatureName_TextureCompressionETC2 = 0x00000006

WGPUFeatureName_TextureCompressionASTC : WGPUFeatureName
WGPUFeatureName_TextureCompressionASTC = 0x00000007

WGPUFeatureName_TextureCompressionASTCSliced3D : WGPUFeatureName
WGPUFeatureName_TextureCompressionASTCSliced3D = 0x00000008

WGPUFeatureName_IndirectFirstInstance : WGPUFeatureName
WGPUFeatureName_IndirectFirstInstance = 0x00000009

WGPUFeatureName_ShaderF16 : WGPUFeatureName
WGPUFeatureName_ShaderF16 = 0x0000000A

WGPUFeatureName_RG11B10UfloatRenderable : WGPUFeatureName
WGPUFeatureName_RG11B10UfloatRenderable = 0x0000000B

WGPUFeatureName_BGRA8UnormStorage : WGPUFeatureName
WGPUFeatureName_BGRA8UnormStorage = 0x0000000C

WGPUFeatureName_Float32Filterable : WGPUFeatureName
WGPUFeatureName_Float32Filterable = 0x0000000D

WGPUFeatureName_Float32Blendable : WGPUFeatureName
WGPUFeatureName_Float32Blendable = 0x0000000E

WGPUFeatureName_ClipDistances : WGPUFeatureName
WGPUFeatureName_ClipDistances = 0x0000000F

WGPUFeatureName_DualSourceBlending : WGPUFeatureName
WGPUFeatureName_DualSourceBlending = 0x00000010

WGPUFeatureName_Force32 : WGPUFeatureName
WGPUFeatureName_Force32 = 0x7FFFFFFF

WGPUFilterMode : Type
WGPUFilterMode = Enum

WGPUFilterMode_Undefined : WGPUFilterMode
WGPUFilterMode_Undefined = 0x00000000

WGPUFilterMode_Nearest : WGPUFilterMode
WGPUFilterMode_Nearest = 0x00000001

WGPUFilterMode_Linear : WGPUFilterMode
WGPUFilterMode_Linear = 0x00000002

WGPUFilterMode_Force32 : WGPUFilterMode
WGPUFilterMode_Force32 = 0x7FFFFFFF

WGPUFrontFace : Type
WGPUFrontFace = Enum

WGPUFrontFace_Undefined : WGPUFrontFace
WGPUFrontFace_Undefined = 0x00000000

WGPUFrontFace_CCW : WGPUFrontFace
WGPUFrontFace_CCW = 0x00000001

WGPUFrontFace_CW : WGPUFrontFace
WGPUFrontFace_CW = 0x00000002

WGPUFrontFace_Force32 : WGPUFrontFace
WGPUFrontFace_Force32 = 0x7FFFFFFF

WGPUIndexFormat : Type
WGPUIndexFormat = Enum

WGPUIndexFormat_Undefined : WGPUIndexFormat
WGPUIndexFormat_Undefined = 0x00000000

WGPUIndexFormat_Uint16 : WGPUIndexFormat
WGPUIndexFormat_Uint16 = 0x00000001

WGPUIndexFormat_Uint32 : WGPUIndexFormat
WGPUIndexFormat_Uint32 = 0x00000002

WGPUIndexFormat_Force32 : WGPUIndexFormat
WGPUIndexFormat_Force32 = 0x7FFFFFFF

WGPULoadOp : Type
WGPULoadOp = Enum

WGPULoadOp_Undefined : WGPULoadOp
WGPULoadOp_Undefined = 0x00000000

WGPULoadOp_Load : WGPULoadOp
WGPULoadOp_Load = 0x00000001

WGPULoadOp_Clear : WGPULoadOp
WGPULoadOp_Clear = 0x00000002

WGPULoadOp_Force32 : WGPULoadOp
WGPULoadOp_Force32 = 0x7FFFFFFF

WGPUMapAsyncStatus : Type
WGPUMapAsyncStatus = Enum

WGPUMapAsyncStatus_Success : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Success = 0x00000001

WGPUMapAsyncStatus_InstanceDropped : WGPUMapAsyncStatus
WGPUMapAsyncStatus_InstanceDropped = 0x00000002

WGPUMapAsyncStatus_Error : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Error = 0x00000003

WGPUMapAsyncStatus_Aborted : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Aborted = 0x00000004

WGPUMapAsyncStatus_Unknown : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Unknown = 0x00000005

WGPUMapAsyncStatus_Force32 : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Force32 = 0x7FFFFFFF

WGPUMipmapFilterMode : Type
WGPUMipmapFilterMode = Enum

WGPUMipmapFilterMode_Undefined : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Undefined = 0x00000000

WGPUMipmapFilterMode_Nearest : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Nearest = 0x00000001

WGPUMipmapFilterMode_Linear : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Linear = 0x00000002

WGPUMipmapFilterMode_Force32 : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Force32 = 0x7FFFFFFF

WGPUOptionalBool : Type
WGPUOptionalBool = Enum

WGPUOptionalBool_False : WGPUOptionalBool
WGPUOptionalBool_False = 0x00000000

WGPUOptionalBool_True : WGPUOptionalBool
WGPUOptionalBool_True = 0x00000001

WGPUOptionalBool_Undefined : WGPUOptionalBool
WGPUOptionalBool_Undefined = 0x00000002

WGPUOptionalBool_Force32 : WGPUOptionalBool
WGPUOptionalBool_Force32 = 0x7FFFFFFF

WGPUPopErrorScopeStatus : Type
WGPUPopErrorScopeStatus = Enum

WGPUPopErrorScopeStatus_Success : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_Success = 0x00000001

WGPUPopErrorScopeStatus_InstanceDropped : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_InstanceDropped = 0x00000002

WGPUPopErrorScopeStatus_EmptyStack : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_EmptyStack = 0x00000003

WGPUPopErrorScopeStatus_Force32 : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_Force32 = 0x7FFFFFFF

WGPUPowerPreference : Type
WGPUPowerPreference = Enum

WGPUPowerPreference_Undefined : WGPUPowerPreference
WGPUPowerPreference_Undefined = 0x00000000

WGPUPowerPreference_LowPower : WGPUPowerPreference
WGPUPowerPreference_LowPower = 0x00000001

WGPUPowerPreference_HighPerformance : WGPUPowerPreference
WGPUPowerPreference_HighPerformance = 0x00000002

WGPUPowerPreference_Force32 : WGPUPowerPreference
WGPUPowerPreference_Force32 = 0x7FFFFFFF

WGPUPresentMode : Type
WGPUPresentMode = Enum

WGPUPresentMode_Undefined : WGPUPresentMode
WGPUPresentMode_Undefined = 0x00000000

WGPUPresentMode_Fifo : WGPUPresentMode
WGPUPresentMode_Fifo = 0x00000001

WGPUPresentMode_FifoRelaxed : WGPUPresentMode
WGPUPresentMode_FifoRelaxed = 0x00000002

WGPUPresentMode_Immediate : WGPUPresentMode
WGPUPresentMode_Immediate = 0x00000003

WGPUPresentMode_Mailbox : WGPUPresentMode
WGPUPresentMode_Mailbox = 0x00000004

WGPUPresentMode_Force32 : WGPUPresentMode
WGPUPresentMode_Force32 = 0x7FFFFFFF

WGPUPrimitiveTopology : Type
WGPUPrimitiveTopology = Enum

WGPUPrimitiveTopology_Undefined : WGPUPrimitiveTopology
WGPUPrimitiveTopology_Undefined = 0x00000000

WGPUPrimitiveTopology_PointList : WGPUPrimitiveTopology
WGPUPrimitiveTopology_PointList = 0x00000001

WGPUPrimitiveTopology_LineList : WGPUPrimitiveTopology
WGPUPrimitiveTopology_LineList = 0x00000002

WGPUPrimitiveTopology_LineStrip : WGPUPrimitiveTopology
WGPUPrimitiveTopology_LineStrip = 0x00000003

WGPUPrimitiveTopology_TriangleList : WGPUPrimitiveTopology
WGPUPrimitiveTopology_TriangleList = 0x00000004

WGPUPrimitiveTopology_TriangleStrip : WGPUPrimitiveTopology
WGPUPrimitiveTopology_TriangleStrip = 0x00000005

WGPUPrimitiveTopology_Force32 : WGPUPrimitiveTopology
WGPUPrimitiveTopology_Force32 = 0x7FFFFFFF

WGPUQueryType : Type
WGPUQueryType = Enum

WGPUQueryType_Occlusion : WGPUQueryType
WGPUQueryType_Occlusion = 0x00000001

WGPUQueryType_Timestamp : WGPUQueryType
WGPUQueryType_Timestamp = 0x00000002

WGPUQueryType_Force32 : WGPUQueryType
WGPUQueryType_Force32 = 0x7FFFFFFF

WGPUQueueWorkDoneStatus : Type
WGPUQueueWorkDoneStatus = Enum

WGPUQueueWorkDoneStatus_Success : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Success = 0x00000001

WGPUQueueWorkDoneStatus_InstanceDropped : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_InstanceDropped = 0x00000002

WGPUQueueWorkDoneStatus_Error : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Error = 0x00000003

WGPUQueueWorkDoneStatus_Unknown : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Unknown = 0x00000004

WGPUQueueWorkDoneStatus_Force32 : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Force32 = 0x7FFFFFFF

WGPURequestAdapterStatus : Type
WGPURequestAdapterStatus = Enum

WGPURequestAdapterStatus_Success : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Success = 0x00000001

WGPURequestAdapterStatus_InstanceDropped : WGPURequestAdapterStatus
WGPURequestAdapterStatus_InstanceDropped = 0x00000002

WGPURequestAdapterStatus_Unavailable : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Unavailable = 0x00000003

WGPURequestAdapterStatus_Error : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Error = 0x00000004

WGPURequestAdapterStatus_Unknown : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Unknown = 0x00000005

WGPURequestAdapterStatus_Force32 : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Force32 = 0x7FFFFFFF

WGPURequestDeviceStatus : Type
WGPURequestDeviceStatus = Enum

WGPURequestDeviceStatus_Success : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Success = 0x00000001

WGPURequestDeviceStatus_InstanceDropped : WGPURequestDeviceStatus
WGPURequestDeviceStatus_InstanceDropped = 0x00000002

WGPURequestDeviceStatus_Error : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Error = 0x00000003

WGPURequestDeviceStatus_Unknown : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Unknown = 0x00000004

WGPURequestDeviceStatus_Force32 : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Force32 = 0x7FFFFFFF

WGPUSType : Type
WGPUSType = Enum

WGPUSType_ShaderSourceSPIRV : WGPUSType
WGPUSType_ShaderSourceSPIRV = 0x00000001

WGPUSType_ShaderSourceWGSL : WGPUSType
WGPUSType_ShaderSourceWGSL = 0x00000002

WGPUSType_RenderPassMaxDrawCount : WGPUSType
WGPUSType_RenderPassMaxDrawCount = 0x00000003

WGPUSType_SurfaceSourceMetalLayer : WGPUSType
WGPUSType_SurfaceSourceMetalLayer = 0x00000004

WGPUSType_SurfaceSourceWindowsHWND : WGPUSType
WGPUSType_SurfaceSourceWindowsHWND = 0x00000005

WGPUSType_SurfaceSourceXlibWindow : WGPUSType
WGPUSType_SurfaceSourceXlibWindow = 0x00000006

WGPUSType_SurfaceSourceWaylandSurface : WGPUSType
WGPUSType_SurfaceSourceWaylandSurface = 0x00000007

WGPUSType_SurfaceSourceAndroidNativeWindow : WGPUSType
WGPUSType_SurfaceSourceAndroidNativeWindow = 0x00000008

WGPUSType_SurfaceSourceXCBWindow : WGPUSType
WGPUSType_SurfaceSourceXCBWindow = 0x00000009

WGPUSType_Force32 : WGPUSType
WGPUSType_Force32 = 0x7FFFFFFF

WGPUSamplerBindingType : Type
WGPUSamplerBindingType = Enum

WGPUSamplerBindingType_BindingNotUsed : WGPUSamplerBindingType
WGPUSamplerBindingType_BindingNotUsed = 0x00000000

WGPUSamplerBindingType_Undefined : WGPUSamplerBindingType
WGPUSamplerBindingType_Undefined = 0x00000001

WGPUSamplerBindingType_Filtering : WGPUSamplerBindingType
WGPUSamplerBindingType_Filtering = 0x00000002

WGPUSamplerBindingType_NonFiltering : WGPUSamplerBindingType
WGPUSamplerBindingType_NonFiltering = 0x00000003

WGPUSamplerBindingType_Comparison : WGPUSamplerBindingType
WGPUSamplerBindingType_Comparison = 0x00000004

WGPUSamplerBindingType_Force32 : WGPUSamplerBindingType
WGPUSamplerBindingType_Force32 = 0x7FFFFFFF

WGPUStatus : Type
WGPUStatus = Enum

WGPUStatus_Success : WGPUStatus
WGPUStatus_Success = 0x00000001

WGPUStatus_Error : WGPUStatus
WGPUStatus_Error = 0x00000002

WGPUStatus_Force32 : WGPUStatus
WGPUStatus_Force32 = 0x7FFFFFFF

WGPUStencilOperation : Type
WGPUStencilOperation = Enum

WGPUStencilOperation_Undefined : WGPUStencilOperation
WGPUStencilOperation_Undefined = 0x00000000

WGPUStencilOperation_Keep : WGPUStencilOperation
WGPUStencilOperation_Keep = 0x00000001

WGPUStencilOperation_Zero : WGPUStencilOperation
WGPUStencilOperation_Zero = 0x00000002

WGPUStencilOperation_Replace : WGPUStencilOperation
WGPUStencilOperation_Replace = 0x00000003

WGPUStencilOperation_Invert : WGPUStencilOperation
WGPUStencilOperation_Invert = 0x00000004

WGPUStencilOperation_IncrementClamp : WGPUStencilOperation
WGPUStencilOperation_IncrementClamp = 0x00000005

WGPUStencilOperation_DecrementClamp : WGPUStencilOperation
WGPUStencilOperation_DecrementClamp = 0x00000006

WGPUStencilOperation_IncrementWrap : WGPUStencilOperation
WGPUStencilOperation_IncrementWrap = 0x00000007

WGPUStencilOperation_DecrementWrap : WGPUStencilOperation
WGPUStencilOperation_DecrementWrap = 0x00000008

WGPUStencilOperation_Force32 : WGPUStencilOperation
WGPUStencilOperation_Force32 = 0x7FFFFFFF

WGPUStorageTextureAccess : Type
WGPUStorageTextureAccess = Enum

WGPUStorageTextureAccess_BindingNotUsed : WGPUStorageTextureAccess
WGPUStorageTextureAccess_BindingNotUsed = 0x00000000

WGPUStorageTextureAccess_Undefined : WGPUStorageTextureAccess
WGPUStorageTextureAccess_Undefined = 0x00000001

WGPUStorageTextureAccess_WriteOnly : WGPUStorageTextureAccess
WGPUStorageTextureAccess_WriteOnly = 0x00000002

WGPUStorageTextureAccess_ReadOnly : WGPUStorageTextureAccess
WGPUStorageTextureAccess_ReadOnly = 0x00000003

WGPUStorageTextureAccess_ReadWrite : WGPUStorageTextureAccess
WGPUStorageTextureAccess_ReadWrite = 0x00000004

WGPUStorageTextureAccess_Force32 : WGPUStorageTextureAccess
WGPUStorageTextureAccess_Force32 = 0x7FFFFFFF

WGPUStoreOp : Type
WGPUStoreOp = Enum

WGPUStoreOp_Undefined : WGPUStoreOp
WGPUStoreOp_Undefined = 0x00000000

WGPUStoreOp_Store : WGPUStoreOp
WGPUStoreOp_Store = 0x00000001

WGPUStoreOp_Discard : WGPUStoreOp
WGPUStoreOp_Discard = 0x00000002

WGPUStoreOp_Force32 : WGPUStoreOp
WGPUStoreOp_Force32 = 0x7FFFFFFF

WGPUSurfaceGetCurrentTextureStatus : Type
WGPUSurfaceGetCurrentTextureStatus = Enum

WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal = 0x00000001

WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal = 0x00000002

WGPUSurfaceGetCurrentTextureStatus_Timeout : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Timeout = 0x00000003

WGPUSurfaceGetCurrentTextureStatus_Outdated : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Outdated = 0x00000004

WGPUSurfaceGetCurrentTextureStatus_Lost : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Lost = 0x00000005

WGPUSurfaceGetCurrentTextureStatus_OutOfMemory : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_OutOfMemory = 0x00000006

WGPUSurfaceGetCurrentTextureStatus_DeviceLost : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_DeviceLost = 0x00000007

WGPUSurfaceGetCurrentTextureStatus_Error : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Error = 0x00000008

WGPUSurfaceGetCurrentTextureStatus_Force32 : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Force32 = 0x7FFFFFFF

WGPUTextureAspect : Type
WGPUTextureAspect = Enum

WGPUTextureAspect_Undefined : WGPUTextureAspect
WGPUTextureAspect_Undefined = 0x00000000

WGPUTextureAspect_All : WGPUTextureAspect
WGPUTextureAspect_All = 0x00000001

WGPUTextureAspect_StencilOnly : WGPUTextureAspect
WGPUTextureAspect_StencilOnly = 0x00000002

WGPUTextureAspect_DepthOnly : WGPUTextureAspect
WGPUTextureAspect_DepthOnly = 0x00000003

WGPUTextureAspect_Force32 : WGPUTextureAspect
WGPUTextureAspect_Force32 = 0x7FFFFFFF

WGPUTextureDimension : Type
WGPUTextureDimension = Enum

WGPUTextureDimension_Undefined : WGPUTextureDimension
WGPUTextureDimension_Undefined = 0x00000000

WGPUTextureDimension_1D : WGPUTextureDimension
WGPUTextureDimension_1D = 0x00000001

WGPUTextureDimension_2D : WGPUTextureDimension
WGPUTextureDimension_2D = 0x00000002

WGPUTextureDimension_3D : WGPUTextureDimension
WGPUTextureDimension_3D = 0x00000003

WGPUTextureDimension_Force32 : WGPUTextureDimension
WGPUTextureDimension_Force32 = 0x7FFFFFFF

WGPUTextureFormat : Type
WGPUTextureFormat = Enum

WGPUTextureFormat_Undefined : WGPUTextureFormat
WGPUTextureFormat_Undefined = 0x00000000

WGPUTextureFormat_R8Unorm : WGPUTextureFormat
WGPUTextureFormat_R8Unorm = 0x00000001

WGPUTextureFormat_R8Snorm : WGPUTextureFormat
WGPUTextureFormat_R8Snorm = 0x00000002

WGPUTextureFormat_R8Uint : WGPUTextureFormat
WGPUTextureFormat_R8Uint = 0x00000003

WGPUTextureFormat_R8Sint : WGPUTextureFormat
WGPUTextureFormat_R8Sint = 0x00000004

WGPUTextureFormat_R16Uint : WGPUTextureFormat
WGPUTextureFormat_R16Uint = 0x00000005

WGPUTextureFormat_R16Sint : WGPUTextureFormat
WGPUTextureFormat_R16Sint = 0x00000006

WGPUTextureFormat_R16Float : WGPUTextureFormat
WGPUTextureFormat_R16Float = 0x00000007

WGPUTextureFormat_RG8Unorm : WGPUTextureFormat
WGPUTextureFormat_RG8Unorm = 0x00000008

WGPUTextureFormat_RG8Snorm : WGPUTextureFormat
WGPUTextureFormat_RG8Snorm = 0x00000009

WGPUTextureFormat_RG8Uint : WGPUTextureFormat
WGPUTextureFormat_RG8Uint = 0x0000000A

WGPUTextureFormat_RG8Sint : WGPUTextureFormat
WGPUTextureFormat_RG8Sint = 0x0000000B

WGPUTextureFormat_R32Float : WGPUTextureFormat
WGPUTextureFormat_R32Float = 0x0000000C

WGPUTextureFormat_R32Uint : WGPUTextureFormat
WGPUTextureFormat_R32Uint = 0x0000000D

WGPUTextureFormat_R32Sint : WGPUTextureFormat
WGPUTextureFormat_R32Sint = 0x0000000E

WGPUTextureFormat_RG16Uint : WGPUTextureFormat
WGPUTextureFormat_RG16Uint = 0x0000000F

WGPUTextureFormat_RG16Sint : WGPUTextureFormat
WGPUTextureFormat_RG16Sint = 0x00000010

WGPUTextureFormat_RG16Float : WGPUTextureFormat
WGPUTextureFormat_RG16Float = 0x00000011

WGPUTextureFormat_RGBA8Unorm : WGPUTextureFormat
WGPUTextureFormat_RGBA8Unorm = 0x00000012

WGPUTextureFormat_RGBA8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_RGBA8UnormSrgb = 0x00000013

WGPUTextureFormat_RGBA8Snorm : WGPUTextureFormat
WGPUTextureFormat_RGBA8Snorm = 0x00000014

WGPUTextureFormat_RGBA8Uint : WGPUTextureFormat
WGPUTextureFormat_RGBA8Uint = 0x00000015

WGPUTextureFormat_RGBA8Sint : WGPUTextureFormat
WGPUTextureFormat_RGBA8Sint = 0x00000016

WGPUTextureFormat_BGRA8Unorm : WGPUTextureFormat
WGPUTextureFormat_BGRA8Unorm = 0x00000017

WGPUTextureFormat_BGRA8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BGRA8UnormSrgb = 0x00000018

WGPUTextureFormat_RGB10A2Uint : WGPUTextureFormat
WGPUTextureFormat_RGB10A2Uint = 0x00000019

WGPUTextureFormat_RGB10A2Unorm : WGPUTextureFormat
WGPUTextureFormat_RGB10A2Unorm = 0x0000001A

WGPUTextureFormat_RG11B10Ufloat : WGPUTextureFormat
WGPUTextureFormat_RG11B10Ufloat = 0x0000001B

WGPUTextureFormat_RGB9E5Ufloat : WGPUTextureFormat
WGPUTextureFormat_RGB9E5Ufloat = 0x0000001C

WGPUTextureFormat_RG32Float : WGPUTextureFormat
WGPUTextureFormat_RG32Float = 0x0000001D

WGPUTextureFormat_RG32Uint : WGPUTextureFormat
WGPUTextureFormat_RG32Uint = 0x0000001E

WGPUTextureFormat_RG32Sint : WGPUTextureFormat
WGPUTextureFormat_RG32Sint = 0x0000001F

WGPUTextureFormat_RGBA16Uint : WGPUTextureFormat
WGPUTextureFormat_RGBA16Uint = 0x00000020

WGPUTextureFormat_RGBA16Sint : WGPUTextureFormat
WGPUTextureFormat_RGBA16Sint = 0x00000021

WGPUTextureFormat_RGBA16Float : WGPUTextureFormat
WGPUTextureFormat_RGBA16Float = 0x00000022

WGPUTextureFormat_RGBA32Float : WGPUTextureFormat
WGPUTextureFormat_RGBA32Float = 0x00000023

WGPUTextureFormat_RGBA32Uint : WGPUTextureFormat
WGPUTextureFormat_RGBA32Uint = 0x00000024

WGPUTextureFormat_RGBA32Sint : WGPUTextureFormat
WGPUTextureFormat_RGBA32Sint = 0x00000025

WGPUTextureFormat_Stencil8 : WGPUTextureFormat
WGPUTextureFormat_Stencil8 = 0x00000026

WGPUTextureFormat_Depth16Unorm : WGPUTextureFormat
WGPUTextureFormat_Depth16Unorm = 0x00000027

WGPUTextureFormat_Depth24Plus : WGPUTextureFormat
WGPUTextureFormat_Depth24Plus = 0x00000028

WGPUTextureFormat_Depth24PlusStencil8 : WGPUTextureFormat
WGPUTextureFormat_Depth24PlusStencil8 = 0x00000029

WGPUTextureFormat_Depth32Float : WGPUTextureFormat
WGPUTextureFormat_Depth32Float = 0x0000002A

WGPUTextureFormat_Depth32FloatStencil8 : WGPUTextureFormat
WGPUTextureFormat_Depth32FloatStencil8 = 0x0000002B

WGPUTextureFormat_BC1RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC1RGBAUnorm = 0x0000002C

WGPUTextureFormat_BC1RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC1RGBAUnormSrgb = 0x0000002D

WGPUTextureFormat_BC2RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC2RGBAUnorm = 0x0000002E

WGPUTextureFormat_BC2RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC2RGBAUnormSrgb = 0x0000002F

WGPUTextureFormat_BC3RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC3RGBAUnorm = 0x00000030

WGPUTextureFormat_BC3RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC3RGBAUnormSrgb = 0x00000031

WGPUTextureFormat_BC4RUnorm : WGPUTextureFormat
WGPUTextureFormat_BC4RUnorm = 0x00000032

WGPUTextureFormat_BC4RSnorm : WGPUTextureFormat
WGPUTextureFormat_BC4RSnorm = 0x00000033

WGPUTextureFormat_BC5RGUnorm : WGPUTextureFormat
WGPUTextureFormat_BC5RGUnorm = 0x00000034

WGPUTextureFormat_BC5RGSnorm : WGPUTextureFormat
WGPUTextureFormat_BC5RGSnorm = 0x00000035

WGPUTextureFormat_BC6HRGBUfloat : WGPUTextureFormat
WGPUTextureFormat_BC6HRGBUfloat = 0x00000036

WGPUTextureFormat_BC6HRGBFloat : WGPUTextureFormat
WGPUTextureFormat_BC6HRGBFloat = 0x00000037

WGPUTextureFormat_BC7RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC7RGBAUnorm = 0x00000038

WGPUTextureFormat_BC7RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC7RGBAUnormSrgb = 0x00000039

WGPUTextureFormat_ETC2RGB8Unorm : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8Unorm = 0x0000003A

WGPUTextureFormat_ETC2RGB8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8UnormSrgb = 0x0000003B

WGPUTextureFormat_ETC2RGB8A1Unorm : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8A1Unorm = 0x0000003C

WGPUTextureFormat_ETC2RGB8A1UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8A1UnormSrgb = 0x0000003D

WGPUTextureFormat_ETC2RGBA8Unorm : WGPUTextureFormat
WGPUTextureFormat_ETC2RGBA8Unorm = 0x0000003E

WGPUTextureFormat_ETC2RGBA8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ETC2RGBA8UnormSrgb = 0x0000003F

WGPUTextureFormat_EACR11Unorm : WGPUTextureFormat
WGPUTextureFormat_EACR11Unorm = 0x00000040

WGPUTextureFormat_EACR11Snorm : WGPUTextureFormat
WGPUTextureFormat_EACR11Snorm = 0x00000041

WGPUTextureFormat_EACRG11Unorm : WGPUTextureFormat
WGPUTextureFormat_EACRG11Unorm = 0x00000042

WGPUTextureFormat_EACRG11Snorm : WGPUTextureFormat
WGPUTextureFormat_EACRG11Snorm = 0x00000043

WGPUTextureFormat_ASTC4x4Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC4x4Unorm = 0x00000044

WGPUTextureFormat_ASTC4x4UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC4x4UnormSrgb = 0x00000045

WGPUTextureFormat_ASTC5x4Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC5x4Unorm = 0x00000046

WGPUTextureFormat_ASTC5x4UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC5x4UnormSrgb = 0x00000047

WGPUTextureFormat_ASTC5x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC5x5Unorm = 0x00000048

WGPUTextureFormat_ASTC5x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC5x5UnormSrgb = 0x00000049

WGPUTextureFormat_ASTC6x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC6x5Unorm = 0x0000004A

WGPUTextureFormat_ASTC6x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC6x5UnormSrgb = 0x0000004B

WGPUTextureFormat_ASTC6x6Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC6x6Unorm = 0x0000004C

WGPUTextureFormat_ASTC6x6UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC6x6UnormSrgb = 0x0000004D

WGPUTextureFormat_ASTC8x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC8x5Unorm = 0x0000004E

WGPUTextureFormat_ASTC8x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC8x5UnormSrgb = 0x0000004F

WGPUTextureFormat_ASTC8x6Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC8x6Unorm = 0x00000050

WGPUTextureFormat_ASTC8x6UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC8x6UnormSrgb = 0x00000051

WGPUTextureFormat_ASTC8x8Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC8x8Unorm = 0x00000052

WGPUTextureFormat_ASTC8x8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC8x8UnormSrgb = 0x00000053

WGPUTextureFormat_ASTC10x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x5Unorm = 0x00000054

WGPUTextureFormat_ASTC10x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x5UnormSrgb = 0x00000055

WGPUTextureFormat_ASTC10x6Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x6Unorm = 0x00000056

WGPUTextureFormat_ASTC10x6UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x6UnormSrgb = 0x00000057

WGPUTextureFormat_ASTC10x8Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x8Unorm = 0x00000058

WGPUTextureFormat_ASTC10x8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x8UnormSrgb = 0x00000059

WGPUTextureFormat_ASTC10x10Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x10Unorm = 0x0000005A

WGPUTextureFormat_ASTC10x10UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x10UnormSrgb = 0x0000005B

WGPUTextureFormat_ASTC12x10Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC12x10Unorm = 0x0000005C

WGPUTextureFormat_ASTC12x10UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC12x10UnormSrgb = 0x0000005D

WGPUTextureFormat_ASTC12x12Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC12x12Unorm = 0x0000005E

WGPUTextureFormat_ASTC12x12UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC12x12UnormSrgb = 0x0000005F

WGPUTextureFormat_Force32 : WGPUTextureFormat
WGPUTextureFormat_Force32 = 0x7FFFFFFF

WGPUTextureSampleType : Type
WGPUTextureSampleType = Enum

WGPUTextureSampleType_BindingNotUsed : WGPUTextureSampleType
WGPUTextureSampleType_BindingNotUsed = 0x00000000

WGPUTextureSampleType_Undefined : WGPUTextureSampleType
WGPUTextureSampleType_Undefined = 0x00000001

WGPUTextureSampleType_Float : WGPUTextureSampleType
WGPUTextureSampleType_Float = 0x00000002

WGPUTextureSampleType_UnfilterableFloat : WGPUTextureSampleType
WGPUTextureSampleType_UnfilterableFloat = 0x00000003

WGPUTextureSampleType_Depth : WGPUTextureSampleType
WGPUTextureSampleType_Depth = 0x00000004

WGPUTextureSampleType_Sint : WGPUTextureSampleType
WGPUTextureSampleType_Sint = 0x00000005

WGPUTextureSampleType_Uint : WGPUTextureSampleType
WGPUTextureSampleType_Uint = 0x00000006

WGPUTextureSampleType_Force32 : WGPUTextureSampleType
WGPUTextureSampleType_Force32 = 0x7FFFFFFF

WGPUTextureViewDimension : Type
WGPUTextureViewDimension = Enum

WGPUTextureViewDimension_Undefined : WGPUTextureViewDimension
WGPUTextureViewDimension_Undefined = 0x00000000

WGPUTextureViewDimension_1D : WGPUTextureViewDimension
WGPUTextureViewDimension_1D = 0x00000001

WGPUTextureViewDimension_2D : WGPUTextureViewDimension
WGPUTextureViewDimension_2D = 0x00000002

WGPUTextureViewDimension_2DArray : WGPUTextureViewDimension
WGPUTextureViewDimension_2DArray = 0x00000003

WGPUTextureViewDimension_Cube : WGPUTextureViewDimension
WGPUTextureViewDimension_Cube = 0x00000004

WGPUTextureViewDimension_CubeArray : WGPUTextureViewDimension
WGPUTextureViewDimension_CubeArray = 0x00000005

WGPUTextureViewDimension_3D : WGPUTextureViewDimension
WGPUTextureViewDimension_3D = 0x00000006

WGPUTextureViewDimension_Force32 : WGPUTextureViewDimension
WGPUTextureViewDimension_Force32 = 0x7FFFFFFF

WGPUVertexFormat : Type
WGPUVertexFormat = Enum

WGPUVertexFormat_Uint8 : WGPUVertexFormat
WGPUVertexFormat_Uint8 = 0x00000001

WGPUVertexFormat_Uint8x2 : WGPUVertexFormat
WGPUVertexFormat_Uint8x2 = 0x00000002

WGPUVertexFormat_Uint8x4 : WGPUVertexFormat
WGPUVertexFormat_Uint8x4 = 0x00000003

WGPUVertexFormat_Sint8 : WGPUVertexFormat
WGPUVertexFormat_Sint8 = 0x00000004

WGPUVertexFormat_Sint8x2 : WGPUVertexFormat
WGPUVertexFormat_Sint8x2 = 0x00000005

WGPUVertexFormat_Sint8x4 : WGPUVertexFormat
WGPUVertexFormat_Sint8x4 = 0x00000006

WGPUVertexFormat_Unorm8 : WGPUVertexFormat
WGPUVertexFormat_Unorm8 = 0x00000007

WGPUVertexFormat_Unorm8x2 : WGPUVertexFormat
WGPUVertexFormat_Unorm8x2 = 0x00000008

WGPUVertexFormat_Unorm8x4 : WGPUVertexFormat
WGPUVertexFormat_Unorm8x4 = 0x00000009

WGPUVertexFormat_Snorm8 : WGPUVertexFormat
WGPUVertexFormat_Snorm8 = 0x0000000A

WGPUVertexFormat_Snorm8x2 : WGPUVertexFormat
WGPUVertexFormat_Snorm8x2 = 0x0000000B

WGPUVertexFormat_Snorm8x4 : WGPUVertexFormat
WGPUVertexFormat_Snorm8x4 = 0x0000000C

WGPUVertexFormat_Uint16 : WGPUVertexFormat
WGPUVertexFormat_Uint16 = 0x0000000D

WGPUVertexFormat_Uint16x2 : WGPUVertexFormat
WGPUVertexFormat_Uint16x2 = 0x0000000E

WGPUVertexFormat_Uint16x4 : WGPUVertexFormat
WGPUVertexFormat_Uint16x4 = 0x0000000F

WGPUVertexFormat_Sint16 : WGPUVertexFormat
WGPUVertexFormat_Sint16 = 0x00000010

WGPUVertexFormat_Sint16x2 : WGPUVertexFormat
WGPUVertexFormat_Sint16x2 = 0x00000011

WGPUVertexFormat_Sint16x4 : WGPUVertexFormat
WGPUVertexFormat_Sint16x4 = 0x00000012

WGPUVertexFormat_Unorm16 : WGPUVertexFormat
WGPUVertexFormat_Unorm16 = 0x00000013

WGPUVertexFormat_Unorm16x2 : WGPUVertexFormat
WGPUVertexFormat_Unorm16x2 = 0x00000014

WGPUVertexFormat_Unorm16x4 : WGPUVertexFormat
WGPUVertexFormat_Unorm16x4 = 0x00000015

WGPUVertexFormat_Snorm16 : WGPUVertexFormat
WGPUVertexFormat_Snorm16 = 0x00000016

WGPUVertexFormat_Snorm16x2 : WGPUVertexFormat
WGPUVertexFormat_Snorm16x2 = 0x00000017

WGPUVertexFormat_Snorm16x4 : WGPUVertexFormat
WGPUVertexFormat_Snorm16x4 = 0x00000018

WGPUVertexFormat_Float16 : WGPUVertexFormat
WGPUVertexFormat_Float16 = 0x00000019

WGPUVertexFormat_Float16x2 : WGPUVertexFormat
WGPUVertexFormat_Float16x2 = 0x0000001A

WGPUVertexFormat_Float16x4 : WGPUVertexFormat
WGPUVertexFormat_Float16x4 = 0x0000001B

WGPUVertexFormat_Float32 : WGPUVertexFormat
WGPUVertexFormat_Float32 = 0x0000001C

WGPUVertexFormat_Float32x2 : WGPUVertexFormat
WGPUVertexFormat_Float32x2 = 0x0000001D

WGPUVertexFormat_Float32x3 : WGPUVertexFormat
WGPUVertexFormat_Float32x3 = 0x0000001E

WGPUVertexFormat_Float32x4 : WGPUVertexFormat
WGPUVertexFormat_Float32x4 = 0x0000001F

WGPUVertexFormat_Uint32 : WGPUVertexFormat
WGPUVertexFormat_Uint32 = 0x00000020

WGPUVertexFormat_Uint32x2 : WGPUVertexFormat
WGPUVertexFormat_Uint32x2 = 0x00000021

WGPUVertexFormat_Uint32x3 : WGPUVertexFormat
WGPUVertexFormat_Uint32x3 = 0x00000022

WGPUVertexFormat_Uint32x4 : WGPUVertexFormat
WGPUVertexFormat_Uint32x4 = 0x00000023

WGPUVertexFormat_Sint32 : WGPUVertexFormat
WGPUVertexFormat_Sint32 = 0x00000024

WGPUVertexFormat_Sint32x2 : WGPUVertexFormat
WGPUVertexFormat_Sint32x2 = 0x00000025

WGPUVertexFormat_Sint32x3 : WGPUVertexFormat
WGPUVertexFormat_Sint32x3 = 0x00000026

WGPUVertexFormat_Sint32x4 : WGPUVertexFormat
WGPUVertexFormat_Sint32x4 = 0x00000027

WGPUVertexFormat_Unorm10_10_10_2 : WGPUVertexFormat
WGPUVertexFormat_Unorm10_10_10_2 = 0x00000028

WGPUVertexFormat_Unorm8x4BGRA : WGPUVertexFormat
WGPUVertexFormat_Unorm8x4BGRA = 0x00000029

WGPUVertexFormat_Force32 : WGPUVertexFormat
WGPUVertexFormat_Force32 = 0x7FFFFFFF

WGPUVertexStepMode : Type
WGPUVertexStepMode = Enum

WGPUVertexStepMode_VertexBufferNotUsed : WGPUVertexStepMode
WGPUVertexStepMode_VertexBufferNotUsed = 0x00000000

WGPUVertexStepMode_Undefined : WGPUVertexStepMode
WGPUVertexStepMode_Undefined = 0x00000001

WGPUVertexStepMode_Vertex : WGPUVertexStepMode
WGPUVertexStepMode_Vertex = 0x00000002

WGPUVertexStepMode_Instance : WGPUVertexStepMode
WGPUVertexStepMode_Instance = 0x00000003

WGPUVertexStepMode_Force32 : WGPUVertexStepMode
WGPUVertexStepMode_Force32 = 0x7FFFFFFF

WGPUWGSLLanguageFeatureName : Type
WGPUWGSLLanguageFeatureName = Enum

WGPUWGSLLanguageFeatureName_ReadonlyAndReadwriteStorageTextures : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_ReadonlyAndReadwriteStorageTextures = 0x00000001

WGPUWGSLLanguageFeatureName_Packed4x8IntegerDotProduct : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_Packed4x8IntegerDotProduct = 0x00000002

WGPUWGSLLanguageFeatureName_UnrestrictedPointerParameters : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_UnrestrictedPointerParameters = 0x00000003

WGPUWGSLLanguageFeatureName_PointerCompositeAccess : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_PointerCompositeAccess = 0x00000004

WGPUWGSLLanguageFeatureName_Force32 : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_Force32 = 0x7FFFFFFF

WGPUWaitStatus : Type
WGPUWaitStatus = Enum

WGPUWaitStatus_Success : WGPUWaitStatus
WGPUWaitStatus_Success = 0x00000001

WGPUWaitStatus_TimedOut : WGPUWaitStatus
WGPUWaitStatus_TimedOut = 0x00000002

WGPUWaitStatus_UnsupportedTimeout : WGPUWaitStatus
WGPUWaitStatus_UnsupportedTimeout = 0x00000003

WGPUWaitStatus_UnsupportedCount : WGPUWaitStatus
WGPUWaitStatus_UnsupportedCount = 0x00000004

WGPUWaitStatus_UnsupportedMixedSources : WGPUWaitStatus
WGPUWaitStatus_UnsupportedMixedSources = 0x00000005

WGPUWaitStatus_Force32 : WGPUWaitStatus
WGPUWaitStatus_Force32 = 0x7FFFFFFF

WGPUBufferUsage : Type
WGPUBufferUsage = WGPUFlags

WGPUColorWriteMask : Type
WGPUColorWriteMask = WGPUFlags

WGPUMapMode : Type
WGPUMapMode = WGPUFlags

WGPUShaderStage : Type
WGPUShaderStage = WGPUFlags

WGPUTextureUsage : Type
WGPUTextureUsage = WGPUFlags

WGPUProc : Type
WGPUProc = Ptr (() -> ())

WGPUBufferMapCallback : Type
WGPUBufferMapCallback = Ptr (WGPUMapAsyncStatus -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUCompilationInfoCallback : Type
WGPUCompilationInfoCallback = Ptr (WGPUCompilationInfoRequestStatus -> Ptr (Struct "WGPUCompilationInfo" []) -> Ptr (()) -> Ptr (()) -> ())

WGPUCreateComputePipelineAsyncCallback : Type
WGPUCreateComputePipelineAsyncCallback = Ptr (WGPUCreatePipelineAsyncStatus -> WGPUComputePipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUCreateRenderPipelineAsyncCallback : Type
WGPUCreateRenderPipelineAsyncCallback = Ptr (WGPUCreatePipelineAsyncStatus -> WGPURenderPipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUDeviceLostCallback : Type
WGPUDeviceLostCallback = Ptr (Ptr (WGPUDevice) -> WGPUDeviceLostReason -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUPopErrorScopeCallback : Type
WGPUPopErrorScopeCallback = Ptr (WGPUPopErrorScopeStatus -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUQueueWorkDoneCallback : Type
WGPUQueueWorkDoneCallback = Ptr (WGPUQueueWorkDoneStatus -> Ptr (()) -> Ptr (()) -> ())

WGPURequestAdapterCallback : Type
WGPURequestAdapterCallback = Ptr (WGPURequestAdapterStatus -> WGPUAdapter -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPURequestDeviceCallback : Type
WGPURequestDeviceCallback = Ptr (WGPURequestDeviceStatus -> WGPUDevice -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUUncapturedErrorCallback : Type
WGPUUncapturedErrorCallback = Ptr (Ptr (WGPUDevice) -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

WGPUChainedStruct : Type
WGPUChainedStruct = Struct "WGPUChainedStruct" [("next", Ptr (Struct "WGPUChainedStruct" [])),("sType",  (WGPUSType))]

WGPUChainedStructOut : Type
WGPUChainedStructOut = Struct "WGPUChainedStructOut" [("next", Ptr (Struct "WGPUChainedStructOut" [])),("sType",  (WGPUSType))]

WGPUBufferMapCallbackInfo : Type
WGPUBufferMapCallbackInfo = Struct "WGPUBufferMapCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUBufferMapCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUCompilationInfoCallbackInfo : Type
WGPUCompilationInfoCallbackInfo = Struct "WGPUCompilationInfoCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCompilationInfoCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUCreateComputePipelineAsyncCallbackInfo : Type
WGPUCreateComputePipelineAsyncCallbackInfo = Struct "WGPUCreateComputePipelineAsyncCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCreateComputePipelineAsyncCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUCreateRenderPipelineAsyncCallbackInfo : Type
WGPUCreateRenderPipelineAsyncCallbackInfo = Struct "WGPUCreateRenderPipelineAsyncCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCreateRenderPipelineAsyncCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUDeviceLostCallbackInfo : Type
WGPUDeviceLostCallbackInfo = Struct "WGPUDeviceLostCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUDeviceLostCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUPopErrorScopeCallbackInfo : Type
WGPUPopErrorScopeCallbackInfo = Struct "WGPUPopErrorScopeCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUPopErrorScopeCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUQueueWorkDoneCallbackInfo : Type
WGPUQueueWorkDoneCallbackInfo = Struct "WGPUQueueWorkDoneCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUQueueWorkDoneCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPURequestAdapterCallbackInfo : Type
WGPURequestAdapterCallbackInfo = Struct "WGPURequestAdapterCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPURequestAdapterCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPURequestDeviceCallbackInfo : Type
WGPURequestDeviceCallbackInfo = Struct "WGPURequestDeviceCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPURequestDeviceCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUUncapturedErrorCallbackInfo : Type
WGPUUncapturedErrorCallbackInfo = Struct "WGPUUncapturedErrorCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("callback",  (WGPUUncapturedErrorCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

WGPUAdapterInfo : Type
WGPUAdapterInfo = Struct "WGPUAdapterInfo" [("nextInChain", Ptr (WGPUChainedStructOut)),("vendor",  (WGPUStringView)),("architecture",  (WGPUStringView)),("device",  (WGPUStringView)),("description",  (WGPUStringView)),("backendType",  (WGPUBackendType)),("adapterType",  (WGPUAdapterType)),("vendorID",  (U32)),("deviceID",  (U32))]

WGPUBindGroupEntry : Type
WGPUBindGroupEntry = Struct "WGPUBindGroupEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("binding",  (U32)),("buffer",  (WGPUBuffer)),("offset",  (U64)),("size",  (U64)),("sampler",  (WGPUSampler)),("textureView",  (WGPUTextureView))]

WGPUBlendComponent : Type
WGPUBlendComponent = Struct "WGPUBlendComponent" [("operation",  (WGPUBlendOperation)),("srcFactor",  (WGPUBlendFactor)),("dstFactor",  (WGPUBlendFactor))]

WGPUBufferBindingLayout : Type
WGPUBufferBindingLayout = Struct "WGPUBufferBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("type",  (WGPUBufferBindingType)),("hasDynamicOffset",  (WGPUBool)),("minBindingSize",  (U64))]

WGPUBufferDescriptor : Type
WGPUBufferDescriptor = Struct "WGPUBufferDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("usage",  (WGPUBufferUsage)),("size",  (U64)),("mappedAtCreation",  (WGPUBool))]

WGPUColor : Type
WGPUColor = Struct "WGPUColor" [("r",  (F64)),("g",  (F64)),("b",  (F64)),("a",  (F64))]

WGPUCommandBufferDescriptor : Type
WGPUCommandBufferDescriptor = Struct "WGPUCommandBufferDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

WGPUCommandEncoderDescriptor : Type
WGPUCommandEncoderDescriptor = Struct "WGPUCommandEncoderDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

WGPUCompilationMessage : Type
WGPUCompilationMessage = Struct "WGPUCompilationMessage" [("nextInChain", Ptr (WGPUChainedStruct)),("message",  (WGPUStringView)),("type",  (WGPUCompilationMessageType)),("lineNum",  (U64)),("linePos",  (U64)),("offset",  (U64)),("length",  (U64))]

WGPUComputePassTimestampWrites : Type
WGPUComputePassTimestampWrites = Struct "WGPUComputePassTimestampWrites" [("querySet",  (WGPUQuerySet)),("beginningOfPassWriteIndex",  (U32)),("endOfPassWriteIndex",  (U32))]

WGPUConstantEntry : Type
WGPUConstantEntry = Struct "WGPUConstantEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("key",  (WGPUStringView)),("value",  (F64))]

WGPUExtent3D : Type
WGPUExtent3D = Struct "WGPUExtent3D" [("width",  (U32)),("height",  (U32)),("depthOrArrayLayers",  (U32))]

WGPUFuture : Type
WGPUFuture = Struct "WGPUFuture" [("id",  (U64))]

WGPUInstanceCapabilities : Type
WGPUInstanceCapabilities = Struct "WGPUInstanceCapabilities" [("nextInChain", Ptr (WGPUChainedStructOut)),("timedWaitAnyEnable",  (WGPUBool)),("timedWaitAnyMaxCount",  (U64))]

WGPULimits : Type
WGPULimits = Struct "WGPULimits" [("nextInChain", Ptr (WGPUChainedStructOut)),("maxTextureDimension1D",  (U32)),("maxTextureDimension2D",  (U32)),("maxTextureDimension3D",  (U32)),("maxTextureArrayLayers",  (U32)),("maxBindGroups",  (U32)),("maxBindGroupsPlusVertexBuffers",  (U32)),("maxBindingsPerBindGroup",  (U32)),("maxDynamicUniformBuffersPerPipelineLayout",  (U32)),("maxDynamicStorageBuffersPerPipelineLayout",  (U32)),("maxSampledTexturesPerShaderStage",  (U32)),("maxSamplersPerShaderStage",  (U32)),("maxStorageBuffersPerShaderStage",  (U32)),("maxStorageTexturesPerShaderStage",  (U32)),("maxUniformBuffersPerShaderStage",  (U32)),("maxUniformBufferBindingSize",  (U64)),("maxStorageBufferBindingSize",  (U64)),("minUniformBufferOffsetAlignment",  (U32)),("minStorageBufferOffsetAlignment",  (U32)),("maxVertexBuffers",  (U32)),("maxBufferSize",  (U64)),("maxVertexAttributes",  (U32)),("maxVertexBufferArrayStride",  (U32)),("maxInterStageShaderVariables",  (U32)),("maxColorAttachments",  (U32)),("maxColorAttachmentBytesPerSample",  (U32)),("maxComputeWorkgroupStorageSize",  (U32)),("maxComputeInvocationsPerWorkgroup",  (U32)),("maxComputeWorkgroupSizeX",  (U32)),("maxComputeWorkgroupSizeY",  (U32)),("maxComputeWorkgroupSizeZ",  (U32)),("maxComputeWorkgroupsPerDimension",  (U32))]

WGPUMultisampleState : Type
WGPUMultisampleState = Struct "WGPUMultisampleState" [("nextInChain", Ptr (WGPUChainedStruct)),("count",  (U32)),("mask",  (U32)),("alphaToCoverageEnabled",  (WGPUBool))]

WGPUOrigin3D : Type
WGPUOrigin3D = Struct "WGPUOrigin3D" [("x",  (U32)),("y",  (U32)),("z",  (U32))]

WGPUPipelineLayoutDescriptor : Type
WGPUPipelineLayoutDescriptor = Struct "WGPUPipelineLayoutDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("bindGroupLayoutCount",  (U64)),("bindGroupLayouts", Ptr (WGPUBindGroupLayout))]

WGPUPrimitiveState : Type
WGPUPrimitiveState = Struct "WGPUPrimitiveState" [("nextInChain", Ptr (WGPUChainedStruct)),("topology",  (WGPUPrimitiveTopology)),("stripIndexFormat",  (WGPUIndexFormat)),("frontFace",  (WGPUFrontFace)),("cullMode",  (WGPUCullMode)),("unclippedDepth",  (WGPUBool))]

WGPUQuerySetDescriptor : Type
WGPUQuerySetDescriptor = Struct "WGPUQuerySetDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("type",  (WGPUQueryType)),("count",  (U32))]

WGPUQueueDescriptor : Type
WGPUQueueDescriptor = Struct "WGPUQueueDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

WGPURenderBundleDescriptor : Type
WGPURenderBundleDescriptor = Struct "WGPURenderBundleDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

WGPURenderBundleEncoderDescriptor : Type
WGPURenderBundleEncoderDescriptor = Struct "WGPURenderBundleEncoderDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("colorFormatCount",  (U64)),("colorFormats", Ptr (WGPUTextureFormat)),("depthStencilFormat",  (WGPUTextureFormat)),("sampleCount",  (U32)),("depthReadOnly",  (WGPUBool)),("stencilReadOnly",  (WGPUBool))]

WGPURenderPassDepthStencilAttachment : Type
WGPURenderPassDepthStencilAttachment = Struct "WGPURenderPassDepthStencilAttachment" [("view",  (WGPUTextureView)),("depthLoadOp",  (WGPULoadOp)),("depthStoreOp",  (WGPUStoreOp)),("depthClearValue",  (F32)),("depthReadOnly",  (WGPUBool)),("stencilLoadOp",  (WGPULoadOp)),("stencilStoreOp",  (WGPUStoreOp)),("stencilClearValue",  (U32)),("stencilReadOnly",  (WGPUBool))]

WGPURenderPassMaxDrawCount : Type
WGPURenderPassMaxDrawCount = Struct "WGPURenderPassMaxDrawCount" [("chain",  (WGPUChainedStruct)),("maxDrawCount",  (U64))]

WGPURenderPassTimestampWrites : Type
WGPURenderPassTimestampWrites = Struct "WGPURenderPassTimestampWrites" [("querySet",  (WGPUQuerySet)),("beginningOfPassWriteIndex",  (U32)),("endOfPassWriteIndex",  (U32))]

WGPURequestAdapterOptions : Type
WGPURequestAdapterOptions = Struct "WGPURequestAdapterOptions" [("nextInChain", Ptr (WGPUChainedStruct)),("featureLevel",  (WGPUFeatureLevel)),("powerPreference",  (WGPUPowerPreference)),("forceFallbackAdapter",  (WGPUBool)),("backendType",  (WGPUBackendType)),("compatibleSurface",  (WGPUSurface))]

WGPUSamplerBindingLayout : Type
WGPUSamplerBindingLayout = Struct "WGPUSamplerBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("type",  (WGPUSamplerBindingType))]

WGPUSamplerDescriptor : Type
WGPUSamplerDescriptor = Struct "WGPUSamplerDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("addressModeU",  (WGPUAddressMode)),("addressModeV",  (WGPUAddressMode)),("addressModeW",  (WGPUAddressMode)),("magFilter",  (WGPUFilterMode)),("minFilter",  (WGPUFilterMode)),("mipmapFilter",  (WGPUMipmapFilterMode)),("lodMinClamp",  (F32)),("lodMaxClamp",  (F32)),("compare",  (WGPUCompareFunction)),("maxAnisotropy",  (U16))]

WGPUShaderModuleDescriptor : Type
WGPUShaderModuleDescriptor = Struct "WGPUShaderModuleDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

WGPUShaderSourceSPIRV : Type
WGPUShaderSourceSPIRV = Struct "WGPUShaderSourceSPIRV" [("chain",  (WGPUChainedStruct)),("codeSize",  (U32)),("code", Ptr (U32))]

WGPUShaderSourceWGSL : Type
WGPUShaderSourceWGSL = Struct "WGPUShaderSourceWGSL" [("chain",  (WGPUChainedStruct)),("code",  (WGPUStringView))]

WGPUStencilFaceState : Type
WGPUStencilFaceState = Struct "WGPUStencilFaceState" [("compare",  (WGPUCompareFunction)),("failOp",  (WGPUStencilOperation)),("depthFailOp",  (WGPUStencilOperation)),("passOp",  (WGPUStencilOperation))]

WGPUStorageTextureBindingLayout : Type
WGPUStorageTextureBindingLayout = Struct "WGPUStorageTextureBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("access",  (WGPUStorageTextureAccess)),("format",  (WGPUTextureFormat)),("viewDimension",  (WGPUTextureViewDimension))]

WGPUSupportedFeatures : Type
WGPUSupportedFeatures = Struct "WGPUSupportedFeatures" [("featureCount",  (U64)),("features", Ptr (WGPUFeatureName))]

WGPUSupportedWGSLLanguageFeatures : Type
WGPUSupportedWGSLLanguageFeatures = Struct "WGPUSupportedWGSLLanguageFeatures" [("featureCount",  (U64)),("features", Ptr (WGPUWGSLLanguageFeatureName))]

WGPUSurfaceCapabilities : Type
WGPUSurfaceCapabilities = Struct "WGPUSurfaceCapabilities" [("nextInChain", Ptr (WGPUChainedStructOut)),("usages",  (WGPUTextureUsage)),("formatCount",  (U64)),("formats", Ptr (WGPUTextureFormat)),("presentModeCount",  (U64)),("presentModes", Ptr (WGPUPresentMode)),("alphaModeCount",  (U64)),("alphaModes", Ptr (WGPUCompositeAlphaMode))]

WGPUSurfaceConfiguration : Type
WGPUSurfaceConfiguration = Struct "WGPUSurfaceConfiguration" [("nextInChain", Ptr (WGPUChainedStruct)),("device",  (WGPUDevice)),("format",  (WGPUTextureFormat)),("usage",  (WGPUTextureUsage)),("width",  (U32)),("height",  (U32)),("viewFormatCount",  (U64)),("viewFormats", Ptr (WGPUTextureFormat)),("alphaMode",  (WGPUCompositeAlphaMode)),("presentMode",  (WGPUPresentMode))]

WGPUSurfaceDescriptor : Type
WGPUSurfaceDescriptor = Struct "WGPUSurfaceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

WGPUSurfaceSourceAndroidNativeWindow : Type
WGPUSurfaceSourceAndroidNativeWindow = Struct "WGPUSurfaceSourceAndroidNativeWindow" [("chain",  (WGPUChainedStruct)),("window", Ptr (()))]

WGPUSurfaceSourceMetalLayer : Type
WGPUSurfaceSourceMetalLayer = Struct "WGPUSurfaceSourceMetalLayer" [("chain",  (WGPUChainedStruct)),("layer", Ptr (()))]

WGPUSurfaceSourceWaylandSurface : Type
WGPUSurfaceSourceWaylandSurface = Struct "WGPUSurfaceSourceWaylandSurface" [("chain",  (WGPUChainedStruct)),("display", Ptr (())),("surface", Ptr (()))]

WGPUSurfaceSourceWindowsHWND : Type
WGPUSurfaceSourceWindowsHWND = Struct "WGPUSurfaceSourceWindowsHWND" [("chain",  (WGPUChainedStruct)),("hinstance", Ptr (())),("hwnd", Ptr (()))]

WGPUSurfaceSourceXCBWindow : Type
WGPUSurfaceSourceXCBWindow = Struct "WGPUSurfaceSourceXCBWindow" [("chain",  (WGPUChainedStruct)),("connection", Ptr (())),("window",  (U32))]

WGPUSurfaceSourceXlibWindow : Type
WGPUSurfaceSourceXlibWindow = Struct "WGPUSurfaceSourceXlibWindow" [("chain",  (WGPUChainedStruct)),("display", Ptr (())),("window",  (U64))]

WGPUSurfaceTexture : Type
WGPUSurfaceTexture = Struct "WGPUSurfaceTexture" [("nextInChain", Ptr (WGPUChainedStructOut)),("texture",  (WGPUTexture)),("status",  (WGPUSurfaceGetCurrentTextureStatus))]

WGPUTexelCopyBufferLayout : Type
WGPUTexelCopyBufferLayout = Struct "WGPUTexelCopyBufferLayout" [("offset",  (U64)),("bytesPerRow",  (U32)),("rowsPerImage",  (U32))]

WGPUTextureBindingLayout : Type
WGPUTextureBindingLayout = Struct "WGPUTextureBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("sampleType",  (WGPUTextureSampleType)),("viewDimension",  (WGPUTextureViewDimension)),("multisampled",  (WGPUBool))]

WGPUTextureViewDescriptor : Type
WGPUTextureViewDescriptor = Struct "WGPUTextureViewDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("format",  (WGPUTextureFormat)),("dimension",  (WGPUTextureViewDimension)),("baseMipLevel",  (U32)),("mipLevelCount",  (U32)),("baseArrayLayer",  (U32)),("arrayLayerCount",  (U32)),("aspect",  (WGPUTextureAspect)),("usage",  (WGPUTextureUsage))]

WGPUVertexAttribute : Type
WGPUVertexAttribute = Struct "WGPUVertexAttribute" [("format",  (WGPUVertexFormat)),("offset",  (U64)),("shaderLocation",  (U32))]

WGPUBindGroupDescriptor : Type
WGPUBindGroupDescriptor = Struct "WGPUBindGroupDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUBindGroupLayout)),("entryCount",  (U64)),("entries", Ptr (WGPUBindGroupEntry))]

WGPUBindGroupLayoutEntry : Type
WGPUBindGroupLayoutEntry = Struct "WGPUBindGroupLayoutEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("binding",  (U32)),("visibility",  (WGPUShaderStage)),("buffer",  (WGPUBufferBindingLayout)),("sampler",  (WGPUSamplerBindingLayout)),("texture",  (WGPUTextureBindingLayout)),("storageTexture",  (WGPUStorageTextureBindingLayout))]

WGPUBlendState : Type
WGPUBlendState = Struct "WGPUBlendState" [("color",  (WGPUBlendComponent)),("alpha",  (WGPUBlendComponent))]

WGPUCompilationInfo : Type
WGPUCompilationInfo = Struct "WGPUCompilationInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("messageCount",  (U64)),("messages", Ptr (WGPUCompilationMessage))]

WGPUComputePassDescriptor : Type
WGPUComputePassDescriptor = Struct "WGPUComputePassDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("timestampWrites", Ptr (WGPUComputePassTimestampWrites))]

WGPUDepthStencilState : Type
WGPUDepthStencilState = Struct "WGPUDepthStencilState" [("nextInChain", Ptr (WGPUChainedStruct)),("format",  (WGPUTextureFormat)),("depthWriteEnabled",  (WGPUOptionalBool)),("depthCompare",  (WGPUCompareFunction)),("stencilFront",  (WGPUStencilFaceState)),("stencilBack",  (WGPUStencilFaceState)),("stencilReadMask",  (U32)),("stencilWriteMask",  (U32)),("depthBias",  (I32)),("depthBiasSlopeScale",  (F32)),("depthBiasClamp",  (F32))]

WGPUDeviceDescriptor : Type
WGPUDeviceDescriptor = Struct "WGPUDeviceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("requiredFeatureCount",  (U64)),("requiredFeatures", Ptr (WGPUFeatureName)),("requiredLimits", Ptr (WGPULimits)),("defaultQueue",  (WGPUQueueDescriptor)),("deviceLostCallbackInfo",  (WGPUDeviceLostCallbackInfo)),("uncapturedErrorCallbackInfo",  (WGPUUncapturedErrorCallbackInfo))]

WGPUFutureWaitInfo : Type
WGPUFutureWaitInfo = Struct "WGPUFutureWaitInfo" [("future",  (WGPUFuture)),("completed",  (WGPUBool))]

WGPUInstanceDescriptor : Type
WGPUInstanceDescriptor = Struct "WGPUInstanceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("features",  (WGPUInstanceCapabilities))]

WGPUProgrammableStageDescriptor : Type
WGPUProgrammableStageDescriptor = Struct "WGPUProgrammableStageDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (U64)),("constants", Ptr (WGPUConstantEntry))]

WGPURenderPassColorAttachment : Type
WGPURenderPassColorAttachment = Struct "WGPURenderPassColorAttachment" [("nextInChain", Ptr (WGPUChainedStruct)),("view",  (WGPUTextureView)),("depthSlice",  (U32)),("resolveTarget",  (WGPUTextureView)),("loadOp",  (WGPULoadOp)),("storeOp",  (WGPUStoreOp)),("clearValue",  (WGPUColor))]

WGPUTexelCopyBufferInfo : Type
WGPUTexelCopyBufferInfo = Struct "WGPUTexelCopyBufferInfo" [("layout",  (WGPUTexelCopyBufferLayout)),("buffer",  (WGPUBuffer))]

WGPUTexelCopyTextureInfo : Type
WGPUTexelCopyTextureInfo = Struct "WGPUTexelCopyTextureInfo" [("texture",  (WGPUTexture)),("mipLevel",  (U32)),("origin",  (WGPUOrigin3D)),("aspect",  (WGPUTextureAspect))]

WGPUTextureDescriptor : Type
WGPUTextureDescriptor = Struct "WGPUTextureDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("usage",  (WGPUTextureUsage)),("dimension",  (WGPUTextureDimension)),("size",  (WGPUExtent3D)),("format",  (WGPUTextureFormat)),("mipLevelCount",  (U32)),("sampleCount",  (U32)),("viewFormatCount",  (U64)),("viewFormats", Ptr (WGPUTextureFormat))]

WGPUVertexBufferLayout : Type
WGPUVertexBufferLayout = Struct "WGPUVertexBufferLayout" [("stepMode",  (WGPUVertexStepMode)),("arrayStride",  (U64)),("attributeCount",  (U64)),("attributes", Ptr (WGPUVertexAttribute))]

WGPUBindGroupLayoutDescriptor : Type
WGPUBindGroupLayoutDescriptor = Struct "WGPUBindGroupLayoutDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("entryCount",  (U64)),("entries", Ptr (WGPUBindGroupLayoutEntry))]

WGPUColorTargetState : Type
WGPUColorTargetState = Struct "WGPUColorTargetState" [("nextInChain", Ptr (WGPUChainedStruct)),("format",  (WGPUTextureFormat)),("blend", Ptr (WGPUBlendState)),("writeMask",  (WGPUColorWriteMask))]

WGPUComputePipelineDescriptor : Type
WGPUComputePipelineDescriptor = Struct "WGPUComputePipelineDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUPipelineLayout)),("compute",  (WGPUProgrammableStageDescriptor))]

WGPURenderPassDescriptor : Type
WGPURenderPassDescriptor = Struct "WGPURenderPassDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("colorAttachmentCount",  (U64)),("colorAttachments", Ptr (WGPURenderPassColorAttachment)),("depthStencilAttachment", Ptr (WGPURenderPassDepthStencilAttachment)),("occlusionQuerySet",  (WGPUQuerySet)),("timestampWrites", Ptr (WGPURenderPassTimestampWrites))]

WGPUVertexState : Type
WGPUVertexState = Struct "WGPUVertexState" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (U64)),("constants", Ptr (WGPUConstantEntry)),("bufferCount",  (U64)),("buffers", Ptr (WGPUVertexBufferLayout))]

WGPUFragmentState : Type
WGPUFragmentState = Struct "WGPUFragmentState" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (U64)),("constants", Ptr (WGPUConstantEntry)),("targetCount",  (U64)),("targets", Ptr (WGPUColorTargetState))]

WGPURenderPipelineDescriptor : Type
WGPURenderPipelineDescriptor = Struct "WGPURenderPipelineDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUPipelineLayout)),("vertex",  (WGPUVertexState)),("primitive",  (WGPUPrimitiveState)),("depthStencil", Ptr (WGPUDepthStencilState)),("multisample",  (WGPUMultisampleState)),("fragment", Ptr (WGPUFragmentState))]

WGPUProcCreateInstance : Type
WGPUProcCreateInstance = Ptr (Ptr (WGPUInstanceDescriptor) -> WGPUInstance)

WGPUProcGetInstanceCapabilities : Type
WGPUProcGetInstanceCapabilities = Ptr (Ptr (WGPUInstanceCapabilities) -> WGPUStatus)

WGPUProcGetProcAddress : Type
WGPUProcGetProcAddress = Ptr (WGPUStringView -> WGPUProc)

WGPUProcAdapterGetFeatures : Type
WGPUProcAdapterGetFeatures = Ptr (WGPUAdapter -> Ptr (WGPUSupportedFeatures) -> ())

WGPUProcAdapterGetInfo : Type
WGPUProcAdapterGetInfo = Ptr (WGPUAdapter -> Ptr (WGPUAdapterInfo) -> WGPUStatus)

WGPUProcAdapterGetLimits : Type
WGPUProcAdapterGetLimits = Ptr (WGPUAdapter -> Ptr (WGPULimits) -> WGPUStatus)

WGPUProcAdapterHasFeature : Type
WGPUProcAdapterHasFeature = Ptr (WGPUAdapter -> WGPUFeatureName -> WGPUBool)

WGPUProcAdapterRequestDevice : Type
WGPUProcAdapterRequestDevice = Ptr (WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> WGPURequestDeviceCallbackInfo -> WGPUFuture)

WGPUProcAdapterAddRef : Type
WGPUProcAdapterAddRef = Ptr (WGPUAdapter -> ())

WGPUProcAdapterRelease : Type
WGPUProcAdapterRelease = Ptr (WGPUAdapter -> ())

WGPUProcAdapterInfoFreeMembers : Type
WGPUProcAdapterInfoFreeMembers = Ptr (WGPUAdapterInfo -> ())

WGPUProcBindGroupSetLabel : Type
WGPUProcBindGroupSetLabel = Ptr (WGPUBindGroup -> WGPUStringView -> ())

WGPUProcBindGroupAddRef : Type
WGPUProcBindGroupAddRef = Ptr (WGPUBindGroup -> ())

WGPUProcBindGroupRelease : Type
WGPUProcBindGroupRelease = Ptr (WGPUBindGroup -> ())

WGPUProcBindGroupLayoutSetLabel : Type
WGPUProcBindGroupLayoutSetLabel = Ptr (WGPUBindGroupLayout -> WGPUStringView -> ())

WGPUProcBindGroupLayoutAddRef : Type
WGPUProcBindGroupLayoutAddRef = Ptr (WGPUBindGroupLayout -> ())

WGPUProcBindGroupLayoutRelease : Type
WGPUProcBindGroupLayoutRelease = Ptr (WGPUBindGroupLayout -> ())

WGPUProcBufferDestroy : Type
WGPUProcBufferDestroy = Ptr (WGPUBuffer -> ())

WGPUProcBufferGetConstMappedRange : Type
WGPUProcBufferGetConstMappedRange = Ptr (WGPUBuffer -> U64 -> U64 -> Ptr (()))

WGPUProcBufferGetMapState : Type
WGPUProcBufferGetMapState = Ptr (WGPUBuffer -> WGPUBufferMapState)

WGPUProcBufferGetMappedRange : Type
WGPUProcBufferGetMappedRange = Ptr (WGPUBuffer -> U64 -> U64 -> Ptr (()))

WGPUProcBufferGetSize : Type
WGPUProcBufferGetSize = Ptr (WGPUBuffer -> U64)

WGPUProcBufferGetUsage : Type
WGPUProcBufferGetUsage = Ptr (WGPUBuffer -> WGPUBufferUsage)

WGPUProcBufferMapAsync : Type
WGPUProcBufferMapAsync = Ptr (WGPUBuffer -> WGPUMapMode -> U64 -> U64 -> WGPUBufferMapCallbackInfo -> WGPUFuture)

WGPUProcBufferSetLabel : Type
WGPUProcBufferSetLabel = Ptr (WGPUBuffer -> WGPUStringView -> ())

WGPUProcBufferUnmap : Type
WGPUProcBufferUnmap = Ptr (WGPUBuffer -> ())

WGPUProcBufferAddRef : Type
WGPUProcBufferAddRef = Ptr (WGPUBuffer -> ())

WGPUProcBufferRelease : Type
WGPUProcBufferRelease = Ptr (WGPUBuffer -> ())

WGPUProcCommandBufferSetLabel : Type
WGPUProcCommandBufferSetLabel = Ptr (WGPUCommandBuffer -> WGPUStringView -> ())

WGPUProcCommandBufferAddRef : Type
WGPUProcCommandBufferAddRef = Ptr (WGPUCommandBuffer -> ())

WGPUProcCommandBufferRelease : Type
WGPUProcCommandBufferRelease = Ptr (WGPUCommandBuffer -> ())

WGPUProcCommandEncoderBeginComputePass : Type
WGPUProcCommandEncoderBeginComputePass = Ptr (WGPUCommandEncoder -> Ptr (WGPUComputePassDescriptor) -> WGPUComputePassEncoder)

WGPUProcCommandEncoderBeginRenderPass : Type
WGPUProcCommandEncoderBeginRenderPass = Ptr (WGPUCommandEncoder -> Ptr (WGPURenderPassDescriptor) -> WGPURenderPassEncoder)

WGPUProcCommandEncoderClearBuffer : Type
WGPUProcCommandEncoderClearBuffer = Ptr (WGPUCommandEncoder -> WGPUBuffer -> U64 -> U64 -> ())

WGPUProcCommandEncoderCopyBufferToBuffer : Type
WGPUProcCommandEncoderCopyBufferToBuffer = Ptr (WGPUCommandEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U64 -> ())

WGPUProcCommandEncoderCopyBufferToTexture : Type
WGPUProcCommandEncoderCopyBufferToTexture = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> ())

WGPUProcCommandEncoderCopyTextureToBuffer : Type
WGPUProcCommandEncoderCopyTextureToBuffer = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUExtent3D) -> ())

WGPUProcCommandEncoderCopyTextureToTexture : Type
WGPUProcCommandEncoderCopyTextureToTexture = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> ())

WGPUProcCommandEncoderFinish : Type
WGPUProcCommandEncoderFinish = Ptr (WGPUCommandEncoder -> Ptr (WGPUCommandBufferDescriptor) -> WGPUCommandBuffer)

WGPUProcCommandEncoderInsertDebugMarker : Type
WGPUProcCommandEncoderInsertDebugMarker = Ptr (WGPUCommandEncoder -> WGPUStringView -> ())

WGPUProcCommandEncoderPopDebugGroup : Type
WGPUProcCommandEncoderPopDebugGroup = Ptr (WGPUCommandEncoder -> ())

WGPUProcCommandEncoderPushDebugGroup : Type
WGPUProcCommandEncoderPushDebugGroup = Ptr (WGPUCommandEncoder -> WGPUStringView -> ())

WGPUProcCommandEncoderResolveQuerySet : Type
WGPUProcCommandEncoderResolveQuerySet = Ptr (WGPUCommandEncoder -> WGPUQuerySet -> U32 -> U32 -> WGPUBuffer -> U64 -> ())

WGPUProcCommandEncoderSetLabel : Type
WGPUProcCommandEncoderSetLabel = Ptr (WGPUCommandEncoder -> WGPUStringView -> ())

WGPUProcCommandEncoderWriteTimestamp : Type
WGPUProcCommandEncoderWriteTimestamp = Ptr (WGPUCommandEncoder -> WGPUQuerySet -> U32 -> ())

WGPUProcCommandEncoderAddRef : Type
WGPUProcCommandEncoderAddRef = Ptr (WGPUCommandEncoder -> ())

WGPUProcCommandEncoderRelease : Type
WGPUProcCommandEncoderRelease = Ptr (WGPUCommandEncoder -> ())

WGPUProcComputePassEncoderDispatchWorkgroups : Type
WGPUProcComputePassEncoderDispatchWorkgroups = Ptr (WGPUComputePassEncoder -> U32 -> U32 -> U32 -> ())

WGPUProcComputePassEncoderDispatchWorkgroupsIndirect : Type
WGPUProcComputePassEncoderDispatchWorkgroupsIndirect = Ptr (WGPUComputePassEncoder -> WGPUBuffer -> U64 -> ())

WGPUProcComputePassEncoderEnd : Type
WGPUProcComputePassEncoderEnd = Ptr (WGPUComputePassEncoder -> ())

WGPUProcComputePassEncoderInsertDebugMarker : Type
WGPUProcComputePassEncoderInsertDebugMarker = Ptr (WGPUComputePassEncoder -> WGPUStringView -> ())

WGPUProcComputePassEncoderPopDebugGroup : Type
WGPUProcComputePassEncoderPopDebugGroup = Ptr (WGPUComputePassEncoder -> ())

WGPUProcComputePassEncoderPushDebugGroup : Type
WGPUProcComputePassEncoderPushDebugGroup = Ptr (WGPUComputePassEncoder -> WGPUStringView -> ())

WGPUProcComputePassEncoderSetBindGroup : Type
WGPUProcComputePassEncoderSetBindGroup = Ptr (WGPUComputePassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ())

WGPUProcComputePassEncoderSetLabel : Type
WGPUProcComputePassEncoderSetLabel = Ptr (WGPUComputePassEncoder -> WGPUStringView -> ())

WGPUProcComputePassEncoderSetPipeline : Type
WGPUProcComputePassEncoderSetPipeline = Ptr (WGPUComputePassEncoder -> WGPUComputePipeline -> ())

WGPUProcComputePassEncoderAddRef : Type
WGPUProcComputePassEncoderAddRef = Ptr (WGPUComputePassEncoder -> ())

WGPUProcComputePassEncoderRelease : Type
WGPUProcComputePassEncoderRelease = Ptr (WGPUComputePassEncoder -> ())

WGPUProcComputePipelineGetBindGroupLayout : Type
WGPUProcComputePipelineGetBindGroupLayout = Ptr (WGPUComputePipeline -> U32 -> WGPUBindGroupLayout)

WGPUProcComputePipelineSetLabel : Type
WGPUProcComputePipelineSetLabel = Ptr (WGPUComputePipeline -> WGPUStringView -> ())

WGPUProcComputePipelineAddRef : Type
WGPUProcComputePipelineAddRef = Ptr (WGPUComputePipeline -> ())

WGPUProcComputePipelineRelease : Type
WGPUProcComputePipelineRelease = Ptr (WGPUComputePipeline -> ())

WGPUProcDeviceCreateBindGroup : Type
WGPUProcDeviceCreateBindGroup = Ptr (WGPUDevice -> Ptr (WGPUBindGroupDescriptor) -> WGPUBindGroup)

WGPUProcDeviceCreateBindGroupLayout : Type
WGPUProcDeviceCreateBindGroupLayout = Ptr (WGPUDevice -> Ptr (WGPUBindGroupLayoutDescriptor) -> WGPUBindGroupLayout)

WGPUProcDeviceCreateBuffer : Type
WGPUProcDeviceCreateBuffer = Ptr (WGPUDevice -> Ptr (WGPUBufferDescriptor) -> WGPUBuffer)

WGPUProcDeviceCreateCommandEncoder : Type
WGPUProcDeviceCreateCommandEncoder = Ptr (WGPUDevice -> Ptr (WGPUCommandEncoderDescriptor) -> WGPUCommandEncoder)

WGPUProcDeviceCreateComputePipeline : Type
WGPUProcDeviceCreateComputePipeline = Ptr (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUComputePipeline)

WGPUProcDeviceCreateComputePipelineAsync : Type
WGPUProcDeviceCreateComputePipelineAsync = Ptr (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUCreateComputePipelineAsyncCallbackInfo -> WGPUFuture)

WGPUProcDeviceCreatePipelineLayout : Type
WGPUProcDeviceCreatePipelineLayout = Ptr (WGPUDevice -> Ptr (WGPUPipelineLayoutDescriptor) -> WGPUPipelineLayout)

WGPUProcDeviceCreateQuerySet : Type
WGPUProcDeviceCreateQuerySet = Ptr (WGPUDevice -> Ptr (WGPUQuerySetDescriptor) -> WGPUQuerySet)

WGPUProcDeviceCreateRenderBundleEncoder : Type
WGPUProcDeviceCreateRenderBundleEncoder = Ptr (WGPUDevice -> Ptr (WGPURenderBundleEncoderDescriptor) -> WGPURenderBundleEncoder)

WGPUProcDeviceCreateRenderPipeline : Type
WGPUProcDeviceCreateRenderPipeline = Ptr (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPURenderPipeline)

WGPUProcDeviceCreateRenderPipelineAsync : Type
WGPUProcDeviceCreateRenderPipelineAsync = Ptr (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPUCreateRenderPipelineAsyncCallbackInfo -> WGPUFuture)

WGPUProcDeviceCreateSampler : Type
WGPUProcDeviceCreateSampler = Ptr (WGPUDevice -> Ptr (WGPUSamplerDescriptor) -> WGPUSampler)

WGPUProcDeviceCreateShaderModule : Type
WGPUProcDeviceCreateShaderModule = Ptr (WGPUDevice -> Ptr (WGPUShaderModuleDescriptor) -> WGPUShaderModule)

WGPUProcDeviceCreateTexture : Type
WGPUProcDeviceCreateTexture = Ptr (WGPUDevice -> Ptr (WGPUTextureDescriptor) -> WGPUTexture)

WGPUProcDeviceDestroy : Type
WGPUProcDeviceDestroy = Ptr (WGPUDevice -> ())

WGPUProcDeviceGetAdapterInfo : Type
WGPUProcDeviceGetAdapterInfo = Ptr (WGPUDevice -> WGPUAdapterInfo)

WGPUProcDeviceGetFeatures : Type
WGPUProcDeviceGetFeatures = Ptr (WGPUDevice -> Ptr (WGPUSupportedFeatures) -> ())

WGPUProcDeviceGetLimits : Type
WGPUProcDeviceGetLimits = Ptr (WGPUDevice -> Ptr (WGPULimits) -> WGPUStatus)

WGPUProcDeviceGetLostFuture : Type
WGPUProcDeviceGetLostFuture = Ptr (WGPUDevice -> WGPUFuture)

WGPUProcDeviceGetQueue : Type
WGPUProcDeviceGetQueue = Ptr (WGPUDevice -> WGPUQueue)

WGPUProcDeviceHasFeature : Type
WGPUProcDeviceHasFeature = Ptr (WGPUDevice -> WGPUFeatureName -> WGPUBool)

WGPUProcDevicePopErrorScope : Type
WGPUProcDevicePopErrorScope = Ptr (WGPUDevice -> WGPUPopErrorScopeCallbackInfo -> WGPUFuture)

WGPUProcDevicePushErrorScope : Type
WGPUProcDevicePushErrorScope = Ptr (WGPUDevice -> WGPUErrorFilter -> ())

WGPUProcDeviceSetLabel : Type
WGPUProcDeviceSetLabel = Ptr (WGPUDevice -> WGPUStringView -> ())

WGPUProcDeviceAddRef : Type
WGPUProcDeviceAddRef = Ptr (WGPUDevice -> ())

WGPUProcDeviceRelease : Type
WGPUProcDeviceRelease = Ptr (WGPUDevice -> ())

WGPUProcInstanceCreateSurface : Type
WGPUProcInstanceCreateSurface = Ptr (WGPUInstance -> Ptr (WGPUSurfaceDescriptor) -> WGPUSurface)

WGPUProcInstanceGetWGSLLanguageFeatures : Type
WGPUProcInstanceGetWGSLLanguageFeatures = Ptr (WGPUInstance -> Ptr (WGPUSupportedWGSLLanguageFeatures) -> WGPUStatus)

WGPUProcInstanceHasWGSLLanguageFeature : Type
WGPUProcInstanceHasWGSLLanguageFeature = Ptr (WGPUInstance -> WGPUWGSLLanguageFeatureName -> WGPUBool)

WGPUProcInstanceProcessEvents : Type
WGPUProcInstanceProcessEvents = Ptr (WGPUInstance -> ())

WGPUProcInstanceRequestAdapter : Type
WGPUProcInstanceRequestAdapter = Ptr (WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> WGPURequestAdapterCallbackInfo -> WGPUFuture)

WGPUProcInstanceWaitAny : Type
WGPUProcInstanceWaitAny = Ptr (WGPUInstance -> U64 -> Ptr (WGPUFutureWaitInfo) -> U64 -> WGPUWaitStatus)

WGPUProcInstanceAddRef : Type
WGPUProcInstanceAddRef = Ptr (WGPUInstance -> ())

WGPUProcInstanceRelease : Type
WGPUProcInstanceRelease = Ptr (WGPUInstance -> ())

WGPUProcPipelineLayoutSetLabel : Type
WGPUProcPipelineLayoutSetLabel = Ptr (WGPUPipelineLayout -> WGPUStringView -> ())

WGPUProcPipelineLayoutAddRef : Type
WGPUProcPipelineLayoutAddRef = Ptr (WGPUPipelineLayout -> ())

WGPUProcPipelineLayoutRelease : Type
WGPUProcPipelineLayoutRelease = Ptr (WGPUPipelineLayout -> ())

WGPUProcQuerySetDestroy : Type
WGPUProcQuerySetDestroy = Ptr (WGPUQuerySet -> ())

WGPUProcQuerySetGetCount : Type
WGPUProcQuerySetGetCount = Ptr (WGPUQuerySet -> U32)

WGPUProcQuerySetGetType : Type
WGPUProcQuerySetGetType = Ptr (WGPUQuerySet -> WGPUQueryType)

WGPUProcQuerySetSetLabel : Type
WGPUProcQuerySetSetLabel = Ptr (WGPUQuerySet -> WGPUStringView -> ())

WGPUProcQuerySetAddRef : Type
WGPUProcQuerySetAddRef = Ptr (WGPUQuerySet -> ())

WGPUProcQuerySetRelease : Type
WGPUProcQuerySetRelease = Ptr (WGPUQuerySet -> ())

WGPUProcQueueOnSubmittedWorkDone : Type
WGPUProcQueueOnSubmittedWorkDone = Ptr (WGPUQueue -> WGPUQueueWorkDoneCallbackInfo -> WGPUFuture)

WGPUProcQueueSetLabel : Type
WGPUProcQueueSetLabel = Ptr (WGPUQueue -> WGPUStringView -> ())

WGPUProcQueueSubmit : Type
WGPUProcQueueSubmit = Ptr (WGPUQueue -> U64 -> Ptr (WGPUCommandBuffer) -> ())

WGPUProcQueueWriteBuffer : Type
WGPUProcQueueWriteBuffer = Ptr (WGPUQueue -> WGPUBuffer -> U64 -> Ptr (()) -> U64 -> ())

WGPUProcQueueWriteTexture : Type
WGPUProcQueueWriteTexture = Ptr (WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> U64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> ())

WGPUProcQueueAddRef : Type
WGPUProcQueueAddRef = Ptr (WGPUQueue -> ())

WGPUProcQueueRelease : Type
WGPUProcQueueRelease = Ptr (WGPUQueue -> ())

WGPUProcRenderBundleSetLabel : Type
WGPUProcRenderBundleSetLabel = Ptr (WGPURenderBundle -> WGPUStringView -> ())

WGPUProcRenderBundleAddRef : Type
WGPUProcRenderBundleAddRef = Ptr (WGPURenderBundle -> ())

WGPUProcRenderBundleRelease : Type
WGPUProcRenderBundleRelease = Ptr (WGPURenderBundle -> ())

WGPUProcRenderBundleEncoderDraw : Type
WGPUProcRenderBundleEncoderDraw = Ptr (WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> U32 -> ())

WGPUProcRenderBundleEncoderDrawIndexed : Type
WGPUProcRenderBundleEncoderDrawIndexed = Ptr (WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> ())

WGPUProcRenderBundleEncoderDrawIndexedIndirect : Type
WGPUProcRenderBundleEncoderDrawIndexedIndirect = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> ())

WGPUProcRenderBundleEncoderDrawIndirect : Type
WGPUProcRenderBundleEncoderDrawIndirect = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> ())

WGPUProcRenderBundleEncoderFinish : Type
WGPUProcRenderBundleEncoderFinish = Ptr (WGPURenderBundleEncoder -> Ptr (WGPURenderBundleDescriptor) -> WGPURenderBundle)

WGPUProcRenderBundleEncoderInsertDebugMarker : Type
WGPUProcRenderBundleEncoderInsertDebugMarker = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> ())

WGPUProcRenderBundleEncoderPopDebugGroup : Type
WGPUProcRenderBundleEncoderPopDebugGroup = Ptr (WGPURenderBundleEncoder -> ())

WGPUProcRenderBundleEncoderPushDebugGroup : Type
WGPUProcRenderBundleEncoderPushDebugGroup = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> ())

WGPUProcRenderBundleEncoderSetBindGroup : Type
WGPUProcRenderBundleEncoderSetBindGroup = Ptr (WGPURenderBundleEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ())

WGPUProcRenderBundleEncoderSetIndexBuffer : Type
WGPUProcRenderBundleEncoderSetIndexBuffer = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> ())

WGPUProcRenderBundleEncoderSetLabel : Type
WGPUProcRenderBundleEncoderSetLabel = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> ())

WGPUProcRenderBundleEncoderSetPipeline : Type
WGPUProcRenderBundleEncoderSetPipeline = Ptr (WGPURenderBundleEncoder -> WGPURenderPipeline -> ())

WGPUProcRenderBundleEncoderSetVertexBuffer : Type
WGPUProcRenderBundleEncoderSetVertexBuffer = Ptr (WGPURenderBundleEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> ())

WGPUProcRenderBundleEncoderAddRef : Type
WGPUProcRenderBundleEncoderAddRef = Ptr (WGPURenderBundleEncoder -> ())

WGPUProcRenderBundleEncoderRelease : Type
WGPUProcRenderBundleEncoderRelease = Ptr (WGPURenderBundleEncoder -> ())

WGPUProcRenderPassEncoderBeginOcclusionQuery : Type
WGPUProcRenderPassEncoderBeginOcclusionQuery = Ptr (WGPURenderPassEncoder -> U32 -> ())

WGPUProcRenderPassEncoderDraw : Type
WGPUProcRenderPassEncoderDraw = Ptr (WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> ())

WGPUProcRenderPassEncoderDrawIndexed : Type
WGPUProcRenderPassEncoderDrawIndexed = Ptr (WGPURenderPassEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> ())

WGPUProcRenderPassEncoderDrawIndexedIndirect : Type
WGPUProcRenderPassEncoderDrawIndexedIndirect = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> U64 -> ())

WGPUProcRenderPassEncoderDrawIndirect : Type
WGPUProcRenderPassEncoderDrawIndirect = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> U64 -> ())

WGPUProcRenderPassEncoderEnd : Type
WGPUProcRenderPassEncoderEnd = Ptr (WGPURenderPassEncoder -> ())

WGPUProcRenderPassEncoderEndOcclusionQuery : Type
WGPUProcRenderPassEncoderEndOcclusionQuery = Ptr (WGPURenderPassEncoder -> ())

WGPUProcRenderPassEncoderExecuteBundles : Type
WGPUProcRenderPassEncoderExecuteBundles = Ptr (WGPURenderPassEncoder -> U64 -> Ptr (WGPURenderBundle) -> ())

WGPUProcRenderPassEncoderInsertDebugMarker : Type
WGPUProcRenderPassEncoderInsertDebugMarker = Ptr (WGPURenderPassEncoder -> WGPUStringView -> ())

WGPUProcRenderPassEncoderPopDebugGroup : Type
WGPUProcRenderPassEncoderPopDebugGroup = Ptr (WGPURenderPassEncoder -> ())

WGPUProcRenderPassEncoderPushDebugGroup : Type
WGPUProcRenderPassEncoderPushDebugGroup = Ptr (WGPURenderPassEncoder -> WGPUStringView -> ())

WGPUProcRenderPassEncoderSetBindGroup : Type
WGPUProcRenderPassEncoderSetBindGroup = Ptr (WGPURenderPassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ())

WGPUProcRenderPassEncoderSetBlendConstant : Type
WGPUProcRenderPassEncoderSetBlendConstant = Ptr (WGPURenderPassEncoder -> Ptr (WGPUColor) -> ())

WGPUProcRenderPassEncoderSetIndexBuffer : Type
WGPUProcRenderPassEncoderSetIndexBuffer = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> ())

WGPUProcRenderPassEncoderSetLabel : Type
WGPUProcRenderPassEncoderSetLabel = Ptr (WGPURenderPassEncoder -> WGPUStringView -> ())

WGPUProcRenderPassEncoderSetPipeline : Type
WGPUProcRenderPassEncoderSetPipeline = Ptr (WGPURenderPassEncoder -> WGPURenderPipeline -> ())

WGPUProcRenderPassEncoderSetScissorRect : Type
WGPUProcRenderPassEncoderSetScissorRect = Ptr (WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> ())

WGPUProcRenderPassEncoderSetStencilReference : Type
WGPUProcRenderPassEncoderSetStencilReference = Ptr (WGPURenderPassEncoder -> U32 -> ())

WGPUProcRenderPassEncoderSetVertexBuffer : Type
WGPUProcRenderPassEncoderSetVertexBuffer = Ptr (WGPURenderPassEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> ())

WGPUProcRenderPassEncoderSetViewport : Type
WGPUProcRenderPassEncoderSetViewport = Ptr (WGPURenderPassEncoder -> F32 -> F32 -> F32 -> F32 -> F32 -> F32 -> ())

WGPUProcRenderPassEncoderAddRef : Type
WGPUProcRenderPassEncoderAddRef = Ptr (WGPURenderPassEncoder -> ())

WGPUProcRenderPassEncoderRelease : Type
WGPUProcRenderPassEncoderRelease = Ptr (WGPURenderPassEncoder -> ())

WGPUProcRenderPipelineGetBindGroupLayout : Type
WGPUProcRenderPipelineGetBindGroupLayout = Ptr (WGPURenderPipeline -> U32 -> WGPUBindGroupLayout)

WGPUProcRenderPipelineSetLabel : Type
WGPUProcRenderPipelineSetLabel = Ptr (WGPURenderPipeline -> WGPUStringView -> ())

WGPUProcRenderPipelineAddRef : Type
WGPUProcRenderPipelineAddRef = Ptr (WGPURenderPipeline -> ())

WGPUProcRenderPipelineRelease : Type
WGPUProcRenderPipelineRelease = Ptr (WGPURenderPipeline -> ())

WGPUProcSamplerSetLabel : Type
WGPUProcSamplerSetLabel = Ptr (WGPUSampler -> WGPUStringView -> ())

WGPUProcSamplerAddRef : Type
WGPUProcSamplerAddRef = Ptr (WGPUSampler -> ())

WGPUProcSamplerRelease : Type
WGPUProcSamplerRelease = Ptr (WGPUSampler -> ())

WGPUProcShaderModuleGetCompilationInfo : Type
WGPUProcShaderModuleGetCompilationInfo = Ptr (WGPUShaderModule -> WGPUCompilationInfoCallbackInfo -> WGPUFuture)

WGPUProcShaderModuleSetLabel : Type
WGPUProcShaderModuleSetLabel = Ptr (WGPUShaderModule -> WGPUStringView -> ())

WGPUProcShaderModuleAddRef : Type
WGPUProcShaderModuleAddRef = Ptr (WGPUShaderModule -> ())

WGPUProcShaderModuleRelease : Type
WGPUProcShaderModuleRelease = Ptr (WGPUShaderModule -> ())

WGPUProcSupportedFeaturesFreeMembers : Type
WGPUProcSupportedFeaturesFreeMembers = Ptr (WGPUSupportedFeatures -> ())

WGPUProcSupportedWGSLLanguageFeaturesFreeMembers : Type
WGPUProcSupportedWGSLLanguageFeaturesFreeMembers = Ptr (WGPUSupportedWGSLLanguageFeatures -> ())

WGPUProcSurfaceConfigure : Type
WGPUProcSurfaceConfigure = Ptr (WGPUSurface -> Ptr (WGPUSurfaceConfiguration) -> ())

WGPUProcSurfaceGetCapabilities : Type
WGPUProcSurfaceGetCapabilities = Ptr (WGPUSurface -> WGPUAdapter -> Ptr (WGPUSurfaceCapabilities) -> WGPUStatus)

WGPUProcSurfaceGetCurrentTexture : Type
WGPUProcSurfaceGetCurrentTexture = Ptr (WGPUSurface -> Ptr (WGPUSurfaceTexture) -> ())

WGPUProcSurfacePresent : Type
WGPUProcSurfacePresent = Ptr (WGPUSurface -> WGPUStatus)

WGPUProcSurfaceSetLabel : Type
WGPUProcSurfaceSetLabel = Ptr (WGPUSurface -> WGPUStringView -> ())

WGPUProcSurfaceUnconfigure : Type
WGPUProcSurfaceUnconfigure = Ptr (WGPUSurface -> ())

WGPUProcSurfaceAddRef : Type
WGPUProcSurfaceAddRef = Ptr (WGPUSurface -> ())

WGPUProcSurfaceRelease : Type
WGPUProcSurfaceRelease = Ptr (WGPUSurface -> ())

WGPUProcSurfaceCapabilitiesFreeMembers : Type
WGPUProcSurfaceCapabilitiesFreeMembers = Ptr (WGPUSurfaceCapabilities -> ())

WGPUProcTextureCreateView : Type
WGPUProcTextureCreateView = Ptr (WGPUTexture -> Ptr (WGPUTextureViewDescriptor) -> WGPUTextureView)

WGPUProcTextureDestroy : Type
WGPUProcTextureDestroy = Ptr (WGPUTexture -> ())

WGPUProcTextureGetDepthOrArrayLayers : Type
WGPUProcTextureGetDepthOrArrayLayers = Ptr (WGPUTexture -> U32)

WGPUProcTextureGetDimension : Type
WGPUProcTextureGetDimension = Ptr (WGPUTexture -> WGPUTextureDimension)

WGPUProcTextureGetFormat : Type
WGPUProcTextureGetFormat = Ptr (WGPUTexture -> WGPUTextureFormat)

WGPUProcTextureGetHeight : Type
WGPUProcTextureGetHeight = Ptr (WGPUTexture -> U32)

WGPUProcTextureGetMipLevelCount : Type
WGPUProcTextureGetMipLevelCount = Ptr (WGPUTexture -> U32)

WGPUProcTextureGetSampleCount : Type
WGPUProcTextureGetSampleCount = Ptr (WGPUTexture -> U32)

WGPUProcTextureGetUsage : Type
WGPUProcTextureGetUsage = Ptr (WGPUTexture -> WGPUTextureUsage)

WGPUProcTextureGetWidth : Type
WGPUProcTextureGetWidth = Ptr (WGPUTexture -> U32)

WGPUProcTextureSetLabel : Type
WGPUProcTextureSetLabel = Ptr (WGPUTexture -> WGPUStringView -> ())

WGPUProcTextureAddRef : Type
WGPUProcTextureAddRef = Ptr (WGPUTexture -> ())

WGPUProcTextureRelease : Type
WGPUProcTextureRelease = Ptr (WGPUTexture -> ())

WGPUProcTextureViewSetLabel : Type
WGPUProcTextureViewSetLabel = Ptr (WGPUTextureView -> WGPUStringView -> ())

WGPUProcTextureViewAddRef : Type
WGPUProcTextureViewAddRef = Ptr (WGPUTextureView -> ())

WGPUProcTextureViewRelease : Type
WGPUProcTextureViewRelease = Ptr (WGPUTextureView -> ())

%foreign "C:wgpuCreateInstance,libwgpu_native"
wgpuCreateInstance : Ptr (WGPUInstanceDescriptor) -> WGPUInstance
    

%foreign "C:wgpuGetInstanceCapabilities,libwgpu_native"
wgpuGetInstanceCapabilities : Ptr (WGPUInstanceCapabilities) -> WGPUStatus
    

%foreign "C:wgpuGetProcAddress,libwgpu_native"
wgpuGetProcAddress : WGPUStringView -> WGPUProc
    

%foreign "C:wgpuAdapterGetFeatures,libwgpu_native"
wgpuAdapterGetFeatures : WGPUAdapter -> Ptr (WGPUSupportedFeatures) -> ()
    

%foreign "C:wgpuAdapterGetInfo,libwgpu_native"
wgpuAdapterGetInfo : WGPUAdapter -> Ptr (WGPUAdapterInfo) -> WGPUStatus
    

%foreign "C:wgpuAdapterGetLimits,libwgpu_native"
wgpuAdapterGetLimits : WGPUAdapter -> Ptr (WGPULimits) -> WGPUStatus
    

%foreign "C:wgpuAdapterHasFeature,libwgpu_native"
wgpuAdapterHasFeature : WGPUAdapter -> WGPUFeatureName -> WGPUBool
    

%foreign "C:wgpuAdapterRequestDevice,libwgpu_native"
wgpuAdapterRequestDevice : WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> WGPURequestDeviceCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuAdapterAddRef,libwgpu_native"
wgpuAdapterAddRef : WGPUAdapter -> ()
    

%foreign "C:wgpuAdapterRelease,libwgpu_native"
wgpuAdapterRelease : WGPUAdapter -> ()
    

%foreign "C:wgpuAdapterInfoFreeMembers,libwgpu_native"
wgpuAdapterInfoFreeMembers : WGPUAdapterInfo -> ()
    

%foreign "C:wgpuBindGroupSetLabel,libwgpu_native"
wgpuBindGroupSetLabel : WGPUBindGroup -> WGPUStringView -> ()
    

%foreign "C:wgpuBindGroupAddRef,libwgpu_native"
wgpuBindGroupAddRef : WGPUBindGroup -> ()
    

%foreign "C:wgpuBindGroupRelease,libwgpu_native"
wgpuBindGroupRelease : WGPUBindGroup -> ()
    

%foreign "C:wgpuBindGroupLayoutSetLabel,libwgpu_native"
wgpuBindGroupLayoutSetLabel : WGPUBindGroupLayout -> WGPUStringView -> ()
    

%foreign "C:wgpuBindGroupLayoutAddRef,libwgpu_native"
wgpuBindGroupLayoutAddRef : WGPUBindGroupLayout -> ()
    

%foreign "C:wgpuBindGroupLayoutRelease,libwgpu_native"
wgpuBindGroupLayoutRelease : WGPUBindGroupLayout -> ()
    

%foreign "C:wgpuBufferDestroy,libwgpu_native"
wgpuBufferDestroy : WGPUBuffer -> ()
    

%foreign "C:wgpuBufferGetConstMappedRange,libwgpu_native"
wgpuBufferGetConstMappedRange : WGPUBuffer -> U64 -> U64 -> Ptr (())
    

%foreign "C:wgpuBufferGetMapState,libwgpu_native"
wgpuBufferGetMapState : WGPUBuffer -> WGPUBufferMapState
    

%foreign "C:wgpuBufferGetMappedRange,libwgpu_native"
wgpuBufferGetMappedRange : WGPUBuffer -> U64 -> U64 -> Ptr (())
    

%foreign "C:wgpuBufferGetSize,libwgpu_native"
wgpuBufferGetSize : WGPUBuffer -> U64
    

%foreign "C:wgpuBufferGetUsage,libwgpu_native"
wgpuBufferGetUsage : WGPUBuffer -> WGPUBufferUsage
    

%foreign "C:wgpuBufferMapAsync,libwgpu_native"
wgpuBufferMapAsync : WGPUBuffer -> WGPUMapMode -> U64 -> U64 -> WGPUBufferMapCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuBufferSetLabel,libwgpu_native"
wgpuBufferSetLabel : WGPUBuffer -> WGPUStringView -> ()
    

%foreign "C:wgpuBufferUnmap,libwgpu_native"
wgpuBufferUnmap : WGPUBuffer -> ()
    

%foreign "C:wgpuBufferAddRef,libwgpu_native"
wgpuBufferAddRef : WGPUBuffer -> ()
    

%foreign "C:wgpuBufferRelease,libwgpu_native"
wgpuBufferRelease : WGPUBuffer -> ()
    

%foreign "C:wgpuCommandBufferSetLabel,libwgpu_native"
wgpuCommandBufferSetLabel : WGPUCommandBuffer -> WGPUStringView -> ()
    

%foreign "C:wgpuCommandBufferAddRef,libwgpu_native"
wgpuCommandBufferAddRef : WGPUCommandBuffer -> ()
    

%foreign "C:wgpuCommandBufferRelease,libwgpu_native"
wgpuCommandBufferRelease : WGPUCommandBuffer -> ()
    

%foreign "C:wgpuCommandEncoderBeginComputePass,libwgpu_native"
wgpuCommandEncoderBeginComputePass : WGPUCommandEncoder -> Ptr (WGPUComputePassDescriptor) -> WGPUComputePassEncoder
    

%foreign "C:wgpuCommandEncoderBeginRenderPass,libwgpu_native"
wgpuCommandEncoderBeginRenderPass : WGPUCommandEncoder -> Ptr (WGPURenderPassDescriptor) -> WGPURenderPassEncoder
    

%foreign "C:wgpuCommandEncoderClearBuffer,libwgpu_native"
wgpuCommandEncoderClearBuffer : WGPUCommandEncoder -> WGPUBuffer -> U64 -> U64 -> ()
    

%foreign "C:wgpuCommandEncoderCopyBufferToBuffer,libwgpu_native"
wgpuCommandEncoderCopyBufferToBuffer : WGPUCommandEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U64 -> ()
    

%foreign "C:wgpuCommandEncoderCopyBufferToTexture,libwgpu_native"
wgpuCommandEncoderCopyBufferToTexture : WGPUCommandEncoder -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> ()
    

%foreign "C:wgpuCommandEncoderCopyTextureToBuffer,libwgpu_native"
wgpuCommandEncoderCopyTextureToBuffer : WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUExtent3D) -> ()
    

%foreign "C:wgpuCommandEncoderCopyTextureToTexture,libwgpu_native"
wgpuCommandEncoderCopyTextureToTexture : WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> ()
    

%foreign "C:wgpuCommandEncoderFinish,libwgpu_native"
wgpuCommandEncoderFinish : WGPUCommandEncoder -> Ptr (WGPUCommandBufferDescriptor) -> WGPUCommandBuffer
    

%foreign "C:wgpuCommandEncoderInsertDebugMarker,libwgpu_native"
wgpuCommandEncoderInsertDebugMarker : WGPUCommandEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuCommandEncoderPopDebugGroup,libwgpu_native"
wgpuCommandEncoderPopDebugGroup : WGPUCommandEncoder -> ()
    

%foreign "C:wgpuCommandEncoderPushDebugGroup,libwgpu_native"
wgpuCommandEncoderPushDebugGroup : WGPUCommandEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuCommandEncoderResolveQuerySet,libwgpu_native"
wgpuCommandEncoderResolveQuerySet : WGPUCommandEncoder -> WGPUQuerySet -> U32 -> U32 -> WGPUBuffer -> U64 -> ()
    

%foreign "C:wgpuCommandEncoderSetLabel,libwgpu_native"
wgpuCommandEncoderSetLabel : WGPUCommandEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuCommandEncoderWriteTimestamp,libwgpu_native"
wgpuCommandEncoderWriteTimestamp : WGPUCommandEncoder -> WGPUQuerySet -> U32 -> ()
    

%foreign "C:wgpuCommandEncoderAddRef,libwgpu_native"
wgpuCommandEncoderAddRef : WGPUCommandEncoder -> ()
    

%foreign "C:wgpuCommandEncoderRelease,libwgpu_native"
wgpuCommandEncoderRelease : WGPUCommandEncoder -> ()
    

%foreign "C:wgpuComputePassEncoderDispatchWorkgroups,libwgpu_native"
wgpuComputePassEncoderDispatchWorkgroups : WGPUComputePassEncoder -> U32 -> U32 -> U32 -> ()
    

%foreign "C:wgpuComputePassEncoderDispatchWorkgroupsIndirect,libwgpu_native"
wgpuComputePassEncoderDispatchWorkgroupsIndirect : WGPUComputePassEncoder -> WGPUBuffer -> U64 -> ()
    

%foreign "C:wgpuComputePassEncoderEnd,libwgpu_native"
wgpuComputePassEncoderEnd : WGPUComputePassEncoder -> ()
    

%foreign "C:wgpuComputePassEncoderInsertDebugMarker,libwgpu_native"
wgpuComputePassEncoderInsertDebugMarker : WGPUComputePassEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuComputePassEncoderPopDebugGroup,libwgpu_native"
wgpuComputePassEncoderPopDebugGroup : WGPUComputePassEncoder -> ()
    

%foreign "C:wgpuComputePassEncoderPushDebugGroup,libwgpu_native"
wgpuComputePassEncoderPushDebugGroup : WGPUComputePassEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuComputePassEncoderSetBindGroup,libwgpu_native"
wgpuComputePassEncoderSetBindGroup : WGPUComputePassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ()
    

%foreign "C:wgpuComputePassEncoderSetLabel,libwgpu_native"
wgpuComputePassEncoderSetLabel : WGPUComputePassEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuComputePassEncoderSetPipeline,libwgpu_native"
wgpuComputePassEncoderSetPipeline : WGPUComputePassEncoder -> WGPUComputePipeline -> ()
    

%foreign "C:wgpuComputePassEncoderAddRef,libwgpu_native"
wgpuComputePassEncoderAddRef : WGPUComputePassEncoder -> ()
    

%foreign "C:wgpuComputePassEncoderRelease,libwgpu_native"
wgpuComputePassEncoderRelease : WGPUComputePassEncoder -> ()
    

%foreign "C:wgpuComputePipelineGetBindGroupLayout,libwgpu_native"
wgpuComputePipelineGetBindGroupLayout : WGPUComputePipeline -> U32 -> WGPUBindGroupLayout
    

%foreign "C:wgpuComputePipelineSetLabel,libwgpu_native"
wgpuComputePipelineSetLabel : WGPUComputePipeline -> WGPUStringView -> ()
    

%foreign "C:wgpuComputePipelineAddRef,libwgpu_native"
wgpuComputePipelineAddRef : WGPUComputePipeline -> ()
    

%foreign "C:wgpuComputePipelineRelease,libwgpu_native"
wgpuComputePipelineRelease : WGPUComputePipeline -> ()
    

%foreign "C:wgpuDeviceCreateBindGroup,libwgpu_native"
wgpuDeviceCreateBindGroup : WGPUDevice -> Ptr (WGPUBindGroupDescriptor) -> WGPUBindGroup
    

%foreign "C:wgpuDeviceCreateBindGroupLayout,libwgpu_native"
wgpuDeviceCreateBindGroupLayout : WGPUDevice -> Ptr (WGPUBindGroupLayoutDescriptor) -> WGPUBindGroupLayout
    

%foreign "C:wgpuDeviceCreateBuffer,libwgpu_native"
wgpuDeviceCreateBuffer : WGPUDevice -> Ptr (WGPUBufferDescriptor) -> WGPUBuffer
    

%foreign "C:wgpuDeviceCreateCommandEncoder,libwgpu_native"
wgpuDeviceCreateCommandEncoder : WGPUDevice -> Ptr (WGPUCommandEncoderDescriptor) -> WGPUCommandEncoder
    

%foreign "C:wgpuDeviceCreateComputePipeline,libwgpu_native"
wgpuDeviceCreateComputePipeline : WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUComputePipeline
    

%foreign "C:wgpuDeviceCreateComputePipelineAsync,libwgpu_native"
wgpuDeviceCreateComputePipelineAsync : WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUCreateComputePipelineAsyncCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuDeviceCreatePipelineLayout,libwgpu_native"
wgpuDeviceCreatePipelineLayout : WGPUDevice -> Ptr (WGPUPipelineLayoutDescriptor) -> WGPUPipelineLayout
    

%foreign "C:wgpuDeviceCreateQuerySet,libwgpu_native"
wgpuDeviceCreateQuerySet : WGPUDevice -> Ptr (WGPUQuerySetDescriptor) -> WGPUQuerySet
    

%foreign "C:wgpuDeviceCreateRenderBundleEncoder,libwgpu_native"
wgpuDeviceCreateRenderBundleEncoder : WGPUDevice -> Ptr (WGPURenderBundleEncoderDescriptor) -> WGPURenderBundleEncoder
    

%foreign "C:wgpuDeviceCreateRenderPipeline,libwgpu_native"
wgpuDeviceCreateRenderPipeline : WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPURenderPipeline
    

%foreign "C:wgpuDeviceCreateRenderPipelineAsync,libwgpu_native"
wgpuDeviceCreateRenderPipelineAsync : WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPUCreateRenderPipelineAsyncCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuDeviceCreateSampler,libwgpu_native"
wgpuDeviceCreateSampler : WGPUDevice -> Ptr (WGPUSamplerDescriptor) -> WGPUSampler
    

%foreign "C:wgpuDeviceCreateShaderModule,libwgpu_native"
wgpuDeviceCreateShaderModule : WGPUDevice -> Ptr (WGPUShaderModuleDescriptor) -> WGPUShaderModule
    

%foreign "C:wgpuDeviceCreateTexture,libwgpu_native"
wgpuDeviceCreateTexture : WGPUDevice -> Ptr (WGPUTextureDescriptor) -> WGPUTexture
    

%foreign "C:wgpuDeviceDestroy,libwgpu_native"
wgpuDeviceDestroy : WGPUDevice -> ()
    

%foreign "C:wgpuDeviceGetAdapterInfo,libwgpu_native"
wgpuDeviceGetAdapterInfo : WGPUDevice -> WGPUAdapterInfo
    

%foreign "C:wgpuDeviceGetFeatures,libwgpu_native"
wgpuDeviceGetFeatures : WGPUDevice -> Ptr (WGPUSupportedFeatures) -> ()
    

%foreign "C:wgpuDeviceGetLimits,libwgpu_native"
wgpuDeviceGetLimits : WGPUDevice -> Ptr (WGPULimits) -> WGPUStatus
    

%foreign "C:wgpuDeviceGetLostFuture,libwgpu_native"
wgpuDeviceGetLostFuture : WGPUDevice -> WGPUFuture
    

%foreign "C:wgpuDeviceGetQueue,libwgpu_native"
wgpuDeviceGetQueue : WGPUDevice -> WGPUQueue
    

%foreign "C:wgpuDeviceHasFeature,libwgpu_native"
wgpuDeviceHasFeature : WGPUDevice -> WGPUFeatureName -> WGPUBool
    

%foreign "C:wgpuDevicePopErrorScope,libwgpu_native"
wgpuDevicePopErrorScope : WGPUDevice -> WGPUPopErrorScopeCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuDevicePushErrorScope,libwgpu_native"
wgpuDevicePushErrorScope : WGPUDevice -> WGPUErrorFilter -> ()
    

%foreign "C:wgpuDeviceSetLabel,libwgpu_native"
wgpuDeviceSetLabel : WGPUDevice -> WGPUStringView -> ()
    

%foreign "C:wgpuDeviceAddRef,libwgpu_native"
wgpuDeviceAddRef : WGPUDevice -> ()
    

%foreign "C:wgpuDeviceRelease,libwgpu_native"
wgpuDeviceRelease : WGPUDevice -> ()
    

%foreign "C:wgpuInstanceCreateSurface,libwgpu_native"
wgpuInstanceCreateSurface : WGPUInstance -> Ptr (WGPUSurfaceDescriptor) -> WGPUSurface
    

%foreign "C:wgpuInstanceGetWGSLLanguageFeatures,libwgpu_native"
wgpuInstanceGetWGSLLanguageFeatures : WGPUInstance -> Ptr (WGPUSupportedWGSLLanguageFeatures) -> WGPUStatus
    

%foreign "C:wgpuInstanceHasWGSLLanguageFeature,libwgpu_native"
wgpuInstanceHasWGSLLanguageFeature : WGPUInstance -> WGPUWGSLLanguageFeatureName -> WGPUBool
    

%foreign "C:wgpuInstanceProcessEvents,libwgpu_native"
wgpuInstanceProcessEvents : WGPUInstance -> ()
    

%foreign "C:wgpuInstanceRequestAdapter,libwgpu_native"
wgpuInstanceRequestAdapter : WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> WGPURequestAdapterCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuInstanceWaitAny,libwgpu_native"
wgpuInstanceWaitAny : WGPUInstance -> U64 -> Ptr (WGPUFutureWaitInfo) -> U64 -> WGPUWaitStatus
    

%foreign "C:wgpuInstanceAddRef,libwgpu_native"
wgpuInstanceAddRef : WGPUInstance -> ()
    

%foreign "C:wgpuInstanceRelease,libwgpu_native"
wgpuInstanceRelease : WGPUInstance -> ()
    

%foreign "C:wgpuPipelineLayoutSetLabel,libwgpu_native"
wgpuPipelineLayoutSetLabel : WGPUPipelineLayout -> WGPUStringView -> ()
    

%foreign "C:wgpuPipelineLayoutAddRef,libwgpu_native"
wgpuPipelineLayoutAddRef : WGPUPipelineLayout -> ()
    

%foreign "C:wgpuPipelineLayoutRelease,libwgpu_native"
wgpuPipelineLayoutRelease : WGPUPipelineLayout -> ()
    

%foreign "C:wgpuQuerySetDestroy,libwgpu_native"
wgpuQuerySetDestroy : WGPUQuerySet -> ()
    

%foreign "C:wgpuQuerySetGetCount,libwgpu_native"
wgpuQuerySetGetCount : WGPUQuerySet -> U32
    

%foreign "C:wgpuQuerySetGetType,libwgpu_native"
wgpuQuerySetGetType : WGPUQuerySet -> WGPUQueryType
    

%foreign "C:wgpuQuerySetSetLabel,libwgpu_native"
wgpuQuerySetSetLabel : WGPUQuerySet -> WGPUStringView -> ()
    

%foreign "C:wgpuQuerySetAddRef,libwgpu_native"
wgpuQuerySetAddRef : WGPUQuerySet -> ()
    

%foreign "C:wgpuQuerySetRelease,libwgpu_native"
wgpuQuerySetRelease : WGPUQuerySet -> ()
    

%foreign "C:wgpuQueueOnSubmittedWorkDone,libwgpu_native"
wgpuQueueOnSubmittedWorkDone : WGPUQueue -> WGPUQueueWorkDoneCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuQueueSetLabel,libwgpu_native"
wgpuQueueSetLabel : WGPUQueue -> WGPUStringView -> ()
    

%foreign "C:wgpuQueueSubmit,libwgpu_native"
wgpuQueueSubmit : WGPUQueue -> U64 -> Ptr (WGPUCommandBuffer) -> ()
    

%foreign "C:wgpuQueueWriteBuffer,libwgpu_native"
wgpuQueueWriteBuffer : WGPUQueue -> WGPUBuffer -> U64 -> Ptr (()) -> U64 -> ()
    

%foreign "C:wgpuQueueWriteTexture,libwgpu_native"
wgpuQueueWriteTexture : WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> U64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> ()
    

%foreign "C:wgpuQueueAddRef,libwgpu_native"
wgpuQueueAddRef : WGPUQueue -> ()
    

%foreign "C:wgpuQueueRelease,libwgpu_native"
wgpuQueueRelease : WGPUQueue -> ()
    

%foreign "C:wgpuRenderBundleSetLabel,libwgpu_native"
wgpuRenderBundleSetLabel : WGPURenderBundle -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderBundleAddRef,libwgpu_native"
wgpuRenderBundleAddRef : WGPURenderBundle -> ()
    

%foreign "C:wgpuRenderBundleRelease,libwgpu_native"
wgpuRenderBundleRelease : WGPURenderBundle -> ()
    

%foreign "C:wgpuRenderBundleEncoderDraw,libwgpu_native"
wgpuRenderBundleEncoderDraw : WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> U32 -> ()
    

%foreign "C:wgpuRenderBundleEncoderDrawIndexed,libwgpu_native"
wgpuRenderBundleEncoderDrawIndexed : WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> ()
    

%foreign "C:wgpuRenderBundleEncoderDrawIndexedIndirect,libwgpu_native"
wgpuRenderBundleEncoderDrawIndexedIndirect : WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> ()
    

%foreign "C:wgpuRenderBundleEncoderDrawIndirect,libwgpu_native"
wgpuRenderBundleEncoderDrawIndirect : WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> ()
    

%foreign "C:wgpuRenderBundleEncoderFinish,libwgpu_native"
wgpuRenderBundleEncoderFinish : WGPURenderBundleEncoder -> Ptr (WGPURenderBundleDescriptor) -> WGPURenderBundle
    

%foreign "C:wgpuRenderBundleEncoderInsertDebugMarker,libwgpu_native"
wgpuRenderBundleEncoderInsertDebugMarker : WGPURenderBundleEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderBundleEncoderPopDebugGroup,libwgpu_native"
wgpuRenderBundleEncoderPopDebugGroup : WGPURenderBundleEncoder -> ()
    

%foreign "C:wgpuRenderBundleEncoderPushDebugGroup,libwgpu_native"
wgpuRenderBundleEncoderPushDebugGroup : WGPURenderBundleEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderBundleEncoderSetBindGroup,libwgpu_native"
wgpuRenderBundleEncoderSetBindGroup : WGPURenderBundleEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ()
    

%foreign "C:wgpuRenderBundleEncoderSetIndexBuffer,libwgpu_native"
wgpuRenderBundleEncoderSetIndexBuffer : WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> ()
    

%foreign "C:wgpuRenderBundleEncoderSetLabel,libwgpu_native"
wgpuRenderBundleEncoderSetLabel : WGPURenderBundleEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderBundleEncoderSetPipeline,libwgpu_native"
wgpuRenderBundleEncoderSetPipeline : WGPURenderBundleEncoder -> WGPURenderPipeline -> ()
    

%foreign "C:wgpuRenderBundleEncoderSetVertexBuffer,libwgpu_native"
wgpuRenderBundleEncoderSetVertexBuffer : WGPURenderBundleEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> ()
    

%foreign "C:wgpuRenderBundleEncoderAddRef,libwgpu_native"
wgpuRenderBundleEncoderAddRef : WGPURenderBundleEncoder -> ()
    

%foreign "C:wgpuRenderBundleEncoderRelease,libwgpu_native"
wgpuRenderBundleEncoderRelease : WGPURenderBundleEncoder -> ()
    

%foreign "C:wgpuRenderPassEncoderBeginOcclusionQuery,libwgpu_native"
wgpuRenderPassEncoderBeginOcclusionQuery : WGPURenderPassEncoder -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderDraw,libwgpu_native"
wgpuRenderPassEncoderDraw : WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderDrawIndexed,libwgpu_native"
wgpuRenderPassEncoderDrawIndexed : WGPURenderPassEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderDrawIndexedIndirect,libwgpu_native"
wgpuRenderPassEncoderDrawIndexedIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> ()
    

%foreign "C:wgpuRenderPassEncoderDrawIndirect,libwgpu_native"
wgpuRenderPassEncoderDrawIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> ()
    

%foreign "C:wgpuRenderPassEncoderEnd,libwgpu_native"
wgpuRenderPassEncoderEnd : WGPURenderPassEncoder -> ()
    

%foreign "C:wgpuRenderPassEncoderEndOcclusionQuery,libwgpu_native"
wgpuRenderPassEncoderEndOcclusionQuery : WGPURenderPassEncoder -> ()
    

%foreign "C:wgpuRenderPassEncoderExecuteBundles,libwgpu_native"
wgpuRenderPassEncoderExecuteBundles : WGPURenderPassEncoder -> U64 -> Ptr (WGPURenderBundle) -> ()
    

%foreign "C:wgpuRenderPassEncoderInsertDebugMarker,libwgpu_native"
wgpuRenderPassEncoderInsertDebugMarker : WGPURenderPassEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderPassEncoderPopDebugGroup,libwgpu_native"
wgpuRenderPassEncoderPopDebugGroup : WGPURenderPassEncoder -> ()
    

%foreign "C:wgpuRenderPassEncoderPushDebugGroup,libwgpu_native"
wgpuRenderPassEncoderPushDebugGroup : WGPURenderPassEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderPassEncoderSetBindGroup,libwgpu_native"
wgpuRenderPassEncoderSetBindGroup : WGPURenderPassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ()
    

%foreign "C:wgpuRenderPassEncoderSetBlendConstant,libwgpu_native"
wgpuRenderPassEncoderSetBlendConstant : WGPURenderPassEncoder -> Ptr (WGPUColor) -> ()
    

%foreign "C:wgpuRenderPassEncoderSetIndexBuffer,libwgpu_native"
wgpuRenderPassEncoderSetIndexBuffer : WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> ()
    

%foreign "C:wgpuRenderPassEncoderSetLabel,libwgpu_native"
wgpuRenderPassEncoderSetLabel : WGPURenderPassEncoder -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderPassEncoderSetPipeline,libwgpu_native"
wgpuRenderPassEncoderSetPipeline : WGPURenderPassEncoder -> WGPURenderPipeline -> ()
    

%foreign "C:wgpuRenderPassEncoderSetScissorRect,libwgpu_native"
wgpuRenderPassEncoderSetScissorRect : WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderSetStencilReference,libwgpu_native"
wgpuRenderPassEncoderSetStencilReference : WGPURenderPassEncoder -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderSetVertexBuffer,libwgpu_native"
wgpuRenderPassEncoderSetVertexBuffer : WGPURenderPassEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> ()
    

%foreign "C:wgpuRenderPassEncoderSetViewport,libwgpu_native"
wgpuRenderPassEncoderSetViewport : WGPURenderPassEncoder -> F32 -> F32 -> F32 -> F32 -> F32 -> F32 -> ()
    

%foreign "C:wgpuRenderPassEncoderAddRef,libwgpu_native"
wgpuRenderPassEncoderAddRef : WGPURenderPassEncoder -> ()
    

%foreign "C:wgpuRenderPassEncoderRelease,libwgpu_native"
wgpuRenderPassEncoderRelease : WGPURenderPassEncoder -> ()
    

%foreign "C:wgpuRenderPipelineGetBindGroupLayout,libwgpu_native"
wgpuRenderPipelineGetBindGroupLayout : WGPURenderPipeline -> U32 -> WGPUBindGroupLayout
    

%foreign "C:wgpuRenderPipelineSetLabel,libwgpu_native"
wgpuRenderPipelineSetLabel : WGPURenderPipeline -> WGPUStringView -> ()
    

%foreign "C:wgpuRenderPipelineAddRef,libwgpu_native"
wgpuRenderPipelineAddRef : WGPURenderPipeline -> ()
    

%foreign "C:wgpuRenderPipelineRelease,libwgpu_native"
wgpuRenderPipelineRelease : WGPURenderPipeline -> ()
    

%foreign "C:wgpuSamplerSetLabel,libwgpu_native"
wgpuSamplerSetLabel : WGPUSampler -> WGPUStringView -> ()
    

%foreign "C:wgpuSamplerAddRef,libwgpu_native"
wgpuSamplerAddRef : WGPUSampler -> ()
    

%foreign "C:wgpuSamplerRelease,libwgpu_native"
wgpuSamplerRelease : WGPUSampler -> ()
    

%foreign "C:wgpuShaderModuleGetCompilationInfo,libwgpu_native"
wgpuShaderModuleGetCompilationInfo : WGPUShaderModule -> WGPUCompilationInfoCallbackInfo -> WGPUFuture
    

%foreign "C:wgpuShaderModuleSetLabel,libwgpu_native"
wgpuShaderModuleSetLabel : WGPUShaderModule -> WGPUStringView -> ()
    

%foreign "C:wgpuShaderModuleAddRef,libwgpu_native"
wgpuShaderModuleAddRef : WGPUShaderModule -> ()
    

%foreign "C:wgpuShaderModuleRelease,libwgpu_native"
wgpuShaderModuleRelease : WGPUShaderModule -> ()
    

%foreign "C:wgpuSupportedFeaturesFreeMembers,libwgpu_native"
wgpuSupportedFeaturesFreeMembers : WGPUSupportedFeatures -> ()
    

%foreign "C:wgpuSupportedWGSLLanguageFeaturesFreeMembers,libwgpu_native"
wgpuSupportedWGSLLanguageFeaturesFreeMembers : WGPUSupportedWGSLLanguageFeatures -> ()
    

%foreign "C:wgpuSurfaceConfigure,libwgpu_native"
wgpuSurfaceConfigure : WGPUSurface -> Ptr (WGPUSurfaceConfiguration) -> ()
    

%foreign "C:wgpuSurfaceGetCapabilities,libwgpu_native"
wgpuSurfaceGetCapabilities : WGPUSurface -> WGPUAdapter -> Ptr (WGPUSurfaceCapabilities) -> WGPUStatus
    

%foreign "C:wgpuSurfaceGetCurrentTexture,libwgpu_native"
wgpuSurfaceGetCurrentTexture : WGPUSurface -> Ptr (WGPUSurfaceTexture) -> ()
    

%foreign "C:wgpuSurfacePresent,libwgpu_native"
wgpuSurfacePresent : WGPUSurface -> WGPUStatus
    

%foreign "C:wgpuSurfaceSetLabel,libwgpu_native"
wgpuSurfaceSetLabel : WGPUSurface -> WGPUStringView -> ()
    

%foreign "C:wgpuSurfaceUnconfigure,libwgpu_native"
wgpuSurfaceUnconfigure : WGPUSurface -> ()
    

%foreign "C:wgpuSurfaceAddRef,libwgpu_native"
wgpuSurfaceAddRef : WGPUSurface -> ()
    

%foreign "C:wgpuSurfaceRelease,libwgpu_native"
wgpuSurfaceRelease : WGPUSurface -> ()
    

%foreign "C:wgpuSurfaceCapabilitiesFreeMembers,libwgpu_native"
wgpuSurfaceCapabilitiesFreeMembers : WGPUSurfaceCapabilities -> ()
    

%foreign "C:wgpuTextureCreateView,libwgpu_native"
wgpuTextureCreateView : WGPUTexture -> Ptr (WGPUTextureViewDescriptor) -> WGPUTextureView
    

%foreign "C:wgpuTextureDestroy,libwgpu_native"
wgpuTextureDestroy : WGPUTexture -> ()
    

%foreign "C:wgpuTextureGetDepthOrArrayLayers,libwgpu_native"
wgpuTextureGetDepthOrArrayLayers : WGPUTexture -> U32
    

%foreign "C:wgpuTextureGetDimension,libwgpu_native"
wgpuTextureGetDimension : WGPUTexture -> WGPUTextureDimension
    

%foreign "C:wgpuTextureGetFormat,libwgpu_native"
wgpuTextureGetFormat : WGPUTexture -> WGPUTextureFormat
    

%foreign "C:wgpuTextureGetHeight,libwgpu_native"
wgpuTextureGetHeight : WGPUTexture -> U32
    

%foreign "C:wgpuTextureGetMipLevelCount,libwgpu_native"
wgpuTextureGetMipLevelCount : WGPUTexture -> U32
    

%foreign "C:wgpuTextureGetSampleCount,libwgpu_native"
wgpuTextureGetSampleCount : WGPUTexture -> U32
    

%foreign "C:wgpuTextureGetUsage,libwgpu_native"
wgpuTextureGetUsage : WGPUTexture -> WGPUTextureUsage
    

%foreign "C:wgpuTextureGetWidth,libwgpu_native"
wgpuTextureGetWidth : WGPUTexture -> U32
    

%foreign "C:wgpuTextureSetLabel,libwgpu_native"
wgpuTextureSetLabel : WGPUTexture -> WGPUStringView -> ()
    

%foreign "C:wgpuTextureAddRef,libwgpu_native"
wgpuTextureAddRef : WGPUTexture -> ()
    

%foreign "C:wgpuTextureRelease,libwgpu_native"
wgpuTextureRelease : WGPUTexture -> ()
    

%foreign "C:wgpuTextureViewSetLabel,libwgpu_native"
wgpuTextureViewSetLabel : WGPUTextureView -> WGPUStringView -> ()
    

%foreign "C:wgpuTextureViewAddRef,libwgpu_native"
wgpuTextureViewAddRef : WGPUTextureView -> ()
    

%foreign "C:wgpuTextureViewRelease,libwgpu_native"
wgpuTextureViewRelease : WGPUTextureView -> ()
    

WGPUNativeSType : Type
WGPUNativeSType = Enum

WGPUSType_DeviceExtras : WGPUNativeSType
WGPUSType_DeviceExtras = 0x00030001

WGPUSType_NativeLimits : WGPUNativeSType
WGPUSType_NativeLimits = 0x00030002

WGPUSType_PipelineLayoutExtras : WGPUNativeSType
WGPUSType_PipelineLayoutExtras = 0x00030003

WGPUSType_ShaderSourceGLSL : WGPUNativeSType
WGPUSType_ShaderSourceGLSL = 0x00030004

WGPUSType_InstanceExtras : WGPUNativeSType
WGPUSType_InstanceExtras = 0x00030006

WGPUSType_BindGroupEntryExtras : WGPUNativeSType
WGPUSType_BindGroupEntryExtras = 0x00030007

WGPUSType_BindGroupLayoutEntryExtras : WGPUNativeSType
WGPUSType_BindGroupLayoutEntryExtras = 0x00030008

WGPUSType_QuerySetDescriptorExtras : WGPUNativeSType
WGPUSType_QuerySetDescriptorExtras = 0x00030009

WGPUSType_SurfaceConfigurationExtras : WGPUNativeSType
WGPUSType_SurfaceConfigurationExtras = 0x0003000A

WGPUSType_SurfaceSourceSwapChainPanel : WGPUNativeSType
WGPUSType_SurfaceSourceSwapChainPanel = 0x0003000B

WGPUSType_PrimitiveStateExtras : WGPUNativeSType
WGPUSType_PrimitiveStateExtras = 0x0003000C

WGPUNativeSType_Force32 : WGPUNativeSType
WGPUNativeSType_Force32 = 0x7FFFFFFF

WGPUNativeFeature : Type
WGPUNativeFeature = Enum

WGPUNativeFeature_PushConstants : WGPUNativeFeature
WGPUNativeFeature_PushConstants = 0x00030001

WGPUNativeFeature_TextureAdapterSpecificFormatFeatures : WGPUNativeFeature
WGPUNativeFeature_TextureAdapterSpecificFormatFeatures = 0x00030002

WGPUNativeFeature_MultiDrawIndirectCount : WGPUNativeFeature
WGPUNativeFeature_MultiDrawIndirectCount = 0x00030004

WGPUNativeFeature_VertexWritableStorage : WGPUNativeFeature
WGPUNativeFeature_VertexWritableStorage = 0x00030005

WGPUNativeFeature_TextureBindingArray : WGPUNativeFeature
WGPUNativeFeature_TextureBindingArray = 0x00030006

WGPUNativeFeature_SampledTextureAndStorageBufferArrayNonUniformIndexing : WGPUNativeFeature
WGPUNativeFeature_SampledTextureAndStorageBufferArrayNonUniformIndexing = 0x00030007

WGPUNativeFeature_PipelineStatisticsQuery : WGPUNativeFeature
WGPUNativeFeature_PipelineStatisticsQuery = 0x00030008

WGPUNativeFeature_StorageResourceBindingArray : WGPUNativeFeature
WGPUNativeFeature_StorageResourceBindingArray = 0x00030009

WGPUNativeFeature_PartiallyBoundBindingArray : WGPUNativeFeature
WGPUNativeFeature_PartiallyBoundBindingArray = 0x0003000A

WGPUNativeFeature_TextureFormat16bitNorm : WGPUNativeFeature
WGPUNativeFeature_TextureFormat16bitNorm = 0x0003000B

WGPUNativeFeature_TextureCompressionAstcHdr : WGPUNativeFeature
WGPUNativeFeature_TextureCompressionAstcHdr = 0x0003000C

WGPUNativeFeature_MappablePrimaryBuffers : WGPUNativeFeature
WGPUNativeFeature_MappablePrimaryBuffers = 0x0003000E

WGPUNativeFeature_BufferBindingArray : WGPUNativeFeature
WGPUNativeFeature_BufferBindingArray = 0x0003000F

WGPUNativeFeature_UniformBufferAndStorageTextureArrayNonUniformIndexing : WGPUNativeFeature
WGPUNativeFeature_UniformBufferAndStorageTextureArrayNonUniformIndexing = 0x00030010

WGPUNativeFeature_PolygonModeLine : WGPUNativeFeature
WGPUNativeFeature_PolygonModeLine = 0x00030013

WGPUNativeFeature_PolygonModePoint : WGPUNativeFeature
WGPUNativeFeature_PolygonModePoint = 0x00030014

WGPUNativeFeature_ConservativeRasterization : WGPUNativeFeature
WGPUNativeFeature_ConservativeRasterization = 0x00030015

WGPUNativeFeature_SpirvShaderPassthrough : WGPUNativeFeature
WGPUNativeFeature_SpirvShaderPassthrough = 0x00030017

WGPUNativeFeature_VertexAttribute64bit : WGPUNativeFeature
WGPUNativeFeature_VertexAttribute64bit = 0x00030019

WGPUNativeFeature_TextureFormatNv12 : WGPUNativeFeature
WGPUNativeFeature_TextureFormatNv12 = 0x0003001A

WGPUNativeFeature_RayQuery : WGPUNativeFeature
WGPUNativeFeature_RayQuery = 0x0003001C

WGPUNativeFeature_ShaderF64 : WGPUNativeFeature
WGPUNativeFeature_ShaderF64 = 0x0003001D

WGPUNativeFeature_ShaderI16 : WGPUNativeFeature
WGPUNativeFeature_ShaderI16 = 0x0003001E

WGPUNativeFeature_ShaderPrimitiveIndex : WGPUNativeFeature
WGPUNativeFeature_ShaderPrimitiveIndex = 0x0003001F

WGPUNativeFeature_ShaderEarlyDepthTest : WGPUNativeFeature
WGPUNativeFeature_ShaderEarlyDepthTest = 0x00030020

WGPUNativeFeature_Subgroup : WGPUNativeFeature
WGPUNativeFeature_Subgroup = 0x00030021

WGPUNativeFeature_SubgroupVertex : WGPUNativeFeature
WGPUNativeFeature_SubgroupVertex = 0x00030022

WGPUNativeFeature_SubgroupBarrier : WGPUNativeFeature
WGPUNativeFeature_SubgroupBarrier = 0x00030023

WGPUNativeFeature_TimestampQueryInsideEncoders : WGPUNativeFeature
WGPUNativeFeature_TimestampQueryInsideEncoders = 0x00030024

WGPUNativeFeature_TimestampQueryInsidePasses : WGPUNativeFeature
WGPUNativeFeature_TimestampQueryInsidePasses = 0x00030025

WGPUNativeFeature_ShaderInt64 : WGPUNativeFeature
WGPUNativeFeature_ShaderInt64 = 0x00030026

WGPUNativeFeature_Force32 : WGPUNativeFeature
WGPUNativeFeature_Force32 = 0x7FFFFFFF

WGPULogLevel : Type
WGPULogLevel = Enum

WGPULogLevel_Off : WGPULogLevel
WGPULogLevel_Off = 0x00000000

WGPULogLevel_Error : WGPULogLevel
WGPULogLevel_Error = 0x00000001

WGPULogLevel_Warn : WGPULogLevel
WGPULogLevel_Warn = 0x00000002

WGPULogLevel_Info : WGPULogLevel
WGPULogLevel_Info = 0x00000003

WGPULogLevel_Debug : WGPULogLevel
WGPULogLevel_Debug = 0x00000004

WGPULogLevel_Trace : WGPULogLevel
WGPULogLevel_Trace = 0x00000005

WGPULogLevel_Force32 : WGPULogLevel
WGPULogLevel_Force32 = 0x7FFFFFFF

WGPUInstanceBackend : Type
WGPUInstanceBackend = WGPUFlags

WGPUInstanceFlag : Type
WGPUInstanceFlag = WGPUFlags

WGPUDx12Compiler : Type
WGPUDx12Compiler = Enum

WGPUDx12Compiler_Undefined : WGPUDx12Compiler
WGPUDx12Compiler_Undefined = 0x00000000

WGPUDx12Compiler_Fxc : WGPUDx12Compiler
WGPUDx12Compiler_Fxc = 0x00000001

WGPUDx12Compiler_Dxc : WGPUDx12Compiler
WGPUDx12Compiler_Dxc = 0x00000002

WGPUDx12Compiler_Force32 : WGPUDx12Compiler
WGPUDx12Compiler_Force32 = 0x7FFFFFFF

WGPUGles3MinorVersion : Type
WGPUGles3MinorVersion = Enum

WGPUGles3MinorVersion_Automatic : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Automatic = 0x00000000

WGPUGles3MinorVersion_Version0 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Version0 = 0x00000001

WGPUGles3MinorVersion_Version1 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Version1 = 0x00000002

WGPUGles3MinorVersion_Version2 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Version2 = 0x00000003

WGPUGles3MinorVersion_Force32 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Force32 = 0x7FFFFFFF

WGPUPipelineStatisticName : Type
WGPUPipelineStatisticName = Enum

WGPUPipelineStatisticName_VertexShaderInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_VertexShaderInvocations = 0x00000000

WGPUPipelineStatisticName_ClipperInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_ClipperInvocations = 0x00000001

WGPUPipelineStatisticName_ClipperPrimitivesOut : WGPUPipelineStatisticName
WGPUPipelineStatisticName_ClipperPrimitivesOut = 0x00000002

WGPUPipelineStatisticName_FragmentShaderInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_FragmentShaderInvocations = 0x00000003

WGPUPipelineStatisticName_ComputeShaderInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_ComputeShaderInvocations = 0x00000004

WGPUPipelineStatisticName_Force32 : WGPUPipelineStatisticName
WGPUPipelineStatisticName_Force32 = 0x7FFFFFFF

WGPUNativeQueryType : Type
WGPUNativeQueryType = Enum

WGPUNativeQueryType_PipelineStatistics : WGPUNativeQueryType
WGPUNativeQueryType_PipelineStatistics = 0x00030000

WGPUNativeQueryType_Force32 : WGPUNativeQueryType
WGPUNativeQueryType_Force32 = 0x7FFFFFFF

WGPUDxcMaxShaderModel : Type
WGPUDxcMaxShaderModel = Enum

WGPUDxcMaxShaderModel_V6_0 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_0 = 0x00000000

WGPUDxcMaxShaderModel_V6_1 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_1 = 0x00000001

WGPUDxcMaxShaderModel_V6_2 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_2 = 0x00000002

WGPUDxcMaxShaderModel_V6_3 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_3 = 0x00000003

WGPUDxcMaxShaderModel_V6_4 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_4 = 0x00000004

WGPUDxcMaxShaderModel_V6_5 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_5 = 0x00000005

WGPUDxcMaxShaderModel_V6_6 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_6 = 0x00000006

WGPUDxcMaxShaderModel_V6_7 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_7 = 0x00000007

WGPUDxcMaxShaderModel_Force32 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_Force32 = 0x7FFFFFFF

WGPUGLFenceBehaviour : Type
WGPUGLFenceBehaviour = Enum

WGPUGLFenceBehaviour_Normal : WGPUGLFenceBehaviour
WGPUGLFenceBehaviour_Normal = 0x00000000

WGPUGLFenceBehaviour_AutoFinish : WGPUGLFenceBehaviour
WGPUGLFenceBehaviour_AutoFinish = 0x00000001

WGPUGLFenceBehaviour_Force32 : WGPUGLFenceBehaviour
WGPUGLFenceBehaviour_Force32 = 0x7FFFFFFF

WGPUInstanceExtras : Type
WGPUInstanceExtras = Struct "WGPUInstanceExtras" [("chain",  (WGPUChainedStruct)),("backends",  (WGPUInstanceBackend)),("flags",  (WGPUInstanceFlag)),("dx12ShaderCompiler",  (WGPUDx12Compiler)),("gles3MinorVersion",  (WGPUGles3MinorVersion)),("glFenceBehaviour",  (WGPUGLFenceBehaviour)),("dxcPath",  (WGPUStringView)),("dxcMaxShaderModel",  (WGPUDxcMaxShaderModel)),("budgetForDeviceCreation", Ptr (U8)),("budgetForDeviceLoss", Ptr (U8))]

WGPUDeviceExtras : Type
WGPUDeviceExtras = Struct "WGPUDeviceExtras" [("chain",  (WGPUChainedStruct)),("tracePath",  (WGPUStringView))]

WGPUNativeLimits : Type
WGPUNativeLimits = Struct "WGPUNativeLimits" [("chain",  (WGPUChainedStructOut)),("maxPushConstantSize",  (U32)),("maxNonSamplerBindings",  (U32))]

WGPUPushConstantRange : Type
WGPUPushConstantRange = Struct "WGPUPushConstantRange" [("stages",  (WGPUShaderStage)),("start",  (U32)),("end",  (U32))]

WGPUPipelineLayoutExtras : Type
WGPUPipelineLayoutExtras = Struct "WGPUPipelineLayoutExtras" [("chain",  (WGPUChainedStruct)),("pushConstantRangeCount",  (U64)),("pushConstantRanges", Ptr (WGPUPushConstantRange))]

WGPUSubmissionIndex : Type
WGPUSubmissionIndex = U64

WGPUShaderDefine : Type
WGPUShaderDefine = Struct "WGPUShaderDefine" [("name",  (WGPUStringView)),("value",  (WGPUStringView))]

WGPUShaderSourceGLSL : Type
WGPUShaderSourceGLSL = Struct "WGPUShaderSourceGLSL" [("chain",  (WGPUChainedStruct)),("stage",  (WGPUShaderStage)),("code",  (WGPUStringView)),("defineCount",  (U32)),("defines", Ptr (WGPUShaderDefine))]

WGPUShaderModuleDescriptorSpirV : Type
WGPUShaderModuleDescriptorSpirV = Struct "WGPUShaderModuleDescriptorSpirV" [("label",  (WGPUStringView)),("sourceSize",  (U32)),("source", Ptr (U32))]

WGPURegistryReport : Type
WGPURegistryReport = Struct "WGPURegistryReport" [("numAllocated",  (U64)),("numKeptFromUser",  (U64)),("numReleasedFromUser",  (U64)),("elementSize",  (U64))]

WGPUHubReport : Type
WGPUHubReport = Struct "WGPUHubReport" [("adapters",  (WGPURegistryReport)),("devices",  (WGPURegistryReport)),("queues",  (WGPURegistryReport)),("pipelineLayouts",  (WGPURegistryReport)),("shaderModules",  (WGPURegistryReport)),("bindGroupLayouts",  (WGPURegistryReport)),("bindGroups",  (WGPURegistryReport)),("commandBuffers",  (WGPURegistryReport)),("renderBundles",  (WGPURegistryReport)),("renderPipelines",  (WGPURegistryReport)),("computePipelines",  (WGPURegistryReport)),("pipelineCaches",  (WGPURegistryReport)),("querySets",  (WGPURegistryReport)),("buffers",  (WGPURegistryReport)),("textures",  (WGPURegistryReport)),("textureViews",  (WGPURegistryReport)),("samplers",  (WGPURegistryReport))]

WGPUGlobalReport : Type
WGPUGlobalReport = Struct "WGPUGlobalReport" [("surfaces",  (WGPURegistryReport)),("hub",  (WGPUHubReport))]

WGPUInstanceEnumerateAdapterOptions : Type
WGPUInstanceEnumerateAdapterOptions = Struct "WGPUInstanceEnumerateAdapterOptions" [("nextInChain", Ptr (WGPUChainedStruct)),("backends",  (WGPUInstanceBackend))]

WGPUBindGroupEntryExtras : Type
WGPUBindGroupEntryExtras = Struct "WGPUBindGroupEntryExtras" [("chain",  (WGPUChainedStruct)),("buffers", Ptr (WGPUBuffer)),("bufferCount",  (U64)),("samplers", Ptr (WGPUSampler)),("samplerCount",  (U64)),("textureViews", Ptr (WGPUTextureView)),("textureViewCount",  (U64))]

WGPUBindGroupLayoutEntryExtras : Type
WGPUBindGroupLayoutEntryExtras = Struct "WGPUBindGroupLayoutEntryExtras" [("chain",  (WGPUChainedStruct)),("count",  (U32))]

WGPUQuerySetDescriptorExtras : Type
WGPUQuerySetDescriptorExtras = Struct "WGPUQuerySetDescriptorExtras" [("chain",  (WGPUChainedStruct)),("pipelineStatistics", Ptr (WGPUPipelineStatisticName)),("pipelineStatisticCount",  (U64))]

WGPUSurfaceConfigurationExtras : Type
WGPUSurfaceConfigurationExtras = Struct "WGPUSurfaceConfigurationExtras" [("chain",  (WGPUChainedStruct)),("desiredMaximumFrameLatency",  (U32))]

WGPUSurfaceSourceSwapChainPanel : Type
WGPUSurfaceSourceSwapChainPanel = Struct "WGPUSurfaceSourceSwapChainPanel" [("chain",  (WGPUChainedStruct)),("panelNative", Ptr (()))]

WGPUPolygonMode : Type
WGPUPolygonMode = Enum

WGPUPolygonMode_Fill : WGPUPolygonMode
WGPUPolygonMode_Fill = 0

WGPUPolygonMode_Line : WGPUPolygonMode
WGPUPolygonMode_Line = 1

WGPUPolygonMode_Point : WGPUPolygonMode
WGPUPolygonMode_Point = 2

WGPUPrimitiveStateExtras : Type
WGPUPrimitiveStateExtras = Struct "WGPUPrimitiveStateExtras" [("chain",  (WGPUChainedStruct)),("polygonMode",  (WGPUPolygonMode)),("conservative",  (WGPUBool))]

WGPULogCallback : Type
WGPULogCallback = Ptr (WGPULogLevel -> WGPUStringView -> Ptr (()) -> ())

WGPUNativeTextureFormat : Type
WGPUNativeTextureFormat = Enum

WGPUNativeTextureFormat_R16Unorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_R16Unorm = 0x00030001

WGPUNativeTextureFormat_R16Snorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_R16Snorm = 0x00030002

WGPUNativeTextureFormat_Rg16Unorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rg16Unorm = 0x00030003

WGPUNativeTextureFormat_Rg16Snorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rg16Snorm = 0x00030004

WGPUNativeTextureFormat_Rgba16Unorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rgba16Unorm = 0x00030005

WGPUNativeTextureFormat_Rgba16Snorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rgba16Snorm = 0x00030006

WGPUNativeTextureFormat_NV12 : WGPUNativeTextureFormat
WGPUNativeTextureFormat_NV12 = 0x00030007

WGPUNativeTextureFormat_P010 : WGPUNativeTextureFormat
WGPUNativeTextureFormat_P010 = 0x00030008

%foreign "C:wgpuGenerateReport,libwgpu_native"
wgpuGenerateReport : WGPUInstance -> Ptr (WGPUGlobalReport) -> ()
    

%foreign "C:wgpuInstanceEnumerateAdapters,libwgpu_native"
wgpuInstanceEnumerateAdapters : WGPUInstance -> Ptr (WGPUInstanceEnumerateAdapterOptions) -> Ptr (WGPUAdapter) -> U64
    

%foreign "C:wgpuQueueSubmitForIndex,libwgpu_native"
wgpuQueueSubmitForIndex : WGPUQueue -> U64 -> Ptr (WGPUCommandBuffer) -> WGPUSubmissionIndex
    

%foreign "C:wgpuDevicePoll,libwgpu_native"
wgpuDevicePoll : WGPUDevice -> WGPUBool -> Ptr (WGPUSubmissionIndex) -> WGPUBool
    

%foreign "C:wgpuDeviceCreateShaderModuleSpirV,libwgpu_native"
wgpuDeviceCreateShaderModuleSpirV : WGPUDevice -> Ptr (WGPUShaderModuleDescriptorSpirV) -> WGPUShaderModule
    

%foreign "C:wgpuSetLogCallback,libwgpu_native"
wgpuSetLogCallback : WGPULogCallback -> Ptr (()) -> ()
    

%foreign "C:wgpuSetLogLevel,libwgpu_native"
wgpuSetLogLevel : WGPULogLevel -> ()
    

%foreign "C:wgpuGetVersion,libwgpu_native"
wgpuGetVersion : () -> U32
    

%foreign "C:wgpuRenderPassEncoderSetPushConstants,libwgpu_native"
wgpuRenderPassEncoderSetPushConstants : WGPURenderPassEncoder -> WGPUShaderStage -> U32 -> U32 -> Ptr (()) -> ()
    

%foreign "C:wgpuComputePassEncoderSetPushConstants,libwgpu_native"
wgpuComputePassEncoderSetPushConstants : WGPUComputePassEncoder -> U32 -> U32 -> Ptr (()) -> ()
    

%foreign "C:wgpuRenderBundleEncoderSetPushConstants,libwgpu_native"
wgpuRenderBundleEncoderSetPushConstants : WGPURenderBundleEncoder -> WGPUShaderStage -> U32 -> U32 -> Ptr (()) -> ()
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndirect,libwgpu_native"
wgpuRenderPassEncoderMultiDrawIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndexedIndirect,libwgpu_native"
wgpuRenderPassEncoderMultiDrawIndexedIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndirectCount,libwgpu_native"
wgpuRenderPassEncoderMultiDrawIndirectCount : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndexedIndirectCount,libwgpu_native"
wgpuRenderPassEncoderMultiDrawIndexedIndirectCount : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U32 -> ()
    

%foreign "C:wgpuComputePassEncoderBeginPipelineStatisticsQuery,libwgpu_native"
wgpuComputePassEncoderBeginPipelineStatisticsQuery : WGPUComputePassEncoder -> WGPUQuerySet -> U32 -> ()
    

%foreign "C:wgpuComputePassEncoderEndPipelineStatisticsQuery,libwgpu_native"
wgpuComputePassEncoderEndPipelineStatisticsQuery : WGPUComputePassEncoder -> ()
    

%foreign "C:wgpuRenderPassEncoderBeginPipelineStatisticsQuery,libwgpu_native"
wgpuRenderPassEncoderBeginPipelineStatisticsQuery : WGPURenderPassEncoder -> WGPUQuerySet -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderEndPipelineStatisticsQuery,libwgpu_native"
wgpuRenderPassEncoderEndPipelineStatisticsQuery : WGPURenderPassEncoder -> ()
    

%foreign "C:wgpuComputePassEncoderWriteTimestamp,libwgpu_native"
wgpuComputePassEncoderWriteTimestamp : WGPUComputePassEncoder -> WGPUQuerySet -> U32 -> ()
    

%foreign "C:wgpuRenderPassEncoderWriteTimestamp,libwgpu_native"
wgpuRenderPassEncoderWriteTimestamp : WGPURenderPassEncoder -> WGPUQuerySet -> U32 -> ()
    
