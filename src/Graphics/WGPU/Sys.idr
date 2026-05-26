
module Graphics.WGPU.Sys

import public System.FFI
import Data.Bits

import public Utils.CTypes



public export
WGPUFlags : Type
WGPUFlags = U64

public export
WGPUBool : Type
WGPUBool = U32

public export
WGPUStringView : Type
WGPUStringView = Struct "WGPUStringView" [("data", Ptr (U8)),("length",  (U64))]

public export
WGPUAdapter : Type
WGPUAdapter = Ptr (Struct "WGPUAdapterImpl" [])

public export
WGPUBindGroup : Type
WGPUBindGroup = Ptr (Struct "WGPUBindGroupImpl" [])

public export
WGPUBindGroupLayout : Type
WGPUBindGroupLayout = Ptr (Struct "WGPUBindGroupLayoutImpl" [])

public export
WGPUBuffer : Type
WGPUBuffer = Ptr (Struct "WGPUBufferImpl" [])

public export
WGPUCommandBuffer : Type
WGPUCommandBuffer = Ptr (Struct "WGPUCommandBufferImpl" [])

public export
WGPUCommandEncoder : Type
WGPUCommandEncoder = Ptr (Struct "WGPUCommandEncoderImpl" [])

public export
WGPUComputePassEncoder : Type
WGPUComputePassEncoder = Ptr (Struct "WGPUComputePassEncoderImpl" [])

public export
WGPUComputePipeline : Type
WGPUComputePipeline = Ptr (Struct "WGPUComputePipelineImpl" [])

public export
WGPUDevice : Type
WGPUDevice = Ptr (Struct "WGPUDeviceImpl" [])

public export
WGPUInstance : Type
WGPUInstance = Ptr (Struct "WGPUInstanceImpl" [])

public export
WGPUPipelineLayout : Type
WGPUPipelineLayout = Ptr (Struct "WGPUPipelineLayoutImpl" [])

public export
WGPUQuerySet : Type
WGPUQuerySet = Ptr (Struct "WGPUQuerySetImpl" [])

public export
WGPUQueue : Type
WGPUQueue = Ptr (Struct "WGPUQueueImpl" [])

public export
WGPURenderBundle : Type
WGPURenderBundle = Ptr (Struct "WGPURenderBundleImpl" [])

public export
WGPURenderBundleEncoder : Type
WGPURenderBundleEncoder = Ptr (Struct "WGPURenderBundleEncoderImpl" [])

public export
WGPURenderPassEncoder : Type
WGPURenderPassEncoder = Ptr (Struct "WGPURenderPassEncoderImpl" [])

public export
WGPURenderPipeline : Type
WGPURenderPipeline = Ptr (Struct "WGPURenderPipelineImpl" [])

public export
WGPUSampler : Type
WGPUSampler = Ptr (Struct "WGPUSamplerImpl" [])

public export
WGPUShaderModule : Type
WGPUShaderModule = Ptr (Struct "WGPUShaderModuleImpl" [])

public export
WGPUSurface : Type
WGPUSurface = Ptr (Struct "WGPUSurfaceImpl" [])

public export
WGPUTexture : Type
WGPUTexture = Ptr (Struct "WGPUTextureImpl" [])

public export
WGPUTextureView : Type
WGPUTextureView = Ptr (Struct "WGPUTextureViewImpl" [])

public export
WGPUAdapterType : Type
WGPUAdapterType = Enum

public export
WGPUAdapterType_DiscreteGPU : WGPUAdapterType
WGPUAdapterType_DiscreteGPU = 0x00000001

public export
WGPUAdapterType_IntegratedGPU : WGPUAdapterType
WGPUAdapterType_IntegratedGPU = 0x00000002

public export
WGPUAdapterType_CPU : WGPUAdapterType
WGPUAdapterType_CPU = 0x00000003

public export
WGPUAdapterType_Unknown : WGPUAdapterType
WGPUAdapterType_Unknown = 0x00000004

public export
WGPUAdapterType_Force32 : WGPUAdapterType
WGPUAdapterType_Force32 = 0x7FFFFFFF

public export
WGPUAddressMode : Type
WGPUAddressMode = Enum

public export
WGPUAddressMode_Undefined : WGPUAddressMode
WGPUAddressMode_Undefined = 0x00000000

public export
WGPUAddressMode_ClampToEdge : WGPUAddressMode
WGPUAddressMode_ClampToEdge = 0x00000001

public export
WGPUAddressMode_Repeat : WGPUAddressMode
WGPUAddressMode_Repeat = 0x00000002

public export
WGPUAddressMode_MirrorRepeat : WGPUAddressMode
WGPUAddressMode_MirrorRepeat = 0x00000003

public export
WGPUAddressMode_Force32 : WGPUAddressMode
WGPUAddressMode_Force32 = 0x7FFFFFFF

public export
WGPUBackendType : Type
WGPUBackendType = Enum

public export
WGPUBackendType_Undefined : WGPUBackendType
WGPUBackendType_Undefined = 0x00000000

public export
WGPUBackendType_Null : WGPUBackendType
WGPUBackendType_Null = 0x00000001

public export
WGPUBackendType_WebGPU : WGPUBackendType
WGPUBackendType_WebGPU = 0x00000002

public export
WGPUBackendType_D3D11 : WGPUBackendType
WGPUBackendType_D3D11 = 0x00000003

public export
WGPUBackendType_D3D12 : WGPUBackendType
WGPUBackendType_D3D12 = 0x00000004

public export
WGPUBackendType_Metal : WGPUBackendType
WGPUBackendType_Metal = 0x00000005

public export
WGPUBackendType_Vulkan : WGPUBackendType
WGPUBackendType_Vulkan = 0x00000006

public export
WGPUBackendType_OpenGL : WGPUBackendType
WGPUBackendType_OpenGL = 0x00000007

public export
WGPUBackendType_OpenGLES : WGPUBackendType
WGPUBackendType_OpenGLES = 0x00000008

public export
WGPUBackendType_Force32 : WGPUBackendType
WGPUBackendType_Force32 = 0x7FFFFFFF

public export
WGPUBlendFactor : Type
WGPUBlendFactor = Enum

public export
WGPUBlendFactor_Undefined : WGPUBlendFactor
WGPUBlendFactor_Undefined = 0x00000000

public export
WGPUBlendFactor_Zero : WGPUBlendFactor
WGPUBlendFactor_Zero = 0x00000001

public export
WGPUBlendFactor_One : WGPUBlendFactor
WGPUBlendFactor_One = 0x00000002

public export
WGPUBlendFactor_Src : WGPUBlendFactor
WGPUBlendFactor_Src = 0x00000003

public export
WGPUBlendFactor_OneMinusSrc : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrc = 0x00000004

public export
WGPUBlendFactor_SrcAlpha : WGPUBlendFactor
WGPUBlendFactor_SrcAlpha = 0x00000005

public export
WGPUBlendFactor_OneMinusSrcAlpha : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrcAlpha = 0x00000006

public export
WGPUBlendFactor_Dst : WGPUBlendFactor
WGPUBlendFactor_Dst = 0x00000007

public export
WGPUBlendFactor_OneMinusDst : WGPUBlendFactor
WGPUBlendFactor_OneMinusDst = 0x00000008

public export
WGPUBlendFactor_DstAlpha : WGPUBlendFactor
WGPUBlendFactor_DstAlpha = 0x00000009

public export
WGPUBlendFactor_OneMinusDstAlpha : WGPUBlendFactor
WGPUBlendFactor_OneMinusDstAlpha = 0x0000000A

public export
WGPUBlendFactor_SrcAlphaSaturated : WGPUBlendFactor
WGPUBlendFactor_SrcAlphaSaturated = 0x0000000B

public export
WGPUBlendFactor_Constant : WGPUBlendFactor
WGPUBlendFactor_Constant = 0x0000000C

public export
WGPUBlendFactor_OneMinusConstant : WGPUBlendFactor
WGPUBlendFactor_OneMinusConstant = 0x0000000D

public export
WGPUBlendFactor_Src1 : WGPUBlendFactor
WGPUBlendFactor_Src1 = 0x0000000E

public export
WGPUBlendFactor_OneMinusSrc1 : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrc1 = 0x0000000F

public export
WGPUBlendFactor_Src1Alpha : WGPUBlendFactor
WGPUBlendFactor_Src1Alpha = 0x00000010

public export
WGPUBlendFactor_OneMinusSrc1Alpha : WGPUBlendFactor
WGPUBlendFactor_OneMinusSrc1Alpha = 0x00000011

public export
WGPUBlendFactor_Force32 : WGPUBlendFactor
WGPUBlendFactor_Force32 = 0x7FFFFFFF

public export
WGPUBlendOperation : Type
WGPUBlendOperation = Enum

public export
WGPUBlendOperation_Undefined : WGPUBlendOperation
WGPUBlendOperation_Undefined = 0x00000000

public export
WGPUBlendOperation_Add : WGPUBlendOperation
WGPUBlendOperation_Add = 0x00000001

public export
WGPUBlendOperation_Subtract : WGPUBlendOperation
WGPUBlendOperation_Subtract = 0x00000002

public export
WGPUBlendOperation_ReverseSubtract : WGPUBlendOperation
WGPUBlendOperation_ReverseSubtract = 0x00000003

public export
WGPUBlendOperation_Min : WGPUBlendOperation
WGPUBlendOperation_Min = 0x00000004

public export
WGPUBlendOperation_Max : WGPUBlendOperation
WGPUBlendOperation_Max = 0x00000005

public export
WGPUBlendOperation_Force32 : WGPUBlendOperation
WGPUBlendOperation_Force32 = 0x7FFFFFFF

public export
WGPUBufferBindingType : Type
WGPUBufferBindingType = Enum

public export
WGPUBufferBindingType_BindingNotUsed : WGPUBufferBindingType
WGPUBufferBindingType_BindingNotUsed = 0x00000000

public export
WGPUBufferBindingType_Undefined : WGPUBufferBindingType
WGPUBufferBindingType_Undefined = 0x00000001

public export
WGPUBufferBindingType_Uniform : WGPUBufferBindingType
WGPUBufferBindingType_Uniform = 0x00000002

public export
WGPUBufferBindingType_Storage : WGPUBufferBindingType
WGPUBufferBindingType_Storage = 0x00000003

public export
WGPUBufferBindingType_ReadOnlyStorage : WGPUBufferBindingType
WGPUBufferBindingType_ReadOnlyStorage = 0x00000004

public export
WGPUBufferBindingType_Force32 : WGPUBufferBindingType
WGPUBufferBindingType_Force32 = 0x7FFFFFFF

public export
WGPUBufferMapState : Type
WGPUBufferMapState = Enum

public export
WGPUBufferMapState_Unmapped : WGPUBufferMapState
WGPUBufferMapState_Unmapped = 0x00000001

public export
WGPUBufferMapState_Pending : WGPUBufferMapState
WGPUBufferMapState_Pending = 0x00000002

public export
WGPUBufferMapState_Mapped : WGPUBufferMapState
WGPUBufferMapState_Mapped = 0x00000003

public export
WGPUBufferMapState_Force32 : WGPUBufferMapState
WGPUBufferMapState_Force32 = 0x7FFFFFFF

public export
WGPUCallbackMode : Type
WGPUCallbackMode = Enum

public export
WGPUCallbackMode_WaitAnyOnly : WGPUCallbackMode
WGPUCallbackMode_WaitAnyOnly = 0x00000001

public export
WGPUCallbackMode_AllowProcessEvents : WGPUCallbackMode
WGPUCallbackMode_AllowProcessEvents = 0x00000002

public export
WGPUCallbackMode_AllowSpontaneous : WGPUCallbackMode
WGPUCallbackMode_AllowSpontaneous = 0x00000003

public export
WGPUCallbackMode_Force32 : WGPUCallbackMode
WGPUCallbackMode_Force32 = 0x7FFFFFFF

public export
WGPUCompareFunction : Type
WGPUCompareFunction = Enum

public export
WGPUCompareFunction_Undefined : WGPUCompareFunction
WGPUCompareFunction_Undefined = 0x00000000

public export
WGPUCompareFunction_Never : WGPUCompareFunction
WGPUCompareFunction_Never = 0x00000001

public export
WGPUCompareFunction_Less : WGPUCompareFunction
WGPUCompareFunction_Less = 0x00000002

public export
WGPUCompareFunction_Equal : WGPUCompareFunction
WGPUCompareFunction_Equal = 0x00000003

public export
WGPUCompareFunction_LessEqual : WGPUCompareFunction
WGPUCompareFunction_LessEqual = 0x00000004

public export
WGPUCompareFunction_Greater : WGPUCompareFunction
WGPUCompareFunction_Greater = 0x00000005

public export
WGPUCompareFunction_NotEqual : WGPUCompareFunction
WGPUCompareFunction_NotEqual = 0x00000006

public export
WGPUCompareFunction_GreaterEqual : WGPUCompareFunction
WGPUCompareFunction_GreaterEqual = 0x00000007

public export
WGPUCompareFunction_Always : WGPUCompareFunction
WGPUCompareFunction_Always = 0x00000008

public export
WGPUCompareFunction_Force32 : WGPUCompareFunction
WGPUCompareFunction_Force32 = 0x7FFFFFFF

public export
WGPUCompilationInfoRequestStatus : Type
WGPUCompilationInfoRequestStatus = Enum

public export
WGPUCompilationInfoRequestStatus_Success : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Success = 0x00000001

public export
WGPUCompilationInfoRequestStatus_InstanceDropped : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_InstanceDropped = 0x00000002

public export
WGPUCompilationInfoRequestStatus_Error : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Error = 0x00000003

public export
WGPUCompilationInfoRequestStatus_Unknown : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Unknown = 0x00000004

public export
WGPUCompilationInfoRequestStatus_Force32 : WGPUCompilationInfoRequestStatus
WGPUCompilationInfoRequestStatus_Force32 = 0x7FFFFFFF

public export
WGPUCompilationMessageType : Type
WGPUCompilationMessageType = Enum

public export
WGPUCompilationMessageType_Error : WGPUCompilationMessageType
WGPUCompilationMessageType_Error = 0x00000001

public export
WGPUCompilationMessageType_Warning : WGPUCompilationMessageType
WGPUCompilationMessageType_Warning = 0x00000002

public export
WGPUCompilationMessageType_Info : WGPUCompilationMessageType
WGPUCompilationMessageType_Info = 0x00000003

public export
WGPUCompilationMessageType_Force32 : WGPUCompilationMessageType
WGPUCompilationMessageType_Force32 = 0x7FFFFFFF

public export
WGPUCompositeAlphaMode : Type
WGPUCompositeAlphaMode = Enum

public export
WGPUCompositeAlphaMode_Auto : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Auto = 0x00000000

public export
WGPUCompositeAlphaMode_Opaque : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Opaque = 0x00000001

public export
WGPUCompositeAlphaMode_Premultiplied : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Premultiplied = 0x00000002

public export
WGPUCompositeAlphaMode_Unpremultiplied : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Unpremultiplied = 0x00000003

public export
WGPUCompositeAlphaMode_Inherit : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Inherit = 0x00000004

public export
WGPUCompositeAlphaMode_Force32 : WGPUCompositeAlphaMode
WGPUCompositeAlphaMode_Force32 = 0x7FFFFFFF

public export
WGPUCreatePipelineAsyncStatus : Type
WGPUCreatePipelineAsyncStatus = Enum

public export
WGPUCreatePipelineAsyncStatus_Success : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_Success = 0x00000001

public export
WGPUCreatePipelineAsyncStatus_InstanceDropped : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_InstanceDropped = 0x00000002

public export
WGPUCreatePipelineAsyncStatus_ValidationError : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_ValidationError = 0x00000003

public export
WGPUCreatePipelineAsyncStatus_InternalError : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_InternalError = 0x00000004

public export
WGPUCreatePipelineAsyncStatus_Unknown : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_Unknown = 0x00000005

public export
WGPUCreatePipelineAsyncStatus_Force32 : WGPUCreatePipelineAsyncStatus
WGPUCreatePipelineAsyncStatus_Force32 = 0x7FFFFFFF

public export
WGPUCullMode : Type
WGPUCullMode = Enum

public export
WGPUCullMode_Undefined : WGPUCullMode
WGPUCullMode_Undefined = 0x00000000

public export
WGPUCullMode_None : WGPUCullMode
WGPUCullMode_None = 0x00000001

public export
WGPUCullMode_Front : WGPUCullMode
WGPUCullMode_Front = 0x00000002

public export
WGPUCullMode_Back : WGPUCullMode
WGPUCullMode_Back = 0x00000003

public export
WGPUCullMode_Force32 : WGPUCullMode
WGPUCullMode_Force32 = 0x7FFFFFFF

public export
WGPUDeviceLostReason : Type
WGPUDeviceLostReason = Enum

public export
WGPUDeviceLostReason_Unknown : WGPUDeviceLostReason
WGPUDeviceLostReason_Unknown = 0x00000001

public export
WGPUDeviceLostReason_Destroyed : WGPUDeviceLostReason
WGPUDeviceLostReason_Destroyed = 0x00000002

public export
WGPUDeviceLostReason_InstanceDropped : WGPUDeviceLostReason
WGPUDeviceLostReason_InstanceDropped = 0x00000003

public export
WGPUDeviceLostReason_FailedCreation : WGPUDeviceLostReason
WGPUDeviceLostReason_FailedCreation = 0x00000004

public export
WGPUDeviceLostReason_Force32 : WGPUDeviceLostReason
WGPUDeviceLostReason_Force32 = 0x7FFFFFFF

public export
WGPUErrorFilter : Type
WGPUErrorFilter = Enum

public export
WGPUErrorFilter_Validation : WGPUErrorFilter
WGPUErrorFilter_Validation = 0x00000001

public export
WGPUErrorFilter_OutOfMemory : WGPUErrorFilter
WGPUErrorFilter_OutOfMemory = 0x00000002

public export
WGPUErrorFilter_Internal : WGPUErrorFilter
WGPUErrorFilter_Internal = 0x00000003

public export
WGPUErrorFilter_Force32 : WGPUErrorFilter
WGPUErrorFilter_Force32 = 0x7FFFFFFF

public export
WGPUErrorType : Type
WGPUErrorType = Enum

public export
WGPUErrorType_NoError : WGPUErrorType
WGPUErrorType_NoError = 0x00000001

public export
WGPUErrorType_Validation : WGPUErrorType
WGPUErrorType_Validation = 0x00000002

public export
WGPUErrorType_OutOfMemory : WGPUErrorType
WGPUErrorType_OutOfMemory = 0x00000003

public export
WGPUErrorType_Internal : WGPUErrorType
WGPUErrorType_Internal = 0x00000004

public export
WGPUErrorType_Unknown : WGPUErrorType
WGPUErrorType_Unknown = 0x00000005

public export
WGPUErrorType_Force32 : WGPUErrorType
WGPUErrorType_Force32 = 0x7FFFFFFF

public export
WGPUFeatureLevel : Type
WGPUFeatureLevel = Enum

public export
WGPUFeatureLevel_Compatibility : WGPUFeatureLevel
WGPUFeatureLevel_Compatibility = 0x00000001

public export
WGPUFeatureLevel_Core : WGPUFeatureLevel
WGPUFeatureLevel_Core = 0x00000002

public export
WGPUFeatureLevel_Force32 : WGPUFeatureLevel
WGPUFeatureLevel_Force32 = 0x7FFFFFFF

public export
WGPUFeatureName : Type
WGPUFeatureName = Enum

public export
WGPUFeatureName_Undefined : WGPUFeatureName
WGPUFeatureName_Undefined = 0x00000000

public export
WGPUFeatureName_DepthClipControl : WGPUFeatureName
WGPUFeatureName_DepthClipControl = 0x00000001

public export
WGPUFeatureName_Depth32FloatStencil8 : WGPUFeatureName
WGPUFeatureName_Depth32FloatStencil8 = 0x00000002

public export
WGPUFeatureName_TimestampQuery : WGPUFeatureName
WGPUFeatureName_TimestampQuery = 0x00000003

public export
WGPUFeatureName_TextureCompressionBC : WGPUFeatureName
WGPUFeatureName_TextureCompressionBC = 0x00000004

public export
WGPUFeatureName_TextureCompressionBCSliced3D : WGPUFeatureName
WGPUFeatureName_TextureCompressionBCSliced3D = 0x00000005

public export
WGPUFeatureName_TextureCompressionETC2 : WGPUFeatureName
WGPUFeatureName_TextureCompressionETC2 = 0x00000006

public export
WGPUFeatureName_TextureCompressionASTC : WGPUFeatureName
WGPUFeatureName_TextureCompressionASTC = 0x00000007

public export
WGPUFeatureName_TextureCompressionASTCSliced3D : WGPUFeatureName
WGPUFeatureName_TextureCompressionASTCSliced3D = 0x00000008

public export
WGPUFeatureName_IndirectFirstInstance : WGPUFeatureName
WGPUFeatureName_IndirectFirstInstance = 0x00000009

public export
WGPUFeatureName_ShaderF16 : WGPUFeatureName
WGPUFeatureName_ShaderF16 = 0x0000000A

public export
WGPUFeatureName_RG11B10UfloatRenderable : WGPUFeatureName
WGPUFeatureName_RG11B10UfloatRenderable = 0x0000000B

public export
WGPUFeatureName_BGRA8UnormStorage : WGPUFeatureName
WGPUFeatureName_BGRA8UnormStorage = 0x0000000C

public export
WGPUFeatureName_Float32Filterable : WGPUFeatureName
WGPUFeatureName_Float32Filterable = 0x0000000D

public export
WGPUFeatureName_Float32Blendable : WGPUFeatureName
WGPUFeatureName_Float32Blendable = 0x0000000E

public export
WGPUFeatureName_ClipDistances : WGPUFeatureName
WGPUFeatureName_ClipDistances = 0x0000000F

public export
WGPUFeatureName_DualSourceBlending : WGPUFeatureName
WGPUFeatureName_DualSourceBlending = 0x00000010

public export
WGPUFeatureName_Force32 : WGPUFeatureName
WGPUFeatureName_Force32 = 0x7FFFFFFF

public export
WGPUFilterMode : Type
WGPUFilterMode = Enum

public export
WGPUFilterMode_Undefined : WGPUFilterMode
WGPUFilterMode_Undefined = 0x00000000

public export
WGPUFilterMode_Nearest : WGPUFilterMode
WGPUFilterMode_Nearest = 0x00000001

public export
WGPUFilterMode_Linear : WGPUFilterMode
WGPUFilterMode_Linear = 0x00000002

public export
WGPUFilterMode_Force32 : WGPUFilterMode
WGPUFilterMode_Force32 = 0x7FFFFFFF

public export
WGPUFrontFace : Type
WGPUFrontFace = Enum

public export
WGPUFrontFace_Undefined : WGPUFrontFace
WGPUFrontFace_Undefined = 0x00000000

public export
WGPUFrontFace_CCW : WGPUFrontFace
WGPUFrontFace_CCW = 0x00000001

public export
WGPUFrontFace_CW : WGPUFrontFace
WGPUFrontFace_CW = 0x00000002

public export
WGPUFrontFace_Force32 : WGPUFrontFace
WGPUFrontFace_Force32 = 0x7FFFFFFF

public export
WGPUIndexFormat : Type
WGPUIndexFormat = Enum

public export
WGPUIndexFormat_Undefined : WGPUIndexFormat
WGPUIndexFormat_Undefined = 0x00000000

public export
WGPUIndexFormat_Uint16 : WGPUIndexFormat
WGPUIndexFormat_Uint16 = 0x00000001

public export
WGPUIndexFormat_Uint32 : WGPUIndexFormat
WGPUIndexFormat_Uint32 = 0x00000002

public export
WGPUIndexFormat_Force32 : WGPUIndexFormat
WGPUIndexFormat_Force32 = 0x7FFFFFFF

public export
WGPULoadOp : Type
WGPULoadOp = Enum

public export
WGPULoadOp_Undefined : WGPULoadOp
WGPULoadOp_Undefined = 0x00000000

public export
WGPULoadOp_Load : WGPULoadOp
WGPULoadOp_Load = 0x00000001

public export
WGPULoadOp_Clear : WGPULoadOp
WGPULoadOp_Clear = 0x00000002

public export
WGPULoadOp_Force32 : WGPULoadOp
WGPULoadOp_Force32 = 0x7FFFFFFF

public export
WGPUMapAsyncStatus : Type
WGPUMapAsyncStatus = Enum

public export
WGPUMapAsyncStatus_Success : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Success = 0x00000001

public export
WGPUMapAsyncStatus_InstanceDropped : WGPUMapAsyncStatus
WGPUMapAsyncStatus_InstanceDropped = 0x00000002

public export
WGPUMapAsyncStatus_Error : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Error = 0x00000003

public export
WGPUMapAsyncStatus_Aborted : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Aborted = 0x00000004

public export
WGPUMapAsyncStatus_Unknown : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Unknown = 0x00000005

public export
WGPUMapAsyncStatus_Force32 : WGPUMapAsyncStatus
WGPUMapAsyncStatus_Force32 = 0x7FFFFFFF

public export
WGPUMipmapFilterMode : Type
WGPUMipmapFilterMode = Enum

public export
WGPUMipmapFilterMode_Undefined : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Undefined = 0x00000000

public export
WGPUMipmapFilterMode_Nearest : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Nearest = 0x00000001

public export
WGPUMipmapFilterMode_Linear : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Linear = 0x00000002

public export
WGPUMipmapFilterMode_Force32 : WGPUMipmapFilterMode
WGPUMipmapFilterMode_Force32 = 0x7FFFFFFF

public export
WGPUOptionalBool : Type
WGPUOptionalBool = Enum

public export
WGPUOptionalBool_False : WGPUOptionalBool
WGPUOptionalBool_False = 0x00000000

public export
WGPUOptionalBool_True : WGPUOptionalBool
WGPUOptionalBool_True = 0x00000001

public export
WGPUOptionalBool_Undefined : WGPUOptionalBool
WGPUOptionalBool_Undefined = 0x00000002

public export
WGPUOptionalBool_Force32 : WGPUOptionalBool
WGPUOptionalBool_Force32 = 0x7FFFFFFF

public export
WGPUPopErrorScopeStatus : Type
WGPUPopErrorScopeStatus = Enum

public export
WGPUPopErrorScopeStatus_Success : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_Success = 0x00000001

public export
WGPUPopErrorScopeStatus_InstanceDropped : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_InstanceDropped = 0x00000002

public export
WGPUPopErrorScopeStatus_EmptyStack : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_EmptyStack = 0x00000003

public export
WGPUPopErrorScopeStatus_Force32 : WGPUPopErrorScopeStatus
WGPUPopErrorScopeStatus_Force32 = 0x7FFFFFFF

public export
WGPUPowerPreference : Type
WGPUPowerPreference = Enum

public export
WGPUPowerPreference_Undefined : WGPUPowerPreference
WGPUPowerPreference_Undefined = 0x00000000

public export
WGPUPowerPreference_LowPower : WGPUPowerPreference
WGPUPowerPreference_LowPower = 0x00000001

public export
WGPUPowerPreference_HighPerformance : WGPUPowerPreference
WGPUPowerPreference_HighPerformance = 0x00000002

public export
WGPUPowerPreference_Force32 : WGPUPowerPreference
WGPUPowerPreference_Force32 = 0x7FFFFFFF

public export
WGPUPresentMode : Type
WGPUPresentMode = Enum

public export
WGPUPresentMode_Undefined : WGPUPresentMode
WGPUPresentMode_Undefined = 0x00000000

public export
WGPUPresentMode_Fifo : WGPUPresentMode
WGPUPresentMode_Fifo = 0x00000001

public export
WGPUPresentMode_FifoRelaxed : WGPUPresentMode
WGPUPresentMode_FifoRelaxed = 0x00000002

public export
WGPUPresentMode_Immediate : WGPUPresentMode
WGPUPresentMode_Immediate = 0x00000003

public export
WGPUPresentMode_Mailbox : WGPUPresentMode
WGPUPresentMode_Mailbox = 0x00000004

public export
WGPUPresentMode_Force32 : WGPUPresentMode
WGPUPresentMode_Force32 = 0x7FFFFFFF

public export
WGPUPrimitiveTopology : Type
WGPUPrimitiveTopology = Enum

public export
WGPUPrimitiveTopology_Undefined : WGPUPrimitiveTopology
WGPUPrimitiveTopology_Undefined = 0x00000000

public export
WGPUPrimitiveTopology_PointList : WGPUPrimitiveTopology
WGPUPrimitiveTopology_PointList = 0x00000001

public export
WGPUPrimitiveTopology_LineList : WGPUPrimitiveTopology
WGPUPrimitiveTopology_LineList = 0x00000002

public export
WGPUPrimitiveTopology_LineStrip : WGPUPrimitiveTopology
WGPUPrimitiveTopology_LineStrip = 0x00000003

public export
WGPUPrimitiveTopology_TriangleList : WGPUPrimitiveTopology
WGPUPrimitiveTopology_TriangleList = 0x00000004

public export
WGPUPrimitiveTopology_TriangleStrip : WGPUPrimitiveTopology
WGPUPrimitiveTopology_TriangleStrip = 0x00000005

public export
WGPUPrimitiveTopology_Force32 : WGPUPrimitiveTopology
WGPUPrimitiveTopology_Force32 = 0x7FFFFFFF

public export
WGPUQueryType : Type
WGPUQueryType = Enum

public export
WGPUQueryType_Occlusion : WGPUQueryType
WGPUQueryType_Occlusion = 0x00000001

public export
WGPUQueryType_Timestamp : WGPUQueryType
WGPUQueryType_Timestamp = 0x00000002

public export
WGPUQueryType_Force32 : WGPUQueryType
WGPUQueryType_Force32 = 0x7FFFFFFF

public export
WGPUQueueWorkDoneStatus : Type
WGPUQueueWorkDoneStatus = Enum

public export
WGPUQueueWorkDoneStatus_Success : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Success = 0x00000001

public export
WGPUQueueWorkDoneStatus_InstanceDropped : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_InstanceDropped = 0x00000002

public export
WGPUQueueWorkDoneStatus_Error : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Error = 0x00000003

public export
WGPUQueueWorkDoneStatus_Unknown : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Unknown = 0x00000004

public export
WGPUQueueWorkDoneStatus_Force32 : WGPUQueueWorkDoneStatus
WGPUQueueWorkDoneStatus_Force32 = 0x7FFFFFFF

public export
WGPURequestAdapterStatus : Type
WGPURequestAdapterStatus = Enum

public export
WGPURequestAdapterStatus_Success : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Success = 0x00000001

public export
WGPURequestAdapterStatus_InstanceDropped : WGPURequestAdapterStatus
WGPURequestAdapterStatus_InstanceDropped = 0x00000002

public export
WGPURequestAdapterStatus_Unavailable : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Unavailable = 0x00000003

public export
WGPURequestAdapterStatus_Error : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Error = 0x00000004

public export
WGPURequestAdapterStatus_Unknown : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Unknown = 0x00000005

public export
WGPURequestAdapterStatus_Force32 : WGPURequestAdapterStatus
WGPURequestAdapterStatus_Force32 = 0x7FFFFFFF

public export
WGPURequestDeviceStatus : Type
WGPURequestDeviceStatus = Enum

public export
WGPURequestDeviceStatus_Success : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Success = 0x00000001

public export
WGPURequestDeviceStatus_InstanceDropped : WGPURequestDeviceStatus
WGPURequestDeviceStatus_InstanceDropped = 0x00000002

public export
WGPURequestDeviceStatus_Error : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Error = 0x00000003

public export
WGPURequestDeviceStatus_Unknown : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Unknown = 0x00000004

public export
WGPURequestDeviceStatus_Force32 : WGPURequestDeviceStatus
WGPURequestDeviceStatus_Force32 = 0x7FFFFFFF

public export
WGPUSType : Type
WGPUSType = Enum

public export
WGPUSType_ShaderSourceSPIRV : WGPUSType
WGPUSType_ShaderSourceSPIRV = 0x00000001

public export
WGPUSType_ShaderSourceWGSL : WGPUSType
WGPUSType_ShaderSourceWGSL = 0x00000002

public export
WGPUSType_RenderPassMaxDrawCount : WGPUSType
WGPUSType_RenderPassMaxDrawCount = 0x00000003

public export
WGPUSType_SurfaceSourceMetalLayer : WGPUSType
WGPUSType_SurfaceSourceMetalLayer = 0x00000004

public export
WGPUSType_SurfaceSourceWindowsHWND : WGPUSType
WGPUSType_SurfaceSourceWindowsHWND = 0x00000005

public export
WGPUSType_SurfaceSourceXlibWindow : WGPUSType
WGPUSType_SurfaceSourceXlibWindow = 0x00000006

public export
WGPUSType_SurfaceSourceWaylandSurface : WGPUSType
WGPUSType_SurfaceSourceWaylandSurface = 0x00000007

public export
WGPUSType_SurfaceSourceAndroidNativeWindow : WGPUSType
WGPUSType_SurfaceSourceAndroidNativeWindow = 0x00000008

public export
WGPUSType_SurfaceSourceXCBWindow : WGPUSType
WGPUSType_SurfaceSourceXCBWindow = 0x00000009

public export
WGPUSType_Force32 : WGPUSType
WGPUSType_Force32 = 0x7FFFFFFF

public export
WGPUSamplerBindingType : Type
WGPUSamplerBindingType = Enum

public export
WGPUSamplerBindingType_BindingNotUsed : WGPUSamplerBindingType
WGPUSamplerBindingType_BindingNotUsed = 0x00000000

public export
WGPUSamplerBindingType_Undefined : WGPUSamplerBindingType
WGPUSamplerBindingType_Undefined = 0x00000001

public export
WGPUSamplerBindingType_Filtering : WGPUSamplerBindingType
WGPUSamplerBindingType_Filtering = 0x00000002

public export
WGPUSamplerBindingType_NonFiltering : WGPUSamplerBindingType
WGPUSamplerBindingType_NonFiltering = 0x00000003

public export
WGPUSamplerBindingType_Comparison : WGPUSamplerBindingType
WGPUSamplerBindingType_Comparison = 0x00000004

public export
WGPUSamplerBindingType_Force32 : WGPUSamplerBindingType
WGPUSamplerBindingType_Force32 = 0x7FFFFFFF

public export
WGPUStatus : Type
WGPUStatus = Enum

public export
WGPUStatus_Success : WGPUStatus
WGPUStatus_Success = 0x00000001

public export
WGPUStatus_Error : WGPUStatus
WGPUStatus_Error = 0x00000002

public export
WGPUStatus_Force32 : WGPUStatus
WGPUStatus_Force32 = 0x7FFFFFFF

public export
WGPUStencilOperation : Type
WGPUStencilOperation = Enum

public export
WGPUStencilOperation_Undefined : WGPUStencilOperation
WGPUStencilOperation_Undefined = 0x00000000

public export
WGPUStencilOperation_Keep : WGPUStencilOperation
WGPUStencilOperation_Keep = 0x00000001

public export
WGPUStencilOperation_Zero : WGPUStencilOperation
WGPUStencilOperation_Zero = 0x00000002

public export
WGPUStencilOperation_Replace : WGPUStencilOperation
WGPUStencilOperation_Replace = 0x00000003

public export
WGPUStencilOperation_Invert : WGPUStencilOperation
WGPUStencilOperation_Invert = 0x00000004

public export
WGPUStencilOperation_IncrementClamp : WGPUStencilOperation
WGPUStencilOperation_IncrementClamp = 0x00000005

public export
WGPUStencilOperation_DecrementClamp : WGPUStencilOperation
WGPUStencilOperation_DecrementClamp = 0x00000006

public export
WGPUStencilOperation_IncrementWrap : WGPUStencilOperation
WGPUStencilOperation_IncrementWrap = 0x00000007

public export
WGPUStencilOperation_DecrementWrap : WGPUStencilOperation
WGPUStencilOperation_DecrementWrap = 0x00000008

public export
WGPUStencilOperation_Force32 : WGPUStencilOperation
WGPUStencilOperation_Force32 = 0x7FFFFFFF

public export
WGPUStorageTextureAccess : Type
WGPUStorageTextureAccess = Enum

public export
WGPUStorageTextureAccess_BindingNotUsed : WGPUStorageTextureAccess
WGPUStorageTextureAccess_BindingNotUsed = 0x00000000

public export
WGPUStorageTextureAccess_Undefined : WGPUStorageTextureAccess
WGPUStorageTextureAccess_Undefined = 0x00000001

public export
WGPUStorageTextureAccess_WriteOnly : WGPUStorageTextureAccess
WGPUStorageTextureAccess_WriteOnly = 0x00000002

public export
WGPUStorageTextureAccess_ReadOnly : WGPUStorageTextureAccess
WGPUStorageTextureAccess_ReadOnly = 0x00000003

public export
WGPUStorageTextureAccess_ReadWrite : WGPUStorageTextureAccess
WGPUStorageTextureAccess_ReadWrite = 0x00000004

public export
WGPUStorageTextureAccess_Force32 : WGPUStorageTextureAccess
WGPUStorageTextureAccess_Force32 = 0x7FFFFFFF

public export
WGPUStoreOp : Type
WGPUStoreOp = Enum

public export
WGPUStoreOp_Undefined : WGPUStoreOp
WGPUStoreOp_Undefined = 0x00000000

public export
WGPUStoreOp_Store : WGPUStoreOp
WGPUStoreOp_Store = 0x00000001

public export
WGPUStoreOp_Discard : WGPUStoreOp
WGPUStoreOp_Discard = 0x00000002

public export
WGPUStoreOp_Force32 : WGPUStoreOp
WGPUStoreOp_Force32 = 0x7FFFFFFF

public export
WGPUSurfaceGetCurrentTextureStatus : Type
WGPUSurfaceGetCurrentTextureStatus = Enum

public export
WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal = 0x00000001

public export
WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal = 0x00000002

public export
WGPUSurfaceGetCurrentTextureStatus_Timeout : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Timeout = 0x00000003

public export
WGPUSurfaceGetCurrentTextureStatus_Outdated : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Outdated = 0x00000004

public export
WGPUSurfaceGetCurrentTextureStatus_Lost : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Lost = 0x00000005

public export
WGPUSurfaceGetCurrentTextureStatus_OutOfMemory : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_OutOfMemory = 0x00000006

public export
WGPUSurfaceGetCurrentTextureStatus_DeviceLost : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_DeviceLost = 0x00000007

public export
WGPUSurfaceGetCurrentTextureStatus_Error : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Error = 0x00000008

public export
WGPUSurfaceGetCurrentTextureStatus_Force32 : WGPUSurfaceGetCurrentTextureStatus
WGPUSurfaceGetCurrentTextureStatus_Force32 = 0x7FFFFFFF

public export
WGPUTextureAspect : Type
WGPUTextureAspect = Enum

public export
WGPUTextureAspect_Undefined : WGPUTextureAspect
WGPUTextureAspect_Undefined = 0x00000000

public export
WGPUTextureAspect_All : WGPUTextureAspect
WGPUTextureAspect_All = 0x00000001

public export
WGPUTextureAspect_StencilOnly : WGPUTextureAspect
WGPUTextureAspect_StencilOnly = 0x00000002

public export
WGPUTextureAspect_DepthOnly : WGPUTextureAspect
WGPUTextureAspect_DepthOnly = 0x00000003

public export
WGPUTextureAspect_Force32 : WGPUTextureAspect
WGPUTextureAspect_Force32 = 0x7FFFFFFF

public export
WGPUTextureDimension : Type
WGPUTextureDimension = Enum

public export
WGPUTextureDimension_Undefined : WGPUTextureDimension
WGPUTextureDimension_Undefined = 0x00000000

public export
WGPUTextureDimension_1D : WGPUTextureDimension
WGPUTextureDimension_1D = 0x00000001

public export
WGPUTextureDimension_2D : WGPUTextureDimension
WGPUTextureDimension_2D = 0x00000002

public export
WGPUTextureDimension_3D : WGPUTextureDimension
WGPUTextureDimension_3D = 0x00000003

public export
WGPUTextureDimension_Force32 : WGPUTextureDimension
WGPUTextureDimension_Force32 = 0x7FFFFFFF

public export
WGPUTextureFormat : Type
WGPUTextureFormat = Enum

public export
WGPUTextureFormat_Undefined : WGPUTextureFormat
WGPUTextureFormat_Undefined = 0x00000000

public export
WGPUTextureFormat_R8Unorm : WGPUTextureFormat
WGPUTextureFormat_R8Unorm = 0x00000001

public export
WGPUTextureFormat_R8Snorm : WGPUTextureFormat
WGPUTextureFormat_R8Snorm = 0x00000002

public export
WGPUTextureFormat_R8Uint : WGPUTextureFormat
WGPUTextureFormat_R8Uint = 0x00000003

public export
WGPUTextureFormat_R8Sint : WGPUTextureFormat
WGPUTextureFormat_R8Sint = 0x00000004

public export
WGPUTextureFormat_R16Uint : WGPUTextureFormat
WGPUTextureFormat_R16Uint = 0x00000005

public export
WGPUTextureFormat_R16Sint : WGPUTextureFormat
WGPUTextureFormat_R16Sint = 0x00000006

public export
WGPUTextureFormat_R16Float : WGPUTextureFormat
WGPUTextureFormat_R16Float = 0x00000007

public export
WGPUTextureFormat_RG8Unorm : WGPUTextureFormat
WGPUTextureFormat_RG8Unorm = 0x00000008

public export
WGPUTextureFormat_RG8Snorm : WGPUTextureFormat
WGPUTextureFormat_RG8Snorm = 0x00000009

public export
WGPUTextureFormat_RG8Uint : WGPUTextureFormat
WGPUTextureFormat_RG8Uint = 0x0000000A

public export
WGPUTextureFormat_RG8Sint : WGPUTextureFormat
WGPUTextureFormat_RG8Sint = 0x0000000B

public export
WGPUTextureFormat_R32Float : WGPUTextureFormat
WGPUTextureFormat_R32Float = 0x0000000C

public export
WGPUTextureFormat_R32Uint : WGPUTextureFormat
WGPUTextureFormat_R32Uint = 0x0000000D

public export
WGPUTextureFormat_R32Sint : WGPUTextureFormat
WGPUTextureFormat_R32Sint = 0x0000000E

public export
WGPUTextureFormat_RG16Uint : WGPUTextureFormat
WGPUTextureFormat_RG16Uint = 0x0000000F

public export
WGPUTextureFormat_RG16Sint : WGPUTextureFormat
WGPUTextureFormat_RG16Sint = 0x00000010

public export
WGPUTextureFormat_RG16Float : WGPUTextureFormat
WGPUTextureFormat_RG16Float = 0x00000011

public export
WGPUTextureFormat_RGBA8Unorm : WGPUTextureFormat
WGPUTextureFormat_RGBA8Unorm = 0x00000012

public export
WGPUTextureFormat_RGBA8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_RGBA8UnormSrgb = 0x00000013

public export
WGPUTextureFormat_RGBA8Snorm : WGPUTextureFormat
WGPUTextureFormat_RGBA8Snorm = 0x00000014

public export
WGPUTextureFormat_RGBA8Uint : WGPUTextureFormat
WGPUTextureFormat_RGBA8Uint = 0x00000015

public export
WGPUTextureFormat_RGBA8Sint : WGPUTextureFormat
WGPUTextureFormat_RGBA8Sint = 0x00000016

public export
WGPUTextureFormat_BGRA8Unorm : WGPUTextureFormat
WGPUTextureFormat_BGRA8Unorm = 0x00000017

public export
WGPUTextureFormat_BGRA8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BGRA8UnormSrgb = 0x00000018

public export
WGPUTextureFormat_RGB10A2Uint : WGPUTextureFormat
WGPUTextureFormat_RGB10A2Uint = 0x00000019

public export
WGPUTextureFormat_RGB10A2Unorm : WGPUTextureFormat
WGPUTextureFormat_RGB10A2Unorm = 0x0000001A

public export
WGPUTextureFormat_RG11B10Ufloat : WGPUTextureFormat
WGPUTextureFormat_RG11B10Ufloat = 0x0000001B

public export
WGPUTextureFormat_RGB9E5Ufloat : WGPUTextureFormat
WGPUTextureFormat_RGB9E5Ufloat = 0x0000001C

public export
WGPUTextureFormat_RG32Float : WGPUTextureFormat
WGPUTextureFormat_RG32Float = 0x0000001D

public export
WGPUTextureFormat_RG32Uint : WGPUTextureFormat
WGPUTextureFormat_RG32Uint = 0x0000001E

public export
WGPUTextureFormat_RG32Sint : WGPUTextureFormat
WGPUTextureFormat_RG32Sint = 0x0000001F

public export
WGPUTextureFormat_RGBA16Uint : WGPUTextureFormat
WGPUTextureFormat_RGBA16Uint = 0x00000020

public export
WGPUTextureFormat_RGBA16Sint : WGPUTextureFormat
WGPUTextureFormat_RGBA16Sint = 0x00000021

public export
WGPUTextureFormat_RGBA16Float : WGPUTextureFormat
WGPUTextureFormat_RGBA16Float = 0x00000022

public export
WGPUTextureFormat_RGBA32Float : WGPUTextureFormat
WGPUTextureFormat_RGBA32Float = 0x00000023

public export
WGPUTextureFormat_RGBA32Uint : WGPUTextureFormat
WGPUTextureFormat_RGBA32Uint = 0x00000024

public export
WGPUTextureFormat_RGBA32Sint : WGPUTextureFormat
WGPUTextureFormat_RGBA32Sint = 0x00000025

public export
WGPUTextureFormat_Stencil8 : WGPUTextureFormat
WGPUTextureFormat_Stencil8 = 0x00000026

public export
WGPUTextureFormat_Depth16Unorm : WGPUTextureFormat
WGPUTextureFormat_Depth16Unorm = 0x00000027

public export
WGPUTextureFormat_Depth24Plus : WGPUTextureFormat
WGPUTextureFormat_Depth24Plus = 0x00000028

public export
WGPUTextureFormat_Depth24PlusStencil8 : WGPUTextureFormat
WGPUTextureFormat_Depth24PlusStencil8 = 0x00000029

public export
WGPUTextureFormat_Depth32Float : WGPUTextureFormat
WGPUTextureFormat_Depth32Float = 0x0000002A

public export
WGPUTextureFormat_Depth32FloatStencil8 : WGPUTextureFormat
WGPUTextureFormat_Depth32FloatStencil8 = 0x0000002B

public export
WGPUTextureFormat_BC1RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC1RGBAUnorm = 0x0000002C

public export
WGPUTextureFormat_BC1RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC1RGBAUnormSrgb = 0x0000002D

public export
WGPUTextureFormat_BC2RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC2RGBAUnorm = 0x0000002E

public export
WGPUTextureFormat_BC2RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC2RGBAUnormSrgb = 0x0000002F

public export
WGPUTextureFormat_BC3RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC3RGBAUnorm = 0x00000030

public export
WGPUTextureFormat_BC3RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC3RGBAUnormSrgb = 0x00000031

public export
WGPUTextureFormat_BC4RUnorm : WGPUTextureFormat
WGPUTextureFormat_BC4RUnorm = 0x00000032

public export
WGPUTextureFormat_BC4RSnorm : WGPUTextureFormat
WGPUTextureFormat_BC4RSnorm = 0x00000033

public export
WGPUTextureFormat_BC5RGUnorm : WGPUTextureFormat
WGPUTextureFormat_BC5RGUnorm = 0x00000034

public export
WGPUTextureFormat_BC5RGSnorm : WGPUTextureFormat
WGPUTextureFormat_BC5RGSnorm = 0x00000035

public export
WGPUTextureFormat_BC6HRGBUfloat : WGPUTextureFormat
WGPUTextureFormat_BC6HRGBUfloat = 0x00000036

public export
WGPUTextureFormat_BC6HRGBFloat : WGPUTextureFormat
WGPUTextureFormat_BC6HRGBFloat = 0x00000037

public export
WGPUTextureFormat_BC7RGBAUnorm : WGPUTextureFormat
WGPUTextureFormat_BC7RGBAUnorm = 0x00000038

public export
WGPUTextureFormat_BC7RGBAUnormSrgb : WGPUTextureFormat
WGPUTextureFormat_BC7RGBAUnormSrgb = 0x00000039

public export
WGPUTextureFormat_ETC2RGB8Unorm : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8Unorm = 0x0000003A

public export
WGPUTextureFormat_ETC2RGB8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8UnormSrgb = 0x0000003B

public export
WGPUTextureFormat_ETC2RGB8A1Unorm : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8A1Unorm = 0x0000003C

public export
WGPUTextureFormat_ETC2RGB8A1UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ETC2RGB8A1UnormSrgb = 0x0000003D

public export
WGPUTextureFormat_ETC2RGBA8Unorm : WGPUTextureFormat
WGPUTextureFormat_ETC2RGBA8Unorm = 0x0000003E

public export
WGPUTextureFormat_ETC2RGBA8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ETC2RGBA8UnormSrgb = 0x0000003F

public export
WGPUTextureFormat_EACR11Unorm : WGPUTextureFormat
WGPUTextureFormat_EACR11Unorm = 0x00000040

public export
WGPUTextureFormat_EACR11Snorm : WGPUTextureFormat
WGPUTextureFormat_EACR11Snorm = 0x00000041

public export
WGPUTextureFormat_EACRG11Unorm : WGPUTextureFormat
WGPUTextureFormat_EACRG11Unorm = 0x00000042

public export
WGPUTextureFormat_EACRG11Snorm : WGPUTextureFormat
WGPUTextureFormat_EACRG11Snorm = 0x00000043

public export
WGPUTextureFormat_ASTC4x4Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC4x4Unorm = 0x00000044

public export
WGPUTextureFormat_ASTC4x4UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC4x4UnormSrgb = 0x00000045

public export
WGPUTextureFormat_ASTC5x4Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC5x4Unorm = 0x00000046

public export
WGPUTextureFormat_ASTC5x4UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC5x4UnormSrgb = 0x00000047

public export
WGPUTextureFormat_ASTC5x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC5x5Unorm = 0x00000048

public export
WGPUTextureFormat_ASTC5x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC5x5UnormSrgb = 0x00000049

public export
WGPUTextureFormat_ASTC6x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC6x5Unorm = 0x0000004A

public export
WGPUTextureFormat_ASTC6x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC6x5UnormSrgb = 0x0000004B

public export
WGPUTextureFormat_ASTC6x6Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC6x6Unorm = 0x0000004C

public export
WGPUTextureFormat_ASTC6x6UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC6x6UnormSrgb = 0x0000004D

public export
WGPUTextureFormat_ASTC8x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC8x5Unorm = 0x0000004E

public export
WGPUTextureFormat_ASTC8x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC8x5UnormSrgb = 0x0000004F

public export
WGPUTextureFormat_ASTC8x6Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC8x6Unorm = 0x00000050

public export
WGPUTextureFormat_ASTC8x6UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC8x6UnormSrgb = 0x00000051

public export
WGPUTextureFormat_ASTC8x8Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC8x8Unorm = 0x00000052

public export
WGPUTextureFormat_ASTC8x8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC8x8UnormSrgb = 0x00000053

public export
WGPUTextureFormat_ASTC10x5Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x5Unorm = 0x00000054

public export
WGPUTextureFormat_ASTC10x5UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x5UnormSrgb = 0x00000055

public export
WGPUTextureFormat_ASTC10x6Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x6Unorm = 0x00000056

public export
WGPUTextureFormat_ASTC10x6UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x6UnormSrgb = 0x00000057

public export
WGPUTextureFormat_ASTC10x8Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x8Unorm = 0x00000058

public export
WGPUTextureFormat_ASTC10x8UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x8UnormSrgb = 0x00000059

public export
WGPUTextureFormat_ASTC10x10Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC10x10Unorm = 0x0000005A

public export
WGPUTextureFormat_ASTC10x10UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC10x10UnormSrgb = 0x0000005B

public export
WGPUTextureFormat_ASTC12x10Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC12x10Unorm = 0x0000005C

public export
WGPUTextureFormat_ASTC12x10UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC12x10UnormSrgb = 0x0000005D

public export
WGPUTextureFormat_ASTC12x12Unorm : WGPUTextureFormat
WGPUTextureFormat_ASTC12x12Unorm = 0x0000005E

public export
WGPUTextureFormat_ASTC12x12UnormSrgb : WGPUTextureFormat
WGPUTextureFormat_ASTC12x12UnormSrgb = 0x0000005F

public export
WGPUTextureFormat_Force32 : WGPUTextureFormat
WGPUTextureFormat_Force32 = 0x7FFFFFFF

public export
WGPUTextureSampleType : Type
WGPUTextureSampleType = Enum

public export
WGPUTextureSampleType_BindingNotUsed : WGPUTextureSampleType
WGPUTextureSampleType_BindingNotUsed = 0x00000000

public export
WGPUTextureSampleType_Undefined : WGPUTextureSampleType
WGPUTextureSampleType_Undefined = 0x00000001

public export
WGPUTextureSampleType_Float : WGPUTextureSampleType
WGPUTextureSampleType_Float = 0x00000002

public export
WGPUTextureSampleType_UnfilterableFloat : WGPUTextureSampleType
WGPUTextureSampleType_UnfilterableFloat = 0x00000003

public export
WGPUTextureSampleType_Depth : WGPUTextureSampleType
WGPUTextureSampleType_Depth = 0x00000004

public export
WGPUTextureSampleType_Sint : WGPUTextureSampleType
WGPUTextureSampleType_Sint = 0x00000005

public export
WGPUTextureSampleType_Uint : WGPUTextureSampleType
WGPUTextureSampleType_Uint = 0x00000006

public export
WGPUTextureSampleType_Force32 : WGPUTextureSampleType
WGPUTextureSampleType_Force32 = 0x7FFFFFFF

public export
WGPUTextureViewDimension : Type
WGPUTextureViewDimension = Enum

public export
WGPUTextureViewDimension_Undefined : WGPUTextureViewDimension
WGPUTextureViewDimension_Undefined = 0x00000000

public export
WGPUTextureViewDimension_1D : WGPUTextureViewDimension
WGPUTextureViewDimension_1D = 0x00000001

public export
WGPUTextureViewDimension_2D : WGPUTextureViewDimension
WGPUTextureViewDimension_2D = 0x00000002

public export
WGPUTextureViewDimension_2DArray : WGPUTextureViewDimension
WGPUTextureViewDimension_2DArray = 0x00000003

public export
WGPUTextureViewDimension_Cube : WGPUTextureViewDimension
WGPUTextureViewDimension_Cube = 0x00000004

public export
WGPUTextureViewDimension_CubeArray : WGPUTextureViewDimension
WGPUTextureViewDimension_CubeArray = 0x00000005

public export
WGPUTextureViewDimension_3D : WGPUTextureViewDimension
WGPUTextureViewDimension_3D = 0x00000006

public export
WGPUTextureViewDimension_Force32 : WGPUTextureViewDimension
WGPUTextureViewDimension_Force32 = 0x7FFFFFFF

public export
WGPUVertexFormat : Type
WGPUVertexFormat = Enum

public export
WGPUVertexFormat_Uint8 : WGPUVertexFormat
WGPUVertexFormat_Uint8 = 0x00000001

public export
WGPUVertexFormat_Uint8x2 : WGPUVertexFormat
WGPUVertexFormat_Uint8x2 = 0x00000002

public export
WGPUVertexFormat_Uint8x4 : WGPUVertexFormat
WGPUVertexFormat_Uint8x4 = 0x00000003

public export
WGPUVertexFormat_Sint8 : WGPUVertexFormat
WGPUVertexFormat_Sint8 = 0x00000004

public export
WGPUVertexFormat_Sint8x2 : WGPUVertexFormat
WGPUVertexFormat_Sint8x2 = 0x00000005

public export
WGPUVertexFormat_Sint8x4 : WGPUVertexFormat
WGPUVertexFormat_Sint8x4 = 0x00000006

public export
WGPUVertexFormat_Unorm8 : WGPUVertexFormat
WGPUVertexFormat_Unorm8 = 0x00000007

public export
WGPUVertexFormat_Unorm8x2 : WGPUVertexFormat
WGPUVertexFormat_Unorm8x2 = 0x00000008

public export
WGPUVertexFormat_Unorm8x4 : WGPUVertexFormat
WGPUVertexFormat_Unorm8x4 = 0x00000009

public export
WGPUVertexFormat_Snorm8 : WGPUVertexFormat
WGPUVertexFormat_Snorm8 = 0x0000000A

public export
WGPUVertexFormat_Snorm8x2 : WGPUVertexFormat
WGPUVertexFormat_Snorm8x2 = 0x0000000B

public export
WGPUVertexFormat_Snorm8x4 : WGPUVertexFormat
WGPUVertexFormat_Snorm8x4 = 0x0000000C

public export
WGPUVertexFormat_Uint16 : WGPUVertexFormat
WGPUVertexFormat_Uint16 = 0x0000000D

public export
WGPUVertexFormat_Uint16x2 : WGPUVertexFormat
WGPUVertexFormat_Uint16x2 = 0x0000000E

public export
WGPUVertexFormat_Uint16x4 : WGPUVertexFormat
WGPUVertexFormat_Uint16x4 = 0x0000000F

public export
WGPUVertexFormat_Sint16 : WGPUVertexFormat
WGPUVertexFormat_Sint16 = 0x00000010

public export
WGPUVertexFormat_Sint16x2 : WGPUVertexFormat
WGPUVertexFormat_Sint16x2 = 0x00000011

public export
WGPUVertexFormat_Sint16x4 : WGPUVertexFormat
WGPUVertexFormat_Sint16x4 = 0x00000012

public export
WGPUVertexFormat_Unorm16 : WGPUVertexFormat
WGPUVertexFormat_Unorm16 = 0x00000013

public export
WGPUVertexFormat_Unorm16x2 : WGPUVertexFormat
WGPUVertexFormat_Unorm16x2 = 0x00000014

public export
WGPUVertexFormat_Unorm16x4 : WGPUVertexFormat
WGPUVertexFormat_Unorm16x4 = 0x00000015

public export
WGPUVertexFormat_Snorm16 : WGPUVertexFormat
WGPUVertexFormat_Snorm16 = 0x00000016

public export
WGPUVertexFormat_Snorm16x2 : WGPUVertexFormat
WGPUVertexFormat_Snorm16x2 = 0x00000017

public export
WGPUVertexFormat_Snorm16x4 : WGPUVertexFormat
WGPUVertexFormat_Snorm16x4 = 0x00000018

public export
WGPUVertexFormat_Float16 : WGPUVertexFormat
WGPUVertexFormat_Float16 = 0x00000019

public export
WGPUVertexFormat_Float16x2 : WGPUVertexFormat
WGPUVertexFormat_Float16x2 = 0x0000001A

public export
WGPUVertexFormat_Float16x4 : WGPUVertexFormat
WGPUVertexFormat_Float16x4 = 0x0000001B

public export
WGPUVertexFormat_Float32 : WGPUVertexFormat
WGPUVertexFormat_Float32 = 0x0000001C

public export
WGPUVertexFormat_Float32x2 : WGPUVertexFormat
WGPUVertexFormat_Float32x2 = 0x0000001D

public export
WGPUVertexFormat_Float32x3 : WGPUVertexFormat
WGPUVertexFormat_Float32x3 = 0x0000001E

public export
WGPUVertexFormat_Float32x4 : WGPUVertexFormat
WGPUVertexFormat_Float32x4 = 0x0000001F

public export
WGPUVertexFormat_Uint32 : WGPUVertexFormat
WGPUVertexFormat_Uint32 = 0x00000020

public export
WGPUVertexFormat_Uint32x2 : WGPUVertexFormat
WGPUVertexFormat_Uint32x2 = 0x00000021

public export
WGPUVertexFormat_Uint32x3 : WGPUVertexFormat
WGPUVertexFormat_Uint32x3 = 0x00000022

public export
WGPUVertexFormat_Uint32x4 : WGPUVertexFormat
WGPUVertexFormat_Uint32x4 = 0x00000023

public export
WGPUVertexFormat_Sint32 : WGPUVertexFormat
WGPUVertexFormat_Sint32 = 0x00000024

public export
WGPUVertexFormat_Sint32x2 : WGPUVertexFormat
WGPUVertexFormat_Sint32x2 = 0x00000025

public export
WGPUVertexFormat_Sint32x3 : WGPUVertexFormat
WGPUVertexFormat_Sint32x3 = 0x00000026

public export
WGPUVertexFormat_Sint32x4 : WGPUVertexFormat
WGPUVertexFormat_Sint32x4 = 0x00000027

public export
WGPUVertexFormat_Unorm10_10_10_2 : WGPUVertexFormat
WGPUVertexFormat_Unorm10_10_10_2 = 0x00000028

public export
WGPUVertexFormat_Unorm8x4BGRA : WGPUVertexFormat
WGPUVertexFormat_Unorm8x4BGRA = 0x00000029

public export
WGPUVertexFormat_Force32 : WGPUVertexFormat
WGPUVertexFormat_Force32 = 0x7FFFFFFF

public export
WGPUVertexStepMode : Type
WGPUVertexStepMode = Enum

public export
WGPUVertexStepMode_VertexBufferNotUsed : WGPUVertexStepMode
WGPUVertexStepMode_VertexBufferNotUsed = 0x00000000

public export
WGPUVertexStepMode_Undefined : WGPUVertexStepMode
WGPUVertexStepMode_Undefined = 0x00000001

public export
WGPUVertexStepMode_Vertex : WGPUVertexStepMode
WGPUVertexStepMode_Vertex = 0x00000002

public export
WGPUVertexStepMode_Instance : WGPUVertexStepMode
WGPUVertexStepMode_Instance = 0x00000003

public export
WGPUVertexStepMode_Force32 : WGPUVertexStepMode
WGPUVertexStepMode_Force32 = 0x7FFFFFFF

public export
WGPUWGSLLanguageFeatureName : Type
WGPUWGSLLanguageFeatureName = Enum

public export
WGPUWGSLLanguageFeatureName_ReadonlyAndReadwriteStorageTextures : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_ReadonlyAndReadwriteStorageTextures = 0x00000001

public export
WGPUWGSLLanguageFeatureName_Packed4x8IntegerDotProduct : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_Packed4x8IntegerDotProduct = 0x00000002

public export
WGPUWGSLLanguageFeatureName_UnrestrictedPointerParameters : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_UnrestrictedPointerParameters = 0x00000003

public export
WGPUWGSLLanguageFeatureName_PointerCompositeAccess : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_PointerCompositeAccess = 0x00000004

public export
WGPUWGSLLanguageFeatureName_Force32 : WGPUWGSLLanguageFeatureName
WGPUWGSLLanguageFeatureName_Force32 = 0x7FFFFFFF

public export
WGPUWaitStatus : Type
WGPUWaitStatus = Enum

public export
WGPUWaitStatus_Success : WGPUWaitStatus
WGPUWaitStatus_Success = 0x00000001

public export
WGPUWaitStatus_TimedOut : WGPUWaitStatus
WGPUWaitStatus_TimedOut = 0x00000002

public export
WGPUWaitStatus_UnsupportedTimeout : WGPUWaitStatus
WGPUWaitStatus_UnsupportedTimeout = 0x00000003

public export
WGPUWaitStatus_UnsupportedCount : WGPUWaitStatus
WGPUWaitStatus_UnsupportedCount = 0x00000004

public export
WGPUWaitStatus_UnsupportedMixedSources : WGPUWaitStatus
WGPUWaitStatus_UnsupportedMixedSources = 0x00000005

public export
WGPUWaitStatus_Force32 : WGPUWaitStatus
WGPUWaitStatus_Force32 = 0x7FFFFFFF

public export
WGPUBufferUsage : Type
WGPUBufferUsage = WGPUFlags

WGPUBufferUsage_None : WGPUBufferUsage
WGPUBufferUsage_None = 0x0000000000000000

WGPUBufferUsage_MapRead : WGPUBufferUsage
WGPUBufferUsage_MapRead = 0x0000000000000001

WGPUBufferUsage_MapWrite : WGPUBufferUsage
WGPUBufferUsage_MapWrite = 0x0000000000000002

WGPUBufferUsage_CopySrc : WGPUBufferUsage
WGPUBufferUsage_CopySrc = 0x0000000000000004

WGPUBufferUsage_CopyDst : WGPUBufferUsage
WGPUBufferUsage_CopyDst = 0x0000000000000008

WGPUBufferUsage_Index : WGPUBufferUsage
WGPUBufferUsage_Index = 0x0000000000000010

WGPUBufferUsage_Vertex : WGPUBufferUsage
WGPUBufferUsage_Vertex = 0x0000000000000020

WGPUBufferUsage_Uniform : WGPUBufferUsage
WGPUBufferUsage_Uniform = 0x0000000000000040

WGPUBufferUsage_Storage : WGPUBufferUsage
WGPUBufferUsage_Storage = 0x0000000000000080

WGPUBufferUsage_Indirect : WGPUBufferUsage
WGPUBufferUsage_Indirect = 0x0000000000000100

WGPUBufferUsage_QueryResolve : WGPUBufferUsage
WGPUBufferUsage_QueryResolve = 0x0000000000000200

public export
WGPUColorWriteMask : Type
WGPUColorWriteMask = WGPUFlags

WGPUColorWriteMask_None : WGPUColorWriteMask
WGPUColorWriteMask_None = 0x0000000000000000

WGPUColorWriteMask_Red : WGPUColorWriteMask
WGPUColorWriteMask_Red = 0x0000000000000001

WGPUColorWriteMask_Green : WGPUColorWriteMask
WGPUColorWriteMask_Green = 0x0000000000000002

WGPUColorWriteMask_Blue : WGPUColorWriteMask
WGPUColorWriteMask_Blue = 0x0000000000000004

WGPUColorWriteMask_Alpha : WGPUColorWriteMask
WGPUColorWriteMask_Alpha = 0x0000000000000008

WGPUColorWriteMask_All : WGPUColorWriteMask
WGPUColorWriteMask_All = 0x000000000000000F

public export
WGPUMapMode : Type
WGPUMapMode = WGPUFlags

WGPUMapMode_None : WGPUMapMode
WGPUMapMode_None = 0x0000000000000000

WGPUMapMode_Read : WGPUMapMode
WGPUMapMode_Read = 0x0000000000000001

WGPUMapMode_Write : WGPUMapMode
WGPUMapMode_Write = 0x0000000000000002

public export
WGPUShaderStage : Type
WGPUShaderStage = WGPUFlags

WGPUShaderStage_None : WGPUShaderStage
WGPUShaderStage_None = 0x0000000000000000

WGPUShaderStage_Vertex : WGPUShaderStage
WGPUShaderStage_Vertex = 0x0000000000000001

WGPUShaderStage_Fragment : WGPUShaderStage
WGPUShaderStage_Fragment = 0x0000000000000002

WGPUShaderStage_Compute : WGPUShaderStage
WGPUShaderStage_Compute = 0x0000000000000004

public export
WGPUTextureUsage : Type
WGPUTextureUsage = WGPUFlags

WGPUTextureUsage_None : WGPUTextureUsage
WGPUTextureUsage_None = 0x0000000000000000

WGPUTextureUsage_CopySrc : WGPUTextureUsage
WGPUTextureUsage_CopySrc = 0x0000000000000001

WGPUTextureUsage_CopyDst : WGPUTextureUsage
WGPUTextureUsage_CopyDst = 0x0000000000000002

WGPUTextureUsage_TextureBinding : WGPUTextureUsage
WGPUTextureUsage_TextureBinding = 0x0000000000000004

WGPUTextureUsage_StorageBinding : WGPUTextureUsage
WGPUTextureUsage_StorageBinding = 0x0000000000000008

WGPUTextureUsage_RenderAttachment : WGPUTextureUsage
WGPUTextureUsage_RenderAttachment = 0x0000000000000010

public export
WGPUProc : Type
WGPUProc = Ptr (() -> ())

public export
WGPUBufferMapCallback : Type
WGPUBufferMapCallback = Ptr (WGPUMapAsyncStatus -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUCompilationInfoCallback : Type
WGPUCompilationInfoCallback = Ptr (WGPUCompilationInfoRequestStatus -> Ptr (Struct "WGPUCompilationInfo" []) -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUCreateComputePipelineAsyncCallback : Type
WGPUCreateComputePipelineAsyncCallback = Ptr (WGPUCreatePipelineAsyncStatus -> WGPUComputePipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUCreateRenderPipelineAsyncCallback : Type
WGPUCreateRenderPipelineAsyncCallback = Ptr (WGPUCreatePipelineAsyncStatus -> WGPURenderPipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUDeviceLostCallback : Type
WGPUDeviceLostCallback = Ptr (Ptr (WGPUDevice) -> WGPUDeviceLostReason -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUPopErrorScopeCallback : Type
WGPUPopErrorScopeCallback = Ptr (WGPUPopErrorScopeStatus -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUQueueWorkDoneCallback : Type
WGPUQueueWorkDoneCallback = Ptr (WGPUQueueWorkDoneStatus -> Ptr (()) -> Ptr (()) -> ())

public export
WGPURequestAdapterCallback : Type
WGPURequestAdapterCallback = Ptr (WGPURequestAdapterStatus -> WGPUAdapter -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPURequestDeviceCallback : Type
WGPURequestDeviceCallback = Ptr (WGPURequestDeviceStatus -> WGPUDevice -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUUncapturedErrorCallback : Type
WGPUUncapturedErrorCallback = Ptr (Ptr (WGPUDevice) -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> ())

public export
WGPUChainedStruct : Type
WGPUChainedStruct = Struct "WGPUChainedStruct" [("next", Ptr (Struct "WGPUChainedStruct" [])),("sType",  (WGPUSType))]

public export
WGPUChainedStructOut : Type
WGPUChainedStructOut = Struct "WGPUChainedStructOut" [("next", Ptr (Struct "WGPUChainedStructOut" [])),("sType",  (WGPUSType))]

public export
WGPUBufferMapCallbackInfo : Type
WGPUBufferMapCallbackInfo = Struct "WGPUBufferMapCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUBufferMapCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUCompilationInfoCallbackInfo : Type
WGPUCompilationInfoCallbackInfo = Struct "WGPUCompilationInfoCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCompilationInfoCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUCreateComputePipelineAsyncCallbackInfo : Type
WGPUCreateComputePipelineAsyncCallbackInfo = Struct "WGPUCreateComputePipelineAsyncCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCreateComputePipelineAsyncCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUCreateRenderPipelineAsyncCallbackInfo : Type
WGPUCreateRenderPipelineAsyncCallbackInfo = Struct "WGPUCreateRenderPipelineAsyncCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCreateRenderPipelineAsyncCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUDeviceLostCallbackInfo : Type
WGPUDeviceLostCallbackInfo = Struct "WGPUDeviceLostCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUDeviceLostCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUPopErrorScopeCallbackInfo : Type
WGPUPopErrorScopeCallbackInfo = Struct "WGPUPopErrorScopeCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUPopErrorScopeCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUQueueWorkDoneCallbackInfo : Type
WGPUQueueWorkDoneCallbackInfo = Struct "WGPUQueueWorkDoneCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUQueueWorkDoneCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPURequestAdapterCallbackInfo : Type
WGPURequestAdapterCallbackInfo = Struct "WGPURequestAdapterCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPURequestAdapterCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPURequestDeviceCallbackInfo : Type
WGPURequestDeviceCallbackInfo = Struct "WGPURequestDeviceCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPURequestDeviceCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUUncapturedErrorCallbackInfo : Type
WGPUUncapturedErrorCallbackInfo = Struct "WGPUUncapturedErrorCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("callback",  (WGPUUncapturedErrorCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

public export
WGPUAdapterInfo : Type
WGPUAdapterInfo = Struct "WGPUAdapterInfo" [("nextInChain", Ptr (WGPUChainedStructOut)),("vendor",  (WGPUStringView)),("architecture",  (WGPUStringView)),("device",  (WGPUStringView)),("description",  (WGPUStringView)),("backendType",  (WGPUBackendType)),("adapterType",  (WGPUAdapterType)),("vendorID",  (U32)),("deviceID",  (U32))]

public export
WGPUBindGroupEntry : Type
WGPUBindGroupEntry = Struct "WGPUBindGroupEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("binding",  (U32)),("buffer",  (WGPUBuffer)),("offset",  (U64)),("size",  (U64)),("sampler",  (WGPUSampler)),("textureView",  (WGPUTextureView))]

public export
WGPUBlendComponent : Type
WGPUBlendComponent = Struct "WGPUBlendComponent" [("operation",  (WGPUBlendOperation)),("srcFactor",  (WGPUBlendFactor)),("dstFactor",  (WGPUBlendFactor))]

public export
WGPUBufferBindingLayout : Type
WGPUBufferBindingLayout = Struct "WGPUBufferBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("type",  (WGPUBufferBindingType)),("hasDynamicOffset",  (WGPUBool)),("minBindingSize",  (U64))]

public export
WGPUBufferDescriptor : Type
WGPUBufferDescriptor = Struct "WGPUBufferDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("usage",  (WGPUBufferUsage)),("size",  (U64)),("mappedAtCreation",  (WGPUBool))]

public export
WGPUColor : Type
WGPUColor = Struct "WGPUColor" [("r",  (F64)),("g",  (F64)),("b",  (F64)),("a",  (F64))]

public export
WGPUCommandBufferDescriptor : Type
WGPUCommandBufferDescriptor = Struct "WGPUCommandBufferDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

public export
WGPUCommandEncoderDescriptor : Type
WGPUCommandEncoderDescriptor = Struct "WGPUCommandEncoderDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

public export
WGPUCompilationMessage : Type
WGPUCompilationMessage = Struct "WGPUCompilationMessage" [("nextInChain", Ptr (WGPUChainedStruct)),("message",  (WGPUStringView)),("type",  (WGPUCompilationMessageType)),("lineNum",  (U64)),("linePos",  (U64)),("offset",  (U64)),("length",  (U64))]

public export
WGPUComputePassTimestampWrites : Type
WGPUComputePassTimestampWrites = Struct "WGPUComputePassTimestampWrites" [("querySet",  (WGPUQuerySet)),("beginningOfPassWriteIndex",  (U32)),("endOfPassWriteIndex",  (U32))]

public export
WGPUConstantEntry : Type
WGPUConstantEntry = Struct "WGPUConstantEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("key",  (WGPUStringView)),("value",  (F64))]

public export
WGPUExtent3D : Type
WGPUExtent3D = Struct "WGPUExtent3D" [("width",  (U32)),("height",  (U32)),("depthOrArrayLayers",  (U32))]

public export
WGPUFuture : Type
WGPUFuture = Struct "WGPUFuture" [("id",  (U64))]

public export
WGPUInstanceCapabilities : Type
WGPUInstanceCapabilities = Struct "WGPUInstanceCapabilities" [("nextInChain", Ptr (WGPUChainedStructOut)),("timedWaitAnyEnable",  (WGPUBool)),("timedWaitAnyMaxCount",  (U64))]

public export
WGPULimits : Type
WGPULimits = Struct "WGPULimits" [("nextInChain", Ptr (WGPUChainedStructOut)),("maxTextureDimension1D",  (U32)),("maxTextureDimension2D",  (U32)),("maxTextureDimension3D",  (U32)),("maxTextureArrayLayers",  (U32)),("maxBindGroups",  (U32)),("maxBindGroupsPlusVertexBuffers",  (U32)),("maxBindingsPerBindGroup",  (U32)),("maxDynamicUniformBuffersPerPipelineLayout",  (U32)),("maxDynamicStorageBuffersPerPipelineLayout",  (U32)),("maxSampledTexturesPerShaderStage",  (U32)),("maxSamplersPerShaderStage",  (U32)),("maxStorageBuffersPerShaderStage",  (U32)),("maxStorageTexturesPerShaderStage",  (U32)),("maxUniformBuffersPerShaderStage",  (U32)),("maxUniformBufferBindingSize",  (U64)),("maxStorageBufferBindingSize",  (U64)),("minUniformBufferOffsetAlignment",  (U32)),("minStorageBufferOffsetAlignment",  (U32)),("maxVertexBuffers",  (U32)),("maxBufferSize",  (U64)),("maxVertexAttributes",  (U32)),("maxVertexBufferArrayStride",  (U32)),("maxInterStageShaderVariables",  (U32)),("maxColorAttachments",  (U32)),("maxColorAttachmentBytesPerSample",  (U32)),("maxComputeWorkgroupStorageSize",  (U32)),("maxComputeInvocationsPerWorkgroup",  (U32)),("maxComputeWorkgroupSizeX",  (U32)),("maxComputeWorkgroupSizeY",  (U32)),("maxComputeWorkgroupSizeZ",  (U32)),("maxComputeWorkgroupsPerDimension",  (U32))]

public export
WGPUMultisampleState : Type
WGPUMultisampleState = Struct "WGPUMultisampleState" [("nextInChain", Ptr (WGPUChainedStruct)),("count",  (U32)),("mask",  (U32)),("alphaToCoverageEnabled",  (WGPUBool))]

public export
WGPUOrigin3D : Type
WGPUOrigin3D = Struct "WGPUOrigin3D" [("x",  (U32)),("y",  (U32)),("z",  (U32))]

public export
WGPUPipelineLayoutDescriptor : Type
WGPUPipelineLayoutDescriptor = Struct "WGPUPipelineLayoutDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("bindGroupLayoutCount",  (U64)),("bindGroupLayouts", Ptr (WGPUBindGroupLayout))]

public export
WGPUPrimitiveState : Type
WGPUPrimitiveState = Struct "WGPUPrimitiveState" [("nextInChain", Ptr (WGPUChainedStruct)),("topology",  (WGPUPrimitiveTopology)),("stripIndexFormat",  (WGPUIndexFormat)),("frontFace",  (WGPUFrontFace)),("cullMode",  (WGPUCullMode)),("unclippedDepth",  (WGPUBool))]

public export
WGPUQuerySetDescriptor : Type
WGPUQuerySetDescriptor = Struct "WGPUQuerySetDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("type",  (WGPUQueryType)),("count",  (U32))]

public export
WGPUQueueDescriptor : Type
WGPUQueueDescriptor = Struct "WGPUQueueDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

public export
WGPURenderBundleDescriptor : Type
WGPURenderBundleDescriptor = Struct "WGPURenderBundleDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

public export
WGPURenderBundleEncoderDescriptor : Type
WGPURenderBundleEncoderDescriptor = Struct "WGPURenderBundleEncoderDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("colorFormatCount",  (U64)),("colorFormats", Ptr (WGPUTextureFormat)),("depthStencilFormat",  (WGPUTextureFormat)),("sampleCount",  (U32)),("depthReadOnly",  (WGPUBool)),("stencilReadOnly",  (WGPUBool))]

public export
WGPURenderPassDepthStencilAttachment : Type
WGPURenderPassDepthStencilAttachment = Struct "WGPURenderPassDepthStencilAttachment" [("view",  (WGPUTextureView)),("depthLoadOp",  (WGPULoadOp)),("depthStoreOp",  (WGPUStoreOp)),("depthClearValue",  (F32)),("depthReadOnly",  (WGPUBool)),("stencilLoadOp",  (WGPULoadOp)),("stencilStoreOp",  (WGPUStoreOp)),("stencilClearValue",  (U32)),("stencilReadOnly",  (WGPUBool))]

public export
WGPURenderPassMaxDrawCount : Type
WGPURenderPassMaxDrawCount = Struct "WGPURenderPassMaxDrawCount" [("chain",  (WGPUChainedStruct)),("maxDrawCount",  (U64))]

public export
WGPURenderPassTimestampWrites : Type
WGPURenderPassTimestampWrites = Struct "WGPURenderPassTimestampWrites" [("querySet",  (WGPUQuerySet)),("beginningOfPassWriteIndex",  (U32)),("endOfPassWriteIndex",  (U32))]

public export
WGPURequestAdapterOptions : Type
WGPURequestAdapterOptions = Struct "WGPURequestAdapterOptions" [("nextInChain", Ptr (WGPUChainedStruct)),("featureLevel",  (WGPUFeatureLevel)),("powerPreference",  (WGPUPowerPreference)),("forceFallbackAdapter",  (WGPUBool)),("backendType",  (WGPUBackendType)),("compatibleSurface",  (WGPUSurface))]

public export
WGPUSamplerBindingLayout : Type
WGPUSamplerBindingLayout = Struct "WGPUSamplerBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("type",  (WGPUSamplerBindingType))]

public export
WGPUSamplerDescriptor : Type
WGPUSamplerDescriptor = Struct "WGPUSamplerDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("addressModeU",  (WGPUAddressMode)),("addressModeV",  (WGPUAddressMode)),("addressModeW",  (WGPUAddressMode)),("magFilter",  (WGPUFilterMode)),("minFilter",  (WGPUFilterMode)),("mipmapFilter",  (WGPUMipmapFilterMode)),("lodMinClamp",  (F32)),("lodMaxClamp",  (F32)),("compare",  (WGPUCompareFunction)),("maxAnisotropy",  (U16))]

public export
WGPUShaderModuleDescriptor : Type
WGPUShaderModuleDescriptor = Struct "WGPUShaderModuleDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

public export
WGPUShaderSourceSPIRV : Type
WGPUShaderSourceSPIRV = Struct "WGPUShaderSourceSPIRV" [("chain",  (WGPUChainedStruct)),("codeSize",  (U32)),("code", Ptr (U32))]

public export
WGPUShaderSourceWGSL : Type
WGPUShaderSourceWGSL = Struct "WGPUShaderSourceWGSL" [("chain",  (WGPUChainedStruct)),("code",  (WGPUStringView))]

public export
WGPUStencilFaceState : Type
WGPUStencilFaceState = Struct "WGPUStencilFaceState" [("compare",  (WGPUCompareFunction)),("failOp",  (WGPUStencilOperation)),("depthFailOp",  (WGPUStencilOperation)),("passOp",  (WGPUStencilOperation))]

public export
WGPUStorageTextureBindingLayout : Type
WGPUStorageTextureBindingLayout = Struct "WGPUStorageTextureBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("access",  (WGPUStorageTextureAccess)),("format",  (WGPUTextureFormat)),("viewDimension",  (WGPUTextureViewDimension))]

public export
WGPUSupportedFeatures : Type
WGPUSupportedFeatures = Struct "WGPUSupportedFeatures" [("featureCount",  (U64)),("features", Ptr (WGPUFeatureName))]

public export
WGPUSupportedWGSLLanguageFeatures : Type
WGPUSupportedWGSLLanguageFeatures = Struct "WGPUSupportedWGSLLanguageFeatures" [("featureCount",  (U64)),("features", Ptr (WGPUWGSLLanguageFeatureName))]

public export
WGPUSurfaceCapabilities : Type
WGPUSurfaceCapabilities = Struct "WGPUSurfaceCapabilities" [("nextInChain", Ptr (WGPUChainedStructOut)),("usages",  (WGPUTextureUsage)),("formatCount",  (U64)),("formats", Ptr (WGPUTextureFormat)),("presentModeCount",  (U64)),("presentModes", Ptr (WGPUPresentMode)),("alphaModeCount",  (U64)),("alphaModes", Ptr (WGPUCompositeAlphaMode))]

public export
WGPUSurfaceConfiguration : Type
WGPUSurfaceConfiguration = Struct "WGPUSurfaceConfiguration" [("nextInChain", Ptr (WGPUChainedStruct)),("device",  (WGPUDevice)),("format",  (WGPUTextureFormat)),("usage",  (WGPUTextureUsage)),("width",  (U32)),("height",  (U32)),("viewFormatCount",  (U64)),("viewFormats", Ptr (WGPUTextureFormat)),("alphaMode",  (WGPUCompositeAlphaMode)),("presentMode",  (WGPUPresentMode))]

public export
WGPUSurfaceDescriptor : Type
WGPUSurfaceDescriptor = Struct "WGPUSurfaceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

public export
WGPUSurfaceSourceAndroidNativeWindow : Type
WGPUSurfaceSourceAndroidNativeWindow = Struct "WGPUSurfaceSourceAndroidNativeWindow" [("chain",  (WGPUChainedStruct)),("window", Ptr (()))]

public export
WGPUSurfaceSourceMetalLayer : Type
WGPUSurfaceSourceMetalLayer = Struct "WGPUSurfaceSourceMetalLayer" [("chain",  (WGPUChainedStruct)),("layer", Ptr (()))]

public export
WGPUSurfaceSourceWaylandSurface : Type
WGPUSurfaceSourceWaylandSurface = Struct "WGPUSurfaceSourceWaylandSurface" [("chain",  (WGPUChainedStruct)),("display", Ptr (())),("surface", Ptr (()))]

public export
WGPUSurfaceSourceWindowsHWND : Type
WGPUSurfaceSourceWindowsHWND = Struct "WGPUSurfaceSourceWindowsHWND" [("chain",  (WGPUChainedStruct)),("hinstance", Ptr (())),("hwnd", Ptr (()))]

public export
WGPUSurfaceSourceXCBWindow : Type
WGPUSurfaceSourceXCBWindow = Struct "WGPUSurfaceSourceXCBWindow" [("chain",  (WGPUChainedStruct)),("connection", Ptr (())),("window",  (U32))]

public export
WGPUSurfaceSourceXlibWindow : Type
WGPUSurfaceSourceXlibWindow = Struct "WGPUSurfaceSourceXlibWindow" [("chain",  (WGPUChainedStruct)),("display", Ptr (())),("window",  (U64))]

public export
WGPUSurfaceTexture : Type
WGPUSurfaceTexture = Struct "WGPUSurfaceTexture" [("nextInChain", Ptr (WGPUChainedStructOut)),("texture",  (WGPUTexture)),("status",  (WGPUSurfaceGetCurrentTextureStatus))]

public export
WGPUTexelCopyBufferLayout : Type
WGPUTexelCopyBufferLayout = Struct "WGPUTexelCopyBufferLayout" [("offset",  (U64)),("bytesPerRow",  (U32)),("rowsPerImage",  (U32))]

public export
WGPUTextureBindingLayout : Type
WGPUTextureBindingLayout = Struct "WGPUTextureBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("sampleType",  (WGPUTextureSampleType)),("viewDimension",  (WGPUTextureViewDimension)),("multisampled",  (WGPUBool))]

public export
WGPUTextureViewDescriptor : Type
WGPUTextureViewDescriptor = Struct "WGPUTextureViewDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("format",  (WGPUTextureFormat)),("dimension",  (WGPUTextureViewDimension)),("baseMipLevel",  (U32)),("mipLevelCount",  (U32)),("baseArrayLayer",  (U32)),("arrayLayerCount",  (U32)),("aspect",  (WGPUTextureAspect)),("usage",  (WGPUTextureUsage))]

public export
WGPUVertexAttribute : Type
WGPUVertexAttribute = Struct "WGPUVertexAttribute" [("format",  (WGPUVertexFormat)),("offset",  (U64)),("shaderLocation",  (U32))]

public export
WGPUBindGroupDescriptor : Type
WGPUBindGroupDescriptor = Struct "WGPUBindGroupDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUBindGroupLayout)),("entryCount",  (U64)),("entries", Ptr (WGPUBindGroupEntry))]

public export
WGPUBindGroupLayoutEntry : Type
WGPUBindGroupLayoutEntry = Struct "WGPUBindGroupLayoutEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("binding",  (U32)),("visibility",  (WGPUShaderStage)),("buffer",  (WGPUBufferBindingLayout)),("sampler",  (WGPUSamplerBindingLayout)),("texture",  (WGPUTextureBindingLayout)),("storageTexture",  (WGPUStorageTextureBindingLayout))]

public export
WGPUBlendState : Type
WGPUBlendState = Struct "WGPUBlendState" [("color",  (WGPUBlendComponent)),("alpha",  (WGPUBlendComponent))]

public export
WGPUCompilationInfo : Type
WGPUCompilationInfo = Struct "WGPUCompilationInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("messageCount",  (U64)),("messages", Ptr (WGPUCompilationMessage))]

public export
WGPUComputePassDescriptor : Type
WGPUComputePassDescriptor = Struct "WGPUComputePassDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("timestampWrites", Ptr (WGPUComputePassTimestampWrites))]

public export
WGPUDepthStencilState : Type
WGPUDepthStencilState = Struct "WGPUDepthStencilState" [("nextInChain", Ptr (WGPUChainedStruct)),("format",  (WGPUTextureFormat)),("depthWriteEnabled",  (WGPUOptionalBool)),("depthCompare",  (WGPUCompareFunction)),("stencilFront",  (WGPUStencilFaceState)),("stencilBack",  (WGPUStencilFaceState)),("stencilReadMask",  (U32)),("stencilWriteMask",  (U32)),("depthBias",  (I32)),("depthBiasSlopeScale",  (F32)),("depthBiasClamp",  (F32))]

public export
WGPUDeviceDescriptor : Type
WGPUDeviceDescriptor = Struct "WGPUDeviceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("requiredFeatureCount",  (U64)),("requiredFeatures", Ptr (WGPUFeatureName)),("requiredLimits", Ptr (WGPULimits)),("defaultQueue",  (WGPUQueueDescriptor)),("deviceLostCallbackInfo",  (WGPUDeviceLostCallbackInfo)),("uncapturedErrorCallbackInfo",  (WGPUUncapturedErrorCallbackInfo))]

public export
WGPUFutureWaitInfo : Type
WGPUFutureWaitInfo = Struct "WGPUFutureWaitInfo" [("future",  (WGPUFuture)),("completed",  (WGPUBool))]

public export
WGPUInstanceDescriptor : Type
WGPUInstanceDescriptor = Struct "WGPUInstanceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("features",  (WGPUInstanceCapabilities))]

public export
WGPUProgrammableStageDescriptor : Type
WGPUProgrammableStageDescriptor = Struct "WGPUProgrammableStageDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (U64)),("constants", Ptr (WGPUConstantEntry))]

public export
WGPURenderPassColorAttachment : Type
WGPURenderPassColorAttachment = Struct "WGPURenderPassColorAttachment" [("nextInChain", Ptr (WGPUChainedStruct)),("view",  (WGPUTextureView)),("depthSlice",  (U32)),("resolveTarget",  (WGPUTextureView)),("loadOp",  (WGPULoadOp)),("storeOp",  (WGPUStoreOp)),("clearValue",  (WGPUColor))]

public export
WGPUTexelCopyBufferInfo : Type
WGPUTexelCopyBufferInfo = Struct "WGPUTexelCopyBufferInfo" [("layout",  (WGPUTexelCopyBufferLayout)),("buffer",  (WGPUBuffer))]

public export
WGPUTexelCopyTextureInfo : Type
WGPUTexelCopyTextureInfo = Struct "WGPUTexelCopyTextureInfo" [("texture",  (WGPUTexture)),("mipLevel",  (U32)),("origin",  (WGPUOrigin3D)),("aspect",  (WGPUTextureAspect))]

public export
WGPUTextureDescriptor : Type
WGPUTextureDescriptor = Struct "WGPUTextureDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("usage",  (WGPUTextureUsage)),("dimension",  (WGPUTextureDimension)),("size",  (WGPUExtent3D)),("format",  (WGPUTextureFormat)),("mipLevelCount",  (U32)),("sampleCount",  (U32)),("viewFormatCount",  (U64)),("viewFormats", Ptr (WGPUTextureFormat))]

public export
WGPUVertexBufferLayout : Type
WGPUVertexBufferLayout = Struct "WGPUVertexBufferLayout" [("stepMode",  (WGPUVertexStepMode)),("arrayStride",  (U64)),("attributeCount",  (U64)),("attributes", Ptr (WGPUVertexAttribute))]

public export
WGPUBindGroupLayoutDescriptor : Type
WGPUBindGroupLayoutDescriptor = Struct "WGPUBindGroupLayoutDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("entryCount",  (U64)),("entries", Ptr (WGPUBindGroupLayoutEntry))]

public export
WGPUColorTargetState : Type
WGPUColorTargetState = Struct "WGPUColorTargetState" [("nextInChain", Ptr (WGPUChainedStruct)),("format",  (WGPUTextureFormat)),("blend", Ptr (WGPUBlendState)),("writeMask",  (WGPUColorWriteMask))]

public export
WGPUComputePipelineDescriptor : Type
WGPUComputePipelineDescriptor = Struct "WGPUComputePipelineDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUPipelineLayout)),("compute",  (WGPUProgrammableStageDescriptor))]

public export
WGPURenderPassDescriptor : Type
WGPURenderPassDescriptor = Struct "WGPURenderPassDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("colorAttachmentCount",  (U64)),("colorAttachments", Ptr (WGPURenderPassColorAttachment)),("depthStencilAttachment", Ptr (WGPURenderPassDepthStencilAttachment)),("occlusionQuerySet",  (WGPUQuerySet)),("timestampWrites", Ptr (WGPURenderPassTimestampWrites))]

public export
WGPUVertexState : Type
WGPUVertexState = Struct "WGPUVertexState" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (U64)),("constants", Ptr (WGPUConstantEntry)),("bufferCount",  (U64)),("buffers", Ptr (WGPUVertexBufferLayout))]

public export
WGPUFragmentState : Type
WGPUFragmentState = Struct "WGPUFragmentState" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (U64)),("constants", Ptr (WGPUConstantEntry)),("targetCount",  (U64)),("targets", Ptr (WGPUColorTargetState))]

public export
WGPURenderPipelineDescriptor : Type
WGPURenderPipelineDescriptor = Struct "WGPURenderPipelineDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUPipelineLayout)),("vertex",  (WGPUVertexState)),("primitive",  (WGPUPrimitiveState)),("depthStencil", Ptr (WGPUDepthStencilState)),("multisample",  (WGPUMultisampleState)),("fragment", Ptr (WGPUFragmentState))]

public export
WGPUProcCreateInstance : Type
WGPUProcCreateInstance = Ptr (Ptr (WGPUInstanceDescriptor) -> WGPUInstance)

public export
WGPUProcGetInstanceCapabilities : Type
WGPUProcGetInstanceCapabilities = Ptr (Ptr (WGPUInstanceCapabilities) -> WGPUStatus)

public export
WGPUProcGetProcAddress : Type
WGPUProcGetProcAddress = Ptr (WGPUStringView -> WGPUProc)

public export
WGPUProcAdapterGetFeatures : Type
WGPUProcAdapterGetFeatures = Ptr (WGPUAdapter -> Ptr (WGPUSupportedFeatures) -> ())

public export
WGPUProcAdapterGetInfo : Type
WGPUProcAdapterGetInfo = Ptr (WGPUAdapter -> Ptr (WGPUAdapterInfo) -> WGPUStatus)

public export
WGPUProcAdapterGetLimits : Type
WGPUProcAdapterGetLimits = Ptr (WGPUAdapter -> Ptr (WGPULimits) -> WGPUStatus)

public export
WGPUProcAdapterHasFeature : Type
WGPUProcAdapterHasFeature = Ptr (WGPUAdapter -> WGPUFeatureName -> WGPUBool)

public export
WGPUProcAdapterRequestDevice : Type
WGPUProcAdapterRequestDevice = Ptr (WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> WGPURequestDeviceCallbackInfo -> WGPUFuture)

public export
WGPUProcAdapterAddRef : Type
WGPUProcAdapterAddRef = Ptr (WGPUAdapter -> ())

public export
WGPUProcAdapterRelease : Type
WGPUProcAdapterRelease = Ptr (WGPUAdapter -> ())

public export
WGPUProcAdapterInfoFreeMembers : Type
WGPUProcAdapterInfoFreeMembers = Ptr (WGPUAdapterInfo -> ())

public export
WGPUProcBindGroupSetLabel : Type
WGPUProcBindGroupSetLabel = Ptr (WGPUBindGroup -> WGPUStringView -> ())

public export
WGPUProcBindGroupAddRef : Type
WGPUProcBindGroupAddRef = Ptr (WGPUBindGroup -> ())

public export
WGPUProcBindGroupRelease : Type
WGPUProcBindGroupRelease = Ptr (WGPUBindGroup -> ())

public export
WGPUProcBindGroupLayoutSetLabel : Type
WGPUProcBindGroupLayoutSetLabel = Ptr (WGPUBindGroupLayout -> WGPUStringView -> ())

public export
WGPUProcBindGroupLayoutAddRef : Type
WGPUProcBindGroupLayoutAddRef = Ptr (WGPUBindGroupLayout -> ())

public export
WGPUProcBindGroupLayoutRelease : Type
WGPUProcBindGroupLayoutRelease = Ptr (WGPUBindGroupLayout -> ())

public export
WGPUProcBufferDestroy : Type
WGPUProcBufferDestroy = Ptr (WGPUBuffer -> ())

public export
WGPUProcBufferGetConstMappedRange : Type
WGPUProcBufferGetConstMappedRange = Ptr (WGPUBuffer -> U64 -> U64 -> Ptr (()))

public export
WGPUProcBufferGetMapState : Type
WGPUProcBufferGetMapState = Ptr (WGPUBuffer -> WGPUBufferMapState)

public export
WGPUProcBufferGetMappedRange : Type
WGPUProcBufferGetMappedRange = Ptr (WGPUBuffer -> U64 -> U64 -> Ptr (()))

public export
WGPUProcBufferGetSize : Type
WGPUProcBufferGetSize = Ptr (WGPUBuffer -> U64)

public export
WGPUProcBufferGetUsage : Type
WGPUProcBufferGetUsage = Ptr (WGPUBuffer -> WGPUBufferUsage)

public export
WGPUProcBufferMapAsync : Type
WGPUProcBufferMapAsync = Ptr (WGPUBuffer -> WGPUMapMode -> U64 -> U64 -> WGPUBufferMapCallbackInfo -> WGPUFuture)

public export
WGPUProcBufferSetLabel : Type
WGPUProcBufferSetLabel = Ptr (WGPUBuffer -> WGPUStringView -> ())

public export
WGPUProcBufferUnmap : Type
WGPUProcBufferUnmap = Ptr (WGPUBuffer -> ())

public export
WGPUProcBufferAddRef : Type
WGPUProcBufferAddRef = Ptr (WGPUBuffer -> ())

public export
WGPUProcBufferRelease : Type
WGPUProcBufferRelease = Ptr (WGPUBuffer -> ())

public export
WGPUProcCommandBufferSetLabel : Type
WGPUProcCommandBufferSetLabel = Ptr (WGPUCommandBuffer -> WGPUStringView -> ())

public export
WGPUProcCommandBufferAddRef : Type
WGPUProcCommandBufferAddRef = Ptr (WGPUCommandBuffer -> ())

public export
WGPUProcCommandBufferRelease : Type
WGPUProcCommandBufferRelease = Ptr (WGPUCommandBuffer -> ())

public export
WGPUProcCommandEncoderBeginComputePass : Type
WGPUProcCommandEncoderBeginComputePass = Ptr (WGPUCommandEncoder -> Ptr (WGPUComputePassDescriptor) -> WGPUComputePassEncoder)

public export
WGPUProcCommandEncoderBeginRenderPass : Type
WGPUProcCommandEncoderBeginRenderPass = Ptr (WGPUCommandEncoder -> Ptr (WGPURenderPassDescriptor) -> WGPURenderPassEncoder)

public export
WGPUProcCommandEncoderClearBuffer : Type
WGPUProcCommandEncoderClearBuffer = Ptr (WGPUCommandEncoder -> WGPUBuffer -> U64 -> U64 -> ())

public export
WGPUProcCommandEncoderCopyBufferToBuffer : Type
WGPUProcCommandEncoderCopyBufferToBuffer = Ptr (WGPUCommandEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U64 -> ())

public export
WGPUProcCommandEncoderCopyBufferToTexture : Type
WGPUProcCommandEncoderCopyBufferToTexture = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> ())

public export
WGPUProcCommandEncoderCopyTextureToBuffer : Type
WGPUProcCommandEncoderCopyTextureToBuffer = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUExtent3D) -> ())

public export
WGPUProcCommandEncoderCopyTextureToTexture : Type
WGPUProcCommandEncoderCopyTextureToTexture = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> ())

public export
WGPUProcCommandEncoderFinish : Type
WGPUProcCommandEncoderFinish = Ptr (WGPUCommandEncoder -> Ptr (WGPUCommandBufferDescriptor) -> WGPUCommandBuffer)

public export
WGPUProcCommandEncoderInsertDebugMarker : Type
WGPUProcCommandEncoderInsertDebugMarker = Ptr (WGPUCommandEncoder -> WGPUStringView -> ())

public export
WGPUProcCommandEncoderPopDebugGroup : Type
WGPUProcCommandEncoderPopDebugGroup = Ptr (WGPUCommandEncoder -> ())

public export
WGPUProcCommandEncoderPushDebugGroup : Type
WGPUProcCommandEncoderPushDebugGroup = Ptr (WGPUCommandEncoder -> WGPUStringView -> ())

public export
WGPUProcCommandEncoderResolveQuerySet : Type
WGPUProcCommandEncoderResolveQuerySet = Ptr (WGPUCommandEncoder -> WGPUQuerySet -> U32 -> U32 -> WGPUBuffer -> U64 -> ())

public export
WGPUProcCommandEncoderSetLabel : Type
WGPUProcCommandEncoderSetLabel = Ptr (WGPUCommandEncoder -> WGPUStringView -> ())

public export
WGPUProcCommandEncoderWriteTimestamp : Type
WGPUProcCommandEncoderWriteTimestamp = Ptr (WGPUCommandEncoder -> WGPUQuerySet -> U32 -> ())

public export
WGPUProcCommandEncoderAddRef : Type
WGPUProcCommandEncoderAddRef = Ptr (WGPUCommandEncoder -> ())

public export
WGPUProcCommandEncoderRelease : Type
WGPUProcCommandEncoderRelease = Ptr (WGPUCommandEncoder -> ())

public export
WGPUProcComputePassEncoderDispatchWorkgroups : Type
WGPUProcComputePassEncoderDispatchWorkgroups = Ptr (WGPUComputePassEncoder -> U32 -> U32 -> U32 -> ())

public export
WGPUProcComputePassEncoderDispatchWorkgroupsIndirect : Type
WGPUProcComputePassEncoderDispatchWorkgroupsIndirect = Ptr (WGPUComputePassEncoder -> WGPUBuffer -> U64 -> ())

public export
WGPUProcComputePassEncoderEnd : Type
WGPUProcComputePassEncoderEnd = Ptr (WGPUComputePassEncoder -> ())

public export
WGPUProcComputePassEncoderInsertDebugMarker : Type
WGPUProcComputePassEncoderInsertDebugMarker = Ptr (WGPUComputePassEncoder -> WGPUStringView -> ())

public export
WGPUProcComputePassEncoderPopDebugGroup : Type
WGPUProcComputePassEncoderPopDebugGroup = Ptr (WGPUComputePassEncoder -> ())

public export
WGPUProcComputePassEncoderPushDebugGroup : Type
WGPUProcComputePassEncoderPushDebugGroup = Ptr (WGPUComputePassEncoder -> WGPUStringView -> ())

public export
WGPUProcComputePassEncoderSetBindGroup : Type
WGPUProcComputePassEncoderSetBindGroup = Ptr (WGPUComputePassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ())

public export
WGPUProcComputePassEncoderSetLabel : Type
WGPUProcComputePassEncoderSetLabel = Ptr (WGPUComputePassEncoder -> WGPUStringView -> ())

public export
WGPUProcComputePassEncoderSetPipeline : Type
WGPUProcComputePassEncoderSetPipeline = Ptr (WGPUComputePassEncoder -> WGPUComputePipeline -> ())

public export
WGPUProcComputePassEncoderAddRef : Type
WGPUProcComputePassEncoderAddRef = Ptr (WGPUComputePassEncoder -> ())

public export
WGPUProcComputePassEncoderRelease : Type
WGPUProcComputePassEncoderRelease = Ptr (WGPUComputePassEncoder -> ())

public export
WGPUProcComputePipelineGetBindGroupLayout : Type
WGPUProcComputePipelineGetBindGroupLayout = Ptr (WGPUComputePipeline -> U32 -> WGPUBindGroupLayout)

public export
WGPUProcComputePipelineSetLabel : Type
WGPUProcComputePipelineSetLabel = Ptr (WGPUComputePipeline -> WGPUStringView -> ())

public export
WGPUProcComputePipelineAddRef : Type
WGPUProcComputePipelineAddRef = Ptr (WGPUComputePipeline -> ())

public export
WGPUProcComputePipelineRelease : Type
WGPUProcComputePipelineRelease = Ptr (WGPUComputePipeline -> ())

public export
WGPUProcDeviceCreateBindGroup : Type
WGPUProcDeviceCreateBindGroup = Ptr (WGPUDevice -> Ptr (WGPUBindGroupDescriptor) -> WGPUBindGroup)

public export
WGPUProcDeviceCreateBindGroupLayout : Type
WGPUProcDeviceCreateBindGroupLayout = Ptr (WGPUDevice -> Ptr (WGPUBindGroupLayoutDescriptor) -> WGPUBindGroupLayout)

public export
WGPUProcDeviceCreateBuffer : Type
WGPUProcDeviceCreateBuffer = Ptr (WGPUDevice -> Ptr (WGPUBufferDescriptor) -> WGPUBuffer)

public export
WGPUProcDeviceCreateCommandEncoder : Type
WGPUProcDeviceCreateCommandEncoder = Ptr (WGPUDevice -> Ptr (WGPUCommandEncoderDescriptor) -> WGPUCommandEncoder)

public export
WGPUProcDeviceCreateComputePipeline : Type
WGPUProcDeviceCreateComputePipeline = Ptr (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUComputePipeline)

public export
WGPUProcDeviceCreateComputePipelineAsync : Type
WGPUProcDeviceCreateComputePipelineAsync = Ptr (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUCreateComputePipelineAsyncCallbackInfo -> WGPUFuture)

public export
WGPUProcDeviceCreatePipelineLayout : Type
WGPUProcDeviceCreatePipelineLayout = Ptr (WGPUDevice -> Ptr (WGPUPipelineLayoutDescriptor) -> WGPUPipelineLayout)

public export
WGPUProcDeviceCreateQuerySet : Type
WGPUProcDeviceCreateQuerySet = Ptr (WGPUDevice -> Ptr (WGPUQuerySetDescriptor) -> WGPUQuerySet)

public export
WGPUProcDeviceCreateRenderBundleEncoder : Type
WGPUProcDeviceCreateRenderBundleEncoder = Ptr (WGPUDevice -> Ptr (WGPURenderBundleEncoderDescriptor) -> WGPURenderBundleEncoder)

public export
WGPUProcDeviceCreateRenderPipeline : Type
WGPUProcDeviceCreateRenderPipeline = Ptr (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPURenderPipeline)

public export
WGPUProcDeviceCreateRenderPipelineAsync : Type
WGPUProcDeviceCreateRenderPipelineAsync = Ptr (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPUCreateRenderPipelineAsyncCallbackInfo -> WGPUFuture)

public export
WGPUProcDeviceCreateSampler : Type
WGPUProcDeviceCreateSampler = Ptr (WGPUDevice -> Ptr (WGPUSamplerDescriptor) -> WGPUSampler)

public export
WGPUProcDeviceCreateShaderModule : Type
WGPUProcDeviceCreateShaderModule = Ptr (WGPUDevice -> Ptr (WGPUShaderModuleDescriptor) -> WGPUShaderModule)

public export
WGPUProcDeviceCreateTexture : Type
WGPUProcDeviceCreateTexture = Ptr (WGPUDevice -> Ptr (WGPUTextureDescriptor) -> WGPUTexture)

public export
WGPUProcDeviceDestroy : Type
WGPUProcDeviceDestroy = Ptr (WGPUDevice -> ())

public export
WGPUProcDeviceGetAdapterInfo : Type
WGPUProcDeviceGetAdapterInfo = Ptr (WGPUDevice -> WGPUAdapterInfo)

public export
WGPUProcDeviceGetFeatures : Type
WGPUProcDeviceGetFeatures = Ptr (WGPUDevice -> Ptr (WGPUSupportedFeatures) -> ())

public export
WGPUProcDeviceGetLimits : Type
WGPUProcDeviceGetLimits = Ptr (WGPUDevice -> Ptr (WGPULimits) -> WGPUStatus)

public export
WGPUProcDeviceGetLostFuture : Type
WGPUProcDeviceGetLostFuture = Ptr (WGPUDevice -> WGPUFuture)

public export
WGPUProcDeviceGetQueue : Type
WGPUProcDeviceGetQueue = Ptr (WGPUDevice -> WGPUQueue)

public export
WGPUProcDeviceHasFeature : Type
WGPUProcDeviceHasFeature = Ptr (WGPUDevice -> WGPUFeatureName -> WGPUBool)

public export
WGPUProcDevicePopErrorScope : Type
WGPUProcDevicePopErrorScope = Ptr (WGPUDevice -> WGPUPopErrorScopeCallbackInfo -> WGPUFuture)

public export
WGPUProcDevicePushErrorScope : Type
WGPUProcDevicePushErrorScope = Ptr (WGPUDevice -> WGPUErrorFilter -> ())

public export
WGPUProcDeviceSetLabel : Type
WGPUProcDeviceSetLabel = Ptr (WGPUDevice -> WGPUStringView -> ())

public export
WGPUProcDeviceAddRef : Type
WGPUProcDeviceAddRef = Ptr (WGPUDevice -> ())

public export
WGPUProcDeviceRelease : Type
WGPUProcDeviceRelease = Ptr (WGPUDevice -> ())

public export
WGPUProcInstanceCreateSurface : Type
WGPUProcInstanceCreateSurface = Ptr (WGPUInstance -> Ptr (WGPUSurfaceDescriptor) -> WGPUSurface)

public export
WGPUProcInstanceGetWGSLLanguageFeatures : Type
WGPUProcInstanceGetWGSLLanguageFeatures = Ptr (WGPUInstance -> Ptr (WGPUSupportedWGSLLanguageFeatures) -> WGPUStatus)

public export
WGPUProcInstanceHasWGSLLanguageFeature : Type
WGPUProcInstanceHasWGSLLanguageFeature = Ptr (WGPUInstance -> WGPUWGSLLanguageFeatureName -> WGPUBool)

public export
WGPUProcInstanceProcessEvents : Type
WGPUProcInstanceProcessEvents = Ptr (WGPUInstance -> ())

public export
WGPUProcInstanceRequestAdapter : Type
WGPUProcInstanceRequestAdapter = Ptr (WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> WGPURequestAdapterCallbackInfo -> WGPUFuture)

public export
WGPUProcInstanceWaitAny : Type
WGPUProcInstanceWaitAny = Ptr (WGPUInstance -> U64 -> Ptr (WGPUFutureWaitInfo) -> U64 -> WGPUWaitStatus)

public export
WGPUProcInstanceAddRef : Type
WGPUProcInstanceAddRef = Ptr (WGPUInstance -> ())

public export
WGPUProcInstanceRelease : Type
WGPUProcInstanceRelease = Ptr (WGPUInstance -> ())

public export
WGPUProcPipelineLayoutSetLabel : Type
WGPUProcPipelineLayoutSetLabel = Ptr (WGPUPipelineLayout -> WGPUStringView -> ())

public export
WGPUProcPipelineLayoutAddRef : Type
WGPUProcPipelineLayoutAddRef = Ptr (WGPUPipelineLayout -> ())

public export
WGPUProcPipelineLayoutRelease : Type
WGPUProcPipelineLayoutRelease = Ptr (WGPUPipelineLayout -> ())

public export
WGPUProcQuerySetDestroy : Type
WGPUProcQuerySetDestroy = Ptr (WGPUQuerySet -> ())

public export
WGPUProcQuerySetGetCount : Type
WGPUProcQuerySetGetCount = Ptr (WGPUQuerySet -> U32)

public export
WGPUProcQuerySetGetType : Type
WGPUProcQuerySetGetType = Ptr (WGPUQuerySet -> WGPUQueryType)

public export
WGPUProcQuerySetSetLabel : Type
WGPUProcQuerySetSetLabel = Ptr (WGPUQuerySet -> WGPUStringView -> ())

public export
WGPUProcQuerySetAddRef : Type
WGPUProcQuerySetAddRef = Ptr (WGPUQuerySet -> ())

public export
WGPUProcQuerySetRelease : Type
WGPUProcQuerySetRelease = Ptr (WGPUQuerySet -> ())

public export
WGPUProcQueueOnSubmittedWorkDone : Type
WGPUProcQueueOnSubmittedWorkDone = Ptr (WGPUQueue -> WGPUQueueWorkDoneCallbackInfo -> WGPUFuture)

public export
WGPUProcQueueSetLabel : Type
WGPUProcQueueSetLabel = Ptr (WGPUQueue -> WGPUStringView -> ())

public export
WGPUProcQueueSubmit : Type
WGPUProcQueueSubmit = Ptr (WGPUQueue -> U64 -> Ptr (WGPUCommandBuffer) -> ())

public export
WGPUProcQueueWriteBuffer : Type
WGPUProcQueueWriteBuffer = Ptr (WGPUQueue -> WGPUBuffer -> U64 -> Ptr (()) -> U64 -> ())

public export
WGPUProcQueueWriteTexture : Type
WGPUProcQueueWriteTexture = Ptr (WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> U64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> ())

public export
WGPUProcQueueAddRef : Type
WGPUProcQueueAddRef = Ptr (WGPUQueue -> ())

public export
WGPUProcQueueRelease : Type
WGPUProcQueueRelease = Ptr (WGPUQueue -> ())

public export
WGPUProcRenderBundleSetLabel : Type
WGPUProcRenderBundleSetLabel = Ptr (WGPURenderBundle -> WGPUStringView -> ())

public export
WGPUProcRenderBundleAddRef : Type
WGPUProcRenderBundleAddRef = Ptr (WGPURenderBundle -> ())

public export
WGPUProcRenderBundleRelease : Type
WGPUProcRenderBundleRelease = Ptr (WGPURenderBundle -> ())

public export
WGPUProcRenderBundleEncoderDraw : Type
WGPUProcRenderBundleEncoderDraw = Ptr (WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> U32 -> ())

public export
WGPUProcRenderBundleEncoderDrawIndexed : Type
WGPUProcRenderBundleEncoderDrawIndexed = Ptr (WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> ())

public export
WGPUProcRenderBundleEncoderDrawIndexedIndirect : Type
WGPUProcRenderBundleEncoderDrawIndexedIndirect = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> ())

public export
WGPUProcRenderBundleEncoderDrawIndirect : Type
WGPUProcRenderBundleEncoderDrawIndirect = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> ())

public export
WGPUProcRenderBundleEncoderFinish : Type
WGPUProcRenderBundleEncoderFinish = Ptr (WGPURenderBundleEncoder -> Ptr (WGPURenderBundleDescriptor) -> WGPURenderBundle)

public export
WGPUProcRenderBundleEncoderInsertDebugMarker : Type
WGPUProcRenderBundleEncoderInsertDebugMarker = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> ())

public export
WGPUProcRenderBundleEncoderPopDebugGroup : Type
WGPUProcRenderBundleEncoderPopDebugGroup = Ptr (WGPURenderBundleEncoder -> ())

public export
WGPUProcRenderBundleEncoderPushDebugGroup : Type
WGPUProcRenderBundleEncoderPushDebugGroup = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> ())

public export
WGPUProcRenderBundleEncoderSetBindGroup : Type
WGPUProcRenderBundleEncoderSetBindGroup = Ptr (WGPURenderBundleEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ())

public export
WGPUProcRenderBundleEncoderSetIndexBuffer : Type
WGPUProcRenderBundleEncoderSetIndexBuffer = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> ())

public export
WGPUProcRenderBundleEncoderSetLabel : Type
WGPUProcRenderBundleEncoderSetLabel = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> ())

public export
WGPUProcRenderBundleEncoderSetPipeline : Type
WGPUProcRenderBundleEncoderSetPipeline = Ptr (WGPURenderBundleEncoder -> WGPURenderPipeline -> ())

public export
WGPUProcRenderBundleEncoderSetVertexBuffer : Type
WGPUProcRenderBundleEncoderSetVertexBuffer = Ptr (WGPURenderBundleEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> ())

public export
WGPUProcRenderBundleEncoderAddRef : Type
WGPUProcRenderBundleEncoderAddRef = Ptr (WGPURenderBundleEncoder -> ())

public export
WGPUProcRenderBundleEncoderRelease : Type
WGPUProcRenderBundleEncoderRelease = Ptr (WGPURenderBundleEncoder -> ())

public export
WGPUProcRenderPassEncoderBeginOcclusionQuery : Type
WGPUProcRenderPassEncoderBeginOcclusionQuery = Ptr (WGPURenderPassEncoder -> U32 -> ())

public export
WGPUProcRenderPassEncoderDraw : Type
WGPUProcRenderPassEncoderDraw = Ptr (WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> ())

public export
WGPUProcRenderPassEncoderDrawIndexed : Type
WGPUProcRenderPassEncoderDrawIndexed = Ptr (WGPURenderPassEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> ())

public export
WGPUProcRenderPassEncoderDrawIndexedIndirect : Type
WGPUProcRenderPassEncoderDrawIndexedIndirect = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> U64 -> ())

public export
WGPUProcRenderPassEncoderDrawIndirect : Type
WGPUProcRenderPassEncoderDrawIndirect = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> U64 -> ())

public export
WGPUProcRenderPassEncoderEnd : Type
WGPUProcRenderPassEncoderEnd = Ptr (WGPURenderPassEncoder -> ())

public export
WGPUProcRenderPassEncoderEndOcclusionQuery : Type
WGPUProcRenderPassEncoderEndOcclusionQuery = Ptr (WGPURenderPassEncoder -> ())

public export
WGPUProcRenderPassEncoderExecuteBundles : Type
WGPUProcRenderPassEncoderExecuteBundles = Ptr (WGPURenderPassEncoder -> U64 -> Ptr (WGPURenderBundle) -> ())

public export
WGPUProcRenderPassEncoderInsertDebugMarker : Type
WGPUProcRenderPassEncoderInsertDebugMarker = Ptr (WGPURenderPassEncoder -> WGPUStringView -> ())

public export
WGPUProcRenderPassEncoderPopDebugGroup : Type
WGPUProcRenderPassEncoderPopDebugGroup = Ptr (WGPURenderPassEncoder -> ())

public export
WGPUProcRenderPassEncoderPushDebugGroup : Type
WGPUProcRenderPassEncoderPushDebugGroup = Ptr (WGPURenderPassEncoder -> WGPUStringView -> ())

public export
WGPUProcRenderPassEncoderSetBindGroup : Type
WGPUProcRenderPassEncoderSetBindGroup = Ptr (WGPURenderPassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> ())

public export
WGPUProcRenderPassEncoderSetBlendConstant : Type
WGPUProcRenderPassEncoderSetBlendConstant = Ptr (WGPURenderPassEncoder -> Ptr (WGPUColor) -> ())

public export
WGPUProcRenderPassEncoderSetIndexBuffer : Type
WGPUProcRenderPassEncoderSetIndexBuffer = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> ())

public export
WGPUProcRenderPassEncoderSetLabel : Type
WGPUProcRenderPassEncoderSetLabel = Ptr (WGPURenderPassEncoder -> WGPUStringView -> ())

public export
WGPUProcRenderPassEncoderSetPipeline : Type
WGPUProcRenderPassEncoderSetPipeline = Ptr (WGPURenderPassEncoder -> WGPURenderPipeline -> ())

public export
WGPUProcRenderPassEncoderSetScissorRect : Type
WGPUProcRenderPassEncoderSetScissorRect = Ptr (WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> ())

public export
WGPUProcRenderPassEncoderSetStencilReference : Type
WGPUProcRenderPassEncoderSetStencilReference = Ptr (WGPURenderPassEncoder -> U32 -> ())

public export
WGPUProcRenderPassEncoderSetVertexBuffer : Type
WGPUProcRenderPassEncoderSetVertexBuffer = Ptr (WGPURenderPassEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> ())

public export
WGPUProcRenderPassEncoderSetViewport : Type
WGPUProcRenderPassEncoderSetViewport = Ptr (WGPURenderPassEncoder -> F32 -> F32 -> F32 -> F32 -> F32 -> F32 -> ())

public export
WGPUProcRenderPassEncoderAddRef : Type
WGPUProcRenderPassEncoderAddRef = Ptr (WGPURenderPassEncoder -> ())

public export
WGPUProcRenderPassEncoderRelease : Type
WGPUProcRenderPassEncoderRelease = Ptr (WGPURenderPassEncoder -> ())

public export
WGPUProcRenderPipelineGetBindGroupLayout : Type
WGPUProcRenderPipelineGetBindGroupLayout = Ptr (WGPURenderPipeline -> U32 -> WGPUBindGroupLayout)

public export
WGPUProcRenderPipelineSetLabel : Type
WGPUProcRenderPipelineSetLabel = Ptr (WGPURenderPipeline -> WGPUStringView -> ())

public export
WGPUProcRenderPipelineAddRef : Type
WGPUProcRenderPipelineAddRef = Ptr (WGPURenderPipeline -> ())

public export
WGPUProcRenderPipelineRelease : Type
WGPUProcRenderPipelineRelease = Ptr (WGPURenderPipeline -> ())

public export
WGPUProcSamplerSetLabel : Type
WGPUProcSamplerSetLabel = Ptr (WGPUSampler -> WGPUStringView -> ())

public export
WGPUProcSamplerAddRef : Type
WGPUProcSamplerAddRef = Ptr (WGPUSampler -> ())

public export
WGPUProcSamplerRelease : Type
WGPUProcSamplerRelease = Ptr (WGPUSampler -> ())

public export
WGPUProcShaderModuleGetCompilationInfo : Type
WGPUProcShaderModuleGetCompilationInfo = Ptr (WGPUShaderModule -> WGPUCompilationInfoCallbackInfo -> WGPUFuture)

public export
WGPUProcShaderModuleSetLabel : Type
WGPUProcShaderModuleSetLabel = Ptr (WGPUShaderModule -> WGPUStringView -> ())

public export
WGPUProcShaderModuleAddRef : Type
WGPUProcShaderModuleAddRef = Ptr (WGPUShaderModule -> ())

public export
WGPUProcShaderModuleRelease : Type
WGPUProcShaderModuleRelease = Ptr (WGPUShaderModule -> ())

public export
WGPUProcSupportedFeaturesFreeMembers : Type
WGPUProcSupportedFeaturesFreeMembers = Ptr (WGPUSupportedFeatures -> ())

public export
WGPUProcSupportedWGSLLanguageFeaturesFreeMembers : Type
WGPUProcSupportedWGSLLanguageFeaturesFreeMembers = Ptr (WGPUSupportedWGSLLanguageFeatures -> ())

public export
WGPUProcSurfaceConfigure : Type
WGPUProcSurfaceConfigure = Ptr (WGPUSurface -> Ptr (WGPUSurfaceConfiguration) -> ())

public export
WGPUProcSurfaceGetCapabilities : Type
WGPUProcSurfaceGetCapabilities = Ptr (WGPUSurface -> WGPUAdapter -> Ptr (WGPUSurfaceCapabilities) -> WGPUStatus)

public export
WGPUProcSurfaceGetCurrentTexture : Type
WGPUProcSurfaceGetCurrentTexture = Ptr (WGPUSurface -> Ptr (WGPUSurfaceTexture) -> ())

public export
WGPUProcSurfacePresent : Type
WGPUProcSurfacePresent = Ptr (WGPUSurface -> WGPUStatus)

public export
WGPUProcSurfaceSetLabel : Type
WGPUProcSurfaceSetLabel = Ptr (WGPUSurface -> WGPUStringView -> ())

public export
WGPUProcSurfaceUnconfigure : Type
WGPUProcSurfaceUnconfigure = Ptr (WGPUSurface -> ())

public export
WGPUProcSurfaceAddRef : Type
WGPUProcSurfaceAddRef = Ptr (WGPUSurface -> ())

public export
WGPUProcSurfaceRelease : Type
WGPUProcSurfaceRelease = Ptr (WGPUSurface -> ())

public export
WGPUProcSurfaceCapabilitiesFreeMembers : Type
WGPUProcSurfaceCapabilitiesFreeMembers = Ptr (WGPUSurfaceCapabilities -> ())

public export
WGPUProcTextureCreateView : Type
WGPUProcTextureCreateView = Ptr (WGPUTexture -> Ptr (WGPUTextureViewDescriptor) -> WGPUTextureView)

public export
WGPUProcTextureDestroy : Type
WGPUProcTextureDestroy = Ptr (WGPUTexture -> ())

public export
WGPUProcTextureGetDepthOrArrayLayers : Type
WGPUProcTextureGetDepthOrArrayLayers = Ptr (WGPUTexture -> U32)

public export
WGPUProcTextureGetDimension : Type
WGPUProcTextureGetDimension = Ptr (WGPUTexture -> WGPUTextureDimension)

public export
WGPUProcTextureGetFormat : Type
WGPUProcTextureGetFormat = Ptr (WGPUTexture -> WGPUTextureFormat)

public export
WGPUProcTextureGetHeight : Type
WGPUProcTextureGetHeight = Ptr (WGPUTexture -> U32)

public export
WGPUProcTextureGetMipLevelCount : Type
WGPUProcTextureGetMipLevelCount = Ptr (WGPUTexture -> U32)

public export
WGPUProcTextureGetSampleCount : Type
WGPUProcTextureGetSampleCount = Ptr (WGPUTexture -> U32)

public export
WGPUProcTextureGetUsage : Type
WGPUProcTextureGetUsage = Ptr (WGPUTexture -> WGPUTextureUsage)

public export
WGPUProcTextureGetWidth : Type
WGPUProcTextureGetWidth = Ptr (WGPUTexture -> U32)

public export
WGPUProcTextureSetLabel : Type
WGPUProcTextureSetLabel = Ptr (WGPUTexture -> WGPUStringView -> ())

public export
WGPUProcTextureAddRef : Type
WGPUProcTextureAddRef = Ptr (WGPUTexture -> ())

public export
WGPUProcTextureRelease : Type
WGPUProcTextureRelease = Ptr (WGPUTexture -> ())

public export
WGPUProcTextureViewSetLabel : Type
WGPUProcTextureViewSetLabel = Ptr (WGPUTextureView -> WGPUStringView -> ())

public export
WGPUProcTextureViewAddRef : Type
WGPUProcTextureViewAddRef = Ptr (WGPUTextureView -> ())

public export
WGPUProcTextureViewRelease : Type
WGPUProcTextureViewRelease = Ptr (WGPUTextureView -> ())

%foreign "C:wgpuCreateInstance,libwgpu_native"
export
wgpuCreateInstance : Ptr (WGPUInstanceDescriptor) -> PrimIO (WGPUInstance)
    

%foreign "C:wgpuGetInstanceCapabilities,libwgpu_native"
export
wgpuGetInstanceCapabilities : Ptr (WGPUInstanceCapabilities) -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuGetProcAddress,libwgpu_native"
export
wgpuGetProcAddress : WGPUStringView -> PrimIO (WGPUProc)
    

%foreign "C:wgpuAdapterGetFeatures,libwgpu_native"
export
wgpuAdapterGetFeatures : WGPUAdapter -> Ptr (WGPUSupportedFeatures) -> PrimIO (())
    

%foreign "C:wgpuAdapterGetInfo,libwgpu_native"
export
wgpuAdapterGetInfo : WGPUAdapter -> Ptr (WGPUAdapterInfo) -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuAdapterGetLimits,libwgpu_native"
export
wgpuAdapterGetLimits : WGPUAdapter -> Ptr (WGPULimits) -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuAdapterHasFeature,libwgpu_native"
export
wgpuAdapterHasFeature : WGPUAdapter -> WGPUFeatureName -> PrimIO (WGPUBool)
    

%foreign "C:wgpuAdapterRequestDevice,libwgpu_native"
export
wgpuAdapterRequestDevice : WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> WGPURequestDeviceCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuAdapterAddRef,libwgpu_native"
export
wgpuAdapterAddRef : WGPUAdapter -> PrimIO (())
    

%foreign "C:wgpuAdapterRelease,libwgpu_native"
export
wgpuAdapterRelease : WGPUAdapter -> PrimIO (())
    

%foreign "C:wgpuAdapterInfoFreeMembers,libwgpu_native"
export
wgpuAdapterInfoFreeMembers : WGPUAdapterInfo -> PrimIO (())
    

%foreign "C:wgpuBindGroupSetLabel,libwgpu_native"
export
wgpuBindGroupSetLabel : WGPUBindGroup -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuBindGroupAddRef,libwgpu_native"
export
wgpuBindGroupAddRef : WGPUBindGroup -> PrimIO (())
    

%foreign "C:wgpuBindGroupRelease,libwgpu_native"
export
wgpuBindGroupRelease : WGPUBindGroup -> PrimIO (())
    

%foreign "C:wgpuBindGroupLayoutSetLabel,libwgpu_native"
export
wgpuBindGroupLayoutSetLabel : WGPUBindGroupLayout -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuBindGroupLayoutAddRef,libwgpu_native"
export
wgpuBindGroupLayoutAddRef : WGPUBindGroupLayout -> PrimIO (())
    

%foreign "C:wgpuBindGroupLayoutRelease,libwgpu_native"
export
wgpuBindGroupLayoutRelease : WGPUBindGroupLayout -> PrimIO (())
    

%foreign "C:wgpuBufferDestroy,libwgpu_native"
export
wgpuBufferDestroy : WGPUBuffer -> PrimIO (())
    

%foreign "C:wgpuBufferGetConstMappedRange,libwgpu_native"
export
wgpuBufferGetConstMappedRange : WGPUBuffer -> U64 -> U64 -> PrimIO (Ptr (()))
    

%foreign "C:wgpuBufferGetMapState,libwgpu_native"
export
wgpuBufferGetMapState : WGPUBuffer -> PrimIO (WGPUBufferMapState)
    

%foreign "C:wgpuBufferGetMappedRange,libwgpu_native"
export
wgpuBufferGetMappedRange : WGPUBuffer -> U64 -> U64 -> PrimIO (Ptr (()))
    

%foreign "C:wgpuBufferGetSize,libwgpu_native"
export
wgpuBufferGetSize : WGPUBuffer -> PrimIO (U64)
    

%foreign "C:wgpuBufferGetUsage,libwgpu_native"
export
wgpuBufferGetUsage : WGPUBuffer -> PrimIO (WGPUBufferUsage)
    

%foreign "C:wgpuBufferMapAsync,libwgpu_native"
export
wgpuBufferMapAsync : WGPUBuffer -> WGPUMapMode -> U64 -> U64 -> WGPUBufferMapCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuBufferSetLabel,libwgpu_native"
export
wgpuBufferSetLabel : WGPUBuffer -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuBufferUnmap,libwgpu_native"
export
wgpuBufferUnmap : WGPUBuffer -> PrimIO (())
    

%foreign "C:wgpuBufferAddRef,libwgpu_native"
export
wgpuBufferAddRef : WGPUBuffer -> PrimIO (())
    

%foreign "C:wgpuBufferRelease,libwgpu_native"
export
wgpuBufferRelease : WGPUBuffer -> PrimIO (())
    

%foreign "C:wgpuCommandBufferSetLabel,libwgpu_native"
export
wgpuCommandBufferSetLabel : WGPUCommandBuffer -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuCommandBufferAddRef,libwgpu_native"
export
wgpuCommandBufferAddRef : WGPUCommandBuffer -> PrimIO (())
    

%foreign "C:wgpuCommandBufferRelease,libwgpu_native"
export
wgpuCommandBufferRelease : WGPUCommandBuffer -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderBeginComputePass,libwgpu_native"
export
wgpuCommandEncoderBeginComputePass : WGPUCommandEncoder -> Ptr (WGPUComputePassDescriptor) -> PrimIO (WGPUComputePassEncoder)
    

%foreign "C:wgpuCommandEncoderBeginRenderPass,libwgpu_native"
export
wgpuCommandEncoderBeginRenderPass : WGPUCommandEncoder -> Ptr (WGPURenderPassDescriptor) -> PrimIO (WGPURenderPassEncoder)
    

%foreign "C:wgpuCommandEncoderClearBuffer,libwgpu_native"
export
wgpuCommandEncoderClearBuffer : WGPUCommandEncoder -> WGPUBuffer -> U64 -> U64 -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderCopyBufferToBuffer,libwgpu_native"
export
wgpuCommandEncoderCopyBufferToBuffer : WGPUCommandEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U64 -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderCopyBufferToTexture,libwgpu_native"
export
wgpuCommandEncoderCopyBufferToTexture : WGPUCommandEncoder -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderCopyTextureToBuffer,libwgpu_native"
export
wgpuCommandEncoderCopyTextureToBuffer : WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUExtent3D) -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderCopyTextureToTexture,libwgpu_native"
export
wgpuCommandEncoderCopyTextureToTexture : WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderFinish,libwgpu_native"
export
wgpuCommandEncoderFinish : WGPUCommandEncoder -> Ptr (WGPUCommandBufferDescriptor) -> PrimIO (WGPUCommandBuffer)
    

%foreign "C:wgpuCommandEncoderInsertDebugMarker,libwgpu_native"
export
wgpuCommandEncoderInsertDebugMarker : WGPUCommandEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderPopDebugGroup,libwgpu_native"
export
wgpuCommandEncoderPopDebugGroup : WGPUCommandEncoder -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderPushDebugGroup,libwgpu_native"
export
wgpuCommandEncoderPushDebugGroup : WGPUCommandEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderResolveQuerySet,libwgpu_native"
export
wgpuCommandEncoderResolveQuerySet : WGPUCommandEncoder -> WGPUQuerySet -> U32 -> U32 -> WGPUBuffer -> U64 -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderSetLabel,libwgpu_native"
export
wgpuCommandEncoderSetLabel : WGPUCommandEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderWriteTimestamp,libwgpu_native"
export
wgpuCommandEncoderWriteTimestamp : WGPUCommandEncoder -> WGPUQuerySet -> U32 -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderAddRef,libwgpu_native"
export
wgpuCommandEncoderAddRef : WGPUCommandEncoder -> PrimIO (())
    

%foreign "C:wgpuCommandEncoderRelease,libwgpu_native"
export
wgpuCommandEncoderRelease : WGPUCommandEncoder -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderDispatchWorkgroups,libwgpu_native"
export
wgpuComputePassEncoderDispatchWorkgroups : WGPUComputePassEncoder -> U32 -> U32 -> U32 -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderDispatchWorkgroupsIndirect,libwgpu_native"
export
wgpuComputePassEncoderDispatchWorkgroupsIndirect : WGPUComputePassEncoder -> WGPUBuffer -> U64 -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderEnd,libwgpu_native"
export
wgpuComputePassEncoderEnd : WGPUComputePassEncoder -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderInsertDebugMarker,libwgpu_native"
export
wgpuComputePassEncoderInsertDebugMarker : WGPUComputePassEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderPopDebugGroup,libwgpu_native"
export
wgpuComputePassEncoderPopDebugGroup : WGPUComputePassEncoder -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderPushDebugGroup,libwgpu_native"
export
wgpuComputePassEncoderPushDebugGroup : WGPUComputePassEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderSetBindGroup,libwgpu_native"
export
wgpuComputePassEncoderSetBindGroup : WGPUComputePassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderSetLabel,libwgpu_native"
export
wgpuComputePassEncoderSetLabel : WGPUComputePassEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderSetPipeline,libwgpu_native"
export
wgpuComputePassEncoderSetPipeline : WGPUComputePassEncoder -> WGPUComputePipeline -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderAddRef,libwgpu_native"
export
wgpuComputePassEncoderAddRef : WGPUComputePassEncoder -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderRelease,libwgpu_native"
export
wgpuComputePassEncoderRelease : WGPUComputePassEncoder -> PrimIO (())
    

%foreign "C:wgpuComputePipelineGetBindGroupLayout,libwgpu_native"
export
wgpuComputePipelineGetBindGroupLayout : WGPUComputePipeline -> U32 -> PrimIO (WGPUBindGroupLayout)
    

%foreign "C:wgpuComputePipelineSetLabel,libwgpu_native"
export
wgpuComputePipelineSetLabel : WGPUComputePipeline -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuComputePipelineAddRef,libwgpu_native"
export
wgpuComputePipelineAddRef : WGPUComputePipeline -> PrimIO (())
    

%foreign "C:wgpuComputePipelineRelease,libwgpu_native"
export
wgpuComputePipelineRelease : WGPUComputePipeline -> PrimIO (())
    

%foreign "C:wgpuDeviceCreateBindGroup,libwgpu_native"
export
wgpuDeviceCreateBindGroup : WGPUDevice -> Ptr (WGPUBindGroupDescriptor) -> PrimIO (WGPUBindGroup)
    

%foreign "C:wgpuDeviceCreateBindGroupLayout,libwgpu_native"
export
wgpuDeviceCreateBindGroupLayout : WGPUDevice -> Ptr (WGPUBindGroupLayoutDescriptor) -> PrimIO (WGPUBindGroupLayout)
    

%foreign "C:wgpuDeviceCreateBuffer,libwgpu_native"
export
wgpuDeviceCreateBuffer : WGPUDevice -> Ptr (WGPUBufferDescriptor) -> PrimIO (WGPUBuffer)
    

%foreign "C:wgpuDeviceCreateCommandEncoder,libwgpu_native"
export
wgpuDeviceCreateCommandEncoder : WGPUDevice -> Ptr (WGPUCommandEncoderDescriptor) -> PrimIO (WGPUCommandEncoder)
    

%foreign "C:wgpuDeviceCreateComputePipeline,libwgpu_native"
export
wgpuDeviceCreateComputePipeline : WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> PrimIO (WGPUComputePipeline)
    

%foreign "C:wgpuDeviceCreateComputePipelineAsync,libwgpu_native"
export
wgpuDeviceCreateComputePipelineAsync : WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUCreateComputePipelineAsyncCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuDeviceCreatePipelineLayout,libwgpu_native"
export
wgpuDeviceCreatePipelineLayout : WGPUDevice -> Ptr (WGPUPipelineLayoutDescriptor) -> PrimIO (WGPUPipelineLayout)
    

%foreign "C:wgpuDeviceCreateQuerySet,libwgpu_native"
export
wgpuDeviceCreateQuerySet : WGPUDevice -> Ptr (WGPUQuerySetDescriptor) -> PrimIO (WGPUQuerySet)
    

%foreign "C:wgpuDeviceCreateRenderBundleEncoder,libwgpu_native"
export
wgpuDeviceCreateRenderBundleEncoder : WGPUDevice -> Ptr (WGPURenderBundleEncoderDescriptor) -> PrimIO (WGPURenderBundleEncoder)
    

%foreign "C:wgpuDeviceCreateRenderPipeline,libwgpu_native"
export
wgpuDeviceCreateRenderPipeline : WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> PrimIO (WGPURenderPipeline)
    

%foreign "C:wgpuDeviceCreateRenderPipelineAsync,libwgpu_native"
export
wgpuDeviceCreateRenderPipelineAsync : WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPUCreateRenderPipelineAsyncCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuDeviceCreateSampler,libwgpu_native"
export
wgpuDeviceCreateSampler : WGPUDevice -> Ptr (WGPUSamplerDescriptor) -> PrimIO (WGPUSampler)
    

%foreign "C:wgpuDeviceCreateShaderModule,libwgpu_native"
export
wgpuDeviceCreateShaderModule : WGPUDevice -> Ptr (WGPUShaderModuleDescriptor) -> PrimIO (WGPUShaderModule)
    

%foreign "C:wgpuDeviceCreateTexture,libwgpu_native"
export
wgpuDeviceCreateTexture : WGPUDevice -> Ptr (WGPUTextureDescriptor) -> PrimIO (WGPUTexture)
    

%foreign "C:wgpuDeviceDestroy,libwgpu_native"
export
wgpuDeviceDestroy : WGPUDevice -> PrimIO (())
    

%foreign "C:wgpuDeviceGetAdapterInfo,libwgpu_native"
export
wgpuDeviceGetAdapterInfo : WGPUDevice -> PrimIO (WGPUAdapterInfo)
    

%foreign "C:wgpuDeviceGetFeatures,libwgpu_native"
export
wgpuDeviceGetFeatures : WGPUDevice -> Ptr (WGPUSupportedFeatures) -> PrimIO (())
    

%foreign "C:wgpuDeviceGetLimits,libwgpu_native"
export
wgpuDeviceGetLimits : WGPUDevice -> Ptr (WGPULimits) -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuDeviceGetLostFuture,libwgpu_native"
export
wgpuDeviceGetLostFuture : WGPUDevice -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuDeviceGetQueue,libwgpu_native"
export
wgpuDeviceGetQueue : WGPUDevice -> PrimIO (WGPUQueue)
    

%foreign "C:wgpuDeviceHasFeature,libwgpu_native"
export
wgpuDeviceHasFeature : WGPUDevice -> WGPUFeatureName -> PrimIO (WGPUBool)
    

%foreign "C:wgpuDevicePopErrorScope,libwgpu_native"
export
wgpuDevicePopErrorScope : WGPUDevice -> WGPUPopErrorScopeCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuDevicePushErrorScope,libwgpu_native"
export
wgpuDevicePushErrorScope : WGPUDevice -> WGPUErrorFilter -> PrimIO (())
    

%foreign "C:wgpuDeviceSetLabel,libwgpu_native"
export
wgpuDeviceSetLabel : WGPUDevice -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuDeviceAddRef,libwgpu_native"
export
wgpuDeviceAddRef : WGPUDevice -> PrimIO (())
    

%foreign "C:wgpuDeviceRelease,libwgpu_native"
export
wgpuDeviceRelease : WGPUDevice -> PrimIO (())
    

%foreign "C:wgpuInstanceCreateSurface,libwgpu_native"
export
wgpuInstanceCreateSurface : WGPUInstance -> Ptr (WGPUSurfaceDescriptor) -> PrimIO (WGPUSurface)
    

%foreign "C:wgpuInstanceGetWGSLLanguageFeatures,libwgpu_native"
export
wgpuInstanceGetWGSLLanguageFeatures : WGPUInstance -> Ptr (WGPUSupportedWGSLLanguageFeatures) -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuInstanceHasWGSLLanguageFeature,libwgpu_native"
export
wgpuInstanceHasWGSLLanguageFeature : WGPUInstance -> WGPUWGSLLanguageFeatureName -> PrimIO (WGPUBool)
    

%foreign "C:wgpuInstanceProcessEvents,libwgpu_native"
export
wgpuInstanceProcessEvents : WGPUInstance -> PrimIO (())
    

%foreign "C:wgpuInstanceRequestAdapter,libwgpu_native"
export
wgpuInstanceRequestAdapter : WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> WGPURequestAdapterCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuInstanceWaitAny,libwgpu_native"
export
wgpuInstanceWaitAny : WGPUInstance -> U64 -> Ptr (WGPUFutureWaitInfo) -> U64 -> PrimIO (WGPUWaitStatus)
    

%foreign "C:wgpuInstanceAddRef,libwgpu_native"
export
wgpuInstanceAddRef : WGPUInstance -> PrimIO (())
    

%foreign "C:wgpuInstanceRelease,libwgpu_native"
export
wgpuInstanceRelease : WGPUInstance -> PrimIO (())
    

%foreign "C:wgpuPipelineLayoutSetLabel,libwgpu_native"
export
wgpuPipelineLayoutSetLabel : WGPUPipelineLayout -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuPipelineLayoutAddRef,libwgpu_native"
export
wgpuPipelineLayoutAddRef : WGPUPipelineLayout -> PrimIO (())
    

%foreign "C:wgpuPipelineLayoutRelease,libwgpu_native"
export
wgpuPipelineLayoutRelease : WGPUPipelineLayout -> PrimIO (())
    

%foreign "C:wgpuQuerySetDestroy,libwgpu_native"
export
wgpuQuerySetDestroy : WGPUQuerySet -> PrimIO (())
    

%foreign "C:wgpuQuerySetGetCount,libwgpu_native"
export
wgpuQuerySetGetCount : WGPUQuerySet -> PrimIO (U32)
    

%foreign "C:wgpuQuerySetGetType,libwgpu_native"
export
wgpuQuerySetGetType : WGPUQuerySet -> PrimIO (WGPUQueryType)
    

%foreign "C:wgpuQuerySetSetLabel,libwgpu_native"
export
wgpuQuerySetSetLabel : WGPUQuerySet -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuQuerySetAddRef,libwgpu_native"
export
wgpuQuerySetAddRef : WGPUQuerySet -> PrimIO (())
    

%foreign "C:wgpuQuerySetRelease,libwgpu_native"
export
wgpuQuerySetRelease : WGPUQuerySet -> PrimIO (())
    

%foreign "C:wgpuQueueOnSubmittedWorkDone,libwgpu_native"
export
wgpuQueueOnSubmittedWorkDone : WGPUQueue -> WGPUQueueWorkDoneCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuQueueSetLabel,libwgpu_native"
export
wgpuQueueSetLabel : WGPUQueue -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuQueueSubmit,libwgpu_native"
export
wgpuQueueSubmit : WGPUQueue -> U64 -> Ptr (WGPUCommandBuffer) -> PrimIO (())
    

%foreign "C:wgpuQueueWriteBuffer,libwgpu_native"
export
wgpuQueueWriteBuffer : WGPUQueue -> WGPUBuffer -> U64 -> Ptr (()) -> U64 -> PrimIO (())
    

%foreign "C:wgpuQueueWriteTexture,libwgpu_native"
export
wgpuQueueWriteTexture : WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> U64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> PrimIO (())
    

%foreign "C:wgpuQueueAddRef,libwgpu_native"
export
wgpuQueueAddRef : WGPUQueue -> PrimIO (())
    

%foreign "C:wgpuQueueRelease,libwgpu_native"
export
wgpuQueueRelease : WGPUQueue -> PrimIO (())
    

%foreign "C:wgpuRenderBundleSetLabel,libwgpu_native"
export
wgpuRenderBundleSetLabel : WGPURenderBundle -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderBundleAddRef,libwgpu_native"
export
wgpuRenderBundleAddRef : WGPURenderBundle -> PrimIO (())
    

%foreign "C:wgpuRenderBundleRelease,libwgpu_native"
export
wgpuRenderBundleRelease : WGPURenderBundle -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderDraw,libwgpu_native"
export
wgpuRenderBundleEncoderDraw : WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderDrawIndexed,libwgpu_native"
export
wgpuRenderBundleEncoderDrawIndexed : WGPURenderBundleEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderDrawIndexedIndirect,libwgpu_native"
export
wgpuRenderBundleEncoderDrawIndexedIndirect : WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderDrawIndirect,libwgpu_native"
export
wgpuRenderBundleEncoderDrawIndirect : WGPURenderBundleEncoder -> WGPUBuffer -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderFinish,libwgpu_native"
export
wgpuRenderBundleEncoderFinish : WGPURenderBundleEncoder -> Ptr (WGPURenderBundleDescriptor) -> PrimIO (WGPURenderBundle)
    

%foreign "C:wgpuRenderBundleEncoderInsertDebugMarker,libwgpu_native"
export
wgpuRenderBundleEncoderInsertDebugMarker : WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderPopDebugGroup,libwgpu_native"
export
wgpuRenderBundleEncoderPopDebugGroup : WGPURenderBundleEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderPushDebugGroup,libwgpu_native"
export
wgpuRenderBundleEncoderPushDebugGroup : WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderSetBindGroup,libwgpu_native"
export
wgpuRenderBundleEncoderSetBindGroup : WGPURenderBundleEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderSetIndexBuffer,libwgpu_native"
export
wgpuRenderBundleEncoderSetIndexBuffer : WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderSetLabel,libwgpu_native"
export
wgpuRenderBundleEncoderSetLabel : WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderSetPipeline,libwgpu_native"
export
wgpuRenderBundleEncoderSetPipeline : WGPURenderBundleEncoder -> WGPURenderPipeline -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderSetVertexBuffer,libwgpu_native"
export
wgpuRenderBundleEncoderSetVertexBuffer : WGPURenderBundleEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderAddRef,libwgpu_native"
export
wgpuRenderBundleEncoderAddRef : WGPURenderBundleEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderRelease,libwgpu_native"
export
wgpuRenderBundleEncoderRelease : WGPURenderBundleEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderBeginOcclusionQuery,libwgpu_native"
export
wgpuRenderPassEncoderBeginOcclusionQuery : WGPURenderPassEncoder -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderDraw,libwgpu_native"
export
wgpuRenderPassEncoderDraw : WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderDrawIndexed,libwgpu_native"
export
wgpuRenderPassEncoderDrawIndexed : WGPURenderPassEncoder -> U32 -> U32 -> U32 -> I32 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderDrawIndexedIndirect,libwgpu_native"
export
wgpuRenderPassEncoderDrawIndexedIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderDrawIndirect,libwgpu_native"
export
wgpuRenderPassEncoderDrawIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderEnd,libwgpu_native"
export
wgpuRenderPassEncoderEnd : WGPURenderPassEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderEndOcclusionQuery,libwgpu_native"
export
wgpuRenderPassEncoderEndOcclusionQuery : WGPURenderPassEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderExecuteBundles,libwgpu_native"
export
wgpuRenderPassEncoderExecuteBundles : WGPURenderPassEncoder -> U64 -> Ptr (WGPURenderBundle) -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderInsertDebugMarker,libwgpu_native"
export
wgpuRenderPassEncoderInsertDebugMarker : WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderPopDebugGroup,libwgpu_native"
export
wgpuRenderPassEncoderPopDebugGroup : WGPURenderPassEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderPushDebugGroup,libwgpu_native"
export
wgpuRenderPassEncoderPushDebugGroup : WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetBindGroup,libwgpu_native"
export
wgpuRenderPassEncoderSetBindGroup : WGPURenderPassEncoder -> U32 -> WGPUBindGroup -> U64 -> Ptr (U32) -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetBlendConstant,libwgpu_native"
export
wgpuRenderPassEncoderSetBlendConstant : WGPURenderPassEncoder -> Ptr (WGPUColor) -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetIndexBuffer,libwgpu_native"
export
wgpuRenderPassEncoderSetIndexBuffer : WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> U64 -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetLabel,libwgpu_native"
export
wgpuRenderPassEncoderSetLabel : WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetPipeline,libwgpu_native"
export
wgpuRenderPassEncoderSetPipeline : WGPURenderPassEncoder -> WGPURenderPipeline -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetScissorRect,libwgpu_native"
export
wgpuRenderPassEncoderSetScissorRect : WGPURenderPassEncoder -> U32 -> U32 -> U32 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetStencilReference,libwgpu_native"
export
wgpuRenderPassEncoderSetStencilReference : WGPURenderPassEncoder -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetVertexBuffer,libwgpu_native"
export
wgpuRenderPassEncoderSetVertexBuffer : WGPURenderPassEncoder -> U32 -> WGPUBuffer -> U64 -> U64 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderSetViewport,libwgpu_native"
export
wgpuRenderPassEncoderSetViewport : WGPURenderPassEncoder -> F32 -> F32 -> F32 -> F32 -> F32 -> F32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderAddRef,libwgpu_native"
export
wgpuRenderPassEncoderAddRef : WGPURenderPassEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderRelease,libwgpu_native"
export
wgpuRenderPassEncoderRelease : WGPURenderPassEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPipelineGetBindGroupLayout,libwgpu_native"
export
wgpuRenderPipelineGetBindGroupLayout : WGPURenderPipeline -> U32 -> PrimIO (WGPUBindGroupLayout)
    

%foreign "C:wgpuRenderPipelineSetLabel,libwgpu_native"
export
wgpuRenderPipelineSetLabel : WGPURenderPipeline -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuRenderPipelineAddRef,libwgpu_native"
export
wgpuRenderPipelineAddRef : WGPURenderPipeline -> PrimIO (())
    

%foreign "C:wgpuRenderPipelineRelease,libwgpu_native"
export
wgpuRenderPipelineRelease : WGPURenderPipeline -> PrimIO (())
    

%foreign "C:wgpuSamplerSetLabel,libwgpu_native"
export
wgpuSamplerSetLabel : WGPUSampler -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuSamplerAddRef,libwgpu_native"
export
wgpuSamplerAddRef : WGPUSampler -> PrimIO (())
    

%foreign "C:wgpuSamplerRelease,libwgpu_native"
export
wgpuSamplerRelease : WGPUSampler -> PrimIO (())
    

%foreign "C:wgpuShaderModuleGetCompilationInfo,libwgpu_native"
export
wgpuShaderModuleGetCompilationInfo : WGPUShaderModule -> WGPUCompilationInfoCallbackInfo -> PrimIO (WGPUFuture)
    

%foreign "C:wgpuShaderModuleSetLabel,libwgpu_native"
export
wgpuShaderModuleSetLabel : WGPUShaderModule -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuShaderModuleAddRef,libwgpu_native"
export
wgpuShaderModuleAddRef : WGPUShaderModule -> PrimIO (())
    

%foreign "C:wgpuShaderModuleRelease,libwgpu_native"
export
wgpuShaderModuleRelease : WGPUShaderModule -> PrimIO (())
    

%foreign "C:wgpuSupportedFeaturesFreeMembers,libwgpu_native"
export
wgpuSupportedFeaturesFreeMembers : WGPUSupportedFeatures -> PrimIO (())
    

%foreign "C:wgpuSupportedWGSLLanguageFeaturesFreeMembers,libwgpu_native"
export
wgpuSupportedWGSLLanguageFeaturesFreeMembers : WGPUSupportedWGSLLanguageFeatures -> PrimIO (())
    

%foreign "C:wgpuSurfaceConfigure,libwgpu_native"
export
wgpuSurfaceConfigure : WGPUSurface -> Ptr (WGPUSurfaceConfiguration) -> PrimIO (())
    

%foreign "C:wgpuSurfaceGetCapabilities,libwgpu_native"
export
wgpuSurfaceGetCapabilities : WGPUSurface -> WGPUAdapter -> Ptr (WGPUSurfaceCapabilities) -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuSurfaceGetCurrentTexture,libwgpu_native"
export
wgpuSurfaceGetCurrentTexture : WGPUSurface -> Ptr (WGPUSurfaceTexture) -> PrimIO (())
    

%foreign "C:wgpuSurfacePresent,libwgpu_native"
export
wgpuSurfacePresent : WGPUSurface -> PrimIO (WGPUStatus)
    

%foreign "C:wgpuSurfaceSetLabel,libwgpu_native"
export
wgpuSurfaceSetLabel : WGPUSurface -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuSurfaceUnconfigure,libwgpu_native"
export
wgpuSurfaceUnconfigure : WGPUSurface -> PrimIO (())
    

%foreign "C:wgpuSurfaceAddRef,libwgpu_native"
export
wgpuSurfaceAddRef : WGPUSurface -> PrimIO (())
    

%foreign "C:wgpuSurfaceRelease,libwgpu_native"
export
wgpuSurfaceRelease : WGPUSurface -> PrimIO (())
    

%foreign "C:wgpuSurfaceCapabilitiesFreeMembers,libwgpu_native"
export
wgpuSurfaceCapabilitiesFreeMembers : WGPUSurfaceCapabilities -> PrimIO (())
    

%foreign "C:wgpuTextureCreateView,libwgpu_native"
export
wgpuTextureCreateView : WGPUTexture -> Ptr (WGPUTextureViewDescriptor) -> PrimIO (WGPUTextureView)
    

%foreign "C:wgpuTextureDestroy,libwgpu_native"
export
wgpuTextureDestroy : WGPUTexture -> PrimIO (())
    

%foreign "C:wgpuTextureGetDepthOrArrayLayers,libwgpu_native"
export
wgpuTextureGetDepthOrArrayLayers : WGPUTexture -> PrimIO (U32)
    

%foreign "C:wgpuTextureGetDimension,libwgpu_native"
export
wgpuTextureGetDimension : WGPUTexture -> PrimIO (WGPUTextureDimension)
    

%foreign "C:wgpuTextureGetFormat,libwgpu_native"
export
wgpuTextureGetFormat : WGPUTexture -> PrimIO (WGPUTextureFormat)
    

%foreign "C:wgpuTextureGetHeight,libwgpu_native"
export
wgpuTextureGetHeight : WGPUTexture -> PrimIO (U32)
    

%foreign "C:wgpuTextureGetMipLevelCount,libwgpu_native"
export
wgpuTextureGetMipLevelCount : WGPUTexture -> PrimIO (U32)
    

%foreign "C:wgpuTextureGetSampleCount,libwgpu_native"
export
wgpuTextureGetSampleCount : WGPUTexture -> PrimIO (U32)
    

%foreign "C:wgpuTextureGetUsage,libwgpu_native"
export
wgpuTextureGetUsage : WGPUTexture -> PrimIO (WGPUTextureUsage)
    

%foreign "C:wgpuTextureGetWidth,libwgpu_native"
export
wgpuTextureGetWidth : WGPUTexture -> PrimIO (U32)
    

%foreign "C:wgpuTextureSetLabel,libwgpu_native"
export
wgpuTextureSetLabel : WGPUTexture -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuTextureAddRef,libwgpu_native"
export
wgpuTextureAddRef : WGPUTexture -> PrimIO (())
    

%foreign "C:wgpuTextureRelease,libwgpu_native"
export
wgpuTextureRelease : WGPUTexture -> PrimIO (())
    

%foreign "C:wgpuTextureViewSetLabel,libwgpu_native"
export
wgpuTextureViewSetLabel : WGPUTextureView -> WGPUStringView -> PrimIO (())
    

%foreign "C:wgpuTextureViewAddRef,libwgpu_native"
export
wgpuTextureViewAddRef : WGPUTextureView -> PrimIO (())
    

%foreign "C:wgpuTextureViewRelease,libwgpu_native"
export
wgpuTextureViewRelease : WGPUTextureView -> PrimIO (())
    

public export
WGPUNativeSType : Type
WGPUNativeSType = Enum

public export
WGPUSType_DeviceExtras : WGPUNativeSType
WGPUSType_DeviceExtras = 0x00030001

public export
WGPUSType_NativeLimits : WGPUNativeSType
WGPUSType_NativeLimits = 0x00030002

public export
WGPUSType_PipelineLayoutExtras : WGPUNativeSType
WGPUSType_PipelineLayoutExtras = 0x00030003

public export
WGPUSType_ShaderSourceGLSL : WGPUNativeSType
WGPUSType_ShaderSourceGLSL = 0x00030004

public export
WGPUSType_InstanceExtras : WGPUNativeSType
WGPUSType_InstanceExtras = 0x00030006

public export
WGPUSType_BindGroupEntryExtras : WGPUNativeSType
WGPUSType_BindGroupEntryExtras = 0x00030007

public export
WGPUSType_BindGroupLayoutEntryExtras : WGPUNativeSType
WGPUSType_BindGroupLayoutEntryExtras = 0x00030008

public export
WGPUSType_QuerySetDescriptorExtras : WGPUNativeSType
WGPUSType_QuerySetDescriptorExtras = 0x00030009

public export
WGPUSType_SurfaceConfigurationExtras : WGPUNativeSType
WGPUSType_SurfaceConfigurationExtras = 0x0003000A

public export
WGPUSType_SurfaceSourceSwapChainPanel : WGPUNativeSType
WGPUSType_SurfaceSourceSwapChainPanel = 0x0003000B

public export
WGPUSType_PrimitiveStateExtras : WGPUNativeSType
WGPUSType_PrimitiveStateExtras = 0x0003000C

public export
WGPUNativeSType_Force32 : WGPUNativeSType
WGPUNativeSType_Force32 = 0x7FFFFFFF

public export
WGPUNativeFeature : Type
WGPUNativeFeature = Enum

public export
WGPUNativeFeature_PushConstants : WGPUNativeFeature
WGPUNativeFeature_PushConstants = 0x00030001

public export
WGPUNativeFeature_TextureAdapterSpecificFormatFeatures : WGPUNativeFeature
WGPUNativeFeature_TextureAdapterSpecificFormatFeatures = 0x00030002

public export
WGPUNativeFeature_MultiDrawIndirectCount : WGPUNativeFeature
WGPUNativeFeature_MultiDrawIndirectCount = 0x00030004

public export
WGPUNativeFeature_VertexWritableStorage : WGPUNativeFeature
WGPUNativeFeature_VertexWritableStorage = 0x00030005

public export
WGPUNativeFeature_TextureBindingArray : WGPUNativeFeature
WGPUNativeFeature_TextureBindingArray = 0x00030006

public export
WGPUNativeFeature_SampledTextureAndStorageBufferArrayNonUniformIndexing : WGPUNativeFeature
WGPUNativeFeature_SampledTextureAndStorageBufferArrayNonUniformIndexing = 0x00030007

public export
WGPUNativeFeature_PipelineStatisticsQuery : WGPUNativeFeature
WGPUNativeFeature_PipelineStatisticsQuery = 0x00030008

public export
WGPUNativeFeature_StorageResourceBindingArray : WGPUNativeFeature
WGPUNativeFeature_StorageResourceBindingArray = 0x00030009

public export
WGPUNativeFeature_PartiallyBoundBindingArray : WGPUNativeFeature
WGPUNativeFeature_PartiallyBoundBindingArray = 0x0003000A

public export
WGPUNativeFeature_TextureFormat16bitNorm : WGPUNativeFeature
WGPUNativeFeature_TextureFormat16bitNorm = 0x0003000B

public export
WGPUNativeFeature_TextureCompressionAstcHdr : WGPUNativeFeature
WGPUNativeFeature_TextureCompressionAstcHdr = 0x0003000C

public export
WGPUNativeFeature_MappablePrimaryBuffers : WGPUNativeFeature
WGPUNativeFeature_MappablePrimaryBuffers = 0x0003000E

public export
WGPUNativeFeature_BufferBindingArray : WGPUNativeFeature
WGPUNativeFeature_BufferBindingArray = 0x0003000F

public export
WGPUNativeFeature_UniformBufferAndStorageTextureArrayNonUniformIndexing : WGPUNativeFeature
WGPUNativeFeature_UniformBufferAndStorageTextureArrayNonUniformIndexing = 0x00030010

public export
WGPUNativeFeature_PolygonModeLine : WGPUNativeFeature
WGPUNativeFeature_PolygonModeLine = 0x00030013

public export
WGPUNativeFeature_PolygonModePoint : WGPUNativeFeature
WGPUNativeFeature_PolygonModePoint = 0x00030014

public export
WGPUNativeFeature_ConservativeRasterization : WGPUNativeFeature
WGPUNativeFeature_ConservativeRasterization = 0x00030015

public export
WGPUNativeFeature_SpirvShaderPassthrough : WGPUNativeFeature
WGPUNativeFeature_SpirvShaderPassthrough = 0x00030017

public export
WGPUNativeFeature_VertexAttribute64bit : WGPUNativeFeature
WGPUNativeFeature_VertexAttribute64bit = 0x00030019

public export
WGPUNativeFeature_TextureFormatNv12 : WGPUNativeFeature
WGPUNativeFeature_TextureFormatNv12 = 0x0003001A

public export
WGPUNativeFeature_RayQuery : WGPUNativeFeature
WGPUNativeFeature_RayQuery = 0x0003001C

public export
WGPUNativeFeature_ShaderF64 : WGPUNativeFeature
WGPUNativeFeature_ShaderF64 = 0x0003001D

public export
WGPUNativeFeature_ShaderI16 : WGPUNativeFeature
WGPUNativeFeature_ShaderI16 = 0x0003001E

public export
WGPUNativeFeature_ShaderPrimitiveIndex : WGPUNativeFeature
WGPUNativeFeature_ShaderPrimitiveIndex = 0x0003001F

public export
WGPUNativeFeature_ShaderEarlyDepthTest : WGPUNativeFeature
WGPUNativeFeature_ShaderEarlyDepthTest = 0x00030020

public export
WGPUNativeFeature_Subgroup : WGPUNativeFeature
WGPUNativeFeature_Subgroup = 0x00030021

public export
WGPUNativeFeature_SubgroupVertex : WGPUNativeFeature
WGPUNativeFeature_SubgroupVertex = 0x00030022

public export
WGPUNativeFeature_SubgroupBarrier : WGPUNativeFeature
WGPUNativeFeature_SubgroupBarrier = 0x00030023

public export
WGPUNativeFeature_TimestampQueryInsideEncoders : WGPUNativeFeature
WGPUNativeFeature_TimestampQueryInsideEncoders = 0x00030024

public export
WGPUNativeFeature_TimestampQueryInsidePasses : WGPUNativeFeature
WGPUNativeFeature_TimestampQueryInsidePasses = 0x00030025

public export
WGPUNativeFeature_ShaderInt64 : WGPUNativeFeature
WGPUNativeFeature_ShaderInt64 = 0x00030026

public export
WGPUNativeFeature_Force32 : WGPUNativeFeature
WGPUNativeFeature_Force32 = 0x7FFFFFFF

public export
WGPULogLevel : Type
WGPULogLevel = Enum

public export
WGPULogLevel_Off : WGPULogLevel
WGPULogLevel_Off = 0x00000000

public export
WGPULogLevel_Error : WGPULogLevel
WGPULogLevel_Error = 0x00000001

public export
WGPULogLevel_Warn : WGPULogLevel
WGPULogLevel_Warn = 0x00000002

public export
WGPULogLevel_Info : WGPULogLevel
WGPULogLevel_Info = 0x00000003

public export
WGPULogLevel_Debug : WGPULogLevel
WGPULogLevel_Debug = 0x00000004

public export
WGPULogLevel_Trace : WGPULogLevel
WGPULogLevel_Trace = 0x00000005

public export
WGPULogLevel_Force32 : WGPULogLevel
WGPULogLevel_Force32 = 0x7FFFFFFF

public export
WGPUInstanceBackend : Type
WGPUInstanceBackend = WGPUFlags

WGPUInstanceBackend_All : WGPUInstanceBackend
WGPUInstanceBackend_All = 0x00000000

WGPUInstanceBackend_Vulkan : WGPUInstanceBackend
WGPUInstanceBackend_Vulkan = (shiftL 1 0)

WGPUInstanceBackend_GL : WGPUInstanceBackend
WGPUInstanceBackend_GL = (shiftL 1 1)

WGPUInstanceBackend_Metal : WGPUInstanceBackend
WGPUInstanceBackend_Metal = (shiftL 1 2)

WGPUInstanceBackend_DX12 : WGPUInstanceBackend
WGPUInstanceBackend_DX12 = (shiftL 1 3)

WGPUInstanceBackend_DX11 : WGPUInstanceBackend
WGPUInstanceBackend_DX11 = (shiftL 1 4)

WGPUInstanceBackend_BrowserWebGPU : WGPUInstanceBackend
WGPUInstanceBackend_BrowserWebGPU = (shiftL 1 5)

WGPUInstanceBackend_Primary : WGPUInstanceBackend
WGPUInstanceBackend_Primary = ((((shiftL 1 0) .|. (shiftL 1 2)) .|. (shiftL 1 3)) .|. (shiftL 1 5))

WGPUInstanceBackend_Secondary : WGPUInstanceBackend
WGPUInstanceBackend_Secondary = ((shiftL 1 1) .|. (shiftL 1 4))

WGPUInstanceBackend_Force32 : WGPUInstanceBackend
WGPUInstanceBackend_Force32 = 0x7FFFFFFF

public export
WGPUInstanceFlag : Type
WGPUInstanceFlag = WGPUFlags

WGPUInstanceFlag_Default : WGPUInstanceFlag
WGPUInstanceFlag_Default = 0x00000000

WGPUInstanceFlag_Debug : WGPUInstanceFlag
WGPUInstanceFlag_Debug = (shiftL 1 0)

WGPUInstanceFlag_Validation : WGPUInstanceFlag
WGPUInstanceFlag_Validation = (shiftL 1 1)

WGPUInstanceFlag_DiscardHalLabels : WGPUInstanceFlag
WGPUInstanceFlag_DiscardHalLabels = (shiftL 1 2)

WGPUInstanceFlag_Force32 : WGPUInstanceFlag
WGPUInstanceFlag_Force32 = 0x7FFFFFFF

public export
WGPUDx12Compiler : Type
WGPUDx12Compiler = Enum

public export
WGPUDx12Compiler_Undefined : WGPUDx12Compiler
WGPUDx12Compiler_Undefined = 0x00000000

public export
WGPUDx12Compiler_Fxc : WGPUDx12Compiler
WGPUDx12Compiler_Fxc = 0x00000001

public export
WGPUDx12Compiler_Dxc : WGPUDx12Compiler
WGPUDx12Compiler_Dxc = 0x00000002

public export
WGPUDx12Compiler_Force32 : WGPUDx12Compiler
WGPUDx12Compiler_Force32 = 0x7FFFFFFF

public export
WGPUGles3MinorVersion : Type
WGPUGles3MinorVersion = Enum

public export
WGPUGles3MinorVersion_Automatic : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Automatic = 0x00000000

public export
WGPUGles3MinorVersion_Version0 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Version0 = 0x00000001

public export
WGPUGles3MinorVersion_Version1 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Version1 = 0x00000002

public export
WGPUGles3MinorVersion_Version2 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Version2 = 0x00000003

public export
WGPUGles3MinorVersion_Force32 : WGPUGles3MinorVersion
WGPUGles3MinorVersion_Force32 = 0x7FFFFFFF

public export
WGPUPipelineStatisticName : Type
WGPUPipelineStatisticName = Enum

public export
WGPUPipelineStatisticName_VertexShaderInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_VertexShaderInvocations = 0x00000000

public export
WGPUPipelineStatisticName_ClipperInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_ClipperInvocations = 0x00000001

public export
WGPUPipelineStatisticName_ClipperPrimitivesOut : WGPUPipelineStatisticName
WGPUPipelineStatisticName_ClipperPrimitivesOut = 0x00000002

public export
WGPUPipelineStatisticName_FragmentShaderInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_FragmentShaderInvocations = 0x00000003

public export
WGPUPipelineStatisticName_ComputeShaderInvocations : WGPUPipelineStatisticName
WGPUPipelineStatisticName_ComputeShaderInvocations = 0x00000004

public export
WGPUPipelineStatisticName_Force32 : WGPUPipelineStatisticName
WGPUPipelineStatisticName_Force32 = 0x7FFFFFFF

public export
WGPUNativeQueryType : Type
WGPUNativeQueryType = Enum

public export
WGPUNativeQueryType_PipelineStatistics : WGPUNativeQueryType
WGPUNativeQueryType_PipelineStatistics = 0x00030000

public export
WGPUNativeQueryType_Force32 : WGPUNativeQueryType
WGPUNativeQueryType_Force32 = 0x7FFFFFFF

public export
WGPUDxcMaxShaderModel : Type
WGPUDxcMaxShaderModel = Enum

public export
WGPUDxcMaxShaderModel_V6_0 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_0 = 0x00000000

public export
WGPUDxcMaxShaderModel_V6_1 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_1 = 0x00000001

public export
WGPUDxcMaxShaderModel_V6_2 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_2 = 0x00000002

public export
WGPUDxcMaxShaderModel_V6_3 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_3 = 0x00000003

public export
WGPUDxcMaxShaderModel_V6_4 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_4 = 0x00000004

public export
WGPUDxcMaxShaderModel_V6_5 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_5 = 0x00000005

public export
WGPUDxcMaxShaderModel_V6_6 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_6 = 0x00000006

public export
WGPUDxcMaxShaderModel_V6_7 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_V6_7 = 0x00000007

public export
WGPUDxcMaxShaderModel_Force32 : WGPUDxcMaxShaderModel
WGPUDxcMaxShaderModel_Force32 = 0x7FFFFFFF

public export
WGPUGLFenceBehaviour : Type
WGPUGLFenceBehaviour = Enum

public export
WGPUGLFenceBehaviour_Normal : WGPUGLFenceBehaviour
WGPUGLFenceBehaviour_Normal = 0x00000000

public export
WGPUGLFenceBehaviour_AutoFinish : WGPUGLFenceBehaviour
WGPUGLFenceBehaviour_AutoFinish = 0x00000001

public export
WGPUGLFenceBehaviour_Force32 : WGPUGLFenceBehaviour
WGPUGLFenceBehaviour_Force32 = 0x7FFFFFFF

public export
WGPUInstanceExtras : Type
WGPUInstanceExtras = Struct "WGPUInstanceExtras" [("chain",  (WGPUChainedStruct)),("backends",  (WGPUInstanceBackend)),("flags",  (WGPUInstanceFlag)),("dx12ShaderCompiler",  (WGPUDx12Compiler)),("gles3MinorVersion",  (WGPUGles3MinorVersion)),("glFenceBehaviour",  (WGPUGLFenceBehaviour)),("dxcPath",  (WGPUStringView)),("dxcMaxShaderModel",  (WGPUDxcMaxShaderModel)),("budgetForDeviceCreation", Ptr (U8)),("budgetForDeviceLoss", Ptr (U8))]

public export
WGPUDeviceExtras : Type
WGPUDeviceExtras = Struct "WGPUDeviceExtras" [("chain",  (WGPUChainedStruct)),("tracePath",  (WGPUStringView))]

public export
WGPUNativeLimits : Type
WGPUNativeLimits = Struct "WGPUNativeLimits" [("chain",  (WGPUChainedStructOut)),("maxPushConstantSize",  (U32)),("maxNonSamplerBindings",  (U32))]

public export
WGPUPushConstantRange : Type
WGPUPushConstantRange = Struct "WGPUPushConstantRange" [("stages",  (WGPUShaderStage)),("start",  (U32)),("end",  (U32))]

public export
WGPUPipelineLayoutExtras : Type
WGPUPipelineLayoutExtras = Struct "WGPUPipelineLayoutExtras" [("chain",  (WGPUChainedStruct)),("pushConstantRangeCount",  (U64)),("pushConstantRanges", Ptr (WGPUPushConstantRange))]

public export
WGPUSubmissionIndex : Type
WGPUSubmissionIndex = U64

public export
WGPUShaderDefine : Type
WGPUShaderDefine = Struct "WGPUShaderDefine" [("name",  (WGPUStringView)),("value",  (WGPUStringView))]

public export
WGPUShaderSourceGLSL : Type
WGPUShaderSourceGLSL = Struct "WGPUShaderSourceGLSL" [("chain",  (WGPUChainedStruct)),("stage",  (WGPUShaderStage)),("code",  (WGPUStringView)),("defineCount",  (U32)),("defines", Ptr (WGPUShaderDefine))]

public export
WGPUShaderModuleDescriptorSpirV : Type
WGPUShaderModuleDescriptorSpirV = Struct "WGPUShaderModuleDescriptorSpirV" [("label",  (WGPUStringView)),("sourceSize",  (U32)),("source", Ptr (U32))]

public export
WGPURegistryReport : Type
WGPURegistryReport = Struct "WGPURegistryReport" [("numAllocated",  (U64)),("numKeptFromUser",  (U64)),("numReleasedFromUser",  (U64)),("elementSize",  (U64))]

public export
WGPUHubReport : Type
WGPUHubReport = Struct "WGPUHubReport" [("adapters",  (WGPURegistryReport)),("devices",  (WGPURegistryReport)),("queues",  (WGPURegistryReport)),("pipelineLayouts",  (WGPURegistryReport)),("shaderModules",  (WGPURegistryReport)),("bindGroupLayouts",  (WGPURegistryReport)),("bindGroups",  (WGPURegistryReport)),("commandBuffers",  (WGPURegistryReport)),("renderBundles",  (WGPURegistryReport)),("renderPipelines",  (WGPURegistryReport)),("computePipelines",  (WGPURegistryReport)),("pipelineCaches",  (WGPURegistryReport)),("querySets",  (WGPURegistryReport)),("buffers",  (WGPURegistryReport)),("textures",  (WGPURegistryReport)),("textureViews",  (WGPURegistryReport)),("samplers",  (WGPURegistryReport))]

public export
WGPUGlobalReport : Type
WGPUGlobalReport = Struct "WGPUGlobalReport" [("surfaces",  (WGPURegistryReport)),("hub",  (WGPUHubReport))]

public export
WGPUInstanceEnumerateAdapterOptions : Type
WGPUInstanceEnumerateAdapterOptions = Struct "WGPUInstanceEnumerateAdapterOptions" [("nextInChain", Ptr (WGPUChainedStruct)),("backends",  (WGPUInstanceBackend))]

public export
WGPUBindGroupEntryExtras : Type
WGPUBindGroupEntryExtras = Struct "WGPUBindGroupEntryExtras" [("chain",  (WGPUChainedStruct)),("buffers", Ptr (WGPUBuffer)),("bufferCount",  (U64)),("samplers", Ptr (WGPUSampler)),("samplerCount",  (U64)),("textureViews", Ptr (WGPUTextureView)),("textureViewCount",  (U64))]

public export
WGPUBindGroupLayoutEntryExtras : Type
WGPUBindGroupLayoutEntryExtras = Struct "WGPUBindGroupLayoutEntryExtras" [("chain",  (WGPUChainedStruct)),("count",  (U32))]

public export
WGPUQuerySetDescriptorExtras : Type
WGPUQuerySetDescriptorExtras = Struct "WGPUQuerySetDescriptorExtras" [("chain",  (WGPUChainedStruct)),("pipelineStatistics", Ptr (WGPUPipelineStatisticName)),("pipelineStatisticCount",  (U64))]

public export
WGPUSurfaceConfigurationExtras : Type
WGPUSurfaceConfigurationExtras = Struct "WGPUSurfaceConfigurationExtras" [("chain",  (WGPUChainedStruct)),("desiredMaximumFrameLatency",  (U32))]

public export
WGPUSurfaceSourceSwapChainPanel : Type
WGPUSurfaceSourceSwapChainPanel = Struct "WGPUSurfaceSourceSwapChainPanel" [("chain",  (WGPUChainedStruct)),("panelNative", Ptr (()))]

public export
WGPUPolygonMode : Type
WGPUPolygonMode = Enum

public export
WGPUPolygonMode_Fill : WGPUPolygonMode
WGPUPolygonMode_Fill = 0

public export
WGPUPolygonMode_Line : WGPUPolygonMode
WGPUPolygonMode_Line = 1

public export
WGPUPolygonMode_Point : WGPUPolygonMode
WGPUPolygonMode_Point = 2

public export
WGPUPrimitiveStateExtras : Type
WGPUPrimitiveStateExtras = Struct "WGPUPrimitiveStateExtras" [("chain",  (WGPUChainedStruct)),("polygonMode",  (WGPUPolygonMode)),("conservative",  (WGPUBool))]

public export
WGPULogCallback : Type
WGPULogCallback = Ptr (WGPULogLevel -> WGPUStringView -> Ptr (()) -> ())

public export
WGPUNativeTextureFormat : Type
WGPUNativeTextureFormat = Enum

public export
WGPUNativeTextureFormat_R16Unorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_R16Unorm = 0x00030001

public export
WGPUNativeTextureFormat_R16Snorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_R16Snorm = 0x00030002

public export
WGPUNativeTextureFormat_Rg16Unorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rg16Unorm = 0x00030003

public export
WGPUNativeTextureFormat_Rg16Snorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rg16Snorm = 0x00030004

public export
WGPUNativeTextureFormat_Rgba16Unorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rgba16Unorm = 0x00030005

public export
WGPUNativeTextureFormat_Rgba16Snorm : WGPUNativeTextureFormat
WGPUNativeTextureFormat_Rgba16Snorm = 0x00030006

public export
WGPUNativeTextureFormat_NV12 : WGPUNativeTextureFormat
WGPUNativeTextureFormat_NV12 = 0x00030007

public export
WGPUNativeTextureFormat_P010 : WGPUNativeTextureFormat
WGPUNativeTextureFormat_P010 = 0x00030008

%foreign "C:wgpuGenerateReport,libwgpu_native"
export
wgpuGenerateReport : WGPUInstance -> Ptr (WGPUGlobalReport) -> PrimIO (())
    

%foreign "C:wgpuInstanceEnumerateAdapters,libwgpu_native"
export
wgpuInstanceEnumerateAdapters : WGPUInstance -> Ptr (WGPUInstanceEnumerateAdapterOptions) -> Ptr (WGPUAdapter) -> PrimIO (U64)
    

%foreign "C:wgpuQueueSubmitForIndex,libwgpu_native"
export
wgpuQueueSubmitForIndex : WGPUQueue -> U64 -> Ptr (WGPUCommandBuffer) -> PrimIO (WGPUSubmissionIndex)
    

%foreign "C:wgpuDevicePoll,libwgpu_native"
export
wgpuDevicePoll : WGPUDevice -> WGPUBool -> Ptr (WGPUSubmissionIndex) -> PrimIO (WGPUBool)
    

%foreign "C:wgpuDeviceCreateShaderModuleSpirV,libwgpu_native"
export
wgpuDeviceCreateShaderModuleSpirV : WGPUDevice -> Ptr (WGPUShaderModuleDescriptorSpirV) -> PrimIO (WGPUShaderModule)
    

%foreign "C:wgpuSetLogCallback,libwgpu_native"
export
wgpuSetLogCallback : WGPULogCallback -> Ptr (()) -> PrimIO (())
    

%foreign "C:wgpuSetLogLevel,libwgpu_native"
export
wgpuSetLogLevel : WGPULogLevel -> PrimIO (())
    

%foreign "C:wgpuGetVersion,libwgpu_native"
export
wgpuGetVersion : PrimIO (U32)
    

%foreign "C:wgpuRenderPassEncoderSetPushConstants,libwgpu_native"
export
wgpuRenderPassEncoderSetPushConstants : WGPURenderPassEncoder -> WGPUShaderStage -> U32 -> U32 -> Ptr (()) -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderSetPushConstants,libwgpu_native"
export
wgpuComputePassEncoderSetPushConstants : WGPUComputePassEncoder -> U32 -> U32 -> Ptr (()) -> PrimIO (())
    

%foreign "C:wgpuRenderBundleEncoderSetPushConstants,libwgpu_native"
export
wgpuRenderBundleEncoderSetPushConstants : WGPURenderBundleEncoder -> WGPUShaderStage -> U32 -> U32 -> Ptr (()) -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndirect,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndexedIndirect,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndexedIndirect : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndirectCount,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndirectCount : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderMultiDrawIndexedIndirectCount,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndexedIndirectCount : WGPURenderPassEncoder -> WGPUBuffer -> U64 -> WGPUBuffer -> U64 -> U32 -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderBeginPipelineStatisticsQuery,libwgpu_native"
export
wgpuComputePassEncoderBeginPipelineStatisticsQuery : WGPUComputePassEncoder -> WGPUQuerySet -> U32 -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderEndPipelineStatisticsQuery,libwgpu_native"
export
wgpuComputePassEncoderEndPipelineStatisticsQuery : WGPUComputePassEncoder -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderBeginPipelineStatisticsQuery,libwgpu_native"
export
wgpuRenderPassEncoderBeginPipelineStatisticsQuery : WGPURenderPassEncoder -> WGPUQuerySet -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderEndPipelineStatisticsQuery,libwgpu_native"
export
wgpuRenderPassEncoderEndPipelineStatisticsQuery : WGPURenderPassEncoder -> PrimIO (())
    

%foreign "C:wgpuComputePassEncoderWriteTimestamp,libwgpu_native"
export
wgpuComputePassEncoderWriteTimestamp : WGPUComputePassEncoder -> WGPUQuerySet -> U32 -> PrimIO (())
    

%foreign "C:wgpuRenderPassEncoderWriteTimestamp,libwgpu_native"
export
wgpuRenderPassEncoderWriteTimestamp : WGPURenderPassEncoder -> WGPUQuerySet -> U32 -> PrimIO (())
    
