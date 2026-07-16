
module Graphics.WGPU.Sys

-- import public System.FFI
import Data.Bits

import Utils.CTypes
import System.ScopedIO



public export
WGPUFlags : Type
WGPUFlags = Bits64

public export
WGPUBool : Type
WGPUBool = Bits32

public export
WGPUStringView : Type
WGPUStringView = Struct "WGPUStringView" [("data", Ptr (Bits8)),("length",  (Bits64))]

-- struct here!!
%foreign (allocStructPrimCodegen WGPUStringView)
prim__allocStructWGPUStringView : allocStructPrimType WGPUStringView

export
AllocStruct WGPUStringView where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUStringView xs

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

public export
WGPUBufferUsage_None : WGPUBufferUsage
WGPUBufferUsage_None = 0x0000000000000000

public export
WGPUBufferUsage_MapRead : WGPUBufferUsage
WGPUBufferUsage_MapRead = 0x0000000000000001

public export
WGPUBufferUsage_MapWrite : WGPUBufferUsage
WGPUBufferUsage_MapWrite = 0x0000000000000002

public export
WGPUBufferUsage_CopySrc : WGPUBufferUsage
WGPUBufferUsage_CopySrc = 0x0000000000000004

public export
WGPUBufferUsage_CopyDst : WGPUBufferUsage
WGPUBufferUsage_CopyDst = 0x0000000000000008

public export
WGPUBufferUsage_Index : WGPUBufferUsage
WGPUBufferUsage_Index = 0x0000000000000010

public export
WGPUBufferUsage_Vertex : WGPUBufferUsage
WGPUBufferUsage_Vertex = 0x0000000000000020

public export
WGPUBufferUsage_Uniform : WGPUBufferUsage
WGPUBufferUsage_Uniform = 0x0000000000000040

public export
WGPUBufferUsage_Storage : WGPUBufferUsage
WGPUBufferUsage_Storage = 0x0000000000000080

public export
WGPUBufferUsage_Indirect : WGPUBufferUsage
WGPUBufferUsage_Indirect = 0x0000000000000100

public export
WGPUBufferUsage_QueryResolve : WGPUBufferUsage
WGPUBufferUsage_QueryResolve = 0x0000000000000200

public export
WGPUColorWriteMask : Type
WGPUColorWriteMask = WGPUFlags

public export
WGPUColorWriteMask_None : WGPUColorWriteMask
WGPUColorWriteMask_None = 0x0000000000000000

public export
WGPUColorWriteMask_Red : WGPUColorWriteMask
WGPUColorWriteMask_Red = 0x0000000000000001

public export
WGPUColorWriteMask_Green : WGPUColorWriteMask
WGPUColorWriteMask_Green = 0x0000000000000002

public export
WGPUColorWriteMask_Blue : WGPUColorWriteMask
WGPUColorWriteMask_Blue = 0x0000000000000004

public export
WGPUColorWriteMask_Alpha : WGPUColorWriteMask
WGPUColorWriteMask_Alpha = 0x0000000000000008

public export
WGPUColorWriteMask_All : WGPUColorWriteMask
WGPUColorWriteMask_All = 0x000000000000000F

public export
WGPUMapMode : Type
WGPUMapMode = WGPUFlags

public export
WGPUMapMode_None : WGPUMapMode
WGPUMapMode_None = 0x0000000000000000

public export
WGPUMapMode_Read : WGPUMapMode
WGPUMapMode_Read = 0x0000000000000001

public export
WGPUMapMode_Write : WGPUMapMode
WGPUMapMode_Write = 0x0000000000000002

public export
WGPUShaderStage : Type
WGPUShaderStage = WGPUFlags

public export
WGPUShaderStage_None : WGPUShaderStage
WGPUShaderStage_None = 0x0000000000000000

public export
WGPUShaderStage_Vertex : WGPUShaderStage
WGPUShaderStage_Vertex = 0x0000000000000001

public export
WGPUShaderStage_Fragment : WGPUShaderStage
WGPUShaderStage_Fragment = 0x0000000000000002

public export
WGPUShaderStage_Compute : WGPUShaderStage
WGPUShaderStage_Compute = 0x0000000000000004

public export
WGPUTextureUsage : Type
WGPUTextureUsage = WGPUFlags

public export
WGPUTextureUsage_None : WGPUTextureUsage
WGPUTextureUsage_None = 0x0000000000000000

public export
WGPUTextureUsage_CopySrc : WGPUTextureUsage
WGPUTextureUsage_CopySrc = 0x0000000000000001

public export
WGPUTextureUsage_CopyDst : WGPUTextureUsage
WGPUTextureUsage_CopyDst = 0x0000000000000002

public export
WGPUTextureUsage_TextureBinding : WGPUTextureUsage
WGPUTextureUsage_TextureBinding = 0x0000000000000004

public export
WGPUTextureUsage_StorageBinding : WGPUTextureUsage
WGPUTextureUsage_StorageBinding = 0x0000000000000008

public export
WGPUTextureUsage_RenderAttachment : WGPUTextureUsage
WGPUTextureUsage_RenderAttachment = 0x0000000000000010

public export
WGPUProc : Type
WGPUProc = Ptr (() -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProc : (() -> PrimIO (())) -> PrimIO $ WGPUProc

public export
WGPUBufferMapCallback : Type
WGPUBufferMapCallback = Ptr (WGPUMapAsyncStatus -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUBufferMapCallback : (WGPUMapAsyncStatus -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUBufferMapCallback

public export
WGPUCompilationInfoCallback : Type
WGPUCompilationInfoCallback = Ptr (WGPUCompilationInfoRequestStatus -> Ptr (Struct "WGPUCompilationInfo" []) -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUCompilationInfoCallback : (WGPUCompilationInfoRequestStatus -> Ptr (Struct "WGPUCompilationInfo" []) -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUCompilationInfoCallback

public export
WGPUCreateComputePipelineAsyncCallback : Type
WGPUCreateComputePipelineAsyncCallback = Ptr (WGPUCreatePipelineAsyncStatus -> WGPUComputePipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUCreateComputePipelineAsyncCallback : (WGPUCreatePipelineAsyncStatus -> WGPUComputePipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUCreateComputePipelineAsyncCallback

public export
WGPUCreateRenderPipelineAsyncCallback : Type
WGPUCreateRenderPipelineAsyncCallback = Ptr (WGPUCreatePipelineAsyncStatus -> WGPURenderPipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUCreateRenderPipelineAsyncCallback : (WGPUCreatePipelineAsyncStatus -> WGPURenderPipeline -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUCreateRenderPipelineAsyncCallback

public export
WGPUDeviceLostCallback : Type
WGPUDeviceLostCallback = Ptr (Ptr (WGPUDevice) -> WGPUDeviceLostReason -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUDeviceLostCallback : (Ptr (WGPUDevice) -> WGPUDeviceLostReason -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUDeviceLostCallback

public export
WGPUPopErrorScopeCallback : Type
WGPUPopErrorScopeCallback = Ptr (WGPUPopErrorScopeStatus -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUPopErrorScopeCallback : (WGPUPopErrorScopeStatus -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUPopErrorScopeCallback

public export
WGPUQueueWorkDoneCallback : Type
WGPUQueueWorkDoneCallback = Ptr (WGPUQueueWorkDoneStatus -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUQueueWorkDoneCallback : (WGPUQueueWorkDoneStatus -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUQueueWorkDoneCallback

public export
WGPURequestAdapterCallback : Type
WGPURequestAdapterCallback = Ptr (WGPURequestAdapterStatus -> WGPUAdapter -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPURequestAdapterCallback : (WGPURequestAdapterStatus -> WGPUAdapter -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPURequestAdapterCallback

public export
WGPURequestDeviceCallback : Type
WGPURequestDeviceCallback = Ptr (WGPURequestDeviceStatus -> WGPUDevice -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPURequestDeviceCallback : (WGPURequestDeviceStatus -> WGPUDevice -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPURequestDeviceCallback

public export
WGPUUncapturedErrorCallback : Type
WGPUUncapturedErrorCallback = Ptr (Ptr (WGPUDevice) -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUUncapturedErrorCallback : (Ptr (WGPUDevice) -> WGPUErrorType -> WGPUStringView -> Ptr (()) -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPUUncapturedErrorCallback

public export
WGPUChainedStruct : Type
WGPUChainedStruct = Struct "WGPUChainedStruct" [("next", Ptr (Struct "WGPUChainedStruct" [])),("sType",  (WGPUSType))]

-- struct here!!
%foreign (allocStructPrimCodegen WGPUChainedStruct)
prim__allocStructWGPUChainedStruct : allocStructPrimType WGPUChainedStruct

export
AllocStruct WGPUChainedStruct where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUChainedStruct xs

public export
WGPUChainedStructOut : Type
WGPUChainedStructOut = Struct "WGPUChainedStructOut" [("next", Ptr (Struct "WGPUChainedStructOut" [])),("sType",  (WGPUSType))]

-- struct here!!
%foreign (allocStructPrimCodegen WGPUChainedStructOut)
prim__allocStructWGPUChainedStructOut : allocStructPrimType WGPUChainedStructOut

export
AllocStruct WGPUChainedStructOut where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUChainedStructOut xs

public export
WGPUBufferMapCallbackInfo : Type
WGPUBufferMapCallbackInfo = Struct "WGPUBufferMapCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUBufferMapCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBufferMapCallbackInfo : allocStructPrimType WGPUBufferMapCallbackInfo
%foreign_impl prim__allocStructWGPUBufferMapCallbackInfo (allocStructPrimCodegen WGPUBufferMapCallbackInfo)

export
AllocStruct WGPUBufferMapCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBufferMapCallbackInfo xs

public export
WGPUCompilationInfoCallbackInfo : Type
WGPUCompilationInfoCallbackInfo = Struct "WGPUCompilationInfoCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCompilationInfoCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCompilationInfoCallbackInfo : allocStructPrimType WGPUCompilationInfoCallbackInfo
%foreign_impl prim__allocStructWGPUCompilationInfoCallbackInfo (allocStructPrimCodegen WGPUCompilationInfoCallbackInfo)

export
AllocStruct WGPUCompilationInfoCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCompilationInfoCallbackInfo xs

public export
WGPUCreateComputePipelineAsyncCallbackInfo : Type
WGPUCreateComputePipelineAsyncCallbackInfo = Struct "WGPUCreateComputePipelineAsyncCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCreateComputePipelineAsyncCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCreateComputePipelineAsyncCallbackInfo : allocStructPrimType WGPUCreateComputePipelineAsyncCallbackInfo
%foreign_impl prim__allocStructWGPUCreateComputePipelineAsyncCallbackInfo (allocStructPrimCodegen WGPUCreateComputePipelineAsyncCallbackInfo)

export
AllocStruct WGPUCreateComputePipelineAsyncCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCreateComputePipelineAsyncCallbackInfo xs

public export
WGPUCreateRenderPipelineAsyncCallbackInfo : Type
WGPUCreateRenderPipelineAsyncCallbackInfo = Struct "WGPUCreateRenderPipelineAsyncCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUCreateRenderPipelineAsyncCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCreateRenderPipelineAsyncCallbackInfo : allocStructPrimType WGPUCreateRenderPipelineAsyncCallbackInfo
%foreign_impl prim__allocStructWGPUCreateRenderPipelineAsyncCallbackInfo (allocStructPrimCodegen WGPUCreateRenderPipelineAsyncCallbackInfo)

export
AllocStruct WGPUCreateRenderPipelineAsyncCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCreateRenderPipelineAsyncCallbackInfo xs

public export
WGPUDeviceLostCallbackInfo : Type
WGPUDeviceLostCallbackInfo = Struct "WGPUDeviceLostCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUDeviceLostCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUDeviceLostCallbackInfo : allocStructPrimType WGPUDeviceLostCallbackInfo
%foreign_impl prim__allocStructWGPUDeviceLostCallbackInfo (allocStructPrimCodegen WGPUDeviceLostCallbackInfo)

export
AllocStruct WGPUDeviceLostCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUDeviceLostCallbackInfo xs

public export
WGPUPopErrorScopeCallbackInfo : Type
WGPUPopErrorScopeCallbackInfo = Struct "WGPUPopErrorScopeCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUPopErrorScopeCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUPopErrorScopeCallbackInfo : allocStructPrimType WGPUPopErrorScopeCallbackInfo
%foreign_impl prim__allocStructWGPUPopErrorScopeCallbackInfo (allocStructPrimCodegen WGPUPopErrorScopeCallbackInfo)

export
AllocStruct WGPUPopErrorScopeCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUPopErrorScopeCallbackInfo xs

public export
WGPUQueueWorkDoneCallbackInfo : Type
WGPUQueueWorkDoneCallbackInfo = Struct "WGPUQueueWorkDoneCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPUQueueWorkDoneCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUQueueWorkDoneCallbackInfo : allocStructPrimType WGPUQueueWorkDoneCallbackInfo
%foreign_impl prim__allocStructWGPUQueueWorkDoneCallbackInfo (allocStructPrimCodegen WGPUQueueWorkDoneCallbackInfo)

export
AllocStruct WGPUQueueWorkDoneCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUQueueWorkDoneCallbackInfo xs

public export
WGPURequestAdapterCallbackInfo : Type
WGPURequestAdapterCallbackInfo = Struct "WGPURequestAdapterCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPURequestAdapterCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPURequestAdapterCallbackInfo : allocStructPrimType WGPURequestAdapterCallbackInfo
%foreign_impl prim__allocStructWGPURequestAdapterCallbackInfo (allocStructPrimCodegen WGPURequestAdapterCallbackInfo)

export
AllocStruct WGPURequestAdapterCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURequestAdapterCallbackInfo xs

public export
WGPURequestDeviceCallbackInfo : Type
WGPURequestDeviceCallbackInfo = Struct "WGPURequestDeviceCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("mode",  (WGPUCallbackMode)),("callback",  (WGPURequestDeviceCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPURequestDeviceCallbackInfo : allocStructPrimType WGPURequestDeviceCallbackInfo
%foreign_impl prim__allocStructWGPURequestDeviceCallbackInfo (allocStructPrimCodegen WGPURequestDeviceCallbackInfo)

export
AllocStruct WGPURequestDeviceCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURequestDeviceCallbackInfo xs

public export
WGPUUncapturedErrorCallbackInfo : Type
WGPUUncapturedErrorCallbackInfo = Struct "WGPUUncapturedErrorCallbackInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("callback",  (WGPUUncapturedErrorCallback)),("userdata1", Ptr (())),("userdata2", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUUncapturedErrorCallbackInfo : allocStructPrimType WGPUUncapturedErrorCallbackInfo
%foreign_impl prim__allocStructWGPUUncapturedErrorCallbackInfo (allocStructPrimCodegen WGPUUncapturedErrorCallbackInfo)

export
AllocStruct WGPUUncapturedErrorCallbackInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUUncapturedErrorCallbackInfo xs

public export
WGPUAdapterInfo : Type
WGPUAdapterInfo = Struct "WGPUAdapterInfo" [("nextInChain", Ptr (WGPUChainedStructOut)),("vendor",  (WGPUStringView)),("architecture",  (WGPUStringView)),("device",  (WGPUStringView)),("description",  (WGPUStringView)),("backendType",  (WGPUBackendType)),("adapterType",  (WGPUAdapterType)),("vendorID",  (Bits32)),("deviceID",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUAdapterInfo : allocStructPrimType WGPUAdapterInfo
%foreign_impl prim__allocStructWGPUAdapterInfo (allocStructPrimCodegen WGPUAdapterInfo)

export
AllocStruct WGPUAdapterInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUAdapterInfo xs

public export
WGPUBindGroupEntry : Type
WGPUBindGroupEntry = Struct "WGPUBindGroupEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("binding",  (Bits32)),("buffer",  (WGPUBuffer)),("offset",  (Bits64)),("size",  (Bits64)),("sampler",  (WGPUSampler)),("textureView",  (WGPUTextureView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBindGroupEntry : allocStructPrimType WGPUBindGroupEntry
%foreign_impl prim__allocStructWGPUBindGroupEntry (allocStructPrimCodegen WGPUBindGroupEntry)

export
AllocStruct WGPUBindGroupEntry where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBindGroupEntry xs

public export
WGPUBlendComponent : Type
WGPUBlendComponent = Struct "WGPUBlendComponent" [("operation",  (WGPUBlendOperation)),("srcFactor",  (WGPUBlendFactor)),("dstFactor",  (WGPUBlendFactor))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBlendComponent : allocStructPrimType WGPUBlendComponent
%foreign_impl prim__allocStructWGPUBlendComponent (allocStructPrimCodegen WGPUBlendComponent)

export
AllocStruct WGPUBlendComponent where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBlendComponent xs

public export
WGPUBufferBindingLayout : Type
WGPUBufferBindingLayout = Struct "WGPUBufferBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("type",  (WGPUBufferBindingType)),("hasDynamicOffset",  (WGPUBool)),("minBindingSize",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBufferBindingLayout : allocStructPrimType WGPUBufferBindingLayout
%foreign_impl prim__allocStructWGPUBufferBindingLayout (allocStructPrimCodegen WGPUBufferBindingLayout)

export
AllocStruct WGPUBufferBindingLayout where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBufferBindingLayout xs

public export
WGPUBufferDescriptor : Type
WGPUBufferDescriptor = Struct "WGPUBufferDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("usage",  (WGPUBufferUsage)),("size",  (Bits64)),("mappedAtCreation",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBufferDescriptor : allocStructPrimType WGPUBufferDescriptor
%foreign_impl prim__allocStructWGPUBufferDescriptor (allocStructPrimCodegen WGPUBufferDescriptor)

export
AllocStruct WGPUBufferDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBufferDescriptor xs

public export
WGPUColor : Type
WGPUColor = Struct "WGPUColor" [("r",  (Double)),("g",  (Double)),("b",  (Double)),("a",  (Double))]

-- struct here!!
%foreign ""
prim__allocStructWGPUColor : allocStructPrimType WGPUColor
%foreign_impl prim__allocStructWGPUColor (allocStructPrimCodegen WGPUColor)

export
AllocStruct WGPUColor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUColor xs

public export
WGPUCommandBufferDescriptor : Type
WGPUCommandBufferDescriptor = Struct "WGPUCommandBufferDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCommandBufferDescriptor : allocStructPrimType WGPUCommandBufferDescriptor
%foreign_impl prim__allocStructWGPUCommandBufferDescriptor (allocStructPrimCodegen WGPUCommandBufferDescriptor)

export
AllocStruct WGPUCommandBufferDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCommandBufferDescriptor xs

public export
WGPUCommandEncoderDescriptor : Type
WGPUCommandEncoderDescriptor = Struct "WGPUCommandEncoderDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCommandEncoderDescriptor : allocStructPrimType WGPUCommandEncoderDescriptor
%foreign_impl prim__allocStructWGPUCommandEncoderDescriptor (allocStructPrimCodegen WGPUCommandEncoderDescriptor)

export
AllocStruct WGPUCommandEncoderDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCommandEncoderDescriptor xs

public export
WGPUCompilationMessage : Type
WGPUCompilationMessage = Struct "WGPUCompilationMessage" [("nextInChain", Ptr (WGPUChainedStruct)),("message",  (WGPUStringView)),("type",  (WGPUCompilationMessageType)),("lineNum",  (Bits64)),("linePos",  (Bits64)),("offset",  (Bits64)),("length",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCompilationMessage : allocStructPrimType WGPUCompilationMessage
%foreign_impl prim__allocStructWGPUCompilationMessage (allocStructPrimCodegen WGPUCompilationMessage)

export
AllocStruct WGPUCompilationMessage where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCompilationMessage xs

public export
WGPUComputePassTimestampWrites : Type
WGPUComputePassTimestampWrites = Struct "WGPUComputePassTimestampWrites" [("querySet",  (WGPUQuerySet)),("beginningOfPassWriteIndex",  (Bits32)),("endOfPassWriteIndex",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUComputePassTimestampWrites : allocStructPrimType WGPUComputePassTimestampWrites
%foreign_impl prim__allocStructWGPUComputePassTimestampWrites (allocStructPrimCodegen WGPUComputePassTimestampWrites)

export
AllocStruct WGPUComputePassTimestampWrites where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUComputePassTimestampWrites xs

public export
WGPUConstantEntry : Type
WGPUConstantEntry = Struct "WGPUConstantEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("key",  (WGPUStringView)),("value",  (Double))]

-- struct here!!
%foreign ""
prim__allocStructWGPUConstantEntry : allocStructPrimType WGPUConstantEntry
%foreign_impl prim__allocStructWGPUConstantEntry (allocStructPrimCodegen WGPUConstantEntry)

export
AllocStruct WGPUConstantEntry where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUConstantEntry xs

public export
WGPUExtent3D : Type
WGPUExtent3D = Struct "WGPUExtent3D" [("width",  (Bits32)),("height",  (Bits32)),("depthOrArrayLayers",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUExtent3D : allocStructPrimType WGPUExtent3D
%foreign_impl prim__allocStructWGPUExtent3D (allocStructPrimCodegen WGPUExtent3D)

export
AllocStruct WGPUExtent3D where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUExtent3D xs

public export
WGPUFuture : Type
WGPUFuture = Struct "WGPUFuture" [("id",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUFuture : allocStructPrimType WGPUFuture
%foreign_impl prim__allocStructWGPUFuture (allocStructPrimCodegen WGPUFuture)

export
AllocStruct WGPUFuture where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUFuture xs

public export
WGPUInstanceCapabilities : Type
WGPUInstanceCapabilities = Struct "WGPUInstanceCapabilities" [("timedWaitAnyEnable",  (WGPUBool)),("timedWaitAnyMaxCount",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUInstanceCapabilities : allocStructPrimType WGPUInstanceCapabilities
%foreign_impl prim__allocStructWGPUInstanceCapabilities (allocStructPrimCodegen WGPUInstanceCapabilities)

export
AllocStruct WGPUInstanceCapabilities where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUInstanceCapabilities xs

public export
WGPULimits : Type
WGPULimits = Struct "WGPULimits" [("nextInChain", Ptr (WGPUChainedStructOut)),("maxTextureDimension1D",  (Bits32)),("maxTextureDimension2D",  (Bits32)),("maxTextureDimension3D",  (Bits32)),("maxTextureArrayLayers",  (Bits32)),("maxBindGroups",  (Bits32)),("maxBindGroupsPlusVertexBuffers",  (Bits32)),("maxBindingsPerBindGroup",  (Bits32)),("maxDynamicUniformBuffersPerPipelineLayout",  (Bits32)),("maxDynamicStorageBuffersPerPipelineLayout",  (Bits32)),("maxSampledTexturesPerShaderStage",  (Bits32)),("maxSamplersPerShaderStage",  (Bits32)),("maxStorageBuffersPerShaderStage",  (Bits32)),("maxStorageTexturesPerShaderStage",  (Bits32)),("maxUniformBuffersPerShaderStage",  (Bits32)),("maxUniformBufferBindingSize",  (Bits64)),("maxStorageBufferBindingSize",  (Bits64)),("minUniformBufferOffsetAlignment",  (Bits32)),("minStorageBufferOffsetAlignment",  (Bits32)),("maxVertexBuffers",  (Bits32)),("maxBufferSize",  (Bits64)),("maxVertexAttributes",  (Bits32)),("maxVertexBufferArrayStride",  (Bits32)),("maxInterStageShaderVariables",  (Bits32)),("maxColorAttachments",  (Bits32)),("maxColorAttachmentBytesPerSample",  (Bits32)),("maxComputeWorkgroupStorageSize",  (Bits32)),("maxComputeInvocationsPerWorkgroup",  (Bits32)),("maxComputeWorkgroupSizeX",  (Bits32)),("maxComputeWorkgroupSizeY",  (Bits32)),("maxComputeWorkgroupSizeZ",  (Bits32)),("maxComputeWorkgroupsPerDimension",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPULimits : allocStructPrimType WGPULimits
%foreign_impl prim__allocStructWGPULimits (allocStructPrimCodegen WGPULimits)

export
AllocStruct WGPULimits where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPULimits xs

public export
WGPUMultisampleState : Type
WGPUMultisampleState = Struct "WGPUMultisampleState" [("nextInChain", Ptr (WGPUChainedStruct)),("count",  (Bits32)),("mask",  (Bits32)),("alphaToCoverageEnabled",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPUMultisampleState : allocStructPrimType WGPUMultisampleState
%foreign_impl prim__allocStructWGPUMultisampleState (allocStructPrimCodegen WGPUMultisampleState)

export
AllocStruct WGPUMultisampleState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUMultisampleState xs

public export
WGPUOrigin3D : Type
WGPUOrigin3D = Struct "WGPUOrigin3D" [("x",  (Bits32)),("y",  (Bits32)),("z",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUOrigin3D : allocStructPrimType WGPUOrigin3D
%foreign_impl prim__allocStructWGPUOrigin3D (allocStructPrimCodegen WGPUOrigin3D)

export
AllocStruct WGPUOrigin3D where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUOrigin3D xs

public export
WGPUPipelineLayoutDescriptor : Type
WGPUPipelineLayoutDescriptor = Struct "WGPUPipelineLayoutDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("bindGroupLayoutCount",  (Bits64)),("bindGroupLayouts", Ptr (WGPUBindGroupLayout))]

-- struct here!!
%foreign ""
prim__allocStructWGPUPipelineLayoutDescriptor : allocStructPrimType WGPUPipelineLayoutDescriptor
%foreign_impl prim__allocStructWGPUPipelineLayoutDescriptor (allocStructPrimCodegen WGPUPipelineLayoutDescriptor)

export
AllocStruct WGPUPipelineLayoutDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUPipelineLayoutDescriptor xs

public export
WGPUPrimitiveState : Type
WGPUPrimitiveState = Struct "WGPUPrimitiveState" [("nextInChain", Ptr (WGPUChainedStruct)),("topology",  (WGPUPrimitiveTopology)),("stripIndexFormat",  (WGPUIndexFormat)),("frontFace",  (WGPUFrontFace)),("cullMode",  (WGPUCullMode)),("unclippedDepth",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPUPrimitiveState : allocStructPrimType WGPUPrimitiveState
%foreign_impl prim__allocStructWGPUPrimitiveState (allocStructPrimCodegen WGPUPrimitiveState)

export
AllocStruct WGPUPrimitiveState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUPrimitiveState xs

public export
WGPUQuerySetDescriptor : Type
WGPUQuerySetDescriptor = Struct "WGPUQuerySetDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("type",  (WGPUQueryType)),("count",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUQuerySetDescriptor : allocStructPrimType WGPUQuerySetDescriptor
%foreign_impl prim__allocStructWGPUQuerySetDescriptor (allocStructPrimCodegen WGPUQuerySetDescriptor)

export
AllocStruct WGPUQuerySetDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUQuerySetDescriptor xs

public export
WGPUQueueDescriptor : Type
WGPUQueueDescriptor = Struct "WGPUQueueDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUQueueDescriptor : allocStructPrimType WGPUQueueDescriptor
%foreign_impl prim__allocStructWGPUQueueDescriptor (allocStructPrimCodegen WGPUQueueDescriptor)

export
AllocStruct WGPUQueueDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUQueueDescriptor xs

public export
WGPURenderBundleDescriptor : Type
WGPURenderBundleDescriptor = Struct "WGPURenderBundleDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderBundleDescriptor : allocStructPrimType WGPURenderBundleDescriptor
%foreign_impl prim__allocStructWGPURenderBundleDescriptor (allocStructPrimCodegen WGPURenderBundleDescriptor)

export
AllocStruct WGPURenderBundleDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderBundleDescriptor xs

public export
WGPURenderBundleEncoderDescriptor : Type
WGPURenderBundleEncoderDescriptor = Struct "WGPURenderBundleEncoderDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("colorFormatCount",  (Bits64)),("colorFormats", Ptr (WGPUTextureFormat)),("depthStencilFormat",  (WGPUTextureFormat)),("sampleCount",  (Bits32)),("depthReadOnly",  (WGPUBool)),("stencilReadOnly",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderBundleEncoderDescriptor : allocStructPrimType WGPURenderBundleEncoderDescriptor
%foreign_impl prim__allocStructWGPURenderBundleEncoderDescriptor (allocStructPrimCodegen WGPURenderBundleEncoderDescriptor)

export
AllocStruct WGPURenderBundleEncoderDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderBundleEncoderDescriptor xs

public export
WGPURenderPassDepthStencilAttachment : Type
WGPURenderPassDepthStencilAttachment = Struct "WGPURenderPassDepthStencilAttachment" [("view",  (WGPUTextureView)),("depthLoadOp",  (WGPULoadOp)),("depthStoreOp",  (WGPUStoreOp)),("depthClearValue",  (Float)),("depthReadOnly",  (WGPUBool)),("stencilLoadOp",  (WGPULoadOp)),("stencilStoreOp",  (WGPUStoreOp)),("stencilClearValue",  (Bits32)),("stencilReadOnly",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderPassDepthStencilAttachment : allocStructPrimType WGPURenderPassDepthStencilAttachment
%foreign_impl prim__allocStructWGPURenderPassDepthStencilAttachment (allocStructPrimCodegen WGPURenderPassDepthStencilAttachment)

export
AllocStruct WGPURenderPassDepthStencilAttachment where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderPassDepthStencilAttachment xs

public export
WGPURenderPassMaxDrawCount : Type
WGPURenderPassMaxDrawCount = Struct "WGPURenderPassMaxDrawCount" [("chain",  (WGPUChainedStruct)),("maxDrawCount",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderPassMaxDrawCount : allocStructPrimType WGPURenderPassMaxDrawCount
%foreign_impl prim__allocStructWGPURenderPassMaxDrawCount (allocStructPrimCodegen WGPURenderPassMaxDrawCount)

export
AllocStruct WGPURenderPassMaxDrawCount where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderPassMaxDrawCount xs

public export
WGPURenderPassTimestampWrites : Type
WGPURenderPassTimestampWrites = Struct "WGPURenderPassTimestampWrites" [("querySet",  (WGPUQuerySet)),("beginningOfPassWriteIndex",  (Bits32)),("endOfPassWriteIndex",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderPassTimestampWrites : allocStructPrimType WGPURenderPassTimestampWrites
%foreign_impl prim__allocStructWGPURenderPassTimestampWrites (allocStructPrimCodegen WGPURenderPassTimestampWrites)

export
AllocStruct WGPURenderPassTimestampWrites where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderPassTimestampWrites xs

public export
WGPURequestAdapterOptions : Type
WGPURequestAdapterOptions = Struct "WGPURequestAdapterOptions" [("nextInChain", Ptr (WGPUChainedStruct)),("featureLevel",  (WGPUFeatureLevel)),("powerPreference",  (WGPUPowerPreference)),("forceFallbackAdapter",  (WGPUBool)),("backendType",  (WGPUBackendType)),("compatibleSurface",  (WGPUSurface))]

-- struct here!!
%foreign ""
prim__allocStructWGPURequestAdapterOptions : allocStructPrimType WGPURequestAdapterOptions
%foreign_impl prim__allocStructWGPURequestAdapterOptions (allocStructPrimCodegen WGPURequestAdapterOptions)

export
AllocStruct WGPURequestAdapterOptions where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURequestAdapterOptions xs

public export
WGPUSamplerBindingLayout : Type
WGPUSamplerBindingLayout = Struct "WGPUSamplerBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("type",  (WGPUSamplerBindingType))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSamplerBindingLayout : allocStructPrimType WGPUSamplerBindingLayout
%foreign_impl prim__allocStructWGPUSamplerBindingLayout (allocStructPrimCodegen WGPUSamplerBindingLayout)

export
AllocStruct WGPUSamplerBindingLayout where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSamplerBindingLayout xs

public export
WGPUSamplerDescriptor : Type
WGPUSamplerDescriptor = Struct "WGPUSamplerDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("addressModeU",  (WGPUAddressMode)),("addressModeV",  (WGPUAddressMode)),("addressModeW",  (WGPUAddressMode)),("magFilter",  (WGPUFilterMode)),("minFilter",  (WGPUFilterMode)),("mipmapFilter",  (WGPUMipmapFilterMode)),("lodMinClamp",  (Float)),("lodMaxClamp",  (Float)),("compare",  (WGPUCompareFunction)),("maxAnisotropy",  (Bits16))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSamplerDescriptor : allocStructPrimType WGPUSamplerDescriptor
%foreign_impl prim__allocStructWGPUSamplerDescriptor (allocStructPrimCodegen WGPUSamplerDescriptor)

export
AllocStruct WGPUSamplerDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSamplerDescriptor xs

public export
WGPUShaderModuleDescriptor : Type
WGPUShaderModuleDescriptor = Struct "WGPUShaderModuleDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUShaderModuleDescriptor : allocStructPrimType WGPUShaderModuleDescriptor
%foreign_impl prim__allocStructWGPUShaderModuleDescriptor (allocStructPrimCodegen WGPUShaderModuleDescriptor)

export
AllocStruct WGPUShaderModuleDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUShaderModuleDescriptor xs

public export
WGPUShaderSourceSPIRV : Type
WGPUShaderSourceSPIRV = Struct "WGPUShaderSourceSPIRV" [("chain",  (WGPUChainedStruct)),("codeSize",  (Bits32)),("code", Ptr (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUShaderSourceSPIRV : allocStructPrimType WGPUShaderSourceSPIRV
%foreign_impl prim__allocStructWGPUShaderSourceSPIRV (allocStructPrimCodegen WGPUShaderSourceSPIRV)

export
AllocStruct WGPUShaderSourceSPIRV where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUShaderSourceSPIRV xs

public export
WGPUShaderSourceWGSL : Type
WGPUShaderSourceWGSL = Struct "WGPUShaderSourceWGSL" [("chain",  (WGPUChainedStruct)),("code",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUShaderSourceWGSL : allocStructPrimType WGPUShaderSourceWGSL
%foreign_impl prim__allocStructWGPUShaderSourceWGSL (allocStructPrimCodegen WGPUShaderSourceWGSL)

export
AllocStruct WGPUShaderSourceWGSL where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUShaderSourceWGSL xs

public export
WGPUStencilFaceState : Type
WGPUStencilFaceState = Struct "WGPUStencilFaceState" [("compare",  (WGPUCompareFunction)),("failOp",  (WGPUStencilOperation)),("depthFailOp",  (WGPUStencilOperation)),("passOp",  (WGPUStencilOperation))]

-- struct here!!
%foreign ""
prim__allocStructWGPUStencilFaceState : allocStructPrimType WGPUStencilFaceState
%foreign_impl prim__allocStructWGPUStencilFaceState (allocStructPrimCodegen WGPUStencilFaceState)

export
AllocStruct WGPUStencilFaceState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUStencilFaceState xs

public export
WGPUStorageTextureBindingLayout : Type
WGPUStorageTextureBindingLayout = Struct "WGPUStorageTextureBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("access",  (WGPUStorageTextureAccess)),("format",  (WGPUTextureFormat)),("viewDimension",  (WGPUTextureViewDimension))]

-- struct here!!
%foreign ""
prim__allocStructWGPUStorageTextureBindingLayout : allocStructPrimType WGPUStorageTextureBindingLayout
%foreign_impl prim__allocStructWGPUStorageTextureBindingLayout (allocStructPrimCodegen WGPUStorageTextureBindingLayout)

export
AllocStruct WGPUStorageTextureBindingLayout where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUStorageTextureBindingLayout xs

public export
WGPUSupportedFeatures : Type
WGPUSupportedFeatures = Struct "WGPUSupportedFeatures" [("featureCount",  (Bits64)),("features", Ptr (WGPUFeatureName))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSupportedFeatures : allocStructPrimType WGPUSupportedFeatures
%foreign_impl prim__allocStructWGPUSupportedFeatures (allocStructPrimCodegen WGPUSupportedFeatures)

export
AllocStruct WGPUSupportedFeatures where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSupportedFeatures xs

public export
WGPUSupportedWGSLLanguageFeatures : Type
WGPUSupportedWGSLLanguageFeatures = Struct "WGPUSupportedWGSLLanguageFeatures" [("featureCount",  (Bits64)),("features", Ptr (WGPUWGSLLanguageFeatureName))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSupportedWGSLLanguageFeatures : allocStructPrimType WGPUSupportedWGSLLanguageFeatures
%foreign_impl prim__allocStructWGPUSupportedWGSLLanguageFeatures (allocStructPrimCodegen WGPUSupportedWGSLLanguageFeatures)

export
AllocStruct WGPUSupportedWGSLLanguageFeatures where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSupportedWGSLLanguageFeatures xs

public export
WGPUSurfaceCapabilities : Type
WGPUSurfaceCapabilities = Struct "WGPUSurfaceCapabilities" [("nextInChain", Ptr (WGPUChainedStructOut)),("usages",  (WGPUTextureUsage)),("formatCount",  (Bits64)),("formats", Ptr (WGPUTextureFormat)),("presentModeCount",  (Bits64)),("presentModes", Ptr (WGPUPresentMode)),("alphaModeCount",  (Bits64)),("alphaModes", Ptr (WGPUCompositeAlphaMode))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceCapabilities : allocStructPrimType WGPUSurfaceCapabilities
%foreign_impl prim__allocStructWGPUSurfaceCapabilities (allocStructPrimCodegen WGPUSurfaceCapabilities)

export
AllocStruct WGPUSurfaceCapabilities where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceCapabilities xs

public export
WGPUSurfaceConfiguration : Type
WGPUSurfaceConfiguration = Struct "WGPUSurfaceConfiguration" [("nextInChain", Ptr (WGPUChainedStruct)),("device",  (WGPUDevice)),("format",  (WGPUTextureFormat)),("usage",  (WGPUTextureUsage)),("width",  (Bits32)),("height",  (Bits32)),("viewFormatCount",  (Bits64)),("viewFormats", Ptr (WGPUTextureFormat)),("alphaMode",  (WGPUCompositeAlphaMode)),("presentMode",  (WGPUPresentMode))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceConfiguration : allocStructPrimType WGPUSurfaceConfiguration
%foreign_impl prim__allocStructWGPUSurfaceConfiguration (allocStructPrimCodegen WGPUSurfaceConfiguration)

export
AllocStruct WGPUSurfaceConfiguration where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceConfiguration xs

public export
WGPUSurfaceDescriptor : Type
WGPUSurfaceDescriptor = Struct "WGPUSurfaceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceDescriptor : allocStructPrimType WGPUSurfaceDescriptor
%foreign_impl prim__allocStructWGPUSurfaceDescriptor (allocStructPrimCodegen WGPUSurfaceDescriptor)

export
AllocStruct WGPUSurfaceDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceDescriptor xs

public export
WGPUSurfaceSourceAndroidNativeWindow : Type
WGPUSurfaceSourceAndroidNativeWindow = Struct "WGPUSurfaceSourceAndroidNativeWindow" [("chain",  (WGPUChainedStruct)),("window", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceAndroidNativeWindow : allocStructPrimType WGPUSurfaceSourceAndroidNativeWindow
%foreign_impl prim__allocStructWGPUSurfaceSourceAndroidNativeWindow (allocStructPrimCodegen WGPUSurfaceSourceAndroidNativeWindow)

export
AllocStruct WGPUSurfaceSourceAndroidNativeWindow where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceAndroidNativeWindow xs

public export
WGPUSurfaceSourceMetalLayer : Type
WGPUSurfaceSourceMetalLayer = Struct "WGPUSurfaceSourceMetalLayer" [("chain",  (WGPUChainedStruct)),("layer", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceMetalLayer : allocStructPrimType WGPUSurfaceSourceMetalLayer
%foreign_impl prim__allocStructWGPUSurfaceSourceMetalLayer (allocStructPrimCodegen WGPUSurfaceSourceMetalLayer)

export
AllocStruct WGPUSurfaceSourceMetalLayer where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceMetalLayer xs

public export
WGPUSurfaceSourceWaylandSurface : Type
WGPUSurfaceSourceWaylandSurface = Struct "WGPUSurfaceSourceWaylandSurface" [("chain",  (WGPUChainedStruct)),("display", Ptr (())),("surface", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceWaylandSurface : allocStructPrimType WGPUSurfaceSourceWaylandSurface
%foreign_impl prim__allocStructWGPUSurfaceSourceWaylandSurface (allocStructPrimCodegen WGPUSurfaceSourceWaylandSurface)

export
AllocStruct WGPUSurfaceSourceWaylandSurface where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceWaylandSurface xs

public export
WGPUSurfaceSourceWindowsHWND : Type
WGPUSurfaceSourceWindowsHWND = Struct "WGPUSurfaceSourceWindowsHWND" [("chain",  (WGPUChainedStruct)),("hinstance", Ptr (())),("hwnd", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceWindowsHWND : allocStructPrimType WGPUSurfaceSourceWindowsHWND
%foreign_impl prim__allocStructWGPUSurfaceSourceWindowsHWND (allocStructPrimCodegen WGPUSurfaceSourceWindowsHWND)

export
AllocStruct WGPUSurfaceSourceWindowsHWND where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceWindowsHWND xs

public export
WGPUSurfaceSourceXCBWindow : Type
WGPUSurfaceSourceXCBWindow = Struct "WGPUSurfaceSourceXCBWindow" [("chain",  (WGPUChainedStruct)),("connection", Ptr (())),("window",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceXCBWindow : allocStructPrimType WGPUSurfaceSourceXCBWindow
%foreign_impl prim__allocStructWGPUSurfaceSourceXCBWindow (allocStructPrimCodegen WGPUSurfaceSourceXCBWindow)

export
AllocStruct WGPUSurfaceSourceXCBWindow where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceXCBWindow xs

public export
WGPUSurfaceSourceXlibWindow : Type
WGPUSurfaceSourceXlibWindow = Struct "WGPUSurfaceSourceXlibWindow" [("chain",  (WGPUChainedStruct)),("display", Ptr (())),("window",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceXlibWindow : allocStructPrimType WGPUSurfaceSourceXlibWindow
%foreign_impl prim__allocStructWGPUSurfaceSourceXlibWindow (allocStructPrimCodegen WGPUSurfaceSourceXlibWindow)

export
AllocStruct WGPUSurfaceSourceXlibWindow where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceXlibWindow xs

public export
WGPUSurfaceTexture : Type
WGPUSurfaceTexture = Struct "WGPUSurfaceTexture" [("nextInChain", Ptr (WGPUChainedStructOut)),("texture",  (WGPUTexture)),("status",  (WGPUSurfaceGetCurrentTextureStatus))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceTexture : allocStructPrimType WGPUSurfaceTexture
%foreign_impl prim__allocStructWGPUSurfaceTexture (allocStructPrimCodegen WGPUSurfaceTexture)

export
AllocStruct WGPUSurfaceTexture where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceTexture xs

public export
WGPUTexelCopyBufferLayout : Type
WGPUTexelCopyBufferLayout = Struct "WGPUTexelCopyBufferLayout" [("offset",  (Bits64)),("bytesPerRow",  (Bits32)),("rowsPerImage",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUTexelCopyBufferLayout : allocStructPrimType WGPUTexelCopyBufferLayout
%foreign_impl prim__allocStructWGPUTexelCopyBufferLayout (allocStructPrimCodegen WGPUTexelCopyBufferLayout)

export
AllocStruct WGPUTexelCopyBufferLayout where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUTexelCopyBufferLayout xs

public export
WGPUTextureBindingLayout : Type
WGPUTextureBindingLayout = Struct "WGPUTextureBindingLayout" [("nextInChain", Ptr (WGPUChainedStruct)),("sampleType",  (WGPUTextureSampleType)),("viewDimension",  (WGPUTextureViewDimension)),("multisampled",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPUTextureBindingLayout : allocStructPrimType WGPUTextureBindingLayout
%foreign_impl prim__allocStructWGPUTextureBindingLayout (allocStructPrimCodegen WGPUTextureBindingLayout)

export
AllocStruct WGPUTextureBindingLayout where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUTextureBindingLayout xs

public export
WGPUTextureViewDescriptor : Type
WGPUTextureViewDescriptor = Struct "WGPUTextureViewDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("format",  (WGPUTextureFormat)),("dimension",  (WGPUTextureViewDimension)),("baseMipLevel",  (Bits32)),("mipLevelCount",  (Bits32)),("baseArrayLayer",  (Bits32)),("arrayLayerCount",  (Bits32)),("aspect",  (WGPUTextureAspect)),("usage",  (WGPUTextureUsage))]

-- struct here!!
%foreign ""
prim__allocStructWGPUTextureViewDescriptor : allocStructPrimType WGPUTextureViewDescriptor
%foreign_impl prim__allocStructWGPUTextureViewDescriptor (allocStructPrimCodegen WGPUTextureViewDescriptor)

export
AllocStruct WGPUTextureViewDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUTextureViewDescriptor xs

public export
WGPUVertexAttribute : Type
WGPUVertexAttribute = Struct "WGPUVertexAttribute" [("format",  (WGPUVertexFormat)),("offset",  (Bits64)),("shaderLocation",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUVertexAttribute : allocStructPrimType WGPUVertexAttribute
%foreign_impl prim__allocStructWGPUVertexAttribute (allocStructPrimCodegen WGPUVertexAttribute)

export
AllocStruct WGPUVertexAttribute where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUVertexAttribute xs

public export
WGPUBindGroupDescriptor : Type
WGPUBindGroupDescriptor = Struct "WGPUBindGroupDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUBindGroupLayout)),("entryCount",  (Bits64)),("entries", Ptr (WGPUBindGroupEntry))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBindGroupDescriptor : allocStructPrimType WGPUBindGroupDescriptor
%foreign_impl prim__allocStructWGPUBindGroupDescriptor (allocStructPrimCodegen WGPUBindGroupDescriptor)

export
AllocStruct WGPUBindGroupDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBindGroupDescriptor xs

public export
WGPUBindGroupLayoutEntry : Type
WGPUBindGroupLayoutEntry = Struct "WGPUBindGroupLayoutEntry" [("nextInChain", Ptr (WGPUChainedStruct)),("binding",  (Bits32)),("visibility",  (WGPUShaderStage)),("buffer",  (WGPUBufferBindingLayout)),("sampler",  (WGPUSamplerBindingLayout)),("texture",  (WGPUTextureBindingLayout)),("storageTexture",  (WGPUStorageTextureBindingLayout))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBindGroupLayoutEntry : allocStructPrimType WGPUBindGroupLayoutEntry
%foreign_impl prim__allocStructWGPUBindGroupLayoutEntry (allocStructPrimCodegen WGPUBindGroupLayoutEntry)

export
AllocStruct WGPUBindGroupLayoutEntry where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBindGroupLayoutEntry xs

public export
WGPUBlendState : Type
WGPUBlendState = Struct "WGPUBlendState" [("color",  (WGPUBlendComponent)),("alpha",  (WGPUBlendComponent))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBlendState : allocStructPrimType WGPUBlendState
%foreign_impl prim__allocStructWGPUBlendState (allocStructPrimCodegen WGPUBlendState)

export
AllocStruct WGPUBlendState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBlendState xs

public export
WGPUCompilationInfo : Type
WGPUCompilationInfo = Struct "WGPUCompilationInfo" [("nextInChain", Ptr (WGPUChainedStruct)),("messageCount",  (Bits64)),("messages", Ptr (WGPUCompilationMessage))]

-- struct here!!
%foreign ""
prim__allocStructWGPUCompilationInfo : allocStructPrimType WGPUCompilationInfo
%foreign_impl prim__allocStructWGPUCompilationInfo (allocStructPrimCodegen WGPUCompilationInfo)

export
AllocStruct WGPUCompilationInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUCompilationInfo xs

public export
WGPUComputePassDescriptor : Type
WGPUComputePassDescriptor = Struct "WGPUComputePassDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("timestampWrites", Ptr (WGPUComputePassTimestampWrites))]

-- struct here!!
%foreign ""
prim__allocStructWGPUComputePassDescriptor : allocStructPrimType WGPUComputePassDescriptor
%foreign_impl prim__allocStructWGPUComputePassDescriptor (allocStructPrimCodegen WGPUComputePassDescriptor)

export
AllocStruct WGPUComputePassDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUComputePassDescriptor xs

public export
WGPUDepthStencilState : Type
WGPUDepthStencilState = Struct "WGPUDepthStencilState" [("nextInChain", Ptr (WGPUChainedStruct)),("format",  (WGPUTextureFormat)),("depthWriteEnabled",  (WGPUOptionalBool)),("depthCompare",  (WGPUCompareFunction)),("stencilFront",  (WGPUStencilFaceState)),("stencilBack",  (WGPUStencilFaceState)),("stencilReadMask",  (Bits32)),("stencilWriteMask",  (Bits32)),("depthBias",  (Int32)),("depthBiasSlopeScale",  (Float)),("depthBiasClamp",  (Float))]

-- struct here!!
%foreign ""
prim__allocStructWGPUDepthStencilState : allocStructPrimType WGPUDepthStencilState
%foreign_impl prim__allocStructWGPUDepthStencilState (allocStructPrimCodegen WGPUDepthStencilState)

export
AllocStruct WGPUDepthStencilState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUDepthStencilState xs

public export
WGPUDeviceDescriptor : Type
WGPUDeviceDescriptor = Struct "WGPUDeviceDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("requiredFeatureCount",  (Bits64)),("requiredFeatures", Ptr (WGPUFeatureName)),("requiredLimits", Ptr (WGPULimits)),("defaultQueue",  (WGPUQueueDescriptor)),("deviceLostCallbackInfo",  (WGPUDeviceLostCallbackInfo)),("uncapturedErrorCallbackInfo",  (WGPUUncapturedErrorCallbackInfo))]

-- struct here!!
%foreign ""
prim__allocStructWGPUDeviceDescriptor : allocStructPrimType WGPUDeviceDescriptor
%foreign_impl prim__allocStructWGPUDeviceDescriptor (allocStructPrimCodegen WGPUDeviceDescriptor)

export
AllocStruct WGPUDeviceDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUDeviceDescriptor xs

public export
WGPUFutureWaitInfo : Type
WGPUFutureWaitInfo = Struct "WGPUFutureWaitInfo" [("future",  (WGPUFuture)),("completed",  (WGPUBool))]

-- struct here!!
%foreign ""
prim__allocStructWGPUFutureWaitInfo : allocStructPrimType WGPUFutureWaitInfo
%foreign_impl prim__allocStructWGPUFutureWaitInfo (allocStructPrimCodegen WGPUFutureWaitInfo)

export
AllocStruct WGPUFutureWaitInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUFutureWaitInfo xs

public export
WGPUInstanceDescriptor : Type
WGPUInstanceDescriptor = Struct "WGPUInstanceDescriptor" [("features",  (WGPUInstanceCapabilities))]

-- struct here!!
%foreign ""
prim__allocStructWGPUInstanceDescriptor : allocStructPrimType WGPUInstanceDescriptor
%foreign_impl prim__allocStructWGPUInstanceDescriptor (allocStructPrimCodegen WGPUInstanceDescriptor)

export
AllocStruct WGPUInstanceDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUInstanceDescriptor xs

public export
WGPUProgrammableStageDescriptor : Type
WGPUProgrammableStageDescriptor = Struct "WGPUProgrammableStageDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (Bits64)),("constants", Ptr (WGPUConstantEntry))]

-- struct here!!
%foreign ""
prim__allocStructWGPUProgrammableStageDescriptor : allocStructPrimType WGPUProgrammableStageDescriptor
%foreign_impl prim__allocStructWGPUProgrammableStageDescriptor (allocStructPrimCodegen WGPUProgrammableStageDescriptor)

export
AllocStruct WGPUProgrammableStageDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUProgrammableStageDescriptor xs

public export
WGPURenderPassColorAttachment : Type
WGPURenderPassColorAttachment = Struct "WGPURenderPassColorAttachment" [("nextInChain", Ptr (WGPUChainedStruct)),("view",  (WGPUTextureView)),("depthSlice",  (Bits32)),("resolveTarget",  (WGPUTextureView)),("loadOp",  (WGPULoadOp)),("storeOp",  (WGPUStoreOp)),("clearValue",  (WGPUColor))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderPassColorAttachment : allocStructPrimType WGPURenderPassColorAttachment
%foreign_impl prim__allocStructWGPURenderPassColorAttachment (allocStructPrimCodegen WGPURenderPassColorAttachment)

export
AllocStruct WGPURenderPassColorAttachment where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderPassColorAttachment xs

public export
WGPUTexelCopyBufferInfo : Type
WGPUTexelCopyBufferInfo = Struct "WGPUTexelCopyBufferInfo" [("layout",  (WGPUTexelCopyBufferLayout)),("buffer",  (WGPUBuffer))]

-- struct here!!
%foreign ""
prim__allocStructWGPUTexelCopyBufferInfo : allocStructPrimType WGPUTexelCopyBufferInfo
%foreign_impl prim__allocStructWGPUTexelCopyBufferInfo (allocStructPrimCodegen WGPUTexelCopyBufferInfo)

export
AllocStruct WGPUTexelCopyBufferInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUTexelCopyBufferInfo xs

public export
WGPUTexelCopyTextureInfo : Type
WGPUTexelCopyTextureInfo = Struct "WGPUTexelCopyTextureInfo" [("texture",  (WGPUTexture)),("mipLevel",  (Bits32)),("origin",  (WGPUOrigin3D)),("aspect",  (WGPUTextureAspect))]

-- struct here!!
%foreign ""
prim__allocStructWGPUTexelCopyTextureInfo : allocStructPrimType WGPUTexelCopyTextureInfo
%foreign_impl prim__allocStructWGPUTexelCopyTextureInfo (allocStructPrimCodegen WGPUTexelCopyTextureInfo)

export
AllocStruct WGPUTexelCopyTextureInfo where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUTexelCopyTextureInfo xs

public export
WGPUTextureDescriptor : Type
WGPUTextureDescriptor = Struct "WGPUTextureDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("usage",  (WGPUTextureUsage)),("dimension",  (WGPUTextureDimension)),("size",  (WGPUExtent3D)),("format",  (WGPUTextureFormat)),("mipLevelCount",  (Bits32)),("sampleCount",  (Bits32)),("viewFormatCount",  (Bits64)),("viewFormats", Ptr (WGPUTextureFormat))]

-- struct here!!
%foreign ""
prim__allocStructWGPUTextureDescriptor : allocStructPrimType WGPUTextureDescriptor
%foreign_impl prim__allocStructWGPUTextureDescriptor (allocStructPrimCodegen WGPUTextureDescriptor)

export
AllocStruct WGPUTextureDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUTextureDescriptor xs

public export
WGPUVertexBufferLayout : Type
WGPUVertexBufferLayout = Struct "WGPUVertexBufferLayout" [("stepMode",  (WGPUVertexStepMode)),("arrayStride",  (Bits64)),("attributeCount",  (Bits64)),("attributes", Ptr (WGPUVertexAttribute))]

-- struct here!!
%foreign ""
prim__allocStructWGPUVertexBufferLayout : allocStructPrimType WGPUVertexBufferLayout
%foreign_impl prim__allocStructWGPUVertexBufferLayout (allocStructPrimCodegen WGPUVertexBufferLayout)

export
AllocStruct WGPUVertexBufferLayout where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUVertexBufferLayout xs

public export
WGPUBindGroupLayoutDescriptor : Type
WGPUBindGroupLayoutDescriptor = Struct "WGPUBindGroupLayoutDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("entryCount",  (Bits64)),("entries", Ptr (WGPUBindGroupLayoutEntry))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBindGroupLayoutDescriptor : allocStructPrimType WGPUBindGroupLayoutDescriptor
%foreign_impl prim__allocStructWGPUBindGroupLayoutDescriptor (allocStructPrimCodegen WGPUBindGroupLayoutDescriptor)

export
AllocStruct WGPUBindGroupLayoutDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBindGroupLayoutDescriptor xs

public export
WGPUColorTargetState : Type
WGPUColorTargetState = Struct "WGPUColorTargetState" [("nextInChain", Ptr (WGPUChainedStruct)),("format",  (WGPUTextureFormat)),("blend", Ptr (WGPUBlendState)),("writeMask",  (WGPUColorWriteMask))]

-- struct here!!
%foreign ""
prim__allocStructWGPUColorTargetState : allocStructPrimType WGPUColorTargetState
%foreign_impl prim__allocStructWGPUColorTargetState (allocStructPrimCodegen WGPUColorTargetState)

export
AllocStruct WGPUColorTargetState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUColorTargetState xs

public export
WGPUComputePipelineDescriptor : Type
WGPUComputePipelineDescriptor = Struct "WGPUComputePipelineDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUPipelineLayout)),("compute",  (WGPUProgrammableStageDescriptor))]

-- struct here!!
%foreign ""
prim__allocStructWGPUComputePipelineDescriptor : allocStructPrimType WGPUComputePipelineDescriptor
%foreign_impl prim__allocStructWGPUComputePipelineDescriptor (allocStructPrimCodegen WGPUComputePipelineDescriptor)

export
AllocStruct WGPUComputePipelineDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUComputePipelineDescriptor xs

public export
WGPURenderPassDescriptor : Type
WGPURenderPassDescriptor = Struct "WGPURenderPassDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("colorAttachmentCount",  (Bits64)),("colorAttachments", Ptr (WGPURenderPassColorAttachment)),("depthStencilAttachment", Ptr (WGPURenderPassDepthStencilAttachment)),("occlusionQuerySet",  (WGPUQuerySet)),("timestampWrites", Ptr (WGPURenderPassTimestampWrites))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderPassDescriptor : allocStructPrimType WGPURenderPassDescriptor
%foreign_impl prim__allocStructWGPURenderPassDescriptor (allocStructPrimCodegen WGPURenderPassDescriptor)

export
AllocStruct WGPURenderPassDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderPassDescriptor xs

public export
WGPUVertexState : Type
WGPUVertexState = Struct "WGPUVertexState" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (Bits64)),("constants", Ptr (WGPUConstantEntry)),("bufferCount",  (Bits64)),("buffers", Ptr (WGPUVertexBufferLayout))]

-- struct here!!
%foreign ""
prim__allocStructWGPUVertexState : allocStructPrimType WGPUVertexState
%foreign_impl prim__allocStructWGPUVertexState (allocStructPrimCodegen WGPUVertexState)

export
AllocStruct WGPUVertexState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUVertexState xs

public export
WGPUFragmentState : Type
WGPUFragmentState = Struct "WGPUFragmentState" [("nextInChain", Ptr (WGPUChainedStruct)),("module",  (WGPUShaderModule)),("entryPoint",  (WGPUStringView)),("constantCount",  (Bits64)),("constants", Ptr (WGPUConstantEntry)),("targetCount",  (Bits64)),("targets", Ptr (WGPUColorTargetState))]

-- struct here!!
%foreign ""
prim__allocStructWGPUFragmentState : allocStructPrimType WGPUFragmentState
%foreign_impl prim__allocStructWGPUFragmentState (allocStructPrimCodegen WGPUFragmentState)

export
AllocStruct WGPUFragmentState where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUFragmentState xs

public export
WGPURenderPipelineDescriptor : Type
WGPURenderPipelineDescriptor = Struct "WGPURenderPipelineDescriptor" [("nextInChain", Ptr (WGPUChainedStruct)),("label",  (WGPUStringView)),("layout",  (WGPUPipelineLayout)),("vertex",  (WGPUVertexState)),("primitive",  (WGPUPrimitiveState)),("depthStencil", Ptr (WGPUDepthStencilState)),("multisample",  (WGPUMultisampleState)),("fragment", Ptr (WGPUFragmentState))]

-- struct here!!
%foreign ""
prim__allocStructWGPURenderPipelineDescriptor : allocStructPrimType WGPURenderPipelineDescriptor
%foreign_impl prim__allocStructWGPURenderPipelineDescriptor (allocStructPrimCodegen WGPURenderPipelineDescriptor)

export
AllocStruct WGPURenderPipelineDescriptor where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURenderPipelineDescriptor xs

public export
WGPUProcCreateInstance : Type
WGPUProcCreateInstance = Ptr (Ptr (WGPUInstanceDescriptor) -> PrimIO (WGPUInstance))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCreateInstance : (Ptr (WGPUInstanceDescriptor) -> PrimIO (WGPUInstance)) -> PrimIO $ WGPUProcCreateInstance

public export
WGPUProcGetInstanceCapabilities : Type
WGPUProcGetInstanceCapabilities = Ptr (Ptr (WGPUInstanceCapabilities) -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcGetInstanceCapabilities : (Ptr (WGPUInstanceCapabilities) -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcGetInstanceCapabilities

public export
WGPUProcGetProcAddress : Type
WGPUProcGetProcAddress = Ptr (WGPUStringView -> PrimIO (WGPUProc))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcGetProcAddress : (WGPUStringView -> PrimIO (WGPUProc)) -> PrimIO $ WGPUProcGetProcAddress

public export
WGPUProcAdapterGetFeatures : Type
WGPUProcAdapterGetFeatures = Ptr (WGPUAdapter -> Ptr (WGPUSupportedFeatures) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterGetFeatures : (WGPUAdapter -> Ptr (WGPUSupportedFeatures) -> PrimIO (())) -> PrimIO $ WGPUProcAdapterGetFeatures

public export
WGPUProcAdapterGetInfo : Type
WGPUProcAdapterGetInfo = Ptr (WGPUAdapter -> Ptr (WGPUAdapterInfo) -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterGetInfo : (WGPUAdapter -> Ptr (WGPUAdapterInfo) -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcAdapterGetInfo

public export
WGPUProcAdapterGetLimits : Type
WGPUProcAdapterGetLimits = Ptr (WGPUAdapter -> Ptr (WGPULimits) -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterGetLimits : (WGPUAdapter -> Ptr (WGPULimits) -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcAdapterGetLimits

public export
WGPUProcAdapterHasFeature : Type
WGPUProcAdapterHasFeature = Ptr (WGPUAdapter -> WGPUFeatureName -> PrimIO (WGPUBool))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterHasFeature : (WGPUAdapter -> WGPUFeatureName -> PrimIO (WGPUBool)) -> PrimIO $ WGPUProcAdapterHasFeature

public export
WGPUProcAdapterRequestDevice : Type
WGPUProcAdapterRequestDevice = Ptr (WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> WGPURequestDeviceCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterRequestDevice : (WGPUAdapter -> Ptr (WGPUDeviceDescriptor) -> WGPURequestDeviceCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcAdapterRequestDevice

public export
WGPUProcAdapterAddRef : Type
WGPUProcAdapterAddRef = Ptr (WGPUAdapter -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterAddRef : (WGPUAdapter -> PrimIO (())) -> PrimIO $ WGPUProcAdapterAddRef

public export
WGPUProcAdapterRelease : Type
WGPUProcAdapterRelease = Ptr (WGPUAdapter -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterRelease : (WGPUAdapter -> PrimIO (())) -> PrimIO $ WGPUProcAdapterRelease

public export
WGPUProcAdapterInfoFreeMembers : Type
WGPUProcAdapterInfoFreeMembers = Ptr (WGPUAdapterInfo -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcAdapterInfoFreeMembers : (WGPUAdapterInfo -> PrimIO (())) -> PrimIO $ WGPUProcAdapterInfoFreeMembers

public export
WGPUProcBindGroupSetLabel : Type
WGPUProcBindGroupSetLabel = Ptr (WGPUBindGroup -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBindGroupSetLabel : (WGPUBindGroup -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcBindGroupSetLabel

public export
WGPUProcBindGroupAddRef : Type
WGPUProcBindGroupAddRef = Ptr (WGPUBindGroup -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBindGroupAddRef : (WGPUBindGroup -> PrimIO (())) -> PrimIO $ WGPUProcBindGroupAddRef

public export
WGPUProcBindGroupRelease : Type
WGPUProcBindGroupRelease = Ptr (WGPUBindGroup -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBindGroupRelease : (WGPUBindGroup -> PrimIO (())) -> PrimIO $ WGPUProcBindGroupRelease

public export
WGPUProcBindGroupLayoutSetLabel : Type
WGPUProcBindGroupLayoutSetLabel = Ptr (WGPUBindGroupLayout -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBindGroupLayoutSetLabel : (WGPUBindGroupLayout -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcBindGroupLayoutSetLabel

public export
WGPUProcBindGroupLayoutAddRef : Type
WGPUProcBindGroupLayoutAddRef = Ptr (WGPUBindGroupLayout -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBindGroupLayoutAddRef : (WGPUBindGroupLayout -> PrimIO (())) -> PrimIO $ WGPUProcBindGroupLayoutAddRef

public export
WGPUProcBindGroupLayoutRelease : Type
WGPUProcBindGroupLayoutRelease = Ptr (WGPUBindGroupLayout -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBindGroupLayoutRelease : (WGPUBindGroupLayout -> PrimIO (())) -> PrimIO $ WGPUProcBindGroupLayoutRelease

public export
WGPUProcBufferDestroy : Type
WGPUProcBufferDestroy = Ptr (WGPUBuffer -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferDestroy : (WGPUBuffer -> PrimIO (())) -> PrimIO $ WGPUProcBufferDestroy

public export
WGPUProcBufferGetConstMappedRange : Type
WGPUProcBufferGetConstMappedRange = Ptr (WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (Ptr (())))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferGetConstMappedRange : (WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (Ptr (()))) -> PrimIO $ WGPUProcBufferGetConstMappedRange

public export
WGPUProcBufferGetMapState : Type
WGPUProcBufferGetMapState = Ptr (WGPUBuffer -> PrimIO (WGPUBufferMapState))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferGetMapState : (WGPUBuffer -> PrimIO (WGPUBufferMapState)) -> PrimIO $ WGPUProcBufferGetMapState

public export
WGPUProcBufferGetMappedRange : Type
WGPUProcBufferGetMappedRange = Ptr (WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (Ptr (())))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferGetMappedRange : (WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (Ptr (()))) -> PrimIO $ WGPUProcBufferGetMappedRange

public export
WGPUProcBufferGetSize : Type
WGPUProcBufferGetSize = Ptr (WGPUBuffer -> PrimIO (Bits64))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferGetSize : (WGPUBuffer -> PrimIO (Bits64)) -> PrimIO $ WGPUProcBufferGetSize

public export
WGPUProcBufferGetUsage : Type
WGPUProcBufferGetUsage = Ptr (WGPUBuffer -> PrimIO (WGPUBufferUsage))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferGetUsage : (WGPUBuffer -> PrimIO (WGPUBufferUsage)) -> PrimIO $ WGPUProcBufferGetUsage

public export
WGPUProcBufferMapAsync : Type
WGPUProcBufferMapAsync = Ptr (WGPUBuffer -> WGPUMapMode -> Bits64 -> Bits64 -> WGPUBufferMapCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferMapAsync : (WGPUBuffer -> WGPUMapMode -> Bits64 -> Bits64 -> WGPUBufferMapCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcBufferMapAsync

public export
WGPUProcBufferSetLabel : Type
WGPUProcBufferSetLabel = Ptr (WGPUBuffer -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferSetLabel : (WGPUBuffer -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcBufferSetLabel

public export
WGPUProcBufferUnmap : Type
WGPUProcBufferUnmap = Ptr (WGPUBuffer -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferUnmap : (WGPUBuffer -> PrimIO (())) -> PrimIO $ WGPUProcBufferUnmap

public export
WGPUProcBufferAddRef : Type
WGPUProcBufferAddRef = Ptr (WGPUBuffer -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferAddRef : (WGPUBuffer -> PrimIO (())) -> PrimIO $ WGPUProcBufferAddRef

public export
WGPUProcBufferRelease : Type
WGPUProcBufferRelease = Ptr (WGPUBuffer -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcBufferRelease : (WGPUBuffer -> PrimIO (())) -> PrimIO $ WGPUProcBufferRelease

public export
WGPUProcCommandBufferSetLabel : Type
WGPUProcCommandBufferSetLabel = Ptr (WGPUCommandBuffer -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandBufferSetLabel : (WGPUCommandBuffer -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcCommandBufferSetLabel

public export
WGPUProcCommandBufferAddRef : Type
WGPUProcCommandBufferAddRef = Ptr (WGPUCommandBuffer -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandBufferAddRef : (WGPUCommandBuffer -> PrimIO (())) -> PrimIO $ WGPUProcCommandBufferAddRef

public export
WGPUProcCommandBufferRelease : Type
WGPUProcCommandBufferRelease = Ptr (WGPUCommandBuffer -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandBufferRelease : (WGPUCommandBuffer -> PrimIO (())) -> PrimIO $ WGPUProcCommandBufferRelease

public export
WGPUProcCommandEncoderBeginComputePass : Type
WGPUProcCommandEncoderBeginComputePass = Ptr (WGPUCommandEncoder -> Ptr (WGPUComputePassDescriptor) -> PrimIO (WGPUComputePassEncoder))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderBeginComputePass : (WGPUCommandEncoder -> Ptr (WGPUComputePassDescriptor) -> PrimIO (WGPUComputePassEncoder)) -> PrimIO $ WGPUProcCommandEncoderBeginComputePass

public export
WGPUProcCommandEncoderBeginRenderPass : Type
WGPUProcCommandEncoderBeginRenderPass = Ptr (WGPUCommandEncoder -> Ptr (WGPURenderPassDescriptor) -> PrimIO (WGPURenderPassEncoder))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderBeginRenderPass : (WGPUCommandEncoder -> Ptr (WGPURenderPassDescriptor) -> PrimIO (WGPURenderPassEncoder)) -> PrimIO $ WGPUProcCommandEncoderBeginRenderPass

public export
WGPUProcCommandEncoderClearBuffer : Type
WGPUProcCommandEncoderClearBuffer = Ptr (WGPUCommandEncoder -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderClearBuffer : (WGPUCommandEncoder -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderClearBuffer

public export
WGPUProcCommandEncoderCopyBufferToBuffer : Type
WGPUProcCommandEncoderCopyBufferToBuffer = Ptr (WGPUCommandEncoder -> WGPUBuffer -> Bits64 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderCopyBufferToBuffer : (WGPUCommandEncoder -> WGPUBuffer -> Bits64 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderCopyBufferToBuffer

public export
WGPUProcCommandEncoderCopyBufferToTexture : Type
WGPUProcCommandEncoderCopyBufferToTexture = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderCopyBufferToTexture : (WGPUCommandEncoder -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderCopyBufferToTexture

public export
WGPUProcCommandEncoderCopyTextureToBuffer : Type
WGPUProcCommandEncoderCopyTextureToBuffer = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUExtent3D) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderCopyTextureToBuffer : (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyBufferInfo) -> Ptr (WGPUExtent3D) -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderCopyTextureToBuffer

public export
WGPUProcCommandEncoderCopyTextureToTexture : Type
WGPUProcCommandEncoderCopyTextureToTexture = Ptr (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderCopyTextureToTexture : (WGPUCommandEncoder -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (WGPUExtent3D) -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderCopyTextureToTexture

public export
WGPUProcCommandEncoderFinish : Type
WGPUProcCommandEncoderFinish = Ptr (WGPUCommandEncoder -> Ptr (WGPUCommandBufferDescriptor) -> PrimIO (WGPUCommandBuffer))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderFinish : (WGPUCommandEncoder -> Ptr (WGPUCommandBufferDescriptor) -> PrimIO (WGPUCommandBuffer)) -> PrimIO $ WGPUProcCommandEncoderFinish

public export
WGPUProcCommandEncoderInsertDebugMarker : Type
WGPUProcCommandEncoderInsertDebugMarker = Ptr (WGPUCommandEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderInsertDebugMarker : (WGPUCommandEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderInsertDebugMarker

public export
WGPUProcCommandEncoderPopDebugGroup : Type
WGPUProcCommandEncoderPopDebugGroup = Ptr (WGPUCommandEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderPopDebugGroup : (WGPUCommandEncoder -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderPopDebugGroup

public export
WGPUProcCommandEncoderPushDebugGroup : Type
WGPUProcCommandEncoderPushDebugGroup = Ptr (WGPUCommandEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderPushDebugGroup : (WGPUCommandEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderPushDebugGroup

public export
WGPUProcCommandEncoderResolveQuerySet : Type
WGPUProcCommandEncoderResolveQuerySet = Ptr (WGPUCommandEncoder -> WGPUQuerySet -> Bits32 -> Bits32 -> WGPUBuffer -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderResolveQuerySet : (WGPUCommandEncoder -> WGPUQuerySet -> Bits32 -> Bits32 -> WGPUBuffer -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderResolveQuerySet

public export
WGPUProcCommandEncoderSetLabel : Type
WGPUProcCommandEncoderSetLabel = Ptr (WGPUCommandEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderSetLabel : (WGPUCommandEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderSetLabel

public export
WGPUProcCommandEncoderWriteTimestamp : Type
WGPUProcCommandEncoderWriteTimestamp = Ptr (WGPUCommandEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderWriteTimestamp : (WGPUCommandEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderWriteTimestamp

public export
WGPUProcCommandEncoderAddRef : Type
WGPUProcCommandEncoderAddRef = Ptr (WGPUCommandEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderAddRef : (WGPUCommandEncoder -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderAddRef

public export
WGPUProcCommandEncoderRelease : Type
WGPUProcCommandEncoderRelease = Ptr (WGPUCommandEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcCommandEncoderRelease : (WGPUCommandEncoder -> PrimIO (())) -> PrimIO $ WGPUProcCommandEncoderRelease

public export
WGPUProcComputePassEncoderDispatchWorkgroups : Type
WGPUProcComputePassEncoderDispatchWorkgroups = Ptr (WGPUComputePassEncoder -> Bits32 -> Bits32 -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderDispatchWorkgroups : (WGPUComputePassEncoder -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderDispatchWorkgroups

public export
WGPUProcComputePassEncoderDispatchWorkgroupsIndirect : Type
WGPUProcComputePassEncoderDispatchWorkgroupsIndirect = Ptr (WGPUComputePassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderDispatchWorkgroupsIndirect : (WGPUComputePassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderDispatchWorkgroupsIndirect

public export
WGPUProcComputePassEncoderEnd : Type
WGPUProcComputePassEncoderEnd = Ptr (WGPUComputePassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderEnd : (WGPUComputePassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderEnd

public export
WGPUProcComputePassEncoderInsertDebugMarker : Type
WGPUProcComputePassEncoderInsertDebugMarker = Ptr (WGPUComputePassEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderInsertDebugMarker : (WGPUComputePassEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderInsertDebugMarker

public export
WGPUProcComputePassEncoderPopDebugGroup : Type
WGPUProcComputePassEncoderPopDebugGroup = Ptr (WGPUComputePassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderPopDebugGroup : (WGPUComputePassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderPopDebugGroup

public export
WGPUProcComputePassEncoderPushDebugGroup : Type
WGPUProcComputePassEncoderPushDebugGroup = Ptr (WGPUComputePassEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderPushDebugGroup : (WGPUComputePassEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderPushDebugGroup

public export
WGPUProcComputePassEncoderSetBindGroup : Type
WGPUProcComputePassEncoderSetBindGroup = Ptr (WGPUComputePassEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderSetBindGroup : (WGPUComputePassEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderSetBindGroup

public export
WGPUProcComputePassEncoderSetLabel : Type
WGPUProcComputePassEncoderSetLabel = Ptr (WGPUComputePassEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderSetLabel : (WGPUComputePassEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderSetLabel

public export
WGPUProcComputePassEncoderSetPipeline : Type
WGPUProcComputePassEncoderSetPipeline = Ptr (WGPUComputePassEncoder -> WGPUComputePipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderSetPipeline : (WGPUComputePassEncoder -> WGPUComputePipeline -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderSetPipeline

public export
WGPUProcComputePassEncoderAddRef : Type
WGPUProcComputePassEncoderAddRef = Ptr (WGPUComputePassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderAddRef : (WGPUComputePassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderAddRef

public export
WGPUProcComputePassEncoderRelease : Type
WGPUProcComputePassEncoderRelease = Ptr (WGPUComputePassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePassEncoderRelease : (WGPUComputePassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcComputePassEncoderRelease

public export
WGPUProcComputePipelineGetBindGroupLayout : Type
WGPUProcComputePipelineGetBindGroupLayout = Ptr (WGPUComputePipeline -> Bits32 -> PrimIO (WGPUBindGroupLayout))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePipelineGetBindGroupLayout : (WGPUComputePipeline -> Bits32 -> PrimIO (WGPUBindGroupLayout)) -> PrimIO $ WGPUProcComputePipelineGetBindGroupLayout

public export
WGPUProcComputePipelineSetLabel : Type
WGPUProcComputePipelineSetLabel = Ptr (WGPUComputePipeline -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePipelineSetLabel : (WGPUComputePipeline -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcComputePipelineSetLabel

public export
WGPUProcComputePipelineAddRef : Type
WGPUProcComputePipelineAddRef = Ptr (WGPUComputePipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePipelineAddRef : (WGPUComputePipeline -> PrimIO (())) -> PrimIO $ WGPUProcComputePipelineAddRef

public export
WGPUProcComputePipelineRelease : Type
WGPUProcComputePipelineRelease = Ptr (WGPUComputePipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcComputePipelineRelease : (WGPUComputePipeline -> PrimIO (())) -> PrimIO $ WGPUProcComputePipelineRelease

public export
WGPUProcDeviceCreateBindGroup : Type
WGPUProcDeviceCreateBindGroup = Ptr (WGPUDevice -> Ptr (WGPUBindGroupDescriptor) -> PrimIO (WGPUBindGroup))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateBindGroup : (WGPUDevice -> Ptr (WGPUBindGroupDescriptor) -> PrimIO (WGPUBindGroup)) -> PrimIO $ WGPUProcDeviceCreateBindGroup

public export
WGPUProcDeviceCreateBindGroupLayout : Type
WGPUProcDeviceCreateBindGroupLayout = Ptr (WGPUDevice -> Ptr (WGPUBindGroupLayoutDescriptor) -> PrimIO (WGPUBindGroupLayout))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateBindGroupLayout : (WGPUDevice -> Ptr (WGPUBindGroupLayoutDescriptor) -> PrimIO (WGPUBindGroupLayout)) -> PrimIO $ WGPUProcDeviceCreateBindGroupLayout

public export
WGPUProcDeviceCreateBuffer : Type
WGPUProcDeviceCreateBuffer = Ptr (WGPUDevice -> Ptr (WGPUBufferDescriptor) -> PrimIO (WGPUBuffer))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateBuffer : (WGPUDevice -> Ptr (WGPUBufferDescriptor) -> PrimIO (WGPUBuffer)) -> PrimIO $ WGPUProcDeviceCreateBuffer

public export
WGPUProcDeviceCreateCommandEncoder : Type
WGPUProcDeviceCreateCommandEncoder = Ptr (WGPUDevice -> Ptr (WGPUCommandEncoderDescriptor) -> PrimIO (WGPUCommandEncoder))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateCommandEncoder : (WGPUDevice -> Ptr (WGPUCommandEncoderDescriptor) -> PrimIO (WGPUCommandEncoder)) -> PrimIO $ WGPUProcDeviceCreateCommandEncoder

public export
WGPUProcDeviceCreateComputePipeline : Type
WGPUProcDeviceCreateComputePipeline = Ptr (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> PrimIO (WGPUComputePipeline))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateComputePipeline : (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> PrimIO (WGPUComputePipeline)) -> PrimIO $ WGPUProcDeviceCreateComputePipeline

public export
WGPUProcDeviceCreateComputePipelineAsync : Type
WGPUProcDeviceCreateComputePipelineAsync = Ptr (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUCreateComputePipelineAsyncCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateComputePipelineAsync : (WGPUDevice -> Ptr (WGPUComputePipelineDescriptor) -> WGPUCreateComputePipelineAsyncCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcDeviceCreateComputePipelineAsync

public export
WGPUProcDeviceCreatePipelineLayout : Type
WGPUProcDeviceCreatePipelineLayout = Ptr (WGPUDevice -> Ptr (WGPUPipelineLayoutDescriptor) -> PrimIO (WGPUPipelineLayout))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreatePipelineLayout : (WGPUDevice -> Ptr (WGPUPipelineLayoutDescriptor) -> PrimIO (WGPUPipelineLayout)) -> PrimIO $ WGPUProcDeviceCreatePipelineLayout

public export
WGPUProcDeviceCreateQuerySet : Type
WGPUProcDeviceCreateQuerySet = Ptr (WGPUDevice -> Ptr (WGPUQuerySetDescriptor) -> PrimIO (WGPUQuerySet))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateQuerySet : (WGPUDevice -> Ptr (WGPUQuerySetDescriptor) -> PrimIO (WGPUQuerySet)) -> PrimIO $ WGPUProcDeviceCreateQuerySet

public export
WGPUProcDeviceCreateRenderBundleEncoder : Type
WGPUProcDeviceCreateRenderBundleEncoder = Ptr (WGPUDevice -> Ptr (WGPURenderBundleEncoderDescriptor) -> PrimIO (WGPURenderBundleEncoder))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateRenderBundleEncoder : (WGPUDevice -> Ptr (WGPURenderBundleEncoderDescriptor) -> PrimIO (WGPURenderBundleEncoder)) -> PrimIO $ WGPUProcDeviceCreateRenderBundleEncoder

public export
WGPUProcDeviceCreateRenderPipeline : Type
WGPUProcDeviceCreateRenderPipeline = Ptr (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> PrimIO (WGPURenderPipeline))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateRenderPipeline : (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> PrimIO (WGPURenderPipeline)) -> PrimIO $ WGPUProcDeviceCreateRenderPipeline

public export
WGPUProcDeviceCreateRenderPipelineAsync : Type
WGPUProcDeviceCreateRenderPipelineAsync = Ptr (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPUCreateRenderPipelineAsyncCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateRenderPipelineAsync : (WGPUDevice -> Ptr (WGPURenderPipelineDescriptor) -> WGPUCreateRenderPipelineAsyncCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcDeviceCreateRenderPipelineAsync

public export
WGPUProcDeviceCreateSampler : Type
WGPUProcDeviceCreateSampler = Ptr (WGPUDevice -> Ptr (WGPUSamplerDescriptor) -> PrimIO (WGPUSampler))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateSampler : (WGPUDevice -> Ptr (WGPUSamplerDescriptor) -> PrimIO (WGPUSampler)) -> PrimIO $ WGPUProcDeviceCreateSampler

public export
WGPUProcDeviceCreateShaderModule : Type
WGPUProcDeviceCreateShaderModule = Ptr (WGPUDevice -> Ptr (WGPUShaderModuleDescriptor) -> PrimIO (WGPUShaderModule))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateShaderModule : (WGPUDevice -> Ptr (WGPUShaderModuleDescriptor) -> PrimIO (WGPUShaderModule)) -> PrimIO $ WGPUProcDeviceCreateShaderModule

public export
WGPUProcDeviceCreateTexture : Type
WGPUProcDeviceCreateTexture = Ptr (WGPUDevice -> Ptr (WGPUTextureDescriptor) -> PrimIO (WGPUTexture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceCreateTexture : (WGPUDevice -> Ptr (WGPUTextureDescriptor) -> PrimIO (WGPUTexture)) -> PrimIO $ WGPUProcDeviceCreateTexture

public export
WGPUProcDeviceDestroy : Type
WGPUProcDeviceDestroy = Ptr (WGPUDevice -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceDestroy : (WGPUDevice -> PrimIO (())) -> PrimIO $ WGPUProcDeviceDestroy

public export
WGPUProcDeviceGetAdapterInfo : Type
WGPUProcDeviceGetAdapterInfo = Ptr (WGPUDevice -> PrimIO (WGPUAdapterInfo))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceGetAdapterInfo : (WGPUDevice -> PrimIO (WGPUAdapterInfo)) -> PrimIO $ WGPUProcDeviceGetAdapterInfo

public export
WGPUProcDeviceGetFeatures : Type
WGPUProcDeviceGetFeatures = Ptr (WGPUDevice -> Ptr (WGPUSupportedFeatures) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceGetFeatures : (WGPUDevice -> Ptr (WGPUSupportedFeatures) -> PrimIO (())) -> PrimIO $ WGPUProcDeviceGetFeatures

public export
WGPUProcDeviceGetLimits : Type
WGPUProcDeviceGetLimits = Ptr (WGPUDevice -> Ptr (WGPULimits) -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceGetLimits : (WGPUDevice -> Ptr (WGPULimits) -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcDeviceGetLimits

public export
WGPUProcDeviceGetLostFuture : Type
WGPUProcDeviceGetLostFuture = Ptr (WGPUDevice -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceGetLostFuture : (WGPUDevice -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcDeviceGetLostFuture

public export
WGPUProcDeviceGetQueue : Type
WGPUProcDeviceGetQueue = Ptr (WGPUDevice -> PrimIO (WGPUQueue))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceGetQueue : (WGPUDevice -> PrimIO (WGPUQueue)) -> PrimIO $ WGPUProcDeviceGetQueue

public export
WGPUProcDeviceHasFeature : Type
WGPUProcDeviceHasFeature = Ptr (WGPUDevice -> WGPUFeatureName -> PrimIO (WGPUBool))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceHasFeature : (WGPUDevice -> WGPUFeatureName -> PrimIO (WGPUBool)) -> PrimIO $ WGPUProcDeviceHasFeature

public export
WGPUProcDevicePopErrorScope : Type
WGPUProcDevicePopErrorScope = Ptr (WGPUDevice -> WGPUPopErrorScopeCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDevicePopErrorScope : (WGPUDevice -> WGPUPopErrorScopeCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcDevicePopErrorScope

public export
WGPUProcDevicePushErrorScope : Type
WGPUProcDevicePushErrorScope = Ptr (WGPUDevice -> WGPUErrorFilter -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDevicePushErrorScope : (WGPUDevice -> WGPUErrorFilter -> PrimIO (())) -> PrimIO $ WGPUProcDevicePushErrorScope

public export
WGPUProcDeviceSetLabel : Type
WGPUProcDeviceSetLabel = Ptr (WGPUDevice -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceSetLabel : (WGPUDevice -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcDeviceSetLabel

public export
WGPUProcDeviceAddRef : Type
WGPUProcDeviceAddRef = Ptr (WGPUDevice -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceAddRef : (WGPUDevice -> PrimIO (())) -> PrimIO $ WGPUProcDeviceAddRef

public export
WGPUProcDeviceRelease : Type
WGPUProcDeviceRelease = Ptr (WGPUDevice -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcDeviceRelease : (WGPUDevice -> PrimIO (())) -> PrimIO $ WGPUProcDeviceRelease

public export
WGPUProcInstanceCreateSurface : Type
WGPUProcInstanceCreateSurface = Ptr (WGPUInstance -> Ptr (WGPUSurfaceDescriptor) -> PrimIO (WGPUSurface))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceCreateSurface : (WGPUInstance -> Ptr (WGPUSurfaceDescriptor) -> PrimIO (WGPUSurface)) -> PrimIO $ WGPUProcInstanceCreateSurface

public export
WGPUProcInstanceGetWGSLLanguageFeatures : Type
WGPUProcInstanceGetWGSLLanguageFeatures = Ptr (WGPUInstance -> Ptr (WGPUSupportedWGSLLanguageFeatures) -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceGetWGSLLanguageFeatures : (WGPUInstance -> Ptr (WGPUSupportedWGSLLanguageFeatures) -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcInstanceGetWGSLLanguageFeatures

public export
WGPUProcInstanceHasWGSLLanguageFeature : Type
WGPUProcInstanceHasWGSLLanguageFeature = Ptr (WGPUInstance -> WGPUWGSLLanguageFeatureName -> PrimIO (WGPUBool))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceHasWGSLLanguageFeature : (WGPUInstance -> WGPUWGSLLanguageFeatureName -> PrimIO (WGPUBool)) -> PrimIO $ WGPUProcInstanceHasWGSLLanguageFeature

public export
WGPUProcInstanceProcessEvents : Type
WGPUProcInstanceProcessEvents = Ptr (WGPUInstance -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceProcessEvents : (WGPUInstance -> PrimIO (())) -> PrimIO $ WGPUProcInstanceProcessEvents

public export
WGPUProcInstanceRequestAdapter : Type
WGPUProcInstanceRequestAdapter = Ptr (WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> WGPURequestAdapterCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceRequestAdapter : (WGPUInstance -> Ptr (WGPURequestAdapterOptions) -> WGPURequestAdapterCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcInstanceRequestAdapter

public export
WGPUProcInstanceWaitAny : Type
WGPUProcInstanceWaitAny = Ptr (WGPUInstance -> Bits64 -> Ptr (WGPUFutureWaitInfo) -> Bits64 -> PrimIO (WGPUWaitStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceWaitAny : (WGPUInstance -> Bits64 -> Ptr (WGPUFutureWaitInfo) -> Bits64 -> PrimIO (WGPUWaitStatus)) -> PrimIO $ WGPUProcInstanceWaitAny

public export
WGPUProcInstanceAddRef : Type
WGPUProcInstanceAddRef = Ptr (WGPUInstance -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceAddRef : (WGPUInstance -> PrimIO (())) -> PrimIO $ WGPUProcInstanceAddRef

public export
WGPUProcInstanceRelease : Type
WGPUProcInstanceRelease = Ptr (WGPUInstance -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcInstanceRelease : (WGPUInstance -> PrimIO (())) -> PrimIO $ WGPUProcInstanceRelease

public export
WGPUProcPipelineLayoutSetLabel : Type
WGPUProcPipelineLayoutSetLabel = Ptr (WGPUPipelineLayout -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcPipelineLayoutSetLabel : (WGPUPipelineLayout -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcPipelineLayoutSetLabel

public export
WGPUProcPipelineLayoutAddRef : Type
WGPUProcPipelineLayoutAddRef = Ptr (WGPUPipelineLayout -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcPipelineLayoutAddRef : (WGPUPipelineLayout -> PrimIO (())) -> PrimIO $ WGPUProcPipelineLayoutAddRef

public export
WGPUProcPipelineLayoutRelease : Type
WGPUProcPipelineLayoutRelease = Ptr (WGPUPipelineLayout -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcPipelineLayoutRelease : (WGPUPipelineLayout -> PrimIO (())) -> PrimIO $ WGPUProcPipelineLayoutRelease

public export
WGPUProcQuerySetDestroy : Type
WGPUProcQuerySetDestroy = Ptr (WGPUQuerySet -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQuerySetDestroy : (WGPUQuerySet -> PrimIO (())) -> PrimIO $ WGPUProcQuerySetDestroy

public export
WGPUProcQuerySetGetCount : Type
WGPUProcQuerySetGetCount = Ptr (WGPUQuerySet -> PrimIO (Bits32))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQuerySetGetCount : (WGPUQuerySet -> PrimIO (Bits32)) -> PrimIO $ WGPUProcQuerySetGetCount

public export
WGPUProcQuerySetGetType : Type
WGPUProcQuerySetGetType = Ptr (WGPUQuerySet -> PrimIO (WGPUQueryType))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQuerySetGetType : (WGPUQuerySet -> PrimIO (WGPUQueryType)) -> PrimIO $ WGPUProcQuerySetGetType

public export
WGPUProcQuerySetSetLabel : Type
WGPUProcQuerySetSetLabel = Ptr (WGPUQuerySet -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQuerySetSetLabel : (WGPUQuerySet -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcQuerySetSetLabel

public export
WGPUProcQuerySetAddRef : Type
WGPUProcQuerySetAddRef = Ptr (WGPUQuerySet -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQuerySetAddRef : (WGPUQuerySet -> PrimIO (())) -> PrimIO $ WGPUProcQuerySetAddRef

public export
WGPUProcQuerySetRelease : Type
WGPUProcQuerySetRelease = Ptr (WGPUQuerySet -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQuerySetRelease : (WGPUQuerySet -> PrimIO (())) -> PrimIO $ WGPUProcQuerySetRelease

public export
WGPUProcQueueOnSubmittedWorkDone : Type
WGPUProcQueueOnSubmittedWorkDone = Ptr (WGPUQueue -> WGPUQueueWorkDoneCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueOnSubmittedWorkDone : (WGPUQueue -> WGPUQueueWorkDoneCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcQueueOnSubmittedWorkDone

public export
WGPUProcQueueSetLabel : Type
WGPUProcQueueSetLabel = Ptr (WGPUQueue -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueSetLabel : (WGPUQueue -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcQueueSetLabel

public export
WGPUProcQueueSubmit : Type
WGPUProcQueueSubmit = Ptr (WGPUQueue -> Bits64 -> Ptr (WGPUCommandBuffer) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueSubmit : (WGPUQueue -> Bits64 -> Ptr (WGPUCommandBuffer) -> PrimIO (())) -> PrimIO $ WGPUProcQueueSubmit

public export
WGPUProcQueueWriteBuffer : Type
WGPUProcQueueWriteBuffer = Ptr (WGPUQueue -> WGPUBuffer -> Bits64 -> Ptr (()) -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueWriteBuffer : (WGPUQueue -> WGPUBuffer -> Bits64 -> Ptr (()) -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcQueueWriteBuffer

public export
WGPUProcQueueWriteTexture : Type
WGPUProcQueueWriteTexture = Ptr (WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> Bits64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueWriteTexture : (WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> Bits64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> PrimIO (())) -> PrimIO $ WGPUProcQueueWriteTexture

public export
WGPUProcQueueAddRef : Type
WGPUProcQueueAddRef = Ptr (WGPUQueue -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueAddRef : (WGPUQueue -> PrimIO (())) -> PrimIO $ WGPUProcQueueAddRef

public export
WGPUProcQueueRelease : Type
WGPUProcQueueRelease = Ptr (WGPUQueue -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcQueueRelease : (WGPUQueue -> PrimIO (())) -> PrimIO $ WGPUProcQueueRelease

public export
WGPUProcRenderBundleSetLabel : Type
WGPUProcRenderBundleSetLabel = Ptr (WGPURenderBundle -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleSetLabel : (WGPURenderBundle -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleSetLabel

public export
WGPUProcRenderBundleAddRef : Type
WGPUProcRenderBundleAddRef = Ptr (WGPURenderBundle -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleAddRef : (WGPURenderBundle -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleAddRef

public export
WGPUProcRenderBundleRelease : Type
WGPUProcRenderBundleRelease = Ptr (WGPURenderBundle -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleRelease : (WGPURenderBundle -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleRelease

public export
WGPUProcRenderBundleEncoderDraw : Type
WGPUProcRenderBundleEncoderDraw = Ptr (WGPURenderBundleEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderDraw : (WGPURenderBundleEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderDraw

public export
WGPUProcRenderBundleEncoderDrawIndexed : Type
WGPUProcRenderBundleEncoderDrawIndexed = Ptr (WGPURenderBundleEncoder -> Bits32 -> Bits32 -> Bits32 -> Int32 -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderDrawIndexed : (WGPURenderBundleEncoder -> Bits32 -> Bits32 -> Bits32 -> Int32 -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderDrawIndexed

public export
WGPUProcRenderBundleEncoderDrawIndexedIndirect : Type
WGPUProcRenderBundleEncoderDrawIndexedIndirect = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderDrawIndexedIndirect : (WGPURenderBundleEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderDrawIndexedIndirect

public export
WGPUProcRenderBundleEncoderDrawIndirect : Type
WGPUProcRenderBundleEncoderDrawIndirect = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderDrawIndirect : (WGPURenderBundleEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderDrawIndirect

public export
WGPUProcRenderBundleEncoderFinish : Type
WGPUProcRenderBundleEncoderFinish = Ptr (WGPURenderBundleEncoder -> Ptr (WGPURenderBundleDescriptor) -> PrimIO (WGPURenderBundle))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderFinish : (WGPURenderBundleEncoder -> Ptr (WGPURenderBundleDescriptor) -> PrimIO (WGPURenderBundle)) -> PrimIO $ WGPUProcRenderBundleEncoderFinish

public export
WGPUProcRenderBundleEncoderInsertDebugMarker : Type
WGPUProcRenderBundleEncoderInsertDebugMarker = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderInsertDebugMarker : (WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderInsertDebugMarker

public export
WGPUProcRenderBundleEncoderPopDebugGroup : Type
WGPUProcRenderBundleEncoderPopDebugGroup = Ptr (WGPURenderBundleEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderPopDebugGroup : (WGPURenderBundleEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderPopDebugGroup

public export
WGPUProcRenderBundleEncoderPushDebugGroup : Type
WGPUProcRenderBundleEncoderPushDebugGroup = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderPushDebugGroup : (WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderPushDebugGroup

public export
WGPUProcRenderBundleEncoderSetBindGroup : Type
WGPUProcRenderBundleEncoderSetBindGroup = Ptr (WGPURenderBundleEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderSetBindGroup : (WGPURenderBundleEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderSetBindGroup

public export
WGPUProcRenderBundleEncoderSetIndexBuffer : Type
WGPUProcRenderBundleEncoderSetIndexBuffer = Ptr (WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> Bits64 -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderSetIndexBuffer : (WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> Bits64 -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderSetIndexBuffer

public export
WGPUProcRenderBundleEncoderSetLabel : Type
WGPUProcRenderBundleEncoderSetLabel = Ptr (WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderSetLabel : (WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderSetLabel

public export
WGPUProcRenderBundleEncoderSetPipeline : Type
WGPUProcRenderBundleEncoderSetPipeline = Ptr (WGPURenderBundleEncoder -> WGPURenderPipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderSetPipeline : (WGPURenderBundleEncoder -> WGPURenderPipeline -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderSetPipeline

public export
WGPUProcRenderBundleEncoderSetVertexBuffer : Type
WGPUProcRenderBundleEncoderSetVertexBuffer = Ptr (WGPURenderBundleEncoder -> Bits32 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderSetVertexBuffer : (WGPURenderBundleEncoder -> Bits32 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderSetVertexBuffer

public export
WGPUProcRenderBundleEncoderAddRef : Type
WGPUProcRenderBundleEncoderAddRef = Ptr (WGPURenderBundleEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderAddRef : (WGPURenderBundleEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderAddRef

public export
WGPUProcRenderBundleEncoderRelease : Type
WGPUProcRenderBundleEncoderRelease = Ptr (WGPURenderBundleEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderBundleEncoderRelease : (WGPURenderBundleEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderBundleEncoderRelease

public export
WGPUProcRenderPassEncoderBeginOcclusionQuery : Type
WGPUProcRenderPassEncoderBeginOcclusionQuery = Ptr (WGPURenderPassEncoder -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderBeginOcclusionQuery : (WGPURenderPassEncoder -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderBeginOcclusionQuery

public export
WGPUProcRenderPassEncoderDraw : Type
WGPUProcRenderPassEncoderDraw = Ptr (WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderDraw : (WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderDraw

public export
WGPUProcRenderPassEncoderDrawIndexed : Type
WGPUProcRenderPassEncoderDrawIndexed = Ptr (WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Int32 -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderDrawIndexed : (WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Int32 -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderDrawIndexed

public export
WGPUProcRenderPassEncoderDrawIndexedIndirect : Type
WGPUProcRenderPassEncoderDrawIndexedIndirect = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderDrawIndexedIndirect : (WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderDrawIndexedIndirect

public export
WGPUProcRenderPassEncoderDrawIndirect : Type
WGPUProcRenderPassEncoderDrawIndirect = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderDrawIndirect : (WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderDrawIndirect

public export
WGPUProcRenderPassEncoderEnd : Type
WGPUProcRenderPassEncoderEnd = Ptr (WGPURenderPassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderEnd : (WGPURenderPassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderEnd

public export
WGPUProcRenderPassEncoderEndOcclusionQuery : Type
WGPUProcRenderPassEncoderEndOcclusionQuery = Ptr (WGPURenderPassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderEndOcclusionQuery : (WGPURenderPassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderEndOcclusionQuery

public export
WGPUProcRenderPassEncoderExecuteBundles : Type
WGPUProcRenderPassEncoderExecuteBundles = Ptr (WGPURenderPassEncoder -> Bits64 -> Ptr (WGPURenderBundle) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderExecuteBundles : (WGPURenderPassEncoder -> Bits64 -> Ptr (WGPURenderBundle) -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderExecuteBundles

public export
WGPUProcRenderPassEncoderInsertDebugMarker : Type
WGPUProcRenderPassEncoderInsertDebugMarker = Ptr (WGPURenderPassEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderInsertDebugMarker : (WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderInsertDebugMarker

public export
WGPUProcRenderPassEncoderPopDebugGroup : Type
WGPUProcRenderPassEncoderPopDebugGroup = Ptr (WGPURenderPassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderPopDebugGroup : (WGPURenderPassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderPopDebugGroup

public export
WGPUProcRenderPassEncoderPushDebugGroup : Type
WGPUProcRenderPassEncoderPushDebugGroup = Ptr (WGPURenderPassEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderPushDebugGroup : (WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderPushDebugGroup

public export
WGPUProcRenderPassEncoderSetBindGroup : Type
WGPUProcRenderPassEncoderSetBindGroup = Ptr (WGPURenderPassEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetBindGroup : (WGPURenderPassEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetBindGroup

public export
WGPUProcRenderPassEncoderSetBlendConstant : Type
WGPUProcRenderPassEncoderSetBlendConstant = Ptr (WGPURenderPassEncoder -> Ptr (WGPUColor) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetBlendConstant : (WGPURenderPassEncoder -> Ptr (WGPUColor) -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetBlendConstant

public export
WGPUProcRenderPassEncoderSetIndexBuffer : Type
WGPUProcRenderPassEncoderSetIndexBuffer = Ptr (WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> Bits64 -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetIndexBuffer : (WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> Bits64 -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetIndexBuffer

public export
WGPUProcRenderPassEncoderSetLabel : Type
WGPUProcRenderPassEncoderSetLabel = Ptr (WGPURenderPassEncoder -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetLabel : (WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetLabel

public export
WGPUProcRenderPassEncoderSetPipeline : Type
WGPUProcRenderPassEncoderSetPipeline = Ptr (WGPURenderPassEncoder -> WGPURenderPipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetPipeline : (WGPURenderPassEncoder -> WGPURenderPipeline -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetPipeline

public export
WGPUProcRenderPassEncoderSetScissorRect : Type
WGPUProcRenderPassEncoderSetScissorRect = Ptr (WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetScissorRect : (WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetScissorRect

public export
WGPUProcRenderPassEncoderSetStencilReference : Type
WGPUProcRenderPassEncoderSetStencilReference = Ptr (WGPURenderPassEncoder -> Bits32 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetStencilReference : (WGPURenderPassEncoder -> Bits32 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetStencilReference

public export
WGPUProcRenderPassEncoderSetVertexBuffer : Type
WGPUProcRenderPassEncoderSetVertexBuffer = Ptr (WGPURenderPassEncoder -> Bits32 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetVertexBuffer : (WGPURenderPassEncoder -> Bits32 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetVertexBuffer

public export
WGPUProcRenderPassEncoderSetViewport : Type
WGPUProcRenderPassEncoderSetViewport = Ptr (WGPURenderPassEncoder -> Float -> Float -> Float -> Float -> Float -> Float -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderSetViewport : (WGPURenderPassEncoder -> Float -> Float -> Float -> Float -> Float -> Float -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderSetViewport

public export
WGPUProcRenderPassEncoderAddRef : Type
WGPUProcRenderPassEncoderAddRef = Ptr (WGPURenderPassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderAddRef : (WGPURenderPassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderAddRef

public export
WGPUProcRenderPassEncoderRelease : Type
WGPUProcRenderPassEncoderRelease = Ptr (WGPURenderPassEncoder -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPassEncoderRelease : (WGPURenderPassEncoder -> PrimIO (())) -> PrimIO $ WGPUProcRenderPassEncoderRelease

public export
WGPUProcRenderPipelineGetBindGroupLayout : Type
WGPUProcRenderPipelineGetBindGroupLayout = Ptr (WGPURenderPipeline -> Bits32 -> PrimIO (WGPUBindGroupLayout))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPipelineGetBindGroupLayout : (WGPURenderPipeline -> Bits32 -> PrimIO (WGPUBindGroupLayout)) -> PrimIO $ WGPUProcRenderPipelineGetBindGroupLayout

public export
WGPUProcRenderPipelineSetLabel : Type
WGPUProcRenderPipelineSetLabel = Ptr (WGPURenderPipeline -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPipelineSetLabel : (WGPURenderPipeline -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcRenderPipelineSetLabel

public export
WGPUProcRenderPipelineAddRef : Type
WGPUProcRenderPipelineAddRef = Ptr (WGPURenderPipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPipelineAddRef : (WGPURenderPipeline -> PrimIO (())) -> PrimIO $ WGPUProcRenderPipelineAddRef

public export
WGPUProcRenderPipelineRelease : Type
WGPUProcRenderPipelineRelease = Ptr (WGPURenderPipeline -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcRenderPipelineRelease : (WGPURenderPipeline -> PrimIO (())) -> PrimIO $ WGPUProcRenderPipelineRelease

public export
WGPUProcSamplerSetLabel : Type
WGPUProcSamplerSetLabel = Ptr (WGPUSampler -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSamplerSetLabel : (WGPUSampler -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcSamplerSetLabel

public export
WGPUProcSamplerAddRef : Type
WGPUProcSamplerAddRef = Ptr (WGPUSampler -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSamplerAddRef : (WGPUSampler -> PrimIO (())) -> PrimIO $ WGPUProcSamplerAddRef

public export
WGPUProcSamplerRelease : Type
WGPUProcSamplerRelease = Ptr (WGPUSampler -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSamplerRelease : (WGPUSampler -> PrimIO (())) -> PrimIO $ WGPUProcSamplerRelease

public export
WGPUProcShaderModuleGetCompilationInfo : Type
WGPUProcShaderModuleGetCompilationInfo = Ptr (WGPUShaderModule -> WGPUCompilationInfoCallbackInfo -> PrimIO (WGPUFuture))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcShaderModuleGetCompilationInfo : (WGPUShaderModule -> WGPUCompilationInfoCallbackInfo -> PrimIO (WGPUFuture)) -> PrimIO $ WGPUProcShaderModuleGetCompilationInfo

public export
WGPUProcShaderModuleSetLabel : Type
WGPUProcShaderModuleSetLabel = Ptr (WGPUShaderModule -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcShaderModuleSetLabel : (WGPUShaderModule -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcShaderModuleSetLabel

public export
WGPUProcShaderModuleAddRef : Type
WGPUProcShaderModuleAddRef = Ptr (WGPUShaderModule -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcShaderModuleAddRef : (WGPUShaderModule -> PrimIO (())) -> PrimIO $ WGPUProcShaderModuleAddRef

public export
WGPUProcShaderModuleRelease : Type
WGPUProcShaderModuleRelease = Ptr (WGPUShaderModule -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcShaderModuleRelease : (WGPUShaderModule -> PrimIO (())) -> PrimIO $ WGPUProcShaderModuleRelease

public export
WGPUProcSupportedFeaturesFreeMembers : Type
WGPUProcSupportedFeaturesFreeMembers = Ptr (WGPUSupportedFeatures -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSupportedFeaturesFreeMembers : (WGPUSupportedFeatures -> PrimIO (())) -> PrimIO $ WGPUProcSupportedFeaturesFreeMembers

public export
WGPUProcSupportedWGSLLanguageFeaturesFreeMembers : Type
WGPUProcSupportedWGSLLanguageFeaturesFreeMembers = Ptr (WGPUSupportedWGSLLanguageFeatures -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSupportedWGSLLanguageFeaturesFreeMembers : (WGPUSupportedWGSLLanguageFeatures -> PrimIO (())) -> PrimIO $ WGPUProcSupportedWGSLLanguageFeaturesFreeMembers

public export
WGPUProcSurfaceConfigure : Type
WGPUProcSurfaceConfigure = Ptr (WGPUSurface -> Ptr (WGPUSurfaceConfiguration) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceConfigure : (WGPUSurface -> Ptr (WGPUSurfaceConfiguration) -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceConfigure

public export
WGPUProcSurfaceGetCapabilities : Type
WGPUProcSurfaceGetCapabilities = Ptr (WGPUSurface -> WGPUAdapter -> Ptr (WGPUSurfaceCapabilities) -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceGetCapabilities : (WGPUSurface -> WGPUAdapter -> Ptr (WGPUSurfaceCapabilities) -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcSurfaceGetCapabilities

public export
WGPUProcSurfaceGetCurrentTexture : Type
WGPUProcSurfaceGetCurrentTexture = Ptr (WGPUSurface -> Ptr (WGPUSurfaceTexture) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceGetCurrentTexture : (WGPUSurface -> Ptr (WGPUSurfaceTexture) -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceGetCurrentTexture

public export
WGPUProcSurfacePresent : Type
WGPUProcSurfacePresent = Ptr (WGPUSurface -> PrimIO (WGPUStatus))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfacePresent : (WGPUSurface -> PrimIO (WGPUStatus)) -> PrimIO $ WGPUProcSurfacePresent

public export
WGPUProcSurfaceSetLabel : Type
WGPUProcSurfaceSetLabel = Ptr (WGPUSurface -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceSetLabel : (WGPUSurface -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceSetLabel

public export
WGPUProcSurfaceUnconfigure : Type
WGPUProcSurfaceUnconfigure = Ptr (WGPUSurface -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceUnconfigure : (WGPUSurface -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceUnconfigure

public export
WGPUProcSurfaceAddRef : Type
WGPUProcSurfaceAddRef = Ptr (WGPUSurface -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceAddRef : (WGPUSurface -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceAddRef

public export
WGPUProcSurfaceRelease : Type
WGPUProcSurfaceRelease = Ptr (WGPUSurface -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceRelease : (WGPUSurface -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceRelease

public export
WGPUProcSurfaceCapabilitiesFreeMembers : Type
WGPUProcSurfaceCapabilitiesFreeMembers = Ptr (WGPUSurfaceCapabilities -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcSurfaceCapabilitiesFreeMembers : (WGPUSurfaceCapabilities -> PrimIO (())) -> PrimIO $ WGPUProcSurfaceCapabilitiesFreeMembers

public export
WGPUProcTextureCreateView : Type
WGPUProcTextureCreateView = Ptr (WGPUTexture -> Ptr (WGPUTextureViewDescriptor) -> PrimIO (WGPUTextureView))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureCreateView : (WGPUTexture -> Ptr (WGPUTextureViewDescriptor) -> PrimIO (WGPUTextureView)) -> PrimIO $ WGPUProcTextureCreateView

public export
WGPUProcTextureDestroy : Type
WGPUProcTextureDestroy = Ptr (WGPUTexture -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureDestroy : (WGPUTexture -> PrimIO (())) -> PrimIO $ WGPUProcTextureDestroy

public export
WGPUProcTextureGetDepthOrArrayLayers : Type
WGPUProcTextureGetDepthOrArrayLayers = Ptr (WGPUTexture -> PrimIO (Bits32))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetDepthOrArrayLayers : (WGPUTexture -> PrimIO (Bits32)) -> PrimIO $ WGPUProcTextureGetDepthOrArrayLayers

public export
WGPUProcTextureGetDimension : Type
WGPUProcTextureGetDimension = Ptr (WGPUTexture -> PrimIO (WGPUTextureDimension))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetDimension : (WGPUTexture -> PrimIO (WGPUTextureDimension)) -> PrimIO $ WGPUProcTextureGetDimension

public export
WGPUProcTextureGetFormat : Type
WGPUProcTextureGetFormat = Ptr (WGPUTexture -> PrimIO (WGPUTextureFormat))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetFormat : (WGPUTexture -> PrimIO (WGPUTextureFormat)) -> PrimIO $ WGPUProcTextureGetFormat

public export
WGPUProcTextureGetHeight : Type
WGPUProcTextureGetHeight = Ptr (WGPUTexture -> PrimIO (Bits32))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetHeight : (WGPUTexture -> PrimIO (Bits32)) -> PrimIO $ WGPUProcTextureGetHeight

public export
WGPUProcTextureGetMipLevelCount : Type
WGPUProcTextureGetMipLevelCount = Ptr (WGPUTexture -> PrimIO (Bits32))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetMipLevelCount : (WGPUTexture -> PrimIO (Bits32)) -> PrimIO $ WGPUProcTextureGetMipLevelCount

public export
WGPUProcTextureGetSampleCount : Type
WGPUProcTextureGetSampleCount = Ptr (WGPUTexture -> PrimIO (Bits32))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetSampleCount : (WGPUTexture -> PrimIO (Bits32)) -> PrimIO $ WGPUProcTextureGetSampleCount

public export
WGPUProcTextureGetUsage : Type
WGPUProcTextureGetUsage = Ptr (WGPUTexture -> PrimIO (WGPUTextureUsage))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetUsage : (WGPUTexture -> PrimIO (WGPUTextureUsage)) -> PrimIO $ WGPUProcTextureGetUsage

public export
WGPUProcTextureGetWidth : Type
WGPUProcTextureGetWidth = Ptr (WGPUTexture -> PrimIO (Bits32))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureGetWidth : (WGPUTexture -> PrimIO (Bits32)) -> PrimIO $ WGPUProcTextureGetWidth

public export
WGPUProcTextureSetLabel : Type
WGPUProcTextureSetLabel = Ptr (WGPUTexture -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureSetLabel : (WGPUTexture -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcTextureSetLabel

public export
WGPUProcTextureAddRef : Type
WGPUProcTextureAddRef = Ptr (WGPUTexture -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureAddRef : (WGPUTexture -> PrimIO (())) -> PrimIO $ WGPUProcTextureAddRef

public export
WGPUProcTextureRelease : Type
WGPUProcTextureRelease = Ptr (WGPUTexture -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureRelease : (WGPUTexture -> PrimIO (())) -> PrimIO $ WGPUProcTextureRelease

public export
WGPUProcTextureViewSetLabel : Type
WGPUProcTextureViewSetLabel = Ptr (WGPUTextureView -> WGPUStringView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureViewSetLabel : (WGPUTextureView -> WGPUStringView -> PrimIO (())) -> PrimIO $ WGPUProcTextureViewSetLabel

public export
WGPUProcTextureViewAddRef : Type
WGPUProcTextureViewAddRef = Ptr (WGPUTextureView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureViewAddRef : (WGPUTextureView -> PrimIO (())) -> PrimIO $ WGPUProcTextureViewAddRef

public export
WGPUProcTextureViewRelease : Type
WGPUProcTextureViewRelease = Ptr (WGPUTextureView -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPUProcTextureViewRelease : (WGPUTextureView -> PrimIO (())) -> PrimIO $ WGPUProcTextureViewRelease

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
wgpuBufferGetConstMappedRange : WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (Ptr (()))


%foreign "C:wgpuBufferGetMapState,libwgpu_native"
export
wgpuBufferGetMapState : WGPUBuffer -> PrimIO (WGPUBufferMapState)


%foreign "C:wgpuBufferGetMappedRange,libwgpu_native"
export
wgpuBufferGetMappedRange : WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (Ptr (()))


%foreign "C:wgpuBufferGetSize,libwgpu_native"
export
wgpuBufferGetSize : WGPUBuffer -> PrimIO (Bits64)


%foreign "C:wgpuBufferGetUsage,libwgpu_native"
export
wgpuBufferGetUsage : WGPUBuffer -> PrimIO (WGPUBufferUsage)


%foreign "C:wgpuBufferMapAsync,libwgpu_native"
export
wgpuBufferMapAsync : WGPUBuffer -> WGPUMapMode -> Bits64 -> Bits64 -> WGPUBufferMapCallbackInfo -> PrimIO (WGPUFuture)


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
wgpuCommandEncoderClearBuffer : WGPUCommandEncoder -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())


%foreign "C:wgpuCommandEncoderCopyBufferToBuffer,libwgpu_native"
export
wgpuCommandEncoderCopyBufferToBuffer : WGPUCommandEncoder -> WGPUBuffer -> Bits64 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())


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
wgpuCommandEncoderResolveQuerySet : WGPUCommandEncoder -> WGPUQuerySet -> Bits32 -> Bits32 -> WGPUBuffer -> Bits64 -> PrimIO (())


%foreign "C:wgpuCommandEncoderSetLabel,libwgpu_native"
export
wgpuCommandEncoderSetLabel : WGPUCommandEncoder -> WGPUStringView -> PrimIO (())


%foreign "C:wgpuCommandEncoderWriteTimestamp,libwgpu_native"
export
wgpuCommandEncoderWriteTimestamp : WGPUCommandEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (())


%foreign "C:wgpuCommandEncoderAddRef,libwgpu_native"
export
wgpuCommandEncoderAddRef : WGPUCommandEncoder -> PrimIO (())


%foreign "C:wgpuCommandEncoderRelease,libwgpu_native"
export
wgpuCommandEncoderRelease : WGPUCommandEncoder -> PrimIO (())


%foreign "C:wgpuComputePassEncoderDispatchWorkgroups,libwgpu_native"
export
wgpuComputePassEncoderDispatchWorkgroups : WGPUComputePassEncoder -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())


%foreign "C:wgpuComputePassEncoderDispatchWorkgroupsIndirect,libwgpu_native"
export
wgpuComputePassEncoderDispatchWorkgroupsIndirect : WGPUComputePassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())


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
wgpuComputePassEncoderSetBindGroup : WGPUComputePassEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (())


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
wgpuComputePipelineGetBindGroupLayout : WGPUComputePipeline -> Bits32 -> PrimIO (WGPUBindGroupLayout)


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
wgpuInstanceWaitAny : WGPUInstance -> Bits64 -> Ptr (WGPUFutureWaitInfo) -> Bits64 -> PrimIO (WGPUWaitStatus)


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
wgpuQuerySetGetCount : WGPUQuerySet -> PrimIO (Bits32)


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
wgpuQueueSubmit : WGPUQueue -> Bits64 -> Ptr (WGPUCommandBuffer) -> PrimIO (())


%foreign "C:wgpuQueueWriteBuffer,libwgpu_native"
export
wgpuQueueWriteBuffer : WGPUQueue -> WGPUBuffer -> Bits64 -> Ptr (()) -> Bits64 -> PrimIO (())


%foreign "C:wgpuQueueWriteTexture,libwgpu_native"
export
wgpuQueueWriteTexture : WGPUQueue -> Ptr (WGPUTexelCopyTextureInfo) -> Ptr (()) -> Bits64 -> Ptr (WGPUTexelCopyBufferLayout) -> Ptr (WGPUExtent3D) -> PrimIO (())


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
wgpuRenderBundleEncoderDraw : WGPURenderBundleEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderDrawIndexed,libwgpu_native"
export
wgpuRenderBundleEncoderDrawIndexed : WGPURenderBundleEncoder -> Bits32 -> Bits32 -> Bits32 -> Int32 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderDrawIndexedIndirect,libwgpu_native"
export
wgpuRenderBundleEncoderDrawIndexedIndirect : WGPURenderBundleEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderDrawIndirect,libwgpu_native"
export
wgpuRenderBundleEncoderDrawIndirect : WGPURenderBundleEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())


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
wgpuRenderBundleEncoderSetBindGroup : WGPURenderBundleEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderSetIndexBuffer,libwgpu_native"
export
wgpuRenderBundleEncoderSetIndexBuffer : WGPURenderBundleEncoder -> WGPUBuffer -> WGPUIndexFormat -> Bits64 -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderSetLabel,libwgpu_native"
export
wgpuRenderBundleEncoderSetLabel : WGPURenderBundleEncoder -> WGPUStringView -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderSetPipeline,libwgpu_native"
export
wgpuRenderBundleEncoderSetPipeline : WGPURenderBundleEncoder -> WGPURenderPipeline -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderSetVertexBuffer,libwgpu_native"
export
wgpuRenderBundleEncoderSetVertexBuffer : WGPURenderBundleEncoder -> Bits32 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderAddRef,libwgpu_native"
export
wgpuRenderBundleEncoderAddRef : WGPURenderBundleEncoder -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderRelease,libwgpu_native"
export
wgpuRenderBundleEncoderRelease : WGPURenderBundleEncoder -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderBeginOcclusionQuery,libwgpu_native"
export
wgpuRenderPassEncoderBeginOcclusionQuery : WGPURenderPassEncoder -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderDraw,libwgpu_native"
export
wgpuRenderPassEncoderDraw : WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderDrawIndexed,libwgpu_native"
export
wgpuRenderPassEncoderDrawIndexed : WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Int32 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderDrawIndexedIndirect,libwgpu_native"
export
wgpuRenderPassEncoderDrawIndexedIndirect : WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderDrawIndirect,libwgpu_native"
export
wgpuRenderPassEncoderDrawIndirect : WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderEnd,libwgpu_native"
export
wgpuRenderPassEncoderEnd : WGPURenderPassEncoder -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderEndOcclusionQuery,libwgpu_native"
export
wgpuRenderPassEncoderEndOcclusionQuery : WGPURenderPassEncoder -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderExecuteBundles,libwgpu_native"
export
wgpuRenderPassEncoderExecuteBundles : WGPURenderPassEncoder -> Bits64 -> Ptr (WGPURenderBundle) -> PrimIO (())


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
wgpuRenderPassEncoderSetBindGroup : WGPURenderPassEncoder -> Bits32 -> WGPUBindGroup -> Bits64 -> Ptr (Bits32) -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetBlendConstant,libwgpu_native"
export
wgpuRenderPassEncoderSetBlendConstant : WGPURenderPassEncoder -> Ptr (WGPUColor) -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetIndexBuffer,libwgpu_native"
export
wgpuRenderPassEncoderSetIndexBuffer : WGPURenderPassEncoder -> WGPUBuffer -> WGPUIndexFormat -> Bits64 -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetLabel,libwgpu_native"
export
wgpuRenderPassEncoderSetLabel : WGPURenderPassEncoder -> WGPUStringView -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetPipeline,libwgpu_native"
export
wgpuRenderPassEncoderSetPipeline : WGPURenderPassEncoder -> WGPURenderPipeline -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetScissorRect,libwgpu_native"
export
wgpuRenderPassEncoderSetScissorRect : WGPURenderPassEncoder -> Bits32 -> Bits32 -> Bits32 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetStencilReference,libwgpu_native"
export
wgpuRenderPassEncoderSetStencilReference : WGPURenderPassEncoder -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetVertexBuffer,libwgpu_native"
export
wgpuRenderPassEncoderSetVertexBuffer : WGPURenderPassEncoder -> Bits32 -> WGPUBuffer -> Bits64 -> Bits64 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderSetViewport,libwgpu_native"
export
wgpuRenderPassEncoderSetViewport : WGPURenderPassEncoder -> Float -> Float -> Float -> Float -> Float -> Float -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderAddRef,libwgpu_native"
export
wgpuRenderPassEncoderAddRef : WGPURenderPassEncoder -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderRelease,libwgpu_native"
export
wgpuRenderPassEncoderRelease : WGPURenderPassEncoder -> PrimIO (())


%foreign "C:wgpuRenderPipelineGetBindGroupLayout,libwgpu_native"
export
wgpuRenderPipelineGetBindGroupLayout : WGPURenderPipeline -> Bits32 -> PrimIO (WGPUBindGroupLayout)


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
wgpuTextureGetDepthOrArrayLayers : WGPUTexture -> PrimIO (Bits32)


%foreign "C:wgpuTextureGetDimension,libwgpu_native"
export
wgpuTextureGetDimension : WGPUTexture -> PrimIO (WGPUTextureDimension)


%foreign "C:wgpuTextureGetFormat,libwgpu_native"
export
wgpuTextureGetFormat : WGPUTexture -> PrimIO (WGPUTextureFormat)


%foreign "C:wgpuTextureGetHeight,libwgpu_native"
export
wgpuTextureGetHeight : WGPUTexture -> PrimIO (Bits32)


%foreign "C:wgpuTextureGetMipLevelCount,libwgpu_native"
export
wgpuTextureGetMipLevelCount : WGPUTexture -> PrimIO (Bits32)


%foreign "C:wgpuTextureGetSampleCount,libwgpu_native"
export
wgpuTextureGetSampleCount : WGPUTexture -> PrimIO (Bits32)


%foreign "C:wgpuTextureGetUsage,libwgpu_native"
export
wgpuTextureGetUsage : WGPUTexture -> PrimIO (WGPUTextureUsage)


%foreign "C:wgpuTextureGetWidth,libwgpu_native"
export
wgpuTextureGetWidth : WGPUTexture -> PrimIO (Bits32)


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

public export
WGPUInstanceBackend_All : WGPUInstanceBackend
WGPUInstanceBackend_All = 0x00000000

public export
WGPUInstanceBackend_Vulkan : WGPUInstanceBackend
WGPUInstanceBackend_Vulkan = (shiftL 1 0)

public export
WGPUInstanceBackend_GL : WGPUInstanceBackend
WGPUInstanceBackend_GL = (shiftL 1 1)

public export
WGPUInstanceBackend_Metal : WGPUInstanceBackend
WGPUInstanceBackend_Metal = (shiftL 1 2)

public export
WGPUInstanceBackend_DX12 : WGPUInstanceBackend
WGPUInstanceBackend_DX12 = (shiftL 1 3)

public export
WGPUInstanceBackend_DX11 : WGPUInstanceBackend
WGPUInstanceBackend_DX11 = (shiftL 1 4)

public export
WGPUInstanceBackend_BrowserWebGPU : WGPUInstanceBackend
WGPUInstanceBackend_BrowserWebGPU = (shiftL 1 5)

public export
WGPUInstanceBackend_Primary : WGPUInstanceBackend
WGPUInstanceBackend_Primary = ((((shiftL 1 0) .|. (shiftL 1 2)) .|. (shiftL 1 3)) .|. (shiftL 1 5))

public export
WGPUInstanceBackend_Secondary : WGPUInstanceBackend
WGPUInstanceBackend_Secondary = ((shiftL 1 1) .|. (shiftL 1 4))

public export
WGPUInstanceBackend_Force32 : WGPUInstanceBackend
WGPUInstanceBackend_Force32 = 0x7FFFFFFF

public export
WGPUInstanceFlag : Type
WGPUInstanceFlag = WGPUFlags

public export
WGPUInstanceFlag_Default : WGPUInstanceFlag
WGPUInstanceFlag_Default = 0x00000000

public export
WGPUInstanceFlag_Debug : WGPUInstanceFlag
WGPUInstanceFlag_Debug = (shiftL 1 0)

public export
WGPUInstanceFlag_Validation : WGPUInstanceFlag
WGPUInstanceFlag_Validation = (shiftL 1 1)

public export
WGPUInstanceFlag_DiscardHalLabels : WGPUInstanceFlag
WGPUInstanceFlag_DiscardHalLabels = (shiftL 1 2)

public export
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
WGPUInstanceExtras = Struct "WGPUInstanceExtras" [("chain",  (WGPUChainedStruct)),("backends",  (WGPUInstanceBackend)),("flags",  (WGPUInstanceFlag)),("dx12ShaderCompiler",  (WGPUDx12Compiler)),("gles3MinorVersion",  (WGPUGles3MinorVersion)),("glFenceBehaviour",  (WGPUGLFenceBehaviour)),("dxcPath",  (WGPUStringView)),("dxcMaxShaderModel",  (WGPUDxcMaxShaderModel)),("budgetForDeviceCreation", Ptr (Bits8)),("budgetForDeviceLoss", Ptr (Bits8))]

-- struct here!!
%foreign ""
prim__allocStructWGPUInstanceExtras : allocStructPrimType WGPUInstanceExtras
%foreign_impl prim__allocStructWGPUInstanceExtras (allocStructPrimCodegen WGPUInstanceExtras)

export
AllocStruct WGPUInstanceExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUInstanceExtras xs

public export
WGPUDeviceExtras : Type
WGPUDeviceExtras = Struct "WGPUDeviceExtras" [("chain",  (WGPUChainedStruct)),("tracePath",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUDeviceExtras : allocStructPrimType WGPUDeviceExtras
%foreign_impl prim__allocStructWGPUDeviceExtras (allocStructPrimCodegen WGPUDeviceExtras)

export
AllocStruct WGPUDeviceExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUDeviceExtras xs

public export
WGPUNativeLimits : Type
WGPUNativeLimits = Struct "WGPUNativeLimits" [("chain",  (WGPUChainedStructOut)),("maxPushConstantSize",  (Bits32)),("maxNonSamplerBindings",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUNativeLimits : allocStructPrimType WGPUNativeLimits
%foreign_impl prim__allocStructWGPUNativeLimits (allocStructPrimCodegen WGPUNativeLimits)

export
AllocStruct WGPUNativeLimits where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUNativeLimits xs

public export
WGPUPushConstantRange : Type
WGPUPushConstantRange = Struct "WGPUPushConstantRange" [("stages",  (WGPUShaderStage)),("start",  (Bits32)),("end",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUPushConstantRange : allocStructPrimType WGPUPushConstantRange
%foreign_impl prim__allocStructWGPUPushConstantRange (allocStructPrimCodegen WGPUPushConstantRange)

export
AllocStruct WGPUPushConstantRange where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUPushConstantRange xs

public export
WGPUPipelineLayoutExtras : Type
WGPUPipelineLayoutExtras = Struct "WGPUPipelineLayoutExtras" [("chain",  (WGPUChainedStruct)),("pushConstantRangeCount",  (Bits64)),("pushConstantRanges", Ptr (WGPUPushConstantRange))]

-- struct here!!
%foreign ""
prim__allocStructWGPUPipelineLayoutExtras : allocStructPrimType WGPUPipelineLayoutExtras
%foreign_impl prim__allocStructWGPUPipelineLayoutExtras (allocStructPrimCodegen WGPUPipelineLayoutExtras)

export
AllocStruct WGPUPipelineLayoutExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUPipelineLayoutExtras xs

public export
WGPUSubmissionIndex : Type
WGPUSubmissionIndex = Bits64

public export
WGPUShaderDefine : Type
WGPUShaderDefine = Struct "WGPUShaderDefine" [("name",  (WGPUStringView)),("value",  (WGPUStringView))]

-- struct here!!
%foreign ""
prim__allocStructWGPUShaderDefine : allocStructPrimType WGPUShaderDefine
%foreign_impl prim__allocStructWGPUShaderDefine (allocStructPrimCodegen WGPUShaderDefine)

export
AllocStruct WGPUShaderDefine where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUShaderDefine xs

public export
WGPUShaderSourceGLSL : Type
WGPUShaderSourceGLSL = Struct "WGPUShaderSourceGLSL" [("chain",  (WGPUChainedStruct)),("stage",  (WGPUShaderStage)),("code",  (WGPUStringView)),("defineCount",  (Bits32)),("defines", Ptr (WGPUShaderDefine))]

-- struct here!!
%foreign ""
prim__allocStructWGPUShaderSourceGLSL : allocStructPrimType WGPUShaderSourceGLSL
%foreign_impl prim__allocStructWGPUShaderSourceGLSL (allocStructPrimCodegen WGPUShaderSourceGLSL)

export
AllocStruct WGPUShaderSourceGLSL where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUShaderSourceGLSL xs

public export
WGPUShaderModuleDescriptorSpirV : Type
WGPUShaderModuleDescriptorSpirV = Struct "WGPUShaderModuleDescriptorSpirV" [("label",  (WGPUStringView)),("sourceSize",  (Bits32)),("source", Ptr (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUShaderModuleDescriptorSpirV : allocStructPrimType WGPUShaderModuleDescriptorSpirV
%foreign_impl prim__allocStructWGPUShaderModuleDescriptorSpirV (allocStructPrimCodegen WGPUShaderModuleDescriptorSpirV)

export
AllocStruct WGPUShaderModuleDescriptorSpirV where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUShaderModuleDescriptorSpirV xs

public export
WGPURegistryReport : Type
WGPURegistryReport = Struct "WGPURegistryReport" [("numAllocated",  (Bits64)),("numKeptFromUser",  (Bits64)),("numReleasedFromUser",  (Bits64)),("elementSize",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPURegistryReport : allocStructPrimType WGPURegistryReport
%foreign_impl prim__allocStructWGPURegistryReport (allocStructPrimCodegen WGPURegistryReport)

export
AllocStruct WGPURegistryReport where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPURegistryReport xs

public export
WGPUHubReport : Type
WGPUHubReport = Struct "WGPUHubReport" [("adapters",  (WGPURegistryReport)),("devices",  (WGPURegistryReport)),("queues",  (WGPURegistryReport)),("pipelineLayouts",  (WGPURegistryReport)),("shaderModules",  (WGPURegistryReport)),("bindGroupLayouts",  (WGPURegistryReport)),("bindGroups",  (WGPURegistryReport)),("commandBuffers",  (WGPURegistryReport)),("renderBundles",  (WGPURegistryReport)),("renderPipelines",  (WGPURegistryReport)),("computePipelines",  (WGPURegistryReport)),("pipelineCaches",  (WGPURegistryReport)),("querySets",  (WGPURegistryReport)),("buffers",  (WGPURegistryReport)),("textures",  (WGPURegistryReport)),("textureViews",  (WGPURegistryReport)),("samplers",  (WGPURegistryReport))]

-- struct here!!
%foreign ""
prim__allocStructWGPUHubReport : allocStructPrimType WGPUHubReport
%foreign_impl prim__allocStructWGPUHubReport (allocStructPrimCodegen WGPUHubReport)

export
AllocStruct WGPUHubReport where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUHubReport xs

public export
WGPUGlobalReport : Type
WGPUGlobalReport = Struct "WGPUGlobalReport" [("surfaces",  (WGPURegistryReport)),("hub",  (WGPUHubReport))]

-- struct here!!
%foreign ""
prim__allocStructWGPUGlobalReport : allocStructPrimType WGPUGlobalReport
%foreign_impl prim__allocStructWGPUGlobalReport (allocStructPrimCodegen WGPUGlobalReport)

export
AllocStruct WGPUGlobalReport where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUGlobalReport xs

public export
WGPUInstanceEnumerateAdapterOptions : Type
WGPUInstanceEnumerateAdapterOptions = Struct "WGPUInstanceEnumerateAdapterOptions" [("nextInChain", Ptr (WGPUChainedStruct)),("backends",  (WGPUInstanceBackend))]

-- struct here!!
%foreign ""
prim__allocStructWGPUInstanceEnumerateAdapterOptions : allocStructPrimType WGPUInstanceEnumerateAdapterOptions
%foreign_impl prim__allocStructWGPUInstanceEnumerateAdapterOptions (allocStructPrimCodegen WGPUInstanceEnumerateAdapterOptions)

export
AllocStruct WGPUInstanceEnumerateAdapterOptions where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUInstanceEnumerateAdapterOptions xs

public export
WGPUBindGroupEntryExtras : Type
WGPUBindGroupEntryExtras = Struct "WGPUBindGroupEntryExtras" [("chain",  (WGPUChainedStruct)),("buffers", Ptr (WGPUBuffer)),("bufferCount",  (Bits64)),("samplers", Ptr (WGPUSampler)),("samplerCount",  (Bits64)),("textureViews", Ptr (WGPUTextureView)),("textureViewCount",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBindGroupEntryExtras : allocStructPrimType WGPUBindGroupEntryExtras
%foreign_impl prim__allocStructWGPUBindGroupEntryExtras (allocStructPrimCodegen WGPUBindGroupEntryExtras)

export
AllocStruct WGPUBindGroupEntryExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBindGroupEntryExtras xs

public export
WGPUBindGroupLayoutEntryExtras : Type
WGPUBindGroupLayoutEntryExtras = Struct "WGPUBindGroupLayoutEntryExtras" [("chain",  (WGPUChainedStruct)),("count",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUBindGroupLayoutEntryExtras : allocStructPrimType WGPUBindGroupLayoutEntryExtras
%foreign_impl prim__allocStructWGPUBindGroupLayoutEntryExtras (allocStructPrimCodegen WGPUBindGroupLayoutEntryExtras)

export
AllocStruct WGPUBindGroupLayoutEntryExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUBindGroupLayoutEntryExtras xs

public export
WGPUQuerySetDescriptorExtras : Type
WGPUQuerySetDescriptorExtras = Struct "WGPUQuerySetDescriptorExtras" [("chain",  (WGPUChainedStruct)),("pipelineStatistics", Ptr (WGPUPipelineStatisticName)),("pipelineStatisticCount",  (Bits64))]

-- struct here!!
%foreign ""
prim__allocStructWGPUQuerySetDescriptorExtras : allocStructPrimType WGPUQuerySetDescriptorExtras
%foreign_impl prim__allocStructWGPUQuerySetDescriptorExtras (allocStructPrimCodegen WGPUQuerySetDescriptorExtras)

export
AllocStruct WGPUQuerySetDescriptorExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUQuerySetDescriptorExtras xs

public export
WGPUSurfaceConfigurationExtras : Type
WGPUSurfaceConfigurationExtras = Struct "WGPUSurfaceConfigurationExtras" [("chain",  (WGPUChainedStruct)),("desiredMaximumFrameLatency",  (Bits32))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceConfigurationExtras : allocStructPrimType WGPUSurfaceConfigurationExtras
%foreign_impl prim__allocStructWGPUSurfaceConfigurationExtras (allocStructPrimCodegen WGPUSurfaceConfigurationExtras)

export
AllocStruct WGPUSurfaceConfigurationExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceConfigurationExtras xs

public export
WGPUSurfaceSourceSwapChainPanel : Type
WGPUSurfaceSourceSwapChainPanel = Struct "WGPUSurfaceSourceSwapChainPanel" [("chain",  (WGPUChainedStruct)),("panelNative", Ptr (()))]

-- struct here!!
%foreign ""
prim__allocStructWGPUSurfaceSourceSwapChainPanel : allocStructPrimType WGPUSurfaceSourceSwapChainPanel
%foreign_impl prim__allocStructWGPUSurfaceSourceSwapChainPanel (allocStructPrimCodegen WGPUSurfaceSourceSwapChainPanel)

export
AllocStruct WGPUSurfaceSourceSwapChainPanel where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUSurfaceSourceSwapChainPanel xs

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

-- struct here!!
%foreign ""
prim__allocStructWGPUPrimitiveStateExtras : allocStructPrimType WGPUPrimitiveStateExtras
%foreign_impl prim__allocStructWGPUPrimitiveStateExtras (allocStructPrimCodegen WGPUPrimitiveStateExtras)

export
AllocStruct WGPUPrimitiveStateExtras where
    allocStruct xs =
        primIO $ hlistApply prim__allocStructWGPUPrimitiveStateExtras xs

public export
WGPULogCallback : Type
WGPULogCallback = Ptr (WGPULogLevel -> WGPUStringView -> Ptr (()) -> PrimIO (()))

export
%foreign "C:mkFunctionPtr,libidris_wgpu_support"
mkWGPULogCallback : (WGPULogLevel -> WGPUStringView -> Ptr (()) -> PrimIO (())) -> PrimIO $ WGPULogCallback

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
wgpuInstanceEnumerateAdapters : WGPUInstance -> Ptr (WGPUInstanceEnumerateAdapterOptions) -> Ptr (WGPUAdapter) -> PrimIO (Bits64)


%foreign "C:wgpuQueueSubmitForIndex,libwgpu_native"
export
wgpuQueueSubmitForIndex : WGPUQueue -> Bits64 -> Ptr (WGPUCommandBuffer) -> PrimIO (WGPUSubmissionIndex)


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
wgpuGetVersion : PrimIO (Bits32)


%foreign "C:wgpuRenderPassEncoderSetPushConstants,libwgpu_native"
export
wgpuRenderPassEncoderSetPushConstants : WGPURenderPassEncoder -> WGPUShaderStage -> Bits32 -> Bits32 -> Ptr (()) -> PrimIO (())


%foreign "C:wgpuComputePassEncoderSetPushConstants,libwgpu_native"
export
wgpuComputePassEncoderSetPushConstants : WGPUComputePassEncoder -> Bits32 -> Bits32 -> Ptr (()) -> PrimIO (())


%foreign "C:wgpuRenderBundleEncoderSetPushConstants,libwgpu_native"
export
wgpuRenderBundleEncoderSetPushConstants : WGPURenderBundleEncoder -> WGPUShaderStage -> Bits32 -> Bits32 -> Ptr (()) -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderMultiDrawIndirect,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndirect : WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderMultiDrawIndexedIndirect,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndexedIndirect : WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderMultiDrawIndirectCount,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndirectCount : WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> WGPUBuffer -> Bits64 -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderMultiDrawIndexedIndirectCount,libwgpu_native"
export
wgpuRenderPassEncoderMultiDrawIndexedIndirectCount : WGPURenderPassEncoder -> WGPUBuffer -> Bits64 -> WGPUBuffer -> Bits64 -> Bits32 -> PrimIO (())


%foreign "C:wgpuComputePassEncoderBeginPipelineStatisticsQuery,libwgpu_native"
export
wgpuComputePassEncoderBeginPipelineStatisticsQuery : WGPUComputePassEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (())


%foreign "C:wgpuComputePassEncoderEndPipelineStatisticsQuery,libwgpu_native"
export
wgpuComputePassEncoderEndPipelineStatisticsQuery : WGPUComputePassEncoder -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderBeginPipelineStatisticsQuery,libwgpu_native"
export
wgpuRenderPassEncoderBeginPipelineStatisticsQuery : WGPURenderPassEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderEndPipelineStatisticsQuery,libwgpu_native"
export
wgpuRenderPassEncoderEndPipelineStatisticsQuery : WGPURenderPassEncoder -> PrimIO (())


%foreign "C:wgpuComputePassEncoderWriteTimestamp,libwgpu_native"
export
wgpuComputePassEncoderWriteTimestamp : WGPUComputePassEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (())


%foreign "C:wgpuRenderPassEncoderWriteTimestamp,libwgpu_native"
export
wgpuRenderPassEncoderWriteTimestamp : WGPURenderPassEncoder -> WGPUQuerySet -> Bits32 -> PrimIO (())

