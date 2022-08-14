module core

import types

#flag -I/usr/include
#flag -D_GNU_SOURCE
#flag -D__STDC_CONSTANT_MACROS
#flag -D__STDC_FORMAT_MACROS
#flag -D__STDC_LIMIT_MACROS
#flag -I/usr/lib/
#flag -lLLVM
#include <llvm-c/Core.h>

pub enum LLVMOpcode {
	llvm_ret = 1
	llvm_br = 2
	llvm_switch = 3
	llvm_indirect_br = 4
	llvm_invoke = 5
	llvm_unreachable = 7
	llvm_call_br = 67
	llvm_f_neg = 66
	llvm_add = 8
	llvm_f_add = 9
	llvm_sub = 10
	llvm_f_sub = 11
	llvm_mul = 12
	llvm_f_mul = 13
	llvm_u_div = 14
	llvm_s_div = 15
	llvmf_div = 16
	llvmu_rem = 17
	llvms_rem = 18
	llvmf_rem = 19
	llvm_shl = 20
	llvml_shr = 21
	llvma_shr = 22
	llvm_and = 23
	llvm_or = 24
	llvm_xor = 25
	llvm_alloca = 26
	llvm_load = 27
	llvm_store = 28
	llvm_get_element_ptr = 29
	llvm_trunc = 30
	llvmz_ext = 31
	llvms_ext = 32
	llvmfp_toui = 33
	llvmfp_tosi = 34
	llvmui_tofp = 35
	llvmsi_tofp = 36
	llvmfp_trunc = 37
	llvmfp_ext = 38
	llvm_ptr_to_int = 39
	llvm_int_to_ptr = 40
	llvm_bit_cast = 41
	llvm_addr_space_cast = 60
	llvmi_cmp = 42
	llvmf_cmp = 43
	llvmphi = 44
	llvm_call = 45
	llvm_select = 46
	llvm_user_op1 = 47
	llvm_user_op2 = 48
	llvmva_arg = 49
	llvm_extract_element = 50
	llvm_insert_element = 51
	llvm_shuffle_vector = 52
	llvm_extract_value = 53
	llvm_insert_value = 54
	llvm_freeze = 68
	llvm_fence = 55
	llvm_atomic_cmp_xchg = 56
	llvm_atomicrmw = 57
	llvm_resume = 58
	llvm_landing_pad = 59
	llvm_cleanup_ret = 61
	llvm_catch_ret = 62
	llvm_catch_pad = 63
	llvm_cleanup_pad = 64
	llvm_catch_switch = 65
}

pub enum LLVMTypeKind {
	llvm_void_type_kind
	llvm_half_type_kind
	llvm_float_type_kind
	llvm_double_type_kind
	llvm_x86_f_p80_type_kind
	llvmf_p128_type_kind
	llvmpp_c_f_p128_type_kind
	llvm_label_type_kind
	llvm_integer_type_kind
	llvm_function_type_kind
	llvm_struct_type_kind
	llvm_array_type_kind
	llvm_pointer_type_kind
	llvm_vector_type_kind
	llvm_metadata_type_kind
	llvm_x86_mmx_type_kind
	llvm_token_type_kind
	llvm_scalable_vector_type_kind
	llvmb_float_type_kind
	llvm_x86_amx_type_kind
}

pub enum LLVMLinkage {
	llvm_external_linkage
	llvm_available_externally_linkage
	llvm_link_once_any_linkage
	llvm_link_onceodr_linkage
	llvm_link_onceodr_auto_hide_linkage
	llvm_weak_any_linkage
	llvm_weakodr_linkage
	llvm_appending_linkage
	llvm_internal_linkage
	llvm_private_linkage
	llvm_dll_import_linkage
	llvm_dll_export_linkage
	llvm_external_weak_linkage
	llvm_ghost_linkage
	llvm_common_linkage
	llvm_linker_private_linkage
	llvm_linker_private_weak_linkage
}

pub enum LLVMVisibility {
	llvm_default_visibility
	llvm_hidden_visibility
	llvm_protected_visibility
}

pub enum LLVMUnnamedAddr {
	llvm_no_unnamed_addr
	llvm_local_unnamed_addr
	llvm_global_unnamed_addr
}

pub enum LLVMDLLStorageClass {
	llvm_default_storage_class = 0
	llvm_dll_import_storage_class = 1
	llvm_dll_export_storage_class = 2
}

pub enum LLVMCallConv {
	llvm_c_call_conv = 0
	llvm_fast_call_conv = 8
	llvm_cold_call_conv = 9
	llvmghc_call_conv = 10
	llvm_hipe_call_conv = 11
	llvm_web_kitjs_call_conv = 12
	llvm_any_reg_call_conv = 13
	llvm_preserve_most_call_conv = 14
	llvm_preserve_all_call_conv = 15
	llvm_swift_call_conv = 16
	llvmcxxfasttls_call_conv = 17
	llvm_x86_stdcall_call_conv = 64
	llvm_x86_fastcall_call_conv = 65
	llvmarmapcs_call_conv = 66
	llvmarmaapcs_call_conv = 67
	llvmarmaapcsvfp_call_conv = 68
	llvmms_p430intr_call_conv = 69
	llvm_x86_this_call_call_conv = 70
	llvmptx_kernel_call_conv = 71
	llvmptx_device_call_conv = 72
	llvmspirfunc_call_conv = 75
	llvmspirkernel_call_conv = 76
	llvm_inteloclbi_call_conv = 77
	llvm_x8664_sysv_call_conv = 78
	llvm_win64_call_conv = 79
	llvm_x86_vector_call_call_conv = 80
	llvmhhvm_call_conv = 81
	llvmhhvmc_call_conv = 82
	llvm_x86intr_call_conv = 83
	llvmavrintr_call_conv = 84
	llvmavrsignal_call_conv = 85
	llvmavrbuiltin_call_conv = 86
	llvmamdgpuvs_call_conv = 87
	llvmamdgpugs_call_conv = 88
	llvmamdgpups_call_conv = 89
	llvmamdgpucs_call_conv = 90
	llvmamdgpukernel_call_conv = 91
	llvm_x86_reg_call_call_conv = 92
	llvmamdgpuhs_call_conv = 93
	llvmms_p430builtin_call_conv = 94
	llvmamdgpuls_call_conv = 95
	llvmamdgpues_call_conv = 96
}

pub enum LLVMValueKind {
	llvm_argument_value_kind
	llvm_basic_block_value_kind
	llvm_memory_use_value_kind
	llvm_memory_def_value_kind
	llvm_memory_phi_value_kind
	llvm_function_value_kind
	llvm_global_alias_value_kind
	llvm_globali_func_value_kind
	llvm_global_variable_value_kind
	llvm_block_address_value_kind
	llvm_constant_expr_value_kind
	llvm_constant_array_value_kind
	llvm_constant_struct_value_kind
	llvm_constant_vector_value_kind
	llvm_undef_value_value_kind
	llvm_constant_aggregate_zero_value_kind
	llvm_constant_data_array_value_kind
	llvm_constant_data_vector_value_kind
	llvm_constant_int_value_kind
	llvm_constantfp_value_kind
	llvm_constant_pointer_null_value_kind
	llvm_constant_token_none_value_kind
	llvm_metadata_as_value_value_kind
	llvm_inline_asm_value_kind
	llvm_instruction_value_kind
	llvm_poison_value_value_kind
}

pub enum LLVMIntPredicate {
	llvm_inteq = 32
	llvm_intne
	llvm_intugt
	llvm_intuge
	llvm_intult
	llvm_intule
	llvm_intsgt
	llvm_intsge
	llvm_intslt
	llvm_intsle
}

pub enum LLVMRealPredicate {
	llvm_real_predicate_false
	llvm_realoeq
	llvm_realogt
	llvm_realoge
	llvm_realolt
	llvm_realole
	llvm_realone
	llvm_realord
	llvm_realuno
	llvm_realueq
	llvm_realugt
	llvm_realuge
	llvm_realult
	llvm_realule
	llvm_realune
	llvm_real_predicate_true
}

pub enum LLVMLandingPadClauseTy {
	llvm_landing_pad_catch
	llvm_landing_pad_filter
}

pub enum LLVMThreadLocalMode {
	llvm_not_thread_local = 0
	llvm_general_dynamictls_model
	llvm_local_dynamictls_model
	llvm_initial_exectls_model
	llvm_local_exectls_model
}

pub enum LLVMAtomicOrdering {
	llvm_atomic_ordering_not_atomic = 0
	llvm_atomic_ordering_unordered = 1
	llvm_atomic_ordering_monotonic = 2
	llvm_atomic_ordering_acquire = 4
	llvm_atomic_ordering_release = 5
	llvm_atomic_ordering_acquire_release = 6
	llvm_atomic_ordering_sequentially_consistent = 7
}

pub enum LLVMAtomicRMWBinOp {
	llvm_atomicrmw_bin_op_xchg
	llvm_atomicrmw_bin_op_add
	llvm_atomicrmw_bin_op_sub
	llvm_atomicrmw_bin_op_and
	llvm_atomicrmw_bin_op_nand
	llvm_atomicrmw_bin_op_or
	llvm_atomicrmw_bin_op_xor
	llvm_atomicrmw_bin_op_max
	llvm_atomicrmw_bin_op_min
	llvm_atomicrmw_bin_opu_max
	llvm_atomicrmw_bin_opu_min
	llvm_atomicrmw_bin_opf_add
	llvm_atomicrmw_bin_opf_sub
}

pub enum LLVMDiagnosticSeverity {
	llvmds_error
	llvmds_warning
	llvmds_remark
	llvmds_note
}

pub enum LLVMInlineAsmDialect {
	llvm_inline_asm_dialectatt
	llvm_inline_asm_dialect_intel
}

pub enum LLVMModuleFlagBehavior {
	llvm_module_flag_behavior_error
	llvm_module_flag_behavior_warning
	llvm_module_flag_behavior_require
	llvm_module_flag_behavior_override
	llvm_module_flag_behavior_append
	llvm_module_flag_behavior_append_unique
}

pub enum LLVMAttributeIndex {
	llvm_attribute_return_index
	llvm_attribute_function_index = -1
}

fn C.LLVMInitializeCore(r types.LLVMPassRegistryRef)
pub fn llvm_initialize_core(r types.LLVMPassRegistryRef) {
	C.LLVMInitializeCore(r)
}

fn C.LLVMShutdown()
pub fn llvm_shutdown() {
	C.LLVMShutdown()
}

fn C.LLVMCreateMessage(message &i8) &i8
pub fn llvm_create_message(message &i8) string {
	return unsafe { (&u8(C.LLVMCreateMessage(message))).vstring() }
}

fn C.LLVMDisposeMessage(message &i8)
pub fn llvm_dispose_message(message &i8) {
	C.LLVMDisposeMessage(message)
}

type LLVMDiagnosticHandler = fn (types.LLVMDiagnosticInfoRef, voidptr)

type LLVMYieldCallback = fn (types.LLVMContextRef, voidptr)

fn C.LLVMContextCreate() types.LLVMContextRef
pub fn llvm_context_create() types.LLVMContextRef {
	return C.LLVMContextCreate()
}

fn C.LLVMGetGlobalContext() types.LLVMContextRef
pub fn llvm_get_global_context() types.LLVMContextRef {
	return C.LLVMGetGlobalContext()
}

fn C.LLVMContextSetDiagnosticHandler(c types.LLVMContextRef, handler LLVMDiagnosticHandler, diagnostic_context voidptr)
pub fn llvm_context_set_diagnostic_handler(c types.LLVMContextRef, handler LLVMDiagnosticHandler, diagnostic_context voidptr) {
	C.LLVMContextSetDiagnosticHandler(c, handler, diagnostic_context)
}

fn C.LLVMContextGetDiagnosticHandler(c types.LLVMContextRef) LLVMDiagnosticHandler
pub fn llvm_context_get_diagnostic_handler(c types.LLVMContextRef) LLVMDiagnosticHandler {
	return C.LLVMContextGetDiagnosticHandler(c)
}

fn C.LLVMContextGetDiagnosticContext(c types.LLVMContextRef) voidptr
pub fn llvm_context_get_diagnostic_context(c types.LLVMContextRef) voidptr {
	return C.LLVMContextGetDiagnosticContext(c)
}

fn C.LLVMContextSetYieldCallback(c types.LLVMContextRef, callback LLVMYieldCallback, opaque_handle voidptr)
pub fn llvm_context_set_yield_callback(c types.LLVMContextRef, callback LLVMYieldCallback, opaque_handle voidptr) {
	C.LLVMContextSetYieldCallback(c, callback, opaque_handle)
}

fn C.LLVMContextShouldDiscardValueNames(c types.LLVMContextRef) types.LLVMBool
pub fn llvm_context_should_discard_value_names(c types.LLVMContextRef) types.LLVMBool {
	return C.LLVMContextShouldDiscardValueNames(c)
}

fn C.LLVMContextSetDiscardValueNames(c types.LLVMContextRef, discard types.LLVMBool)
pub fn llvm_context_set_discard_value_names(c types.LLVMContextRef, discard types.LLVMBool) {
	C.LLVMContextSetDiscardValueNames(c, discard)
}

fn C.LLVMContextDispose(c types.LLVMContextRef)
pub fn llvm_context_dispose(c types.LLVMContextRef) {
	C.LLVMContextDispose(c)
}

fn C.LLVMGetDiagInfoDescription(di types.LLVMDiagnosticInfoRef) &i8
pub fn llvm_get_diag_info_description(di types.LLVMDiagnosticInfoRef) string {
	return unsafe { (&u8(C.LLVMGetDiagInfoDescription(di))).vstring() }
}

fn C.LLVMGetDiagInfoSeverity(di types.LLVMDiagnosticInfoRef) LLVMDiagnosticSeverity
pub fn llvm_get_diag_info_severity(di types.LLVMDiagnosticInfoRef) LLVMDiagnosticSeverity {
	return C.LLVMGetDiagInfoSeverity(di)
}

fn C.LLVMGetMDKindIDInContext(c types.LLVMContextRef, name &i8, s_len u32) u32
pub fn llvm_getmd_kindid_in_context(c types.LLVMContextRef, name &i8, s_len u32) u32 {
	return C.LLVMGetMDKindIDInContext(c, name, s_len)
}

fn C.LLVMGetMDKindID(name &i8, s_len u32) u32
pub fn llvm_getmd_kindid(name &i8, s_len u32) u32 {
	return C.LLVMGetMDKindID(name, s_len)
}

fn C.LLVMGetEnumAttributeKindForName(name &i8, s_len usize) u32
pub fn llvm_get_enum_attribute_kind_for_name(name &i8, s_len usize) u32 {
	return C.LLVMGetEnumAttributeKindForName(name, s_len)
}

fn C.LLVMGetLastEnumAttributeKind() u32
pub fn llvm_get_last_enum_attribute_kind() u32 {
	return C.LLVMGetLastEnumAttributeKind()
}

fn C.LLVMCreateEnumAttribute(c types.LLVMContextRef, kindid u32, val u64) types.LLVMAttributeRef
pub fn llvm_create_enum_attribute(c types.LLVMContextRef, kindid u32, val u64) types.LLVMAttributeRef {
	return C.LLVMCreateEnumAttribute(c, kindid, val)
}

fn C.LLVMGetEnumAttributeKind(a types.LLVMAttributeRef) u32
pub fn llvm_get_enum_attribute_kind(a types.LLVMAttributeRef) u32 {
	return C.LLVMGetEnumAttributeKind(a)
}

fn C.LLVMGetEnumAttributeValue(a types.LLVMAttributeRef) u64
pub fn llvm_get_enum_attribute_value(a types.LLVMAttributeRef) u64 {
	return C.LLVMGetEnumAttributeValue(a)
}

fn C.LLVMCreateTypeAttribute(c types.LLVMContextRef, kindid u32, type_ref types.LLVMTypeRef) types.LLVMAttributeRef
pub fn llvm_create_type_attribute(c types.LLVMContextRef, kindid u32, type_ref types.LLVMTypeRef) types.LLVMAttributeRef {
	return C.LLVMCreateTypeAttribute(c, kindid, type_ref)
}

fn C.LLVMGetTypeAttributeValue(a types.LLVMAttributeRef) types.LLVMTypeRef
pub fn llvm_get_type_attribute_value(a types.LLVMAttributeRef) types.LLVMTypeRef {
	return C.LLVMGetTypeAttributeValue(a)
}

fn C.LLVMCreateStringAttribute(c types.LLVMContextRef, k &i8, k_length u32, v &i8, v_length u32) types.LLVMAttributeRef
pub fn llvm_create_string_attribute(c types.LLVMContextRef, k &i8, k_length u32, v &i8, v_length u32) types.LLVMAttributeRef {
	return C.LLVMCreateStringAttribute(c, k, k_length, v, v_length)
}

fn C.LLVMGetStringAttributeKind(a types.LLVMAttributeRef, length &u32) &i8
pub fn llvm_get_string_attribute_kind(a types.LLVMAttributeRef, length &u32) string {
	return unsafe { (&u8(C.LLVMGetStringAttributeKind(a, length))).vstring() }
}

fn C.LLVMGetStringAttributeValue(a types.LLVMAttributeRef, length &u32) &i8
pub fn llvm_get_string_attribute_value(a types.LLVMAttributeRef, length &u32) string {
	return unsafe { (&u8(C.LLVMGetStringAttributeValue(a, length))).vstring() }
}

fn C.LLVMIsEnumAttribute(a types.LLVMAttributeRef) types.LLVMBool
pub fn llvm_is_enum_attribute(a types.LLVMAttributeRef) types.LLVMBool {
	return C.LLVMIsEnumAttribute(a)
}

fn C.LLVMIsStringAttribute(a types.LLVMAttributeRef) types.LLVMBool
pub fn llvm_is_string_attribute(a types.LLVMAttributeRef) types.LLVMBool {
	return C.LLVMIsStringAttribute(a)
}

fn C.LLVMIsTypeAttribute(a types.LLVMAttributeRef) types.LLVMBool
pub fn llvm_is_type_attribute(a types.LLVMAttributeRef) types.LLVMBool {
	return C.LLVMIsTypeAttribute(a)
}

fn C.LLVMGetTypeByName2(c types.LLVMContextRef, name &i8) types.LLVMTypeRef
pub fn llvm_get_type_by_name2(c types.LLVMContextRef, name &i8) types.LLVMTypeRef {
	return C.LLVMGetTypeByName2(c, name)
}

fn C.LLVMModuleCreateWithName(moduleid &i8) types.LLVMModuleRef
pub fn llvm_module_create_with_name(moduleid &i8) types.LLVMModuleRef {
	return C.LLVMModuleCreateWithName(moduleid)
}

fn C.LLVMModuleCreateWithNameInContext(moduleid &i8, c types.LLVMContextRef) types.LLVMModuleRef
pub fn llvm_module_create_with_name_in_context(moduleid string, c types.LLVMContextRef) types.LLVMModuleRef {
	return C.LLVMModuleCreateWithNameInContext(moduleid.str, c)
}

fn C.LLVMCloneModule(m types.LLVMModuleRef) types.LLVMModuleRef
pub fn llvm_clone_module(m types.LLVMModuleRef) types.LLVMModuleRef {
	return C.LLVMCloneModule(m)
}

fn C.LLVMDisposeModule(m types.LLVMModuleRef)
pub fn llvm_dispose_module(m types.LLVMModuleRef) {
	C.LLVMDisposeModule(m)
}

fn C.LLVMGetModuleIdentifier(m types.LLVMModuleRef, len &usize) &i8
pub fn llvm_get_module_identifier(m types.LLVMModuleRef, len &usize) string {
	return unsafe { (&u8(C.LLVMGetModuleIdentifier(m, len))).vstring() }
}

fn C.LLVMSetModuleIdentifier(m types.LLVMModuleRef, ident &i8, len usize)
pub fn llvm_set_module_identifier(m types.LLVMModuleRef, ident &i8, len usize) {
	C.LLVMSetModuleIdentifier(m, ident, len)
}

fn C.LLVMGetSourceFileName(m types.LLVMModuleRef, len &usize) &i8
pub fn llvm_get_source_file_name(m types.LLVMModuleRef, len &usize) string {
	return unsafe { (&u8(C.LLVMGetSourceFileName(m, len))).vstring() }
}

fn C.LLVMSetSourceFileName(m types.LLVMModuleRef, name &i8, len usize)
pub fn llvm_set_source_file_name(m types.LLVMModuleRef, name &i8, len usize) {
	C.LLVMSetSourceFileName(m, name, len)
}

fn C.LLVMGetDataLayoutStr(m types.LLVMModuleRef) &i8
pub fn llvm_get_data_layout_str(m types.LLVMModuleRef) string {
	return unsafe { (&u8(C.LLVMGetDataLayoutStr(m))).vstring() }
}

fn C.LLVMGetDataLayout(m types.LLVMModuleRef) &i8
pub fn llvm_get_data_layout(m types.LLVMModuleRef) string {
	return unsafe { (&u8(C.LLVMGetDataLayout(m))).vstring() }
}

fn C.LLVMSetDataLayout(m types.LLVMModuleRef, data_layout_str &i8)
pub fn llvm_set_data_layout(m types.LLVMModuleRef, data_layout_str &i8) {
	C.LLVMSetDataLayout(m, data_layout_str)
}

fn C.LLVMGetTarget(m types.LLVMModuleRef) &i8
pub fn llvm_get_target(m types.LLVMModuleRef) string {
	return unsafe { (&u8(C.LLVMGetTarget(m))).vstring() }
}

fn C.LLVMSetTarget(m types.LLVMModuleRef, triple &i8)
pub fn llvm_set_target(m types.LLVMModuleRef, triple &i8) {
	C.LLVMSetTarget(m, triple)
}

fn C.LLVMCopyModuleFlagsMetadata(m types.LLVMModuleRef, len &usize) &types.LLVMModuleFlagEntry
pub fn llvm_copy_module_flags_metadata(m types.LLVMModuleRef, len &usize) &types.LLVMModuleFlagEntry {
	return C.LLVMCopyModuleFlagsMetadata(m, len)
}

fn C.LLVMDisposeModuleFlagsMetadata(entries &types.LLVMModuleFlagEntry)
pub fn llvm_dispose_module_flags_metadata(entries &types.LLVMModuleFlagEntry) {
	C.LLVMDisposeModuleFlagsMetadata(entries)
}

fn C.LLVMModuleFlagEntriesGetFlagBehavior(entries &types.LLVMModuleFlagEntry, index u32) LLVMModuleFlagBehavior
pub fn llvm_module_flag_entries_get_flag_behavior(entries &types.LLVMModuleFlagEntry, index u32) LLVMModuleFlagBehavior {
	return C.LLVMModuleFlagEntriesGetFlagBehavior(entries, index)
}

fn C.LLVMModuleFlagEntriesGetKey(entries &types.LLVMModuleFlagEntry, index u32, len &usize) &i8
pub fn llvm_module_flag_entries_get_key(entries &types.LLVMModuleFlagEntry, index u32, len &usize) string {
	return unsafe { (&u8(C.LLVMModuleFlagEntriesGetKey(entries, index, len))).vstring() }
}

fn C.LLVMModuleFlagEntriesGetMetadata(entries &types.LLVMModuleFlagEntry, index u32) types.LLVMMetadataRef
pub fn llvm_module_flag_entries_get_metadata(entries &types.LLVMModuleFlagEntry, index u32) types.LLVMMetadataRef {
	return C.LLVMModuleFlagEntriesGetMetadata(entries, index)
}

fn C.LLVMGetModuleFlag(m types.LLVMModuleRef, key &i8, key_len usize) types.LLVMMetadataRef
pub fn llvm_get_module_flag(m types.LLVMModuleRef, key &i8, key_len usize) types.LLVMMetadataRef {
	return C.LLVMGetModuleFlag(m, key, key_len)
}

fn C.LLVMAddModuleFlag(m types.LLVMModuleRef, behavior LLVMModuleFlagBehavior, key &i8, key_len usize, val types.LLVMMetadataRef)
pub fn llvm_add_module_flag(m types.LLVMModuleRef, behavior LLVMModuleFlagBehavior, key &i8, key_len usize, val types.LLVMMetadataRef) {
	C.LLVMAddModuleFlag(m, behavior, key, key_len, val)
}

fn C.LLVMDumpModule(m types.LLVMModuleRef)
pub fn llvm_dump_module(m types.LLVMModuleRef) {
	C.LLVMDumpModule(m)
}

fn C.LLVMPrintModuleToFile(m types.LLVMModuleRef, filename &i8, error_message &&u8) types.LLVMBool
pub fn llvm_print_module_to_file(m types.LLVMModuleRef, filename &i8, error_message &&u8) types.LLVMBool {
	return C.LLVMPrintModuleToFile(m, filename, error_message)
}

fn C.LLVMPrintModuleToString(m types.LLVMModuleRef) &i8
pub fn llvm_print_module_to_string(m types.LLVMModuleRef) string {
	return unsafe { (&u8(C.LLVMPrintModuleToString(m))).vstring() }
}

fn C.LLVMGetModuleInlineAsm(m types.LLVMModuleRef, len &usize) &i8
pub fn llvm_get_module_inline_asm(m types.LLVMModuleRef, len &usize) string {
	return unsafe { (&u8(C.LLVMGetModuleInlineAsm(m, len))).vstring() }
}

fn C.LLVMSetModuleInlineAsm2(m types.LLVMModuleRef, asm_ &i8, len usize)
pub fn llvm_set_module_inline_asm2(m types.LLVMModuleRef, asm_ &i8, len usize) {
	C.LLVMSetModuleInlineAsm2(m, asm_, len)
}

fn C.LLVMAppendModuleInlineAsm(m types.LLVMModuleRef, asm_ &i8, len usize)
pub fn llvm_append_module_inline_asm(m types.LLVMModuleRef, asm_ &i8, len usize) {
	C.LLVMAppendModuleInlineAsm(m, asm_, len)
}

fn C.LLVMGetInlineAsm(ty types.LLVMTypeRef, asm_string &i8, asm_string_size usize, constraints &i8, constraints_size usize, has_side_effects types.LLVMBool, is_align_stack types.LLVMBool, dialect LLVMInlineAsmDialect, can_throw types.LLVMBool) types.LLVMValueRef
pub fn llvm_get_inline_asm(ty types.LLVMTypeRef, asm_string &i8, asm_string_size usize, constraints &i8, constraints_size usize, has_side_effects types.LLVMBool, is_align_stack types.LLVMBool, dialect LLVMInlineAsmDialect, can_throw types.LLVMBool) types.LLVMValueRef {
	return C.LLVMGetInlineAsm(ty, asm_string, asm_string_size, constraints, constraints_size,
		has_side_effects, is_align_stack, dialect, can_throw)
}

fn C.LLVMGetModuleContext(m types.LLVMModuleRef) types.LLVMContextRef
pub fn llvm_get_module_context(m types.LLVMModuleRef) types.LLVMContextRef {
	return C.LLVMGetModuleContext(m)
}

fn C.LLVMGetTypeByName(m types.LLVMModuleRef, name &i8) types.LLVMTypeRef
pub fn llvm_get_type_by_name(m types.LLVMModuleRef, name &i8) types.LLVMTypeRef {
	return C.LLVMGetTypeByName(m, name)
}

fn C.LLVMGetFirstNamedMetadata(m types.LLVMModuleRef) types.LLVMNamedMDNodeRef
pub fn llvm_get_first_named_metadata(m types.LLVMModuleRef) types.LLVMNamedMDNodeRef {
	return C.LLVMGetFirstNamedMetadata(m)
}

fn C.LLVMGetLastNamedMetadata(m types.LLVMModuleRef) types.LLVMNamedMDNodeRef
pub fn llvm_get_last_named_metadata(m types.LLVMModuleRef) types.LLVMNamedMDNodeRef {
	return C.LLVMGetLastNamedMetadata(m)
}

fn C.LLVMGetNextNamedMetadata(namedmd_node types.LLVMNamedMDNodeRef) types.LLVMNamedMDNodeRef
pub fn llvm_get_next_named_metadata(namedmd_node types.LLVMNamedMDNodeRef) types.LLVMNamedMDNodeRef {
	return C.LLVMGetNextNamedMetadata(namedmd_node)
}

fn C.LLVMGetPreviousNamedMetadata(namedmd_node types.LLVMNamedMDNodeRef) types.LLVMNamedMDNodeRef
pub fn llvm_get_previous_named_metadata(namedmd_node types.LLVMNamedMDNodeRef) types.LLVMNamedMDNodeRef {
	return C.LLVMGetPreviousNamedMetadata(namedmd_node)
}

fn C.LLVMGetNamedMetadata(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMNamedMDNodeRef
pub fn llvm_get_named_metadata(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMNamedMDNodeRef {
	return C.LLVMGetNamedMetadata(m, name, name_len)
}

fn C.LLVMGetOrInsertNamedMetadata(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMNamedMDNodeRef
pub fn llvm_get_or_insert_named_metadata(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMNamedMDNodeRef {
	return C.LLVMGetOrInsertNamedMetadata(m, name, name_len)
}

fn C.LLVMGetNamedMetadataName(namedmd types.LLVMNamedMDNodeRef, name_len &usize) &i8
pub fn llvm_get_named_metadata_name(namedmd types.LLVMNamedMDNodeRef, name_len &usize) string {
	return unsafe { (&u8(C.LLVMGetNamedMetadataName(namedmd, name_len))).vstring() }
}

fn C.LLVMGetNamedMetadataNumOperands(m types.LLVMModuleRef, name &i8) u32
pub fn llvm_get_named_metadata_num_operands(m types.LLVMModuleRef, name &i8) u32 {
	return C.LLVMGetNamedMetadataNumOperands(m, name)
}

fn C.LLVMGetNamedMetadataOperands(m types.LLVMModuleRef, name &i8, dest &types.LLVMValueRef)
pub fn llvm_get_named_metadata_operands(m types.LLVMModuleRef, name &i8, dest &types.LLVMValueRef) {
	C.LLVMGetNamedMetadataOperands(m, name, dest)
}

fn C.LLVMAddNamedMetadataOperand(m types.LLVMModuleRef, name &i8, val types.LLVMValueRef)
pub fn llvm_add_named_metadata_operand(m types.LLVMModuleRef, name &i8, val types.LLVMValueRef) {
	C.LLVMAddNamedMetadataOperand(m, name, val)
}

fn C.LLVMGetDebugLocDirectory(val types.LLVMValueRef, length &u32) &i8
pub fn llvm_get_debug_loc_directory(val types.LLVMValueRef, length &u32) string {
	return unsafe { (&u8(C.LLVMGetDebugLocDirectory(val, length))).vstring() }
}

fn C.LLVMGetDebugLocFilename(val types.LLVMValueRef, length &u32) &i8
pub fn llvm_get_debug_loc_filename(val types.LLVMValueRef, length &u32) string {
	return unsafe { (&u8(C.LLVMGetDebugLocFilename(val, length))).vstring() }
}

fn C.LLVMGetDebugLocLine(val types.LLVMValueRef) u32
pub fn llvm_get_debug_loc_line(val types.LLVMValueRef) u32 {
	return C.LLVMGetDebugLocLine(val)
}

fn C.LLVMGetDebugLocColumn(val types.LLVMValueRef) u32
pub fn llvm_get_debug_loc_column(val types.LLVMValueRef) u32 {
	return C.LLVMGetDebugLocColumn(val)
}

fn C.LLVMAddFunction(m types.LLVMModuleRef, name &i8, function_ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_add_function(m types.LLVMModuleRef, name string, function_ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMAddFunction(m, name.str, function_ty)
}

fn C.LLVMGetNamedFunction(m types.LLVMModuleRef, name &i8) types.LLVMValueRef
pub fn llvm_get_named_function(m types.LLVMModuleRef, name string) types.LLVMValueRef {
	return C.LLVMGetNamedFunction(m, name.str)
}

fn C.LLVMGetFirstFunction(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_first_function(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetFirstFunction(m)
}

fn C.LLVMGetLastFunction(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_last_function(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetLastFunction(m)
}

fn C.LLVMGetNextFunction(fn_ types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_next_function(fn_ types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetNextFunction(fn_)
}

fn C.LLVMGetPreviousFunction(fn_ types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_previous_function(fn_ types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPreviousFunction(fn_)
}

fn C.LLVMSetModuleInlineAsm(m types.LLVMModuleRef, asm_ &i8)
pub fn llvm_set_module_inline_asm(m types.LLVMModuleRef, asm_ &i8) {
	C.LLVMSetModuleInlineAsm(m, asm_)
}

fn C.LLVMGetTypeKind(ty types.LLVMTypeRef) LLVMTypeKind
pub fn llvm_get_type_kind(ty types.LLVMTypeRef) LLVMTypeKind {
	return C.LLVMGetTypeKind(ty)
}

fn C.LLVMTypeIsSized(ty types.LLVMTypeRef) types.LLVMBool
pub fn llvm_type_is_sized(ty types.LLVMTypeRef) types.LLVMBool {
	return C.LLVMTypeIsSized(ty)
}

fn C.LLVMGetTypeContext(ty types.LLVMTypeRef) types.LLVMContextRef
pub fn llvm_get_type_context(ty types.LLVMTypeRef) types.LLVMContextRef {
	return C.LLVMGetTypeContext(ty)
}

fn C.LLVMDumpType(val types.LLVMTypeRef)
pub fn llvm_dump_type(val types.LLVMTypeRef) {
	C.LLVMDumpType(val)
}

fn C.LLVMPrintTypeToString(val types.LLVMTypeRef) &i8
pub fn llvm_print_type_to_string(val types.LLVMTypeRef) string {
	return unsafe { (&u8(C.LLVMPrintTypeToString(val))).vstring() }
}

fn C.LLVMInt1TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_int1_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMInt1TypeInContext(c)
}

fn C.LLVMInt8TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_int8_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMInt8TypeInContext(c)
}

fn C.LLVMInt16TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_int16_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMInt16TypeInContext(c)
}

fn C.LLVMInt32TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_int32_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMInt32TypeInContext(c)
}

fn C.LLVMInt64TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_int64_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMInt64TypeInContext(c)
}

fn C.LLVMInt128TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_int128_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMInt128TypeInContext(c)
}

fn C.LLVMIntTypeInContext(c types.LLVMContextRef, num_bits u32) types.LLVMTypeRef
pub fn llvm_int_type_in_context(c types.LLVMContextRef, num_bits u32) types.LLVMTypeRef {
	return C.LLVMIntTypeInContext(c, num_bits)
}

fn C.LLVMInt1Type() types.LLVMTypeRef
pub fn llvm_int1_type() types.LLVMTypeRef {
	return C.LLVMInt1Type()
}

fn C.LLVMInt8Type() types.LLVMTypeRef
pub fn llvm_int8_type() types.LLVMTypeRef {
	return C.LLVMInt8Type()
}

fn C.LLVMInt16Type() types.LLVMTypeRef
pub fn llvm_int16_type() types.LLVMTypeRef {
	return C.LLVMInt16Type()
}

fn C.LLVMInt32Type() types.LLVMTypeRef
pub fn llvm_int32_type() types.LLVMTypeRef {
	return C.LLVMInt32Type()
}

fn C.LLVMInt64Type() types.LLVMTypeRef
pub fn llvm_int64_type() types.LLVMTypeRef {
	return C.LLVMInt64Type()
}

fn C.LLVMInt128Type() types.LLVMTypeRef
pub fn llvm_int128_type() types.LLVMTypeRef {
	return C.LLVMInt128Type()
}

fn C.LLVMIntType(num_bits u32) types.LLVMTypeRef
pub fn llvm_int_type(num_bits u32) types.LLVMTypeRef {
	return C.LLVMIntType(num_bits)
}

fn C.LLVMGetIntTypeWidth(integer_ty types.LLVMTypeRef) u32
pub fn llvm_get_int_type_width(integer_ty types.LLVMTypeRef) u32 {
	return C.LLVMGetIntTypeWidth(integer_ty)
}

fn C.LLVMHalfTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_half_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMHalfTypeInContext(c)
}

fn C.LLVMBFloatTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvmb_float_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMBFloatTypeInContext(c)
}

fn C.LLVMFloatTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_float_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMFloatTypeInContext(c)
}

fn C.LLVMDoubleTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_double_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMDoubleTypeInContext(c)
}

fn C.LLVMX86FP80TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_x86f_p80_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMX86FP80TypeInContext(c)
}

fn C.LLVMFP128TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvmf_p128_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMFP128TypeInContext(c)
}

fn C.LLVMPPCFP128TypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvmppcf_p128_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMPPCFP128TypeInContext(c)
}

fn C.LLVMHalfType() types.LLVMTypeRef
pub fn llvm_half_type() types.LLVMTypeRef {
	return C.LLVMHalfType()
}

fn C.LLVMBFloatType() types.LLVMTypeRef
pub fn llvmb_float_type() types.LLVMTypeRef {
	return C.LLVMBFloatType()
}

fn C.LLVMFloatType() types.LLVMTypeRef
pub fn llvm_float_type() types.LLVMTypeRef {
	return C.LLVMFloatType()
}

fn C.LLVMDoubleType() types.LLVMTypeRef
pub fn llvm_double_type() types.LLVMTypeRef {
	return C.LLVMDoubleType()
}

fn C.LLVMX86FP80Type() types.LLVMTypeRef
pub fn llvm_x86f_p80_type() types.LLVMTypeRef {
	return C.LLVMX86FP80Type()
}

fn C.LLVMFP128Type() types.LLVMTypeRef
pub fn llvmf_p128_type() types.LLVMTypeRef {
	return C.LLVMFP128Type()
}

fn C.LLVMPPCFP128Type() types.LLVMTypeRef
pub fn llvmppcf_p128_type() types.LLVMTypeRef {
	return C.LLVMPPCFP128Type()
}

fn C.LLVMFunctionType(return_type types.LLVMTypeRef, param_types &types.LLVMTypeRef, param_count u32, is_var_arg types.LLVMBool) types.LLVMTypeRef
pub fn llvm_function_type(return_type types.LLVMTypeRef, param_types []types.LLVMTypeRef, is_var_arg bool) types.LLVMTypeRef {
	return C.LLVMFunctionType(return_type, param_types.data, param_types.len, types.LLVMBool(is_var_arg))
}

fn C.LLVMIsFunctionVarArg(function_ty types.LLVMTypeRef) types.LLVMBool
pub fn llvm_is_function_var_arg(function_ty types.LLVMTypeRef) types.LLVMBool {
	return C.LLVMIsFunctionVarArg(function_ty)
}

fn C.LLVMGetReturnType(function_ty types.LLVMTypeRef) types.LLVMTypeRef
pub fn llvm_get_return_type(function_ty types.LLVMTypeRef) types.LLVMTypeRef {
	return C.LLVMGetReturnType(function_ty)
}

fn C.LLVMCountParamTypes(function_ty types.LLVMTypeRef) u32
pub fn llvm_count_param_types(function_ty types.LLVMTypeRef) u32 {
	return C.LLVMCountParamTypes(function_ty)
}

fn C.LLVMGetParamTypes(function_ty types.LLVMTypeRef, dest &types.LLVMTypeRef)
pub fn llvm_get_param_types(function_ty types.LLVMTypeRef, dest &types.LLVMTypeRef) {
	C.LLVMGetParamTypes(function_ty, dest)
}

fn C.LLVMStructTypeInContext(c types.LLVMContextRef, element_types &types.LLVMTypeRef, element_count u32, packed types.LLVMBool) types.LLVMTypeRef
pub fn llvm_struct_type_in_context(c types.LLVMContextRef, element_types &types.LLVMTypeRef, element_count u32, packed types.LLVMBool) types.LLVMTypeRef {
	return C.LLVMStructTypeInContext(c, element_types, element_count, packed)
}

fn C.LLVMStructType(element_types &types.LLVMTypeRef, element_count u32, packed types.LLVMBool) types.LLVMTypeRef
pub fn llvm_struct_type(element_types &types.LLVMTypeRef, element_count u32, packed types.LLVMBool) types.LLVMTypeRef {
	return C.LLVMStructType(element_types, element_count, packed)
}

fn C.LLVMStructCreateNamed(c types.LLVMContextRef, name &i8) types.LLVMTypeRef
pub fn llvm_struct_create_named(c types.LLVMContextRef, name &i8) types.LLVMTypeRef {
	return C.LLVMStructCreateNamed(c, name)
}

fn C.LLVMGetStructName(ty types.LLVMTypeRef) &i8
pub fn llvm_get_struct_name(ty types.LLVMTypeRef) string {
	return unsafe { (&u8(C.LLVMGetStructName(ty))).vstring() }
}

fn C.LLVMStructSetBody(struct_ty types.LLVMTypeRef, element_types &types.LLVMTypeRef, element_count u32, packed types.LLVMBool)
pub fn llvm_struct_set_body(struct_ty types.LLVMTypeRef, element_types &types.LLVMTypeRef, element_count u32, packed types.LLVMBool) {
	C.LLVMStructSetBody(struct_ty, element_types, element_count, packed)
}

fn C.LLVMCountStructElementTypes(struct_ty types.LLVMTypeRef) u32
pub fn llvm_count_struct_element_types(struct_ty types.LLVMTypeRef) u32 {
	return C.LLVMCountStructElementTypes(struct_ty)
}

fn C.LLVMGetStructElementTypes(struct_ty types.LLVMTypeRef, dest &types.LLVMTypeRef)
pub fn llvm_get_struct_element_types(struct_ty types.LLVMTypeRef, dest &types.LLVMTypeRef) {
	C.LLVMGetStructElementTypes(struct_ty, dest)
}

fn C.LLVMStructGetTypeAtIndex(struct_ty types.LLVMTypeRef, i u32) types.LLVMTypeRef
pub fn llvm_struct_get_type_at_index(struct_ty types.LLVMTypeRef, i u32) types.LLVMTypeRef {
	return C.LLVMStructGetTypeAtIndex(struct_ty, i)
}

fn C.LLVMIsPackedStruct(struct_ty types.LLVMTypeRef) types.LLVMBool
pub fn llvm_is_packed_struct(struct_ty types.LLVMTypeRef) types.LLVMBool {
	return C.LLVMIsPackedStruct(struct_ty)
}

fn C.LLVMIsOpaqueStruct(struct_ty types.LLVMTypeRef) types.LLVMBool
pub fn llvm_is_opaque_struct(struct_ty types.LLVMTypeRef) types.LLVMBool {
	return C.LLVMIsOpaqueStruct(struct_ty)
}

fn C.LLVMIsLiteralStruct(struct_ty types.LLVMTypeRef) types.LLVMBool
pub fn llvm_is_literal_struct(struct_ty types.LLVMTypeRef) types.LLVMBool {
	return C.LLVMIsLiteralStruct(struct_ty)
}

fn C.LLVMGetElementType(ty types.LLVMTypeRef) types.LLVMTypeRef
pub fn llvm_get_element_type(ty types.LLVMTypeRef) types.LLVMTypeRef {
	return C.LLVMGetElementType(ty)
}

fn C.LLVMGetSubtypes(tp types.LLVMTypeRef, arr &types.LLVMTypeRef)
pub fn llvm_get_subtypes(tp types.LLVMTypeRef, arr &types.LLVMTypeRef) {
	C.LLVMGetSubtypes(tp, arr)
}

fn C.LLVMGetNumContainedTypes(tp types.LLVMTypeRef) u32
pub fn llvm_get_num_contained_types(tp types.LLVMTypeRef) u32 {
	return C.LLVMGetNumContainedTypes(tp)
}

fn C.LLVMArrayType(element_type types.LLVMTypeRef, element_count u32) types.LLVMTypeRef
pub fn llvm_array_type(element_type types.LLVMTypeRef, element_count u32) types.LLVMTypeRef {
	return C.LLVMArrayType(element_type, element_count)
}

fn C.LLVMGetArrayLength(array_ty types.LLVMTypeRef) u32
pub fn llvm_get_array_length(array_ty types.LLVMTypeRef) u32 {
	return C.LLVMGetArrayLength(array_ty)
}

fn C.LLVMPointerType(element_type types.LLVMTypeRef, address_space u32) types.LLVMTypeRef
pub fn llvm_pointer_type(element_type types.LLVMTypeRef, address_space u32) types.LLVMTypeRef {
	return C.LLVMPointerType(element_type, address_space)
}

fn C.LLVMGetPointerAddressSpace(pointer_ty types.LLVMTypeRef) u32
pub fn llvm_get_pointer_address_space(pointer_ty types.LLVMTypeRef) u32 {
	return C.LLVMGetPointerAddressSpace(pointer_ty)
}

fn C.LLVMVectorType(element_type types.LLVMTypeRef, element_count u32) types.LLVMTypeRef
pub fn llvm_vector_type(element_type types.LLVMTypeRef, element_count u32) types.LLVMTypeRef {
	return C.LLVMVectorType(element_type, element_count)
}

fn C.LLVMScalableVectorType(element_type types.LLVMTypeRef, element_count u32) types.LLVMTypeRef
pub fn llvm_scalable_vector_type(element_type types.LLVMTypeRef, element_count u32) types.LLVMTypeRef {
	return C.LLVMScalableVectorType(element_type, element_count)
}

fn C.LLVMGetVectorSize(vector_ty types.LLVMTypeRef) u32
pub fn llvm_get_vector_size(vector_ty types.LLVMTypeRef) u32 {
	return C.LLVMGetVectorSize(vector_ty)
}

fn C.LLVMVoidTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_void_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMVoidTypeInContext(c)
}

fn C.LLVMLabelTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_label_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMLabelTypeInContext(c)
}

fn C.LLVMX86MMXTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_x86mmx_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMX86MMXTypeInContext(c)
}

fn C.LLVMX86AMXTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_x86amx_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMX86AMXTypeInContext(c)
}

fn C.LLVMTokenTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_token_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMTokenTypeInContext(c)
}

fn C.LLVMMetadataTypeInContext(c types.LLVMContextRef) types.LLVMTypeRef
pub fn llvm_metadata_type_in_context(c types.LLVMContextRef) types.LLVMTypeRef {
	return C.LLVMMetadataTypeInContext(c)
}

fn C.LLVMVoidType() types.LLVMTypeRef
pub fn llvm_void_type() types.LLVMTypeRef {
	return C.LLVMVoidType()
}

fn C.LLVMLabelType() types.LLVMTypeRef
pub fn llvm_label_type() types.LLVMTypeRef {
	return C.LLVMLabelType()
}

fn C.LLVMX86MMXType() types.LLVMTypeRef
pub fn llvm_x86mmx_type() types.LLVMTypeRef {
	return C.LLVMX86MMXType()
}

fn C.LLVMX86AMXType() types.LLVMTypeRef
pub fn llvm_x86amx_type() types.LLVMTypeRef {
	return C.LLVMX86AMXType()
}

fn C.LLVMTypeOf(val types.LLVMValueRef) types.LLVMTypeRef
pub fn llvm_type_of(val types.LLVMValueRef) types.LLVMTypeRef {
	return C.LLVMTypeOf(val)
}

fn C.LLVMGetValueKind(val types.LLVMValueRef) LLVMValueKind
pub fn llvm_get_value_kind(val types.LLVMValueRef) LLVMValueKind {
	return C.LLVMGetValueKind(val)
}

fn C.LLVMGetValueName2(val types.LLVMValueRef, length &usize) &i8
pub fn llvm_get_value_name2(val types.LLVMValueRef, length &usize) string {
	return unsafe { (&u8(C.LLVMGetValueName2(val, length))).vstring() }
}

fn C.LLVMSetValueName2(val types.LLVMValueRef, name &i8, name_len usize)
pub fn llvm_set_value_name2(val types.LLVMValueRef, name &i8, name_len usize) {
	C.LLVMSetValueName2(val, name, name_len)
}

fn C.LLVMDumpValue(val types.LLVMValueRef)
pub fn llvm_dump_value(val types.LLVMValueRef) {
	C.LLVMDumpValue(val)
}

fn C.LLVMPrintValueToString(val types.LLVMValueRef) &i8
pub fn llvm_print_value_to_string(val types.LLVMValueRef) string {
	return unsafe { (&u8(C.LLVMPrintValueToString(val))).vstring() }
}

fn C.LLVMReplaceAllUsesWith(old_val types.LLVMValueRef, new_val types.LLVMValueRef)
pub fn llvm_replace_all_uses_with(old_val types.LLVMValueRef, new_val types.LLVMValueRef) {
	C.LLVMReplaceAllUsesWith(old_val, new_val)
}

fn C.LLVMIsConstant(val types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_constant(val types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsConstant(val)
}

fn C.LLVMIsUndef(val types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_undef(val types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsUndef(val)
}

fn C.LLVMIsPoison(val types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_poison(val types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsPoison(val)
}

fn C.LLVMIsAArgument(val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_isa_argument(val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMIsAArgument(val)
}

fn C.LLVMIsAMDNode(val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_isamd_node(val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMIsAMDNode(val)
}

fn C.LLVMIsAMDString(val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_isamd_string(val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMIsAMDString(val)
}

fn C.LLVMGetValueName(val types.LLVMValueRef) &i8
pub fn llvm_get_value_name(val types.LLVMValueRef) string {
	return unsafe { (&u8(C.LLVMGetValueName(val))).vstring() }
}

fn C.LLVMSetValueName(val types.LLVMValueRef, name &i8)
pub fn llvm_set_value_name(val types.LLVMValueRef, name &i8) {
	C.LLVMSetValueName(val, name)
}

fn C.LLVMGetFirstUse(val types.LLVMValueRef) types.LLVMUseRef
pub fn llvm_get_first_use(val types.LLVMValueRef) types.LLVMUseRef {
	return C.LLVMGetFirstUse(val)
}

fn C.LLVMGetNextUse(u types.LLVMUseRef) types.LLVMUseRef
pub fn llvm_get_next_use(u types.LLVMUseRef) types.LLVMUseRef {
	return C.LLVMGetNextUse(u)
}

fn C.LLVMGetUser(u types.LLVMUseRef) types.LLVMValueRef
pub fn llvm_get_user(u types.LLVMUseRef) types.LLVMValueRef {
	return C.LLVMGetUser(u)
}

fn C.LLVMGetUsedValue(u types.LLVMUseRef) types.LLVMValueRef
pub fn llvm_get_used_value(u types.LLVMUseRef) types.LLVMValueRef {
	return C.LLVMGetUsedValue(u)
}

fn C.LLVMGetOperand(val types.LLVMValueRef, index u32) types.LLVMValueRef
pub fn llvm_get_operand(val types.LLVMValueRef, index u32) types.LLVMValueRef {
	return C.LLVMGetOperand(val, index)
}

fn C.LLVMGetOperandUse(val types.LLVMValueRef, index u32) types.LLVMUseRef
pub fn llvm_get_operand_use(val types.LLVMValueRef, index u32) types.LLVMUseRef {
	return C.LLVMGetOperandUse(val, index)
}

fn C.LLVMSetOperand(user types.LLVMValueRef, index u32, val types.LLVMValueRef)
pub fn llvm_set_operand(user types.LLVMValueRef, index u32, val types.LLVMValueRef) {
	C.LLVMSetOperand(user, index, val)
}

fn C.LLVMGetNumOperands(val types.LLVMValueRef) int
pub fn llvm_get_num_operands(val types.LLVMValueRef) int {
	return C.LLVMGetNumOperands(val)
}

fn C.LLVMConstNull(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_null(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstNull(ty)
}

fn C.LLVMConstAllOnes(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_all_ones(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstAllOnes(ty)
}

fn C.LLVMGetUndef(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_get_undef(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMGetUndef(ty)
}

fn C.LLVMGetPoison(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_get_poison(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMGetPoison(ty)
}

fn C.LLVMIsNull(val types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_null(val types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsNull(val)
}

fn C.LLVMConstPointerNull(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_pointer_null(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstPointerNull(ty)
}

fn C.LLVMConstInt(int_ty types.LLVMTypeRef, n i64, sign_extend types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_int(int_ty types.LLVMTypeRef, n i64, sign_extend types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstInt(int_ty, n, sign_extend)
}

fn C.LLVMConstIntOfArbitraryPrecision(int_ty types.LLVMTypeRef, num_words u32, words &u64) types.LLVMValueRef
pub fn llvm_const_int_of_arbitrary_precision(int_ty types.LLVMTypeRef, num_words u32, words &u64) types.LLVMValueRef {
	return C.LLVMConstIntOfArbitraryPrecision(int_ty, num_words, words)
}

fn C.LLVMConstIntOfString(int_ty types.LLVMTypeRef, text &i8, radix u8) types.LLVMValueRef
pub fn llvm_const_int_of_string(int_ty types.LLVMTypeRef, text &i8, radix u8) types.LLVMValueRef {
	return C.LLVMConstIntOfString(int_ty, text, radix)
}

fn C.LLVMConstIntOfStringAndSize(int_ty types.LLVMTypeRef, text &i8, s_len u32, radix u8) types.LLVMValueRef
pub fn llvm_const_int_of_string_and_size(int_ty types.LLVMTypeRef, text &i8, s_len u32, radix u8) types.LLVMValueRef {
	return C.LLVMConstIntOfStringAndSize(int_ty, text, s_len, radix)
}

fn C.LLVMConstReal(real_ty types.LLVMTypeRef, n f64) types.LLVMValueRef
pub fn llvm_const_real(real_ty types.LLVMTypeRef, n f64) types.LLVMValueRef {
	return C.LLVMConstReal(real_ty, n)
}

fn C.LLVMConstRealOfString(real_ty types.LLVMTypeRef, text &i8) types.LLVMValueRef
pub fn llvm_const_real_of_string(real_ty types.LLVMTypeRef, text &i8) types.LLVMValueRef {
	return C.LLVMConstRealOfString(real_ty, text)
}

fn C.LLVMConstRealOfStringAndSize(real_ty types.LLVMTypeRef, text &i8, s_len u32) types.LLVMValueRef
pub fn llvm_const_real_of_string_and_size(real_ty types.LLVMTypeRef, text &i8, s_len u32) types.LLVMValueRef {
	return C.LLVMConstRealOfStringAndSize(real_ty, text, s_len)
}

fn C.LLVMConstIntGetZExtValue(constant_val types.LLVMValueRef) i64
pub fn llvm_const_int_getz_ext_value(constant_val types.LLVMValueRef) i64 {
	return C.LLVMConstIntGetZExtValue(constant_val)
}

fn C.LLVMConstIntGetSExtValue(constant_val types.LLVMValueRef) i64
pub fn llvm_const_int_gets_ext_value(constant_val types.LLVMValueRef) i64 {
	return C.LLVMConstIntGetSExtValue(constant_val)
}

fn C.LLVMConstRealGetDouble(constant_val types.LLVMValueRef, loses_info &types.LLVMBool) f64
pub fn llvm_const_real_get_double(constant_val types.LLVMValueRef, loses_info &types.LLVMBool) f64 {
	return C.LLVMConstRealGetDouble(constant_val, loses_info)
}

fn C.LLVMConstStringInContext(c types.LLVMContextRef, str &i8, length u32, dont_null_terminate types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_string_in_context(c types.LLVMContextRef, str &i8, length u32, dont_null_terminate types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstStringInContext(c, str, length, dont_null_terminate)
}

fn C.LLVMConstString(str &i8, length u32, dont_null_terminate types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_string(str &i8, length u32, dont_null_terminate types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstString(str, length, dont_null_terminate)
}

fn C.LLVMIsConstantString(c types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_constant_string(c types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsConstantString(c)
}

fn C.LLVMGetAsString(c types.LLVMValueRef, length &usize) &i8
pub fn llvm_get_as_string(c types.LLVMValueRef, length &usize) string {
	return unsafe { (&u8(C.LLVMGetAsString(c, length))).vstring() }
}

fn C.LLVMConstStructInContext(c types.LLVMContextRef, constant_vals &types.LLVMValueRef, count u32, packed types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_struct_in_context(c types.LLVMContextRef, constant_vals &types.LLVMValueRef, count u32, packed types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstStructInContext(c, constant_vals, count, packed)
}

fn C.LLVMConstStruct(constant_vals &types.LLVMValueRef, count u32, packed types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_struct(constant_vals &types.LLVMValueRef, count u32, packed types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstStruct(constant_vals, count, packed)
}

fn C.LLVMConstArray(element_ty types.LLVMTypeRef, constant_vals &types.LLVMValueRef, length u32) types.LLVMValueRef
pub fn llvm_const_array(element_ty types.LLVMTypeRef, constant_vals &types.LLVMValueRef, length u32) types.LLVMValueRef {
	return C.LLVMConstArray(element_ty, constant_vals, length)
}

fn C.LLVMConstNamedStruct(struct_ty types.LLVMTypeRef, constant_vals &types.LLVMValueRef, count u32) types.LLVMValueRef
pub fn llvm_const_named_struct(struct_ty types.LLVMTypeRef, constant_vals &types.LLVMValueRef, count u32) types.LLVMValueRef {
	return C.LLVMConstNamedStruct(struct_ty, constant_vals, count)
}

fn C.LLVMGetElementAsConstant(c types.LLVMValueRef, idx u32) types.LLVMValueRef
pub fn llvm_get_element_as_constant(c types.LLVMValueRef, idx u32) types.LLVMValueRef {
	return C.LLVMGetElementAsConstant(c, idx)
}

fn C.LLVMConstVector(scalar_constant_vals &types.LLVMValueRef, size u32) types.LLVMValueRef
pub fn llvm_const_vector(scalar_constant_vals &types.LLVMValueRef, size u32) types.LLVMValueRef {
	return C.LLVMConstVector(scalar_constant_vals, size)
}

fn C.LLVMGetConstOpcode(constant_val types.LLVMValueRef) LLVMOpcode
pub fn llvm_get_const_opcode(constant_val types.LLVMValueRef) LLVMOpcode {
	return C.LLVMGetConstOpcode(constant_val)
}

fn C.LLVMAlignOf(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_align_of(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMAlignOf(ty)
}

fn C.LLVMSizeOf(ty types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_size_of(ty types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMSizeOf(ty)
}

fn C.LLVMConstNeg(constant_val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_neg(constant_val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNeg(constant_val)
}

fn C.LLVMConstNSWNeg(constant_val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnsw_neg(constant_val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNSWNeg(constant_val)
}

fn C.LLVMConstNUWNeg(constant_val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnuw_neg(constant_val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNUWNeg(constant_val)
}

fn C.LLVMConstFNeg(constant_val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_neg(constant_val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFNeg(constant_val)
}

fn C.LLVMConstNot(constant_val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_not(constant_val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNot(constant_val)
}

fn C.LLVMConstAdd(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_add(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstAdd(lhs_constant, rhs_constant)
}

fn C.LLVMConstNSWAdd(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnsw_add(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNSWAdd(lhs_constant, rhs_constant)
}

fn C.LLVMConstNUWAdd(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnuw_add(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNUWAdd(lhs_constant, rhs_constant)
}

fn C.LLVMConstFAdd(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_add(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFAdd(lhs_constant, rhs_constant)
}

fn C.LLVMConstSub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_sub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstSub(lhs_constant, rhs_constant)
}

fn C.LLVMConstNSWSub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnsw_sub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNSWSub(lhs_constant, rhs_constant)
}

fn C.LLVMConstNUWSub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnuw_sub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNUWSub(lhs_constant, rhs_constant)
}

fn C.LLVMConstFSub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_sub(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFSub(lhs_constant, rhs_constant)
}

fn C.LLVMConstMul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_mul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstMul(lhs_constant, rhs_constant)
}

fn C.LLVMConstNSWMul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnsw_mul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNSWMul(lhs_constant, rhs_constant)
}

fn C.LLVMConstNUWMul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constnuw_mul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstNUWMul(lhs_constant, rhs_constant)
}

fn C.LLVMConstFMul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_mul(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFMul(lhs_constant, rhs_constant)
}

fn C.LLVMConstUDiv(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constu_div(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstUDiv(lhs_constant, rhs_constant)
}

fn C.LLVMConstExactUDiv(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_exactu_div(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstExactUDiv(lhs_constant, rhs_constant)
}

fn C.LLVMConstSDiv(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_consts_div(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstSDiv(lhs_constant, rhs_constant)
}

fn C.LLVMConstExactSDiv(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_exacts_div(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstExactSDiv(lhs_constant, rhs_constant)
}

fn C.LLVMConstFDiv(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_div(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFDiv(lhs_constant, rhs_constant)
}

fn C.LLVMConstURem(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constu_rem(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstURem(lhs_constant, rhs_constant)
}

fn C.LLVMConstSRem(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_consts_rem(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstSRem(lhs_constant, rhs_constant)
}

fn C.LLVMConstFRem(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_rem(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFRem(lhs_constant, rhs_constant)
}

fn C.LLVMConstAnd(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_and(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstAnd(lhs_constant, rhs_constant)
}

fn C.LLVMConstOr(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_or(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstOr(lhs_constant, rhs_constant)
}

fn C.LLVMConstXor(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_xor(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstXor(lhs_constant, rhs_constant)
}

fn C.LLVMConstICmp(predicate LLVMIntPredicate, lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_consti_cmp(predicate LLVMIntPredicate, lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstICmp(predicate, lhs_constant, rhs_constant)
}

fn C.LLVMConstFCmp(predicate LLVMRealPredicate, lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constf_cmp(predicate LLVMRealPredicate, lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstFCmp(predicate, lhs_constant, rhs_constant)
}

fn C.LLVMConstShl(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_shl(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstShl(lhs_constant, rhs_constant)
}

fn C.LLVMConstLShr(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_constl_shr(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstLShr(lhs_constant, rhs_constant)
}

fn C.LLVMConstAShr(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_consta_shr(lhs_constant types.LLVMValueRef, rhs_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstAShr(lhs_constant, rhs_constant)
}

fn C.LLVMConstGEP2(ty types.LLVMTypeRef, constant_val types.LLVMValueRef, constant_indices &types.LLVMValueRef, num_indices u32) types.LLVMValueRef
pub fn llvm_constge_p2(ty types.LLVMTypeRef, constant_val types.LLVMValueRef, constant_indices &types.LLVMValueRef, num_indices u32) types.LLVMValueRef {
	return C.LLVMConstGEP2(ty, constant_val, constant_indices, num_indices)
}

fn C.LLVMConstInBoundsGEP2(ty types.LLVMTypeRef, constant_val types.LLVMValueRef, constant_indices &types.LLVMValueRef, num_indices u32) types.LLVMValueRef
pub fn llvm_const_in_boundsge_p2(ty types.LLVMTypeRef, constant_val types.LLVMValueRef, constant_indices &types.LLVMValueRef, num_indices u32) types.LLVMValueRef {
	return C.LLVMConstInBoundsGEP2(ty, constant_val, constant_indices, num_indices)
}

fn C.LLVMConstTrunc(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_trunc(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstTrunc(constant_val, to_type)
}

fn C.LLVMConstSExt(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_consts_ext(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstSExt(constant_val, to_type)
}

fn C.LLVMConstZExt(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constz_ext(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstZExt(constant_val, to_type)
}

fn C.LLVMConstFPTrunc(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constfp_trunc(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstFPTrunc(constant_val, to_type)
}

fn C.LLVMConstFPExt(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constfp_ext(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstFPExt(constant_val, to_type)
}

fn C.LLVMConstUIToFP(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constui_tofp(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstUIToFP(constant_val, to_type)
}

fn C.LLVMConstSIToFP(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constsi_tofp(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstSIToFP(constant_val, to_type)
}

fn C.LLVMConstFPToUI(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constfp_toui(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstFPToUI(constant_val, to_type)
}

fn C.LLVMConstFPToSI(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constfp_tosi(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstFPToSI(constant_val, to_type)
}

fn C.LLVMConstPtrToInt(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_ptr_to_int(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstPtrToInt(constant_val, to_type)
}

fn C.LLVMConstIntToPtr(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_int_to_ptr(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstIntToPtr(constant_val, to_type)
}

fn C.LLVMConstBitCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_bit_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstBitCast(constant_val, to_type)
}

fn C.LLVMConstAddrSpaceCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_addr_space_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstAddrSpaceCast(constant_val, to_type)
}

fn C.LLVMConstZExtOrBitCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constz_ext_or_bit_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstZExtOrBitCast(constant_val, to_type)
}

fn C.LLVMConstSExtOrBitCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_consts_ext_or_bit_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstSExtOrBitCast(constant_val, to_type)
}

fn C.LLVMConstTruncOrBitCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_trunc_or_bit_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstTruncOrBitCast(constant_val, to_type)
}

fn C.LLVMConstPointerCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_const_pointer_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstPointerCast(constant_val, to_type)
}

fn C.LLVMConstIntCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef, is_signed types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_int_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef, is_signed types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstIntCast(constant_val, to_type, is_signed)
}

fn C.LLVMConstFPCast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef
pub fn llvm_constfp_cast(constant_val types.LLVMValueRef, to_type types.LLVMTypeRef) types.LLVMValueRef {
	return C.LLVMConstFPCast(constant_val, to_type)
}

fn C.LLVMConstSelect(constant_condition types.LLVMValueRef, constant_if_true types.LLVMValueRef, constant_if_false types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_select(constant_condition types.LLVMValueRef, constant_if_true types.LLVMValueRef, constant_if_false types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstSelect(constant_condition, constant_if_true, constant_if_false)
}

fn C.LLVMConstExtractElement(vector_constant types.LLVMValueRef, index_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_extract_element(vector_constant types.LLVMValueRef, index_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstExtractElement(vector_constant, index_constant)
}

fn C.LLVMConstInsertElement(vector_constant types.LLVMValueRef, element_value_constant types.LLVMValueRef, index_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_insert_element(vector_constant types.LLVMValueRef, element_value_constant types.LLVMValueRef, index_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstInsertElement(vector_constant, element_value_constant, index_constant)
}

fn C.LLVMConstShuffleVector(vectora_constant types.LLVMValueRef, vectorb_constant types.LLVMValueRef, mask_constant types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_const_shuffle_vector(vectora_constant types.LLVMValueRef, vectorb_constant types.LLVMValueRef, mask_constant types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMConstShuffleVector(vectora_constant, vectorb_constant, mask_constant)
}

fn C.LLVMConstExtractValue(agg_constant types.LLVMValueRef, idx_list &u32, num_idx u32) types.LLVMValueRef
pub fn llvm_const_extract_value(agg_constant types.LLVMValueRef, idx_list &u32, num_idx u32) types.LLVMValueRef {
	return C.LLVMConstExtractValue(agg_constant, idx_list, num_idx)
}

fn C.LLVMConstInsertValue(agg_constant types.LLVMValueRef, element_value_constant types.LLVMValueRef, idx_list &u32, num_idx u32) types.LLVMValueRef
pub fn llvm_const_insert_value(agg_constant types.LLVMValueRef, element_value_constant types.LLVMValueRef, idx_list &u32, num_idx u32) types.LLVMValueRef {
	return C.LLVMConstInsertValue(agg_constant, element_value_constant, idx_list, num_idx)
}

fn C.LLVMBlockAddress(f types.LLVMValueRef, bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_block_address(f types.LLVMValueRef, bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMBlockAddress(f, bb)
}

fn C.LLVMConstInlineAsm(ty types.LLVMTypeRef, asm_string &i8, constraints &i8, has_side_effects types.LLVMBool, is_align_stack types.LLVMBool) types.LLVMValueRef
pub fn llvm_const_inline_asm(ty types.LLVMTypeRef, asm_string &i8, constraints &i8, has_side_effects types.LLVMBool, is_align_stack types.LLVMBool) types.LLVMValueRef {
	return C.LLVMConstInlineAsm(ty, asm_string, constraints, has_side_effects, is_align_stack)
}

fn C.LLVMGetGlobalParent(global types.LLVMValueRef) types.LLVMModuleRef
pub fn llvm_get_global_parent(global types.LLVMValueRef) types.LLVMModuleRef {
	return C.LLVMGetGlobalParent(global)
}

fn C.LLVMIsDeclaration(global types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_declaration(global types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsDeclaration(global)
}

fn C.LLVMGetLinkage(global types.LLVMValueRef) LLVMLinkage
pub fn llvm_get_linkage(global types.LLVMValueRef) LLVMLinkage {
	return C.LLVMGetLinkage(global)
}

fn C.LLVMSetLinkage(global types.LLVMValueRef, linkage LLVMLinkage)
pub fn llvm_set_linkage(global types.LLVMValueRef, linkage LLVMLinkage) {
	C.LLVMSetLinkage(global, linkage)
}

fn C.LLVMGetSection(global types.LLVMValueRef) &i8
pub fn llvm_get_section(global types.LLVMValueRef) string {
	return unsafe { (&u8(C.LLVMGetSection(global))).vstring() }
}

fn C.LLVMSetSection(global types.LLVMValueRef, section &i8)
pub fn llvm_set_section(global types.LLVMValueRef, section &i8) {
	C.LLVMSetSection(global, section)
}

fn C.LLVMGetVisibility(global types.LLVMValueRef) LLVMVisibility
pub fn llvm_get_visibility(global types.LLVMValueRef) LLVMVisibility {
	return C.LLVMGetVisibility(global)
}

fn C.LLVMSetVisibility(global types.LLVMValueRef, viz LLVMVisibility)
pub fn llvm_set_visibility(global types.LLVMValueRef, viz LLVMVisibility) {
	C.LLVMSetVisibility(global, viz)
}

fn C.LLVMGetDLLStorageClass(global types.LLVMValueRef) LLVMDLLStorageClass
pub fn llvm_getdll_storage_class(global types.LLVMValueRef) LLVMDLLStorageClass {
	return C.LLVMGetDLLStorageClass(global)
}

fn C.LLVMSetDLLStorageClass(global types.LLVMValueRef, class LLVMDLLStorageClass)
pub fn llvm_setdll_storage_class(global types.LLVMValueRef, class LLVMDLLStorageClass) {
	C.LLVMSetDLLStorageClass(global, class)
}

fn C.LLVMGetUnnamedAddress(global types.LLVMValueRef) LLVMUnnamedAddr
pub fn llvm_get_unnamed_address(global types.LLVMValueRef) LLVMUnnamedAddr {
	return C.LLVMGetUnnamedAddress(global)
}

fn C.LLVMSetUnnamedAddress(global types.LLVMValueRef, unnamed_addr LLVMUnnamedAddr)
pub fn llvm_set_unnamed_address(global types.LLVMValueRef, unnamed_addr LLVMUnnamedAddr) {
	C.LLVMSetUnnamedAddress(global, unnamed_addr)
}

fn C.LLVMGlobalGetValueType(global types.LLVMValueRef) types.LLVMTypeRef
pub fn llvm_global_get_value_type(global types.LLVMValueRef) types.LLVMTypeRef {
	return C.LLVMGlobalGetValueType(global)
}

fn C.LLVMHasUnnamedAddr(global types.LLVMValueRef) types.LLVMBool
pub fn llvm_has_unnamed_addr(global types.LLVMValueRef) types.LLVMBool {
	return C.LLVMHasUnnamedAddr(global)
}

fn C.LLVMSetUnnamedAddr(global types.LLVMValueRef, has_unnamed_addr types.LLVMBool)
pub fn llvm_set_unnamed_addr(global types.LLVMValueRef, has_unnamed_addr types.LLVMBool) {
	C.LLVMSetUnnamedAddr(global, has_unnamed_addr)
}

fn C.LLVMGetAlignment(v types.LLVMValueRef) u32
pub fn llvm_get_alignment(v types.LLVMValueRef) u32 {
	return C.LLVMGetAlignment(v)
}

fn C.LLVMSetAlignment(v types.LLVMValueRef, bytes u32)
pub fn llvm_set_alignment(v types.LLVMValueRef, bytes u32) {
	C.LLVMSetAlignment(v, bytes)
}

fn C.LLVMGlobalSetMetadata(global types.LLVMValueRef, kind u32, md types.LLVMMetadataRef)
pub fn llvm_global_set_metadata(global types.LLVMValueRef, kind u32, md types.LLVMMetadataRef) {
	C.LLVMGlobalSetMetadata(global, kind, md)
}

fn C.LLVMGlobalEraseMetadata(global types.LLVMValueRef, kind u32)
pub fn llvm_global_erase_metadata(global types.LLVMValueRef, kind u32) {
	C.LLVMGlobalEraseMetadata(global, kind)
}

fn C.LLVMGlobalClearMetadata(global types.LLVMValueRef)
pub fn llvm_global_clear_metadata(global types.LLVMValueRef) {
	C.LLVMGlobalClearMetadata(global)
}

fn C.LLVMGlobalCopyAllMetadata(value types.LLVMValueRef, num_entries &usize) &types.LLVMValueMetadataEntry
pub fn llvm_global_copy_all_metadata(value types.LLVMValueRef, num_entries &usize) &types.LLVMValueMetadataEntry {
	return C.LLVMGlobalCopyAllMetadata(value, num_entries)
}

fn C.LLVMDisposeValueMetadataEntries(entries &types.LLVMValueMetadataEntry)
pub fn llvm_dispose_value_metadata_entries(entries &types.LLVMValueMetadataEntry) {
	C.LLVMDisposeValueMetadataEntries(entries)
}

fn C.LLVMValueMetadataEntriesGetKind(entries &types.LLVMValueMetadataEntry, index u32) u32
pub fn llvm_value_metadata_entries_get_kind(entries &types.LLVMValueMetadataEntry, index u32) u32 {
	return C.LLVMValueMetadataEntriesGetKind(entries, index)
}

fn C.LLVMValueMetadataEntriesGetMetadata(entries &types.LLVMValueMetadataEntry, index u32) types.LLVMMetadataRef
pub fn llvm_value_metadata_entries_get_metadata(entries &types.LLVMValueMetadataEntry, index u32) types.LLVMMetadataRef {
	return C.LLVMValueMetadataEntriesGetMetadata(entries, index)
}

fn C.LLVMAddGlobal(m types.LLVMModuleRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_add_global(m types.LLVMModuleRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMAddGlobal(m, ty, name)
}

fn C.LLVMAddGlobalInAddressSpace(m types.LLVMModuleRef, ty types.LLVMTypeRef, name &i8, address_space u32) types.LLVMValueRef
pub fn llvm_add_global_in_address_space(m types.LLVMModuleRef, ty types.LLVMTypeRef, name &i8, address_space u32) types.LLVMValueRef {
	return C.LLVMAddGlobalInAddressSpace(m, ty, name, address_space)
}

fn C.LLVMGetNamedGlobal(m types.LLVMModuleRef, name &i8) types.LLVMValueRef
pub fn llvm_get_named_global(m types.LLVMModuleRef, name &i8) types.LLVMValueRef {
	return C.LLVMGetNamedGlobal(m, name)
}

fn C.LLVMGetFirstGlobal(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_first_global(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetFirstGlobal(m)
}

fn C.LLVMGetLastGlobal(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_last_global(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetLastGlobal(m)
}

fn C.LLVMGetNextGlobal(global_var types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_next_global(global_var types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetNextGlobal(global_var)
}

fn C.LLVMGetPreviousGlobal(global_var types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_previous_global(global_var types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPreviousGlobal(global_var)
}

fn C.LLVMDeleteGlobal(global_var types.LLVMValueRef)
pub fn llvm_delete_global(global_var types.LLVMValueRef) {
	C.LLVMDeleteGlobal(global_var)
}

fn C.LLVMGetInitializer(global_var types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_initializer(global_var types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetInitializer(global_var)
}

fn C.LLVMSetInitializer(global_var types.LLVMValueRef, constant_val types.LLVMValueRef)
pub fn llvm_set_initializer(global_var types.LLVMValueRef, constant_val types.LLVMValueRef) {
	C.LLVMSetInitializer(global_var, constant_val)
}

fn C.LLVMIsThreadLocal(global_var types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_thread_local(global_var types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsThreadLocal(global_var)
}

fn C.LLVMSetThreadLocal(global_var types.LLVMValueRef, is_thread_local types.LLVMBool)
pub fn llvm_set_thread_local(global_var types.LLVMValueRef, is_thread_local types.LLVMBool) {
	C.LLVMSetThreadLocal(global_var, is_thread_local)
}

fn C.LLVMIsGlobalConstant(global_var types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_global_constant(global_var types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsGlobalConstant(global_var)
}

fn C.LLVMSetGlobalConstant(global_var types.LLVMValueRef, is_constant types.LLVMBool)
pub fn llvm_set_global_constant(global_var types.LLVMValueRef, is_constant types.LLVMBool) {
	C.LLVMSetGlobalConstant(global_var, is_constant)
}

fn C.LLVMGetThreadLocalMode(global_var types.LLVMValueRef) LLVMThreadLocalMode
pub fn llvm_get_thread_local_mode(global_var types.LLVMValueRef) LLVMThreadLocalMode {
	return C.LLVMGetThreadLocalMode(global_var)
}

fn C.LLVMSetThreadLocalMode(global_var types.LLVMValueRef, mode LLVMThreadLocalMode)
pub fn llvm_set_thread_local_mode(global_var types.LLVMValueRef, mode LLVMThreadLocalMode) {
	C.LLVMSetThreadLocalMode(global_var, mode)
}

fn C.LLVMIsExternallyInitialized(global_var types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_externally_initialized(global_var types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsExternallyInitialized(global_var)
}

fn C.LLVMSetExternallyInitialized(global_var types.LLVMValueRef, is_ext_init types.LLVMBool)
pub fn llvm_set_externally_initialized(global_var types.LLVMValueRef, is_ext_init types.LLVMBool) {
	C.LLVMSetExternallyInitialized(global_var, is_ext_init)
}

fn C.LLVMAddAlias2(m types.LLVMModuleRef, value_ty types.LLVMTypeRef, addr_space u32, aliasee types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_add_alias2(m types.LLVMModuleRef, value_ty types.LLVMTypeRef, addr_space u32, aliasee types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMAddAlias2(m, value_ty, addr_space, aliasee, name)
}

fn C.LLVMGetNamedGlobalAlias(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMValueRef
pub fn llvm_get_named_global_alias(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMValueRef {
	return C.LLVMGetNamedGlobalAlias(m, name, name_len)
}

fn C.LLVMGetFirstGlobalAlias(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_first_global_alias(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetFirstGlobalAlias(m)
}

fn C.LLVMGetLastGlobalAlias(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_last_global_alias(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetLastGlobalAlias(m)
}

fn C.LLVMGetNextGlobalAlias(ga types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_next_global_alias(ga types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetNextGlobalAlias(ga)
}

fn C.LLVMGetPreviousGlobalAlias(ga types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_previous_global_alias(ga types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPreviousGlobalAlias(ga)
}

fn C.LLVMAliasGetAliasee(alias types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_alias_get_aliasee(alias types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMAliasGetAliasee(alias)
}

fn C.LLVMAliasSetAliasee(alias types.LLVMValueRef, aliasee types.LLVMValueRef)
pub fn llvm_alias_set_aliasee(alias types.LLVMValueRef, aliasee types.LLVMValueRef) {
	C.LLVMAliasSetAliasee(alias, aliasee)
}

fn C.LLVMDeleteFunction(fn_ types.LLVMValueRef)
pub fn llvm_delete_function(fn_ types.LLVMValueRef) {
	C.LLVMDeleteFunction(fn_)
}

fn C.LLVMHasPersonalityFn(fn_ types.LLVMValueRef) types.LLVMBool
pub fn llvm_has_personality_fn(fn_ types.LLVMValueRef) types.LLVMBool {
	return C.LLVMHasPersonalityFn(fn_)
}

fn C.LLVMGetPersonalityFn(fn_ types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_personality_fn(fn_ types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPersonalityFn(fn_)
}

fn C.LLVMSetPersonalityFn(fn_ types.LLVMValueRef, personality_fn types.LLVMValueRef)
pub fn llvm_set_personality_fn(fn_ types.LLVMValueRef, personality_fn types.LLVMValueRef) {
	C.LLVMSetPersonalityFn(fn_, personality_fn)
}

fn C.LLVMLookupIntrinsicID(name &i8, name_len usize) u32
pub fn llvm_lookup_intrinsicid(name &i8, name_len usize) u32 {
	return C.LLVMLookupIntrinsicID(name, name_len)
}

fn C.LLVMGetIntrinsicID(fn_ types.LLVMValueRef) u32
pub fn llvm_get_intrinsicid(fn_ types.LLVMValueRef) u32 {
	return C.LLVMGetIntrinsicID(fn_)
}

fn C.LLVMGetIntrinsicDeclaration(mod types.LLVMModuleRef, id u32, param_types &types.LLVMTypeRef, param_count usize) types.LLVMValueRef
pub fn llvm_get_intrinsic_declaration(mod types.LLVMModuleRef, id u32, param_types &types.LLVMTypeRef, param_count usize) types.LLVMValueRef {
	return C.LLVMGetIntrinsicDeclaration(mod, id, param_types, param_count)
}

fn C.LLVMIntrinsicGetType(ctx types.LLVMContextRef, id u32, param_types &types.LLVMTypeRef, param_count usize) types.LLVMTypeRef
pub fn llvm_intrinsic_get_type(ctx types.LLVMContextRef, id u32, param_types &types.LLVMTypeRef, param_count usize) types.LLVMTypeRef {
	return C.LLVMIntrinsicGetType(ctx, id, param_types, param_count)
}

fn C.LLVMIntrinsicGetName(id u32, name_length &usize) &i8
pub fn llvm_intrinsic_get_name(id u32, name_length &usize) string {
	return unsafe { (&u8(C.LLVMIntrinsicGetName(id, name_length))).vstring() }
}

fn C.LLVMIntrinsicCopyOverloadedName(id u32, param_types &types.LLVMTypeRef, param_count usize, name_length &usize) &i8
pub fn llvm_intrinsic_copy_overloaded_name(id u32, param_types &types.LLVMTypeRef, param_count usize, name_length &usize) string {
	return unsafe { (&u8(C.LLVMIntrinsicCopyOverloadedName(id, param_types, param_count, name_length))).vstring() }
}

fn C.LLVMIntrinsicCopyOverloadedName2(mod types.LLVMModuleRef, id u32, param_types &types.LLVMTypeRef, param_count usize, name_length &usize) &i8
pub fn llvm_intrinsic_copy_overloaded_name2(mod types.LLVMModuleRef, id u32, param_types &types.LLVMTypeRef, param_count usize, name_length &usize) string {
	return unsafe { (&u8(C.LLVMIntrinsicCopyOverloadedName2(mod, id, param_types, param_count, name_length))).vstring() }
}

fn C.LLVMIntrinsicIsOverloaded(id u32) types.LLVMBool
pub fn llvm_intrinsic_is_overloaded(id u32) types.LLVMBool {
	return C.LLVMIntrinsicIsOverloaded(id)
}

fn C.LLVMGetFunctionCallConv(fn_ types.LLVMValueRef) u32
pub fn llvm_get_function_call_conv(fn_ types.LLVMValueRef) u32 {
	return C.LLVMGetFunctionCallConv(fn_)
}

fn C.LLVMSetFunctionCallConv(fn_ types.LLVMValueRef, cc u32)
pub fn llvm_set_function_call_conv(fn_ types.LLVMValueRef, cc u32) {
	C.LLVMSetFunctionCallConv(fn_, cc)
}

fn C.LLVMGetGC(fn_ types.LLVMValueRef) &i8
pub fn llvm_getgc(fn_ types.LLVMValueRef) string {
	return unsafe { (&u8(C.LLVMGetGC(fn_))).vstring() }
}

fn C.LLVMSetGC(fn_ types.LLVMValueRef, name &i8)
pub fn llvm_setgc(fn_ types.LLVMValueRef, name &i8) {
	C.LLVMSetGC(fn_, name)
}

fn C.LLVMAddAttributeAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex, a types.LLVMAttributeRef)
pub fn llvm_add_attribute_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex, a types.LLVMAttributeRef) {
	C.LLVMAddAttributeAtIndex(f, idx, a)
}

fn C.LLVMGetAttributeCountAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex) u32
pub fn llvm_get_attribute_count_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex) u32 {
	return C.LLVMGetAttributeCountAtIndex(f, idx)
}

fn C.LLVMGetAttributesAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex, attrs &types.LLVMAttributeRef)
pub fn llvm_get_attributes_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex, attrs &types.LLVMAttributeRef) {
	C.LLVMGetAttributesAtIndex(f, idx, attrs)
}

fn C.LLVMGetEnumAttributeAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32) types.LLVMAttributeRef
pub fn llvm_get_enum_attribute_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32) types.LLVMAttributeRef {
	return C.LLVMGetEnumAttributeAtIndex(f, idx, kindid)
}

fn C.LLVMGetStringAttributeAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32) types.LLVMAttributeRef
pub fn llvm_get_string_attribute_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32) types.LLVMAttributeRef {
	return C.LLVMGetStringAttributeAtIndex(f, idx, k, k_len)
}

fn C.LLVMRemoveEnumAttributeAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32)
pub fn llvm_remove_enum_attribute_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32) {
	C.LLVMRemoveEnumAttributeAtIndex(f, idx, kindid)
}

fn C.LLVMRemoveStringAttributeAtIndex(f types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32)
pub fn llvm_remove_string_attribute_at_index(f types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32) {
	C.LLVMRemoveStringAttributeAtIndex(f, idx, k, k_len)
}

fn C.LLVMAddTargetDependentFunctionAttr(fn_ types.LLVMValueRef, a &i8, v &i8)
pub fn llvm_add_target_dependent_function_attr(fn_ types.LLVMValueRef, a &i8, v &i8) {
	C.LLVMAddTargetDependentFunctionAttr(fn_, a, v)
}

fn C.LLVMCountParams(fn_ types.LLVMValueRef) u32
pub fn llvm_count_params(fn_ types.LLVMValueRef) u32 {
	return C.LLVMCountParams(fn_)
}

fn C.LLVMGetParams(fn_ types.LLVMValueRef, params &types.LLVMValueRef)
pub fn llvm_get_params(fn_ types.LLVMValueRef, params &types.LLVMValueRef) {
	C.LLVMGetParams(fn_, params)
}

fn C.LLVMGetParam(fn_ types.LLVMValueRef, index u32) types.LLVMValueRef
pub fn llvm_get_param(fn_ types.LLVMValueRef, index u32) types.LLVMValueRef {
	return C.LLVMGetParam(fn_, index)
}

fn C.LLVMGetParamParent(inst types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_param_parent(inst types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetParamParent(inst)
}

fn C.LLVMGetFirstParam(fn_ types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_first_param(fn_ types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetFirstParam(fn_)
}

fn C.LLVMGetLastParam(fn_ types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_last_param(fn_ types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetLastParam(fn_)
}

fn C.LLVMGetNextParam(arg types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_next_param(arg types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetNextParam(arg)
}

fn C.LLVMGetPreviousParam(arg types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_previous_param(arg types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPreviousParam(arg)
}

fn C.LLVMSetParamAlignment(arg types.LLVMValueRef, align u32)
pub fn llvm_set_param_alignment(arg types.LLVMValueRef, align u32) {
	C.LLVMSetParamAlignment(arg, align)
}

fn C.LLVMAddGlobalIFunc(m types.LLVMModuleRef, name &i8, name_len usize, ty types.LLVMTypeRef, addr_space u32, resolver types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_add_globali_func(m types.LLVMModuleRef, name &i8, name_len usize, ty types.LLVMTypeRef, addr_space u32, resolver types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMAddGlobalIFunc(m, name, name_len, ty, addr_space, resolver)
}

fn C.LLVMGetNamedGlobalIFunc(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMValueRef
pub fn llvm_get_named_globali_func(m types.LLVMModuleRef, name &i8, name_len usize) types.LLVMValueRef {
	return C.LLVMGetNamedGlobalIFunc(m, name, name_len)
}

fn C.LLVMGetFirstGlobalIFunc(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_first_globali_func(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetFirstGlobalIFunc(m)
}

fn C.LLVMGetLastGlobalIFunc(m types.LLVMModuleRef) types.LLVMValueRef
pub fn llvm_get_last_globali_func(m types.LLVMModuleRef) types.LLVMValueRef {
	return C.LLVMGetLastGlobalIFunc(m)
}

fn C.LLVMGetNextGlobalIFunc(i_func types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_next_globali_func(i_func types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetNextGlobalIFunc(i_func)
}

fn C.LLVMGetPreviousGlobalIFunc(i_func types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_previous_globali_func(i_func types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPreviousGlobalIFunc(i_func)
}

fn C.LLVMGetGlobalIFuncResolver(i_func types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_globali_func_resolver(i_func types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetGlobalIFuncResolver(i_func)
}

fn C.LLVMSetGlobalIFuncResolver(i_func types.LLVMValueRef, resolver types.LLVMValueRef)
pub fn llvm_set_globali_func_resolver(i_func types.LLVMValueRef, resolver types.LLVMValueRef) {
	C.LLVMSetGlobalIFuncResolver(i_func, resolver)
}

fn C.LLVMEraseGlobalIFunc(i_func types.LLVMValueRef)
pub fn llvm_erase_globali_func(i_func types.LLVMValueRef) {
	C.LLVMEraseGlobalIFunc(i_func)
}

fn C.LLVMRemoveGlobalIFunc(i_func types.LLVMValueRef)
pub fn llvm_remove_globali_func(i_func types.LLVMValueRef) {
	C.LLVMRemoveGlobalIFunc(i_func)
}

fn C.LLVMMDStringInContext2(c types.LLVMContextRef, str &i8, s_len usize) types.LLVMMetadataRef
pub fn llvmmd_string_in_context2(c types.LLVMContextRef, str &i8, s_len usize) types.LLVMMetadataRef {
	return C.LLVMMDStringInContext2(c, str, s_len)
}

fn C.LLVMMDNodeInContext2(c types.LLVMContextRef, m_ds &types.LLVMMetadataRef, count usize) types.LLVMMetadataRef
pub fn llvmmd_node_in_context2(c types.LLVMContextRef, m_ds &types.LLVMMetadataRef, count usize) types.LLVMMetadataRef {
	return C.LLVMMDNodeInContext2(c, m_ds, count)
}

fn C.LLVMMetadataAsValue(c types.LLVMContextRef, md types.LLVMMetadataRef) types.LLVMValueRef
pub fn llvm_metadata_as_value(c types.LLVMContextRef, md types.LLVMMetadataRef) types.LLVMValueRef {
	return C.LLVMMetadataAsValue(c, md)
}

fn C.LLVMValueAsMetadata(val types.LLVMValueRef) types.LLVMMetadataRef
pub fn llvm_value_as_metadata(val types.LLVMValueRef) types.LLVMMetadataRef {
	return C.LLVMValueAsMetadata(val)
}

fn C.LLVMGetMDString(v types.LLVMValueRef, length &u32) &i8
pub fn llvm_getmd_string(v types.LLVMValueRef, length &u32) string {
	return unsafe { (&u8(C.LLVMGetMDString(v, length))).vstring() }
}

fn C.LLVMGetMDNodeNumOperands(v types.LLVMValueRef) u32
pub fn llvm_getmd_node_num_operands(v types.LLVMValueRef) u32 {
	return C.LLVMGetMDNodeNumOperands(v)
}

fn C.LLVMGetMDNodeOperands(v types.LLVMValueRef, dest &types.LLVMValueRef)
pub fn llvm_getmd_node_operands(v types.LLVMValueRef, dest &types.LLVMValueRef) {
	C.LLVMGetMDNodeOperands(v, dest)
}

fn C.LLVMMDStringInContext(c types.LLVMContextRef, str &i8, s_len u32) types.LLVMValueRef
pub fn llvmmd_string_in_context(c types.LLVMContextRef, str &i8, s_len u32) types.LLVMValueRef {
	return C.LLVMMDStringInContext(c, str, s_len)
}

fn C.LLVMMDString(str &i8, s_len u32) types.LLVMValueRef
pub fn llvmmd_string(str &i8, s_len u32) types.LLVMValueRef {
	return C.LLVMMDString(str, s_len)
}

fn C.LLVMMDNodeInContext(c types.LLVMContextRef, vals &types.LLVMValueRef, count u32) types.LLVMValueRef
pub fn llvmmd_node_in_context(c types.LLVMContextRef, vals &types.LLVMValueRef, count u32) types.LLVMValueRef {
	return C.LLVMMDNodeInContext(c, vals, count)
}

fn C.LLVMMDNode(vals &types.LLVMValueRef, count u32) types.LLVMValueRef
pub fn llvmmd_node(vals &types.LLVMValueRef, count u32) types.LLVMValueRef {
	return C.LLVMMDNode(vals, count)
}

fn C.LLVMBasicBlockAsValue(bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_basic_block_as_value(bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMBasicBlockAsValue(bb)
}

fn C.LLVMValueIsBasicBlock(val types.LLVMValueRef) types.LLVMBool
pub fn llvm_value_is_basic_block(val types.LLVMValueRef) types.LLVMBool {
	return C.LLVMValueIsBasicBlock(val)
}

fn C.LLVMValueAsBasicBlock(val types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_value_as_basic_block(val types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMValueAsBasicBlock(val)
}

fn C.LLVMGetBasicBlockName(bb types.LLVMBasicBlockRef) &i8
pub fn llvm_get_basic_block_name(bb types.LLVMBasicBlockRef) string {
	return unsafe { (&u8(C.LLVMGetBasicBlockName(bb))).vstring() }
}

fn C.LLVMGetBasicBlockParent(bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_get_basic_block_parent(bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMGetBasicBlockParent(bb)
}

fn C.LLVMGetBasicBlockTerminator(bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_get_basic_block_terminator(bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMGetBasicBlockTerminator(bb)
}

fn C.LLVMCountBasicBlocks(fn_ types.LLVMValueRef) u32
pub fn llvm_count_basic_blocks(fn_ types.LLVMValueRef) u32 {
	return C.LLVMCountBasicBlocks(fn_)
}

fn C.LLVMGetBasicBlocks(fn_ types.LLVMValueRef, basic_blocks &types.LLVMBasicBlockRef)
pub fn llvm_get_basic_blocks(fn_ types.LLVMValueRef, basic_blocks &types.LLVMBasicBlockRef) {
	C.LLVMGetBasicBlocks(fn_, basic_blocks)
}

fn C.LLVMGetFirstBasicBlock(fn_ types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_first_basic_block(fn_ types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetFirstBasicBlock(fn_)
}

fn C.LLVMGetLastBasicBlock(fn_ types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_last_basic_block(fn_ types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetLastBasicBlock(fn_)
}

fn C.LLVMGetNextBasicBlock(bb types.LLVMBasicBlockRef) types.LLVMBasicBlockRef
pub fn llvm_get_next_basic_block(bb types.LLVMBasicBlockRef) types.LLVMBasicBlockRef {
	return C.LLVMGetNextBasicBlock(bb)
}

fn C.LLVMGetPreviousBasicBlock(bb types.LLVMBasicBlockRef) types.LLVMBasicBlockRef
pub fn llvm_get_previous_basic_block(bb types.LLVMBasicBlockRef) types.LLVMBasicBlockRef {
	return C.LLVMGetPreviousBasicBlock(bb)
}

fn C.LLVMGetEntryBasicBlock(fn_ types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_entry_basic_block(fn_ types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetEntryBasicBlock(fn_)
}

fn C.LLVMInsertExistingBasicBlockAfterInsertBlock(builder types.LLVMBuilderRef, bb types.LLVMBasicBlockRef)
pub fn llvm_insert_existing_basic_block_after_insert_block(builder types.LLVMBuilderRef, bb types.LLVMBasicBlockRef) {
	C.LLVMInsertExistingBasicBlockAfterInsertBlock(builder, bb)
}

fn C.LLVMAppendExistingBasicBlock(fn_ types.LLVMValueRef, bb types.LLVMBasicBlockRef)
pub fn llvm_append_existing_basic_block(fn_ types.LLVMValueRef, bb types.LLVMBasicBlockRef) {
	C.LLVMAppendExistingBasicBlock(fn_, bb)
}

fn C.LLVMCreateBasicBlockInContext(c types.LLVMContextRef, name &i8) types.LLVMBasicBlockRef
pub fn llvm_create_basic_block_in_context(c types.LLVMContextRef, name &i8) types.LLVMBasicBlockRef {
	return C.LLVMCreateBasicBlockInContext(c, name)
}

fn C.LLVMAppendBasicBlockInContext(c types.LLVMContextRef, fn_ types.LLVMValueRef, name &i8) types.LLVMBasicBlockRef
pub fn llvm_append_basic_block_in_context(c types.LLVMContextRef, fn_ types.LLVMValueRef, name &i8) types.LLVMBasicBlockRef {
	return C.LLVMAppendBasicBlockInContext(c, fn_, name)
}

fn C.LLVMAppendBasicBlock(fn_ types.LLVMValueRef, name &i8) types.LLVMBasicBlockRef
pub fn llvm_append_basic_block(fn_ types.LLVMValueRef, name &i8) types.LLVMBasicBlockRef {
	return C.LLVMAppendBasicBlock(fn_, name)
}

fn C.LLVMInsertBasicBlockInContext(c types.LLVMContextRef, bb types.LLVMBasicBlockRef, name &i8) types.LLVMBasicBlockRef
pub fn llvm_insert_basic_block_in_context(c types.LLVMContextRef, bb types.LLVMBasicBlockRef, name &i8) types.LLVMBasicBlockRef {
	return C.LLVMInsertBasicBlockInContext(c, bb, name)
}

fn C.LLVMInsertBasicBlock(insert_beforebb types.LLVMBasicBlockRef, name &i8) types.LLVMBasicBlockRef
pub fn llvm_insert_basic_block(insert_beforebb types.LLVMBasicBlockRef, name &i8) types.LLVMBasicBlockRef {
	return C.LLVMInsertBasicBlock(insert_beforebb, name)
}

fn C.LLVMDeleteBasicBlock(bb types.LLVMBasicBlockRef)
pub fn llvm_delete_basic_block(bb types.LLVMBasicBlockRef) {
	C.LLVMDeleteBasicBlock(bb)
}

fn C.LLVMRemoveBasicBlockFromParent(bb types.LLVMBasicBlockRef)
pub fn llvm_remove_basic_block_from_parent(bb types.LLVMBasicBlockRef) {
	C.LLVMRemoveBasicBlockFromParent(bb)
}

fn C.LLVMMoveBasicBlockBefore(bb types.LLVMBasicBlockRef, move_pos types.LLVMBasicBlockRef)
pub fn llvm_move_basic_block_before(bb types.LLVMBasicBlockRef, move_pos types.LLVMBasicBlockRef) {
	C.LLVMMoveBasicBlockBefore(bb, move_pos)
}

fn C.LLVMMoveBasicBlockAfter(bb types.LLVMBasicBlockRef, move_pos types.LLVMBasicBlockRef)
pub fn llvm_move_basic_block_after(bb types.LLVMBasicBlockRef, move_pos types.LLVMBasicBlockRef) {
	C.LLVMMoveBasicBlockAfter(bb, move_pos)
}

fn C.LLVMGetFirstInstruction(bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_get_first_instruction(bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMGetFirstInstruction(bb)
}

fn C.LLVMGetLastInstruction(bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_get_last_instruction(bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMGetLastInstruction(bb)
}

fn C.LLVMHasMetadata(val types.LLVMValueRef) int
pub fn llvm_has_metadata(val types.LLVMValueRef) int {
	return C.LLVMHasMetadata(val)
}

fn C.LLVMGetMetadata(val types.LLVMValueRef, kindid u32) types.LLVMValueRef
pub fn llvm_get_metadata(val types.LLVMValueRef, kindid u32) types.LLVMValueRef {
	return C.LLVMGetMetadata(val, kindid)
}

fn C.LLVMSetMetadata(val types.LLVMValueRef, kindid u32, node types.LLVMValueRef)
pub fn llvm_set_metadata(val types.LLVMValueRef, kindid u32, node types.LLVMValueRef) {
	C.LLVMSetMetadata(val, kindid, node)
}

fn C.LLVMInstructionGetAllMetadataOtherThanDebugLoc(instr types.LLVMValueRef, num_entries &usize) &types.LLVMValueMetadataEntry
pub fn llvm_instruction_get_all_metadata_other_than_debug_loc(instr types.LLVMValueRef, num_entries &usize) &types.LLVMValueMetadataEntry {
	return C.LLVMInstructionGetAllMetadataOtherThanDebugLoc(instr, num_entries)
}

fn C.LLVMGetInstructionParent(inst types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_instruction_parent(inst types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetInstructionParent(inst)
}

fn C.LLVMGetNextInstruction(inst types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_next_instruction(inst types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetNextInstruction(inst)
}

fn C.LLVMGetPreviousInstruction(inst types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_previous_instruction(inst types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetPreviousInstruction(inst)
}

fn C.LLVMInstructionRemoveFromParent(inst types.LLVMValueRef)
pub fn llvm_instruction_remove_from_parent(inst types.LLVMValueRef) {
	C.LLVMInstructionRemoveFromParent(inst)
}

fn C.LLVMInstructionEraseFromParent(inst types.LLVMValueRef)
pub fn llvm_instruction_erase_from_parent(inst types.LLVMValueRef) {
	C.LLVMInstructionEraseFromParent(inst)
}

fn C.LLVMGetInstructionOpcode(inst types.LLVMValueRef) LLVMOpcode
pub fn llvm_get_instruction_opcode(inst types.LLVMValueRef) LLVMOpcode {
	return C.LLVMGetInstructionOpcode(inst)
}

fn C.LLVMGetICmpPredicate(inst types.LLVMValueRef) LLVMIntPredicate
pub fn llvm_geti_cmp_predicate(inst types.LLVMValueRef) LLVMIntPredicate {
	return C.LLVMGetICmpPredicate(inst)
}

fn C.LLVMGetFCmpPredicate(inst types.LLVMValueRef) LLVMRealPredicate
pub fn llvm_getf_cmp_predicate(inst types.LLVMValueRef) LLVMRealPredicate {
	return C.LLVMGetFCmpPredicate(inst)
}

fn C.LLVMInstructionClone(inst types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_instruction_clone(inst types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMInstructionClone(inst)
}

fn C.LLVMIsATerminatorInst(inst types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_isa_terminator_inst(inst types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMIsATerminatorInst(inst)
}

fn C.LLVMGetNumArgOperands(instr types.LLVMValueRef) u32
pub fn llvm_get_num_arg_operands(instr types.LLVMValueRef) u32 {
	return C.LLVMGetNumArgOperands(instr)
}

fn C.LLVMSetInstructionCallConv(instr types.LLVMValueRef, cc u32)
pub fn llvm_set_instruction_call_conv(instr types.LLVMValueRef, cc u32) {
	C.LLVMSetInstructionCallConv(instr, cc)
}

fn C.LLVMGetInstructionCallConv(instr types.LLVMValueRef) u32
pub fn llvm_get_instruction_call_conv(instr types.LLVMValueRef) u32 {
	return C.LLVMGetInstructionCallConv(instr)
}

fn C.LLVMSetInstrParamAlignment(instr types.LLVMValueRef, idx LLVMAttributeIndex, align u32)
pub fn llvm_set_instr_param_alignment(instr types.LLVMValueRef, idx LLVMAttributeIndex, align u32) {
	C.LLVMSetInstrParamAlignment(instr, idx, align)
}

fn C.LLVMAddCallSiteAttribute(c types.LLVMValueRef, idx LLVMAttributeIndex, a types.LLVMAttributeRef)
pub fn llvm_add_call_site_attribute(c types.LLVMValueRef, idx LLVMAttributeIndex, a types.LLVMAttributeRef) {
	C.LLVMAddCallSiteAttribute(c, idx, a)
}

fn C.LLVMGetCallSiteAttributeCount(c types.LLVMValueRef, idx LLVMAttributeIndex) u32
pub fn llvm_get_call_site_attribute_count(c types.LLVMValueRef, idx LLVMAttributeIndex) u32 {
	return C.LLVMGetCallSiteAttributeCount(c, idx)
}

fn C.LLVMGetCallSiteAttributes(c types.LLVMValueRef, idx LLVMAttributeIndex, attrs &types.LLVMAttributeRef)
pub fn llvm_get_call_site_attributes(c types.LLVMValueRef, idx LLVMAttributeIndex, attrs &types.LLVMAttributeRef) {
	C.LLVMGetCallSiteAttributes(c, idx, attrs)
}

fn C.LLVMGetCallSiteEnumAttribute(c types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32) types.LLVMAttributeRef
pub fn llvm_get_call_site_enum_attribute(c types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32) types.LLVMAttributeRef {
	return C.LLVMGetCallSiteEnumAttribute(c, idx, kindid)
}

fn C.LLVMGetCallSiteStringAttribute(c types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32) types.LLVMAttributeRef
pub fn llvm_get_call_site_string_attribute(c types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32) types.LLVMAttributeRef {
	return C.LLVMGetCallSiteStringAttribute(c, idx, k, k_len)
}

fn C.LLVMRemoveCallSiteEnumAttribute(c types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32)
pub fn llvm_remove_call_site_enum_attribute(c types.LLVMValueRef, idx LLVMAttributeIndex, kindid u32) {
	C.LLVMRemoveCallSiteEnumAttribute(c, idx, kindid)
}

fn C.LLVMRemoveCallSiteStringAttribute(c types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32)
pub fn llvm_remove_call_site_string_attribute(c types.LLVMValueRef, idx LLVMAttributeIndex, k &i8, k_len u32) {
	C.LLVMRemoveCallSiteStringAttribute(c, idx, k, k_len)
}

fn C.LLVMGetCalledFunctionType(c types.LLVMValueRef) types.LLVMTypeRef
pub fn llvm_get_called_function_type(c types.LLVMValueRef) types.LLVMTypeRef {
	return C.LLVMGetCalledFunctionType(c)
}

fn C.LLVMGetCalledValue(instr types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_called_value(instr types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetCalledValue(instr)
}

fn C.LLVMIsTailCall(call_inst types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_tail_call(call_inst types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsTailCall(call_inst)
}

fn C.LLVMSetTailCall(call_inst types.LLVMValueRef, is_tail_call types.LLVMBool)
pub fn llvm_set_tail_call(call_inst types.LLVMValueRef, is_tail_call types.LLVMBool) {
	C.LLVMSetTailCall(call_inst, is_tail_call)
}

fn C.LLVMGetNormalDest(invoke_inst types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_normal_dest(invoke_inst types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetNormalDest(invoke_inst)
}

fn C.LLVMGetUnwindDest(invoke_inst types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_unwind_dest(invoke_inst types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetUnwindDest(invoke_inst)
}

fn C.LLVMSetNormalDest(invoke_inst types.LLVMValueRef, b types.LLVMBasicBlockRef)
pub fn llvm_set_normal_dest(invoke_inst types.LLVMValueRef, b types.LLVMBasicBlockRef) {
	C.LLVMSetNormalDest(invoke_inst, b)
}

fn C.LLVMSetUnwindDest(invoke_inst types.LLVMValueRef, b types.LLVMBasicBlockRef)
pub fn llvm_set_unwind_dest(invoke_inst types.LLVMValueRef, b types.LLVMBasicBlockRef) {
	C.LLVMSetUnwindDest(invoke_inst, b)
}

fn C.LLVMGetNumSuccessors(term types.LLVMValueRef) u32
pub fn llvm_get_num_successors(term types.LLVMValueRef) u32 {
	return C.LLVMGetNumSuccessors(term)
}

fn C.LLVMGetSuccessor(term types.LLVMValueRef, i u32) types.LLVMBasicBlockRef
pub fn llvm_get_successor(term types.LLVMValueRef, i u32) types.LLVMBasicBlockRef {
	return C.LLVMGetSuccessor(term, i)
}

fn C.LLVMSetSuccessor(term types.LLVMValueRef, i u32, block types.LLVMBasicBlockRef)
pub fn llvm_set_successor(term types.LLVMValueRef, i u32, block types.LLVMBasicBlockRef) {
	C.LLVMSetSuccessor(term, i, block)
}

fn C.LLVMIsConditional(branch types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_conditional(branch types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsConditional(branch)
}

fn C.LLVMGetCondition(branch types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_condition(branch types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetCondition(branch)
}

fn C.LLVMSetCondition(branch types.LLVMValueRef, cond types.LLVMValueRef)
pub fn llvm_set_condition(branch types.LLVMValueRef, cond types.LLVMValueRef) {
	C.LLVMSetCondition(branch, cond)
}

fn C.LLVMGetSwitchDefaultDest(switch_instr types.LLVMValueRef) types.LLVMBasicBlockRef
pub fn llvm_get_switch_default_dest(switch_instr types.LLVMValueRef) types.LLVMBasicBlockRef {
	return C.LLVMGetSwitchDefaultDest(switch_instr)
}

fn C.LLVMGetAllocatedType(alloca types.LLVMValueRef) types.LLVMTypeRef
pub fn llvm_get_allocated_type(alloca types.LLVMValueRef) types.LLVMTypeRef {
	return C.LLVMGetAllocatedType(alloca)
}

fn C.LLVMIsInBounds(gep types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_in_bounds(gep types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsInBounds(gep)
}

fn C.LLVMSetIsInBounds(gep types.LLVMValueRef, in_bounds types.LLVMBool)
pub fn llvm_set_is_in_bounds(gep types.LLVMValueRef, in_bounds types.LLVMBool) {
	C.LLVMSetIsInBounds(gep, in_bounds)
}

fn C.LLVMGetGEPSourceElementType(gep types.LLVMValueRef) types.LLVMTypeRef
pub fn llvm_getgep_source_element_type(gep types.LLVMValueRef) types.LLVMTypeRef {
	return C.LLVMGetGEPSourceElementType(gep)
}

fn C.LLVMAddIncoming(phi_node types.LLVMValueRef, incoming_values &types.LLVMValueRef, incoming_blocks &types.LLVMBasicBlockRef, count u32)
pub fn llvm_add_incoming(phi_node types.LLVMValueRef, incoming_values &types.LLVMValueRef, incoming_blocks &types.LLVMBasicBlockRef, count u32) {
	C.LLVMAddIncoming(phi_node, incoming_values, incoming_blocks, count)
}

fn C.LLVMCountIncoming(phi_node types.LLVMValueRef) u32
pub fn llvm_count_incoming(phi_node types.LLVMValueRef) u32 {
	return C.LLVMCountIncoming(phi_node)
}

fn C.LLVMGetIncomingValue(phi_node types.LLVMValueRef, index u32) types.LLVMValueRef
pub fn llvm_get_incoming_value(phi_node types.LLVMValueRef, index u32) types.LLVMValueRef {
	return C.LLVMGetIncomingValue(phi_node, index)
}

fn C.LLVMGetIncomingBlock(phi_node types.LLVMValueRef, index u32) types.LLVMBasicBlockRef
pub fn llvm_get_incoming_block(phi_node types.LLVMValueRef, index u32) types.LLVMBasicBlockRef {
	return C.LLVMGetIncomingBlock(phi_node, index)
}

fn C.LLVMGetNumIndices(inst types.LLVMValueRef) u32
pub fn llvm_get_num_indices(inst types.LLVMValueRef) u32 {
	return C.LLVMGetNumIndices(inst)
}

fn C.LLVMGetIndices(inst types.LLVMValueRef) &u32
pub fn llvm_get_indices(inst types.LLVMValueRef) &u32 {
	return C.LLVMGetIndices(inst)
}

fn C.LLVMCreateBuilderInContext(c types.LLVMContextRef) types.LLVMBuilderRef
pub fn llvm_create_builder_in_context(c types.LLVMContextRef) types.LLVMBuilderRef {
	return C.LLVMCreateBuilderInContext(c)
}

fn C.LLVMCreateBuilder() types.LLVMBuilderRef
pub fn llvm_create_builder() types.LLVMBuilderRef {
	return C.LLVMCreateBuilder()
}

fn C.LLVMPositionBuilder(builder types.LLVMBuilderRef, block types.LLVMBasicBlockRef, instr types.LLVMValueRef)
pub fn llvm_position_builder(builder types.LLVMBuilderRef, block types.LLVMBasicBlockRef, instr types.LLVMValueRef) {
	C.LLVMPositionBuilder(builder, block, instr)
}

fn C.LLVMPositionBuilderBefore(builder types.LLVMBuilderRef, instr types.LLVMValueRef)
pub fn llvm_position_builder_before(builder types.LLVMBuilderRef, instr types.LLVMValueRef) {
	C.LLVMPositionBuilderBefore(builder, instr)
}

fn C.LLVMPositionBuilderAtEnd(builder types.LLVMBuilderRef, block types.LLVMBasicBlockRef)
pub fn llvm_position_builder_at_end(builder types.LLVMBuilderRef, block types.LLVMBasicBlockRef) {
	C.LLVMPositionBuilderAtEnd(builder, block)
}

fn C.LLVMGetInsertBlock(builder types.LLVMBuilderRef) types.LLVMBasicBlockRef
pub fn llvm_get_insert_block(builder types.LLVMBuilderRef) types.LLVMBasicBlockRef {
	return C.LLVMGetInsertBlock(builder)
}

fn C.LLVMClearInsertionPosition(builder types.LLVMBuilderRef)
pub fn llvm_clear_insertion_position(builder types.LLVMBuilderRef) {
	C.LLVMClearInsertionPosition(builder)
}

fn C.LLVMInsertIntoBuilder(builder types.LLVMBuilderRef, instr types.LLVMValueRef)
pub fn llvm_insert_into_builder(builder types.LLVMBuilderRef, instr types.LLVMValueRef) {
	C.LLVMInsertIntoBuilder(builder, instr)
}

fn C.LLVMInsertIntoBuilderWithName(builder types.LLVMBuilderRef, instr types.LLVMValueRef, name &i8)
pub fn llvm_insert_into_builder_with_name(builder types.LLVMBuilderRef, instr types.LLVMValueRef, name &i8) {
	C.LLVMInsertIntoBuilderWithName(builder, instr, name)
}

fn C.LLVMDisposeBuilder(builder types.LLVMBuilderRef)
pub fn llvm_dispose_builder(builder types.LLVMBuilderRef) {
	C.LLVMDisposeBuilder(builder)
}

fn C.LLVMGetCurrentDebugLocation2(builder types.LLVMBuilderRef) types.LLVMMetadataRef
pub fn llvm_get_current_debug_location2(builder types.LLVMBuilderRef) types.LLVMMetadataRef {
	return C.LLVMGetCurrentDebugLocation2(builder)
}

fn C.LLVMSetCurrentDebugLocation2(builder types.LLVMBuilderRef, loc types.LLVMMetadataRef)
pub fn llvm_set_current_debug_location2(builder types.LLVMBuilderRef, loc types.LLVMMetadataRef) {
	C.LLVMSetCurrentDebugLocation2(builder, loc)
}

fn C.LLVMSetInstDebugLocation(builder types.LLVMBuilderRef, inst types.LLVMValueRef)
pub fn llvm_set_inst_debug_location(builder types.LLVMBuilderRef, inst types.LLVMValueRef) {
	C.LLVMSetInstDebugLocation(builder, inst)
}

fn C.LLVMAddMetadataToInst(builder types.LLVMBuilderRef, inst types.LLVMValueRef)
pub fn llvm_add_metadata_to_inst(builder types.LLVMBuilderRef, inst types.LLVMValueRef) {
	C.LLVMAddMetadataToInst(builder, inst)
}

fn C.LLVMBuilderGetDefaultFPMathTag(builder types.LLVMBuilderRef) types.LLVMMetadataRef
pub fn llvm_builder_get_defaultfp_math_tag(builder types.LLVMBuilderRef) types.LLVMMetadataRef {
	return C.LLVMBuilderGetDefaultFPMathTag(builder)
}

fn C.LLVMBuilderSetDefaultFPMathTag(builder types.LLVMBuilderRef, fp_math_tag types.LLVMMetadataRef)
pub fn llvm_builder_set_defaultfp_math_tag(builder types.LLVMBuilderRef, fp_math_tag types.LLVMMetadataRef) {
	C.LLVMBuilderSetDefaultFPMathTag(builder, fp_math_tag)
}

fn C.LLVMSetCurrentDebugLocation(builder types.LLVMBuilderRef, l types.LLVMValueRef)
pub fn llvm_set_current_debug_location(builder types.LLVMBuilderRef, l types.LLVMValueRef) {
	C.LLVMSetCurrentDebugLocation(builder, l)
}

fn C.LLVMGetCurrentDebugLocation(builder types.LLVMBuilderRef) types.LLVMValueRef
pub fn llvm_get_current_debug_location(builder types.LLVMBuilderRef) types.LLVMValueRef {
	return C.LLVMGetCurrentDebugLocation(builder)
}

fn C.LLVMBuildRetVoid(llvm_builder_ref_ types.LLVMBuilderRef) types.LLVMValueRef
pub fn llvm_build_ret_void(llvm_builder_ref_ types.LLVMBuilderRef) types.LLVMValueRef {
	return C.LLVMBuildRetVoid(llvm_builder_ref_)
}

fn C.LLVMBuildRet(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_build_ret(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMBuildRet(llvm_builder_ref_, v)
}

fn C.LLVMBuildAggregateRet(llvm_builder_ref_ types.LLVMBuilderRef, ret_vals &types.LLVMValueRef, n u32) types.LLVMValueRef
pub fn llvm_build_aggregate_ret(llvm_builder_ref_ types.LLVMBuilderRef, ret_vals &types.LLVMValueRef, n u32) types.LLVMValueRef {
	return C.LLVMBuildAggregateRet(llvm_builder_ref_, ret_vals, n)
}

fn C.LLVMBuildBr(llvm_builder_ref_ types.LLVMBuilderRef, dest types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_build_br(llvm_builder_ref_ types.LLVMBuilderRef, dest types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMBuildBr(llvm_builder_ref_, dest)
}

fn C.LLVMBuildCondBr(llvm_builder_ref_ types.LLVMBuilderRef, if_ types.LLVMValueRef, then types.LLVMBasicBlockRef, else_ types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_build_cond_br(llvm_builder_ref_ types.LLVMBuilderRef, if_ types.LLVMValueRef, then types.LLVMBasicBlockRef, else_ types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMBuildCondBr(llvm_builder_ref_, if_, then, else_)
}

fn C.LLVMBuildSwitch(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, else_ types.LLVMBasicBlockRef, num_cases u32) types.LLVMValueRef
pub fn llvm_build_switch(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, else_ types.LLVMBasicBlockRef, num_cases u32) types.LLVMValueRef {
	return C.LLVMBuildSwitch(llvm_builder_ref_, v, else_, num_cases)
}

fn C.LLVMBuildIndirectBr(b types.LLVMBuilderRef, addr types.LLVMValueRef, num_dests u32) types.LLVMValueRef
pub fn llvm_build_indirect_br(b types.LLVMBuilderRef, addr types.LLVMValueRef, num_dests u32) types.LLVMValueRef {
	return C.LLVMBuildIndirectBr(b, addr, num_dests)
}

fn C.LLVMBuildInvoke2(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, fn_ types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, then types.LLVMBasicBlockRef, catch types.LLVMBasicBlockRef, name &i8) types.LLVMValueRef
pub fn llvm_build_invoke2(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, fn_ types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, then types.LLVMBasicBlockRef, catch types.LLVMBasicBlockRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildInvoke2(llvm_builder_ref_, ty, fn_, args, num_args, then, catch,
		name)
}

fn C.LLVMBuildUnreachable(llvm_builder_ref_ types.LLVMBuilderRef) types.LLVMValueRef
pub fn llvm_build_unreachable(llvm_builder_ref_ types.LLVMBuilderRef) types.LLVMValueRef {
	return C.LLVMBuildUnreachable(llvm_builder_ref_)
}

fn C.LLVMBuildResume(b types.LLVMBuilderRef, exn types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_build_resume(b types.LLVMBuilderRef, exn types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMBuildResume(b, exn)
}

fn C.LLVMBuildLandingPad(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pers_fn types.LLVMValueRef, num_clauses u32, name &i8) types.LLVMValueRef
pub fn llvm_build_landing_pad(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pers_fn types.LLVMValueRef, num_clauses u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildLandingPad(b, ty, pers_fn, num_clauses, name)
}

fn C.LLVMBuildCleanupRet(b types.LLVMBuilderRef, catch_pad types.LLVMValueRef, bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_build_cleanup_ret(b types.LLVMBuilderRef, catch_pad types.LLVMValueRef, bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMBuildCleanupRet(b, catch_pad, bb)
}

fn C.LLVMBuildCatchRet(b types.LLVMBuilderRef, catch_pad types.LLVMValueRef, bb types.LLVMBasicBlockRef) types.LLVMValueRef
pub fn llvm_build_catch_ret(b types.LLVMBuilderRef, catch_pad types.LLVMValueRef, bb types.LLVMBasicBlockRef) types.LLVMValueRef {
	return C.LLVMBuildCatchRet(b, catch_pad, bb)
}

fn C.LLVMBuildCatchPad(b types.LLVMBuilderRef, parent_pad types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, name &i8) types.LLVMValueRef
pub fn llvm_build_catch_pad(b types.LLVMBuilderRef, parent_pad types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildCatchPad(b, parent_pad, args, num_args, name)
}

fn C.LLVMBuildCleanupPad(b types.LLVMBuilderRef, parent_pad types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, name &i8) types.LLVMValueRef
pub fn llvm_build_cleanup_pad(b types.LLVMBuilderRef, parent_pad types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildCleanupPad(b, parent_pad, args, num_args, name)
}

fn C.LLVMBuildCatchSwitch(b types.LLVMBuilderRef, parent_pad types.LLVMValueRef, unwindbb types.LLVMBasicBlockRef, num_handlers u32, name &i8) types.LLVMValueRef
pub fn llvm_build_catch_switch(b types.LLVMBuilderRef, parent_pad types.LLVMValueRef, unwindbb types.LLVMBasicBlockRef, num_handlers u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildCatchSwitch(b, parent_pad, unwindbb, num_handlers, name)
}

fn C.LLVMAddCase(switch types.LLVMValueRef, on_val types.LLVMValueRef, dest types.LLVMBasicBlockRef)
pub fn llvm_add_case(switch types.LLVMValueRef, on_val types.LLVMValueRef, dest types.LLVMBasicBlockRef) {
	C.LLVMAddCase(switch, on_val, dest)
}

fn C.LLVMAddDestination(indirect_br types.LLVMValueRef, dest types.LLVMBasicBlockRef)
pub fn llvm_add_destination(indirect_br types.LLVMValueRef, dest types.LLVMBasicBlockRef) {
	C.LLVMAddDestination(indirect_br, dest)
}

fn C.LLVMGetNumClauses(landing_pad types.LLVMValueRef) u32
pub fn llvm_get_num_clauses(landing_pad types.LLVMValueRef) u32 {
	return C.LLVMGetNumClauses(landing_pad)
}

fn C.LLVMGetClause(landing_pad types.LLVMValueRef, idx u32) types.LLVMValueRef
pub fn llvm_get_clause(landing_pad types.LLVMValueRef, idx u32) types.LLVMValueRef {
	return C.LLVMGetClause(landing_pad, idx)
}

fn C.LLVMAddClause(landing_pad types.LLVMValueRef, clause_val types.LLVMValueRef)
pub fn llvm_add_clause(landing_pad types.LLVMValueRef, clause_val types.LLVMValueRef) {
	C.LLVMAddClause(landing_pad, clause_val)
}

fn C.LLVMIsCleanup(landing_pad types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_cleanup(landing_pad types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsCleanup(landing_pad)
}

fn C.LLVMSetCleanup(landing_pad types.LLVMValueRef, val types.LLVMBool)
pub fn llvm_set_cleanup(landing_pad types.LLVMValueRef, val types.LLVMBool) {
	C.LLVMSetCleanup(landing_pad, val)
}

fn C.LLVMAddHandler(catch_switch types.LLVMValueRef, dest types.LLVMBasicBlockRef)
pub fn llvm_add_handler(catch_switch types.LLVMValueRef, dest types.LLVMBasicBlockRef) {
	C.LLVMAddHandler(catch_switch, dest)
}

fn C.LLVMGetNumHandlers(catch_switch types.LLVMValueRef) u32
pub fn llvm_get_num_handlers(catch_switch types.LLVMValueRef) u32 {
	return C.LLVMGetNumHandlers(catch_switch)
}

fn C.LLVMGetHandlers(catch_switch types.LLVMValueRef, handlers &types.LLVMBasicBlockRef)
pub fn llvm_get_handlers(catch_switch types.LLVMValueRef, handlers &types.LLVMBasicBlockRef) {
	C.LLVMGetHandlers(catch_switch, handlers)
}

fn C.LLVMGetArgOperand(funclet types.LLVMValueRef, i u32) types.LLVMValueRef
pub fn llvm_get_arg_operand(funclet types.LLVMValueRef, i u32) types.LLVMValueRef {
	return C.LLVMGetArgOperand(funclet, i)
}

fn C.LLVMSetArgOperand(funclet types.LLVMValueRef, i u32, value types.LLVMValueRef)
pub fn llvm_set_arg_operand(funclet types.LLVMValueRef, i u32, value types.LLVMValueRef) {
	C.LLVMSetArgOperand(funclet, i, value)
}

fn C.LLVMGetParentCatchSwitch(catch_pad types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_get_parent_catch_switch(catch_pad types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMGetParentCatchSwitch(catch_pad)
}

fn C.LLVMSetParentCatchSwitch(catch_pad types.LLVMValueRef, catch_switch types.LLVMValueRef)
pub fn llvm_set_parent_catch_switch(catch_pad types.LLVMValueRef, catch_switch types.LLVMValueRef) {
	C.LLVMSetParentCatchSwitch(catch_pad, catch_switch)
}

fn C.LLVMBuildAdd(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_add(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildAdd(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildNSWAdd(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnsw_add(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNSWAdd(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildNUWAdd(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnuw_add(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNUWAdd(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildFAdd(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_add(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFAdd(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildSub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_sub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSub(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildNSWSub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnsw_sub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNSWSub(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildNUWSub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnuw_sub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNUWSub(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildFSub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_sub(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFSub(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildMul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_mul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildMul(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildNSWMul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnsw_mul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNSWMul(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildNUWMul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnuw_mul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNUWMul(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildFMul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_mul(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFMul(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildUDiv(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildu_div(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildUDiv(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildExactUDiv(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_exactu_div(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildExactUDiv(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildSDiv(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_builds_div(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSDiv(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildExactSDiv(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_exacts_div(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildExactSDiv(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildFDiv(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_div(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFDiv(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildURem(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildu_rem(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildURem(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildSRem(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_builds_rem(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSRem(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildFRem(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_rem(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFRem(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildShl(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_shl(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildShl(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildLShr(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildl_shr(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildLShr(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildAShr(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_builda_shr(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildAShr(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildAnd(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_and(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildAnd(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildOr(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_or(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildOr(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildXor(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_xor(llvm_builder_ref_ types.LLVMBuilderRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildXor(llvm_builder_ref_, lhs, rhs, name)
}

fn C.LLVMBuildBinOp(b types.LLVMBuilderRef, op LLVMOpcode, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_bin_op(b types.LLVMBuilderRef, op LLVMOpcode, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildBinOp(b, op, lhs, rhs, name)
}

fn C.LLVMBuildNeg(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_neg(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNeg(llvm_builder_ref_, v, name)
}

fn C.LLVMBuildNSWNeg(b types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnsw_neg(b types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNSWNeg(b, v, name)
}

fn C.LLVMBuildNUWNeg(b types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildnuw_neg(b types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNUWNeg(b, v, name)
}

fn C.LLVMBuildFNeg(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_neg(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFNeg(llvm_builder_ref_, v, name)
}

fn C.LLVMBuildNot(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_not(llvm_builder_ref_ types.LLVMBuilderRef, v types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildNot(llvm_builder_ref_, v, name)
}

fn C.LLVMBuildMalloc(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_malloc(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildMalloc(llvm_builder_ref_, ty, name)
}

fn C.LLVMBuildArrayMalloc(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_array_malloc(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildArrayMalloc(llvm_builder_ref_, ty, val, name)
}

fn C.LLVMBuildMemSet(b types.LLVMBuilderRef, ptr types.LLVMValueRef, val types.LLVMValueRef, len types.LLVMValueRef, align u32) types.LLVMValueRef
pub fn llvm_build_mem_set(b types.LLVMBuilderRef, ptr types.LLVMValueRef, val types.LLVMValueRef, len types.LLVMValueRef, align u32) types.LLVMValueRef {
	return C.LLVMBuildMemSet(b, ptr, val, len, align)
}

fn C.LLVMBuildMemCpy(b types.LLVMBuilderRef, dst types.LLVMValueRef, dst_align u32, src types.LLVMValueRef, src_align u32, size types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_build_mem_cpy(b types.LLVMBuilderRef, dst types.LLVMValueRef, dst_align u32, src types.LLVMValueRef, src_align u32, size types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMBuildMemCpy(b, dst, dst_align, src, src_align, size)
}

fn C.LLVMBuildMemMove(b types.LLVMBuilderRef, dst types.LLVMValueRef, dst_align u32, src types.LLVMValueRef, src_align u32, size types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_build_mem_move(b types.LLVMBuilderRef, dst types.LLVMValueRef, dst_align u32, src types.LLVMValueRef, src_align u32, size types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMBuildMemMove(b, dst, dst_align, src, src_align, size)
}

fn C.LLVMBuildAlloca(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_alloca(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildAlloca(llvm_builder_ref_, ty, name)
}

fn C.LLVMBuildArrayAlloca(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_array_alloca(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildArrayAlloca(llvm_builder_ref_, ty, val, name)
}

fn C.LLVMBuildFree(llvm_builder_ref_ types.LLVMBuilderRef, pointer_val types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_build_free(llvm_builder_ref_ types.LLVMBuilderRef, pointer_val types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMBuildFree(llvm_builder_ref_, pointer_val)
}

fn C.LLVMBuildLoad2(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer_val types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_load2(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer_val types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildLoad2(llvm_builder_ref_, ty, pointer_val, name)
}

fn C.LLVMBuildStore(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, ptr types.LLVMValueRef) types.LLVMValueRef
pub fn llvm_build_store(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, ptr types.LLVMValueRef) types.LLVMValueRef {
	return C.LLVMBuildStore(llvm_builder_ref_, val, ptr)
}

fn C.LLVMBuildGEP2(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer types.LLVMValueRef, indices &types.LLVMValueRef, num_indices u32, name &i8) types.LLVMValueRef
pub fn llvm_buildge_p2(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer types.LLVMValueRef, indices &types.LLVMValueRef, num_indices u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildGEP2(b, ty, pointer, indices, num_indices, name)
}

fn C.LLVMBuildInBoundsGEP2(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer types.LLVMValueRef, indices &types.LLVMValueRef, num_indices u32, name &i8) types.LLVMValueRef
pub fn llvm_build_in_boundsge_p2(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer types.LLVMValueRef, indices &types.LLVMValueRef, num_indices u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildInBoundsGEP2(b, ty, pointer, indices, num_indices, name)
}

fn C.LLVMBuildStructGEP2(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer types.LLVMValueRef, idx u32, name &i8) types.LLVMValueRef
pub fn llvm_build_structge_p2(b types.LLVMBuilderRef, ty types.LLVMTypeRef, pointer types.LLVMValueRef, idx u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildStructGEP2(b, ty, pointer, idx, name)
}

fn C.LLVMBuildGlobalString(b types.LLVMBuilderRef, str &i8, name &i8) types.LLVMValueRef
pub fn llvm_build_global_string(b types.LLVMBuilderRef, str &i8, name &i8) types.LLVMValueRef {
	return C.LLVMBuildGlobalString(b, str, name)
}

fn C.LLVMBuildGlobalStringPtr(b types.LLVMBuilderRef, str &i8, name &i8) types.LLVMValueRef
pub fn llvm_build_global_string_ptr(b types.LLVMBuilderRef, str &i8, name &i8) types.LLVMValueRef {
	return C.LLVMBuildGlobalStringPtr(b, str, name)
}

fn C.LLVMGetVolatile(memory_access_inst types.LLVMValueRef) types.LLVMBool
pub fn llvm_get_volatile(memory_access_inst types.LLVMValueRef) types.LLVMBool {
	return C.LLVMGetVolatile(memory_access_inst)
}

fn C.LLVMSetVolatile(memory_access_inst types.LLVMValueRef, is_volatile types.LLVMBool)
pub fn llvm_set_volatile(memory_access_inst types.LLVMValueRef, is_volatile types.LLVMBool) {
	C.LLVMSetVolatile(memory_access_inst, is_volatile)
}

fn C.LLVMGetWeak(cmp_xchg_inst types.LLVMValueRef) types.LLVMBool
pub fn llvm_get_weak(cmp_xchg_inst types.LLVMValueRef) types.LLVMBool {
	return C.LLVMGetWeak(cmp_xchg_inst)
}

fn C.LLVMSetWeak(cmp_xchg_inst types.LLVMValueRef, is_weak types.LLVMBool)
pub fn llvm_set_weak(cmp_xchg_inst types.LLVMValueRef, is_weak types.LLVMBool) {
	C.LLVMSetWeak(cmp_xchg_inst, is_weak)
}

fn C.LLVMGetOrdering(memory_access_inst types.LLVMValueRef) LLVMAtomicOrdering
pub fn llvm_get_ordering(memory_access_inst types.LLVMValueRef) LLVMAtomicOrdering {
	return C.LLVMGetOrdering(memory_access_inst)
}

fn C.LLVMSetOrdering(memory_access_inst types.LLVMValueRef, ordering LLVMAtomicOrdering)
pub fn llvm_set_ordering(memory_access_inst types.LLVMValueRef, ordering LLVMAtomicOrdering) {
	C.LLVMSetOrdering(memory_access_inst, ordering)
}

fn C.LLVMGetAtomicRMWBinOp(atomicrmw_inst types.LLVMValueRef) LLVMAtomicRMWBinOp
pub fn llvm_get_atomicrmw_bin_op(atomicrmw_inst types.LLVMValueRef) LLVMAtomicRMWBinOp {
	return C.LLVMGetAtomicRMWBinOp(atomicrmw_inst)
}

fn C.LLVMSetAtomicRMWBinOp(atomicrmw_inst types.LLVMValueRef, bin_op LLVMAtomicRMWBinOp)
pub fn llvm_set_atomicrmw_bin_op(atomicrmw_inst types.LLVMValueRef, bin_op LLVMAtomicRMWBinOp) {
	C.LLVMSetAtomicRMWBinOp(atomicrmw_inst, bin_op)
}

fn C.LLVMBuildTrunc(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_trunc(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildTrunc(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildZExt(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildz_ext(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildZExt(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildSExt(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_builds_ext(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSExt(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildFPToUI(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildfp_toui(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFPToUI(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildFPToSI(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildfp_tosi(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFPToSI(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildUIToFP(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildui_tofp(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildUIToFP(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildSIToFP(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildsi_tofp(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSIToFP(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildFPTrunc(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildfp_trunc(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFPTrunc(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildFPExt(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildfp_ext(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFPExt(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildPtrToInt(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_ptr_to_int(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildPtrToInt(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildIntToPtr(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_int_to_ptr(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildIntToPtr(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildBitCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_bit_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildBitCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildAddrSpaceCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_addr_space_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildAddrSpaceCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildZExtOrBitCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildz_ext_or_bit_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildZExtOrBitCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildSExtOrBitCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_builds_ext_or_bit_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSExtOrBitCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildTruncOrBitCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_trunc_or_bit_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildTruncOrBitCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildCast(b types.LLVMBuilderRef, op LLVMOpcode, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_cast(b types.LLVMBuilderRef, op LLVMOpcode, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildCast(b, op, val, dest_ty, name)
}

fn C.LLVMBuildPointerCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_pointer_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildPointerCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildIntCast2(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, is_signed types.LLVMBool, name &i8) types.LLVMValueRef
pub fn llvm_build_int_cast2(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, is_signed types.LLVMBool, name &i8) types.LLVMValueRef {
	return C.LLVMBuildIntCast2(llvm_builder_ref_, val, dest_ty, is_signed, name)
}

fn C.LLVMBuildFPCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildfp_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFPCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildIntCast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_int_cast(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, dest_ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildIntCast(llvm_builder_ref_, val, dest_ty, name)
}

fn C.LLVMBuildICmp(llvm_builder_ref_ types.LLVMBuilderRef, op LLVMIntPredicate, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildi_cmp(llvm_builder_ref_ types.LLVMBuilderRef, op LLVMIntPredicate, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildICmp(llvm_builder_ref_, op, lhs, rhs, name)
}

fn C.LLVMBuildFCmp(llvm_builder_ref_ types.LLVMBuilderRef, op LLVMRealPredicate, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_buildf_cmp(llvm_builder_ref_ types.LLVMBuilderRef, op LLVMRealPredicate, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFCmp(llvm_builder_ref_, op, lhs, rhs, name)
}

fn C.LLVMBuildPhi(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_build_phi(llvm_builder_ref_ types.LLVMBuilderRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildPhi(llvm_builder_ref_, ty, name)
}

fn C.LLVMBuildCall2(llvm_builder_ref_ types.LLVMBuilderRef, llvm_type_ref_ types.LLVMTypeRef, fn_ types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, name &i8) types.LLVMValueRef
pub fn llvm_build_call2(llvm_builder_ref_ types.LLVMBuilderRef, llvm_type_ref_ types.LLVMTypeRef, fn_ types.LLVMValueRef, args &types.LLVMValueRef, num_args u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildCall2(llvm_builder_ref_, llvm_type_ref_, fn_, args, num_args, name)
}

fn C.LLVMBuildSelect(llvm_builder_ref_ types.LLVMBuilderRef, if_ types.LLVMValueRef, then types.LLVMValueRef, else_ types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_select(llvm_builder_ref_ types.LLVMBuilderRef, if_ types.LLVMValueRef, then types.LLVMValueRef, else_ types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildSelect(llvm_builder_ref_, if_, then, else_, name)
}

fn C.LLVMBuildVAArg(llvm_builder_ref_ types.LLVMBuilderRef, list types.LLVMValueRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef
pub fn llvm_buildva_arg(llvm_builder_ref_ types.LLVMBuilderRef, list types.LLVMValueRef, ty types.LLVMTypeRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildVAArg(llvm_builder_ref_, list, ty, name)
}

fn C.LLVMBuildExtractElement(llvm_builder_ref_ types.LLVMBuilderRef, vec_val types.LLVMValueRef, index types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_extract_element(llvm_builder_ref_ types.LLVMBuilderRef, vec_val types.LLVMValueRef, index types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildExtractElement(llvm_builder_ref_, vec_val, index, name)
}

fn C.LLVMBuildInsertElement(llvm_builder_ref_ types.LLVMBuilderRef, vec_val types.LLVMValueRef, elt_val types.LLVMValueRef, index types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_insert_element(llvm_builder_ref_ types.LLVMBuilderRef, vec_val types.LLVMValueRef, elt_val types.LLVMValueRef, index types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildInsertElement(llvm_builder_ref_, vec_val, elt_val, index, name)
}

fn C.LLVMBuildShuffleVector(llvm_builder_ref_ types.LLVMBuilderRef, v1 types.LLVMValueRef, v2 types.LLVMValueRef, mask types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_shuffle_vector(llvm_builder_ref_ types.LLVMBuilderRef, v1 types.LLVMValueRef, v2 types.LLVMValueRef, mask types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildShuffleVector(llvm_builder_ref_, v1, v2, mask, name)
}

fn C.LLVMBuildExtractValue(llvm_builder_ref_ types.LLVMBuilderRef, agg_val types.LLVMValueRef, index u32, name &i8) types.LLVMValueRef
pub fn llvm_build_extract_value(llvm_builder_ref_ types.LLVMBuilderRef, agg_val types.LLVMValueRef, index u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildExtractValue(llvm_builder_ref_, agg_val, index, name)
}

fn C.LLVMBuildInsertValue(llvm_builder_ref_ types.LLVMBuilderRef, agg_val types.LLVMValueRef, elt_val types.LLVMValueRef, index u32, name &i8) types.LLVMValueRef
pub fn llvm_build_insert_value(llvm_builder_ref_ types.LLVMBuilderRef, agg_val types.LLVMValueRef, elt_val types.LLVMValueRef, index u32, name &i8) types.LLVMValueRef {
	return C.LLVMBuildInsertValue(llvm_builder_ref_, agg_val, elt_val, index, name)
}

fn C.LLVMBuildFreeze(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_freeze(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFreeze(llvm_builder_ref_, val, name)
}

fn C.LLVMBuildIsNull(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_is_null(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildIsNull(llvm_builder_ref_, val, name)
}

fn C.LLVMBuildIsNotNull(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_is_not_null(llvm_builder_ref_ types.LLVMBuilderRef, val types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildIsNotNull(llvm_builder_ref_, val, name)
}

fn C.LLVMBuildPtrDiff2(llvm_builder_ref_ types.LLVMBuilderRef, elem_ty types.LLVMTypeRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef
pub fn llvm_build_ptr_diff2(llvm_builder_ref_ types.LLVMBuilderRef, elem_ty types.LLVMTypeRef, lhs types.LLVMValueRef, rhs types.LLVMValueRef, name &i8) types.LLVMValueRef {
	return C.LLVMBuildPtrDiff2(llvm_builder_ref_, elem_ty, lhs, rhs, name)
}

fn C.LLVMBuildFence(b types.LLVMBuilderRef, ordering LLVMAtomicOrdering, single_thread types.LLVMBool, name &i8) types.LLVMValueRef
pub fn llvm_build_fence(b types.LLVMBuilderRef, ordering LLVMAtomicOrdering, single_thread types.LLVMBool, name &i8) types.LLVMValueRef {
	return C.LLVMBuildFence(b, ordering, single_thread, name)
}

fn C.LLVMBuildAtomicRMW(b types.LLVMBuilderRef, op LLVMAtomicRMWBinOp, ptr types.LLVMValueRef, val types.LLVMValueRef, ordering LLVMAtomicOrdering, single_thread types.LLVMBool) types.LLVMValueRef
pub fn llvm_build_atomicrmw(b types.LLVMBuilderRef, op LLVMAtomicRMWBinOp, ptr types.LLVMValueRef, val types.LLVMValueRef, ordering LLVMAtomicOrdering, single_thread types.LLVMBool) types.LLVMValueRef {
	return C.LLVMBuildAtomicRMW(b, op, ptr, val, ordering, single_thread)
}

fn C.LLVMBuildAtomicCmpXchg(b types.LLVMBuilderRef, ptr types.LLVMValueRef, cmp types.LLVMValueRef, new types.LLVMValueRef, success_ordering LLVMAtomicOrdering, failure_ordering LLVMAtomicOrdering, single_thread types.LLVMBool) types.LLVMValueRef
pub fn llvm_build_atomic_cmp_xchg(b types.LLVMBuilderRef, ptr types.LLVMValueRef, cmp types.LLVMValueRef, new types.LLVMValueRef, success_ordering LLVMAtomicOrdering, failure_ordering LLVMAtomicOrdering, single_thread types.LLVMBool) types.LLVMValueRef {
	return C.LLVMBuildAtomicCmpXchg(b, ptr, cmp, new, success_ordering, failure_ordering,
		single_thread)
}

fn C.LLVMGetNumMaskElements(shuffle_vector_inst types.LLVMValueRef) u32
pub fn llvm_get_num_mask_elements(shuffle_vector_inst types.LLVMValueRef) u32 {
	return C.LLVMGetNumMaskElements(shuffle_vector_inst)
}

fn C.LLVMGetUndefMaskElem() int
pub fn llvm_get_undef_mask_elem() int {
	return C.LLVMGetUndefMaskElem()
}

fn C.LLVMGetMaskValue(shuffle_vector_inst types.LLVMValueRef, elt u32) int
pub fn llvm_get_mask_value(shuffle_vector_inst types.LLVMValueRef, elt u32) int {
	return C.LLVMGetMaskValue(shuffle_vector_inst, elt)
}

fn C.LLVMIsAtomicSingleThread(atomic_inst types.LLVMValueRef) types.LLVMBool
pub fn llvm_is_atomic_single_thread(atomic_inst types.LLVMValueRef) types.LLVMBool {
	return C.LLVMIsAtomicSingleThread(atomic_inst)
}

fn C.LLVMSetAtomicSingleThread(atomic_inst types.LLVMValueRef, single_thread types.LLVMBool)
pub fn llvm_set_atomic_single_thread(atomic_inst types.LLVMValueRef, single_thread types.LLVMBool) {
	C.LLVMSetAtomicSingleThread(atomic_inst, single_thread)
}

fn C.LLVMGetCmpXchgSuccessOrdering(cmp_xchg_inst types.LLVMValueRef) LLVMAtomicOrdering
pub fn llvm_get_cmp_xchg_success_ordering(cmp_xchg_inst types.LLVMValueRef) LLVMAtomicOrdering {
	return C.LLVMGetCmpXchgSuccessOrdering(cmp_xchg_inst)
}

fn C.LLVMSetCmpXchgSuccessOrdering(cmp_xchg_inst types.LLVMValueRef, ordering LLVMAtomicOrdering)
pub fn llvm_set_cmp_xchg_success_ordering(cmp_xchg_inst types.LLVMValueRef, ordering LLVMAtomicOrdering) {
	C.LLVMSetCmpXchgSuccessOrdering(cmp_xchg_inst, ordering)
}

fn C.LLVMGetCmpXchgFailureOrdering(cmp_xchg_inst types.LLVMValueRef) LLVMAtomicOrdering
pub fn llvm_get_cmp_xchg_failure_ordering(cmp_xchg_inst types.LLVMValueRef) LLVMAtomicOrdering {
	return C.LLVMGetCmpXchgFailureOrdering(cmp_xchg_inst)
}

fn C.LLVMSetCmpXchgFailureOrdering(cmp_xchg_inst types.LLVMValueRef, ordering LLVMAtomicOrdering)
pub fn llvm_set_cmp_xchg_failure_ordering(cmp_xchg_inst types.LLVMValueRef, ordering LLVMAtomicOrdering) {
	C.LLVMSetCmpXchgFailureOrdering(cmp_xchg_inst, ordering)
}

fn C.LLVMCreateModuleProviderForExistingModule(m types.LLVMModuleRef) types.LLVMModuleProviderRef
pub fn llvm_create_module_provider_for_existing_module(m types.LLVMModuleRef) types.LLVMModuleProviderRef {
	return C.LLVMCreateModuleProviderForExistingModule(m)
}

fn C.LLVMDisposeModuleProvider(m types.LLVMModuleProviderRef)
pub fn llvm_dispose_module_provider(m types.LLVMModuleProviderRef) {
	C.LLVMDisposeModuleProvider(m)
}

fn C.LLVMCreateMemoryBufferWithContentsOfFile(path &i8, out_mem_buf &types.LLVMMemoryBufferRef, out_message &&u8) types.LLVMBool
pub fn llvm_create_memory_buffer_with_contents_of_file(path &i8, out_mem_buf &types.LLVMMemoryBufferRef, out_message &&u8) types.LLVMBool {
	return C.LLVMCreateMemoryBufferWithContentsOfFile(path, out_mem_buf, out_message)
}

fn C.LLVMCreateMemoryBufferWithSTDIN(out_mem_buf &types.LLVMMemoryBufferRef, out_message &&u8) types.LLVMBool
pub fn llvm_create_memory_buffer_withstdin(out_mem_buf &types.LLVMMemoryBufferRef, out_message &&u8) types.LLVMBool {
	return C.LLVMCreateMemoryBufferWithSTDIN(out_mem_buf, out_message)
}

fn C.LLVMCreateMemoryBufferWithMemoryRange(input_data &i8, input_data_length usize, buffer_name &i8, requires_null_terminator types.LLVMBool) types.LLVMMemoryBufferRef
pub fn llvm_create_memory_buffer_with_memory_range(input_data &i8, input_data_length usize, buffer_name &i8, requires_null_terminator types.LLVMBool) types.LLVMMemoryBufferRef {
	return C.LLVMCreateMemoryBufferWithMemoryRange(input_data, input_data_length, buffer_name,
		requires_null_terminator)
}

fn C.LLVMCreateMemoryBufferWithMemoryRangeCopy(input_data &i8, input_data_length usize, buffer_name &i8) types.LLVMMemoryBufferRef
pub fn llvm_create_memory_buffer_with_memory_range_copy(input_data &i8, input_data_length usize, buffer_name &i8) types.LLVMMemoryBufferRef {
	return C.LLVMCreateMemoryBufferWithMemoryRangeCopy(input_data, input_data_length,
		buffer_name)
}

fn C.LLVMGetBufferStart(mem_buf types.LLVMMemoryBufferRef) &i8
pub fn llvm_get_buffer_start(mem_buf types.LLVMMemoryBufferRef) string {
	return unsafe { (&u8(C.LLVMGetBufferStart(mem_buf))).vstring() }
}

fn C.LLVMGetBufferSize(mem_buf types.LLVMMemoryBufferRef) usize
pub fn llvm_get_buffer_size(mem_buf types.LLVMMemoryBufferRef) usize {
	return C.LLVMGetBufferSize(mem_buf)
}

fn C.LLVMDisposeMemoryBuffer(mem_buf types.LLVMMemoryBufferRef)
pub fn llvm_dispose_memory_buffer(mem_buf types.LLVMMemoryBufferRef) {
	C.LLVMDisposeMemoryBuffer(mem_buf)
}

fn C.LLVMGetGlobalPassRegistry() types.LLVMPassRegistryRef
pub fn llvm_get_global_pass_registry() types.LLVMPassRegistryRef {
	return C.LLVMGetGlobalPassRegistry()
}

fn C.LLVMCreatePassManager() types.LLVMPassManagerRef
pub fn llvm_create_pass_manager() types.LLVMPassManagerRef {
	return C.LLVMCreatePassManager()
}

fn C.LLVMCreateFunctionPassManagerForModule(m types.LLVMModuleRef) types.LLVMPassManagerRef
pub fn llvm_create_function_pass_manager_for_module(m types.LLVMModuleRef) types.LLVMPassManagerRef {
	return C.LLVMCreateFunctionPassManagerForModule(m)
}

fn C.LLVMCreateFunctionPassManager(mp types.LLVMModuleProviderRef) types.LLVMPassManagerRef
pub fn llvm_create_function_pass_manager(mp types.LLVMModuleProviderRef) types.LLVMPassManagerRef {
	return C.LLVMCreateFunctionPassManager(mp)
}

fn C.LLVMRunPassManager(pm types.LLVMPassManagerRef, m types.LLVMModuleRef) types.LLVMBool
pub fn llvm_run_pass_manager(pm types.LLVMPassManagerRef, m types.LLVMModuleRef) types.LLVMBool {
	return C.LLVMRunPassManager(pm, m)
}

fn C.LLVMInitializeFunctionPassManager(fpm types.LLVMPassManagerRef) types.LLVMBool
pub fn llvm_initialize_function_pass_manager(fpm types.LLVMPassManagerRef) types.LLVMBool {
	return C.LLVMInitializeFunctionPassManager(fpm)
}

fn C.LLVMRunFunctionPassManager(fpm types.LLVMPassManagerRef, f types.LLVMValueRef) types.LLVMBool
pub fn llvm_run_function_pass_manager(fpm types.LLVMPassManagerRef, f types.LLVMValueRef) types.LLVMBool {
	return C.LLVMRunFunctionPassManager(fpm, f)
}

fn C.LLVMFinalizeFunctionPassManager(fpm types.LLVMPassManagerRef) types.LLVMBool
pub fn llvm_finalize_function_pass_manager(fpm types.LLVMPassManagerRef) types.LLVMBool {
	return C.LLVMFinalizeFunctionPassManager(fpm)
}

fn C.LLVMDisposePassManager(pm types.LLVMPassManagerRef)
pub fn llvm_dispose_pass_manager(pm types.LLVMPassManagerRef) {
	C.LLVMDisposePassManager(pm)
}

fn C.LLVMStartMultithreaded() types.LLVMBool
pub fn llvm_start_multithreaded() types.LLVMBool {
	return C.LLVMStartMultithreaded()
}

fn C.LLVMStopMultithreaded()
pub fn llvm_stop_multithreaded() {
	C.LLVMStopMultithreaded()
}

fn C.LLVMIsMultithreaded() types.LLVMBool
pub fn llvm_is_multithreaded() types.LLVMBool {
	return C.LLVMIsMultithreaded()
}
