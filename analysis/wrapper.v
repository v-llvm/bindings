module analysis

import types

#flag -I/usr/include
#flag -D_GNU_SOURCE
#flag -D__STDC_CONSTANT_MACROS
#flag -D__STDC_FORMAT_MACROS
#flag -D__STDC_LIMIT_MACROS
#flag -I/usr/lib/
#flag -lLLVM
#include <llvm-c/Analysis.h>

pub enum LLVMVerifierFailureAction {
	llvm_abort_process_action
	llvm_print_message_action
	llvm_return_status_action
}

fn C.LLVMVerifyModule(m types.LLVMModuleRef, action LLVMVerifierFailureAction, out_message &&u8) types.LLVMBool
pub fn llvm_verify_module(m types.LLVMModuleRef, action LLVMVerifierFailureAction, out_message &&u8) types.LLVMBool {
	return C.LLVMVerifyModule(m, action, out_message)
}

fn C.LLVMVerifyFunction(fn_ types.LLVMValueRef, action LLVMVerifierFailureAction) types.LLVMBool
pub fn llvm_verify_function(fn_ types.LLVMValueRef, action LLVMVerifierFailureAction) bool {
	return C.LLVMVerifyFunction(fn_, action) == 0
}

fn C.LLVMViewFunctionCFG(fn_ types.LLVMValueRef)
pub fn llvm_view_functioncfg(fn_ types.LLVMValueRef)  {
	C.LLVMViewFunctionCFG(fn_)
}

fn C.LLVMViewFunctionCFGOnly(fn_ types.LLVMValueRef)
pub fn llvm_view_functioncfg_only(fn_ types.LLVMValueRef)  {
	C.LLVMViewFunctionCFGOnly(fn_)
}

