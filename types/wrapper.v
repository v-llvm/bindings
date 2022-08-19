module types

#flag -I/usr/include
#flag -D_GNU_SOURCE
#flag -D__STDC_CONSTANT_MACROS
#flag -D__STDC_FORMAT_MACROS
#flag -D__STDC_LIMIT_MACROS
#flag -L/usr/lib/
#flag -lLLVM
#include <llvm-c/Types.h>

struct LLVMOpaqueMemoryBuffer{}
struct LLVMOpaqueContext{}
struct LLVMOpaqueModule{}
struct LLVMOpaqueType{}
struct LLVMOpaqueValue{}
struct LLVMOpaqueBasicBlock{}
struct LLVMOpaqueMetadata{}
struct LLVMOpaqueNamedMDNode{}
struct LLVMOpaqueValueMetadataEntry{}
struct LLVMOpaqueBuilder{}
struct LLVMOpaqueDIBuilder{}
struct LLVMOpaqueModuleProvider{}
struct LLVMOpaquePassManager{}
struct LLVMOpaquePassRegistry{}
struct LLVMOpaqueUse{}
struct LLVMOpaqueAttributeRef{}
struct LLVMOpaqueDiagnosticInfo{}
struct LLVMOpaqueModuleFlagEntry{}
struct LLVMOpaqueJITEventListener{}
struct LLVMOpaqueBinary{}
struct LLVMComdat{}

type LLVMBool = int
type LLVMMemoryBufferRef = &LLVMOpaqueMemoryBuffer
type LLVMContextRef = &LLVMOpaqueContext
type LLVMModuleRef = &LLVMOpaqueModule
type LLVMTypeRef = &LLVMOpaqueType
type LLVMValueRef = &LLVMOpaqueValue
type LLVMBasicBlockRef = &LLVMOpaqueBasicBlock
type LLVMMetadataRef = &LLVMOpaqueMetadata
type LLVMNamedMDNodeRef = &LLVMOpaqueNamedMDNode
type LLVMValueMetadataEntry = LLVMOpaqueValueMetadataEntry
type LLVMBuilderRef = &LLVMOpaqueBuilder
type LLVMDIBuilderRef = &LLVMOpaqueDIBuilder
type LLVMModuleProviderRef = &LLVMOpaqueModuleProvider
type LLVMPassManagerRef = &LLVMOpaquePassManager
type LLVMPassRegistryRef = &LLVMOpaquePassRegistry
type LLVMUseRef = &LLVMOpaqueUse
type LLVMAttributeRef = &LLVMOpaqueAttributeRef
type LLVMDiagnosticInfoRef = &LLVMOpaqueDiagnosticInfo
type LLVMComdatRef = &LLVMComdat
type LLVMModuleFlagEntry = LLVMOpaqueModuleFlagEntry
type LLVMJITEventListenerRef = &LLVMOpaqueJITEventListener
type LLVMBinaryRef = &LLVMOpaqueBinary
