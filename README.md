# V LLVM Bindings _(v-llvm.bindings)_

LLVM bindings for the V programming language

This project is a collection of bindings to [the llvm-c interface](https://llvm.org/doxygen/group__LLVMC.html). The bindings are originally generated with [c2v](https://github.com/vlang/c2v) and further tweaked to be easier to use within the V programming language.

## Table of Contents

- [Coverage](#coverage)
- [Install](#install)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Coverage

This is a list of [the llvm-c modules](https://llvm.org/doxygen/group__LLVMC.html#details) that have usable V programming language bindings.

* [x] [Types](https://llvm.org/doxygen/group__LLVMCSupportTypes.html)
* [ ] [Analysis](https://llvm.org/doxygen/group__LLVMCAnalysis.html)
* [ ] [Bit Reader](https://llvm.org/doxygen/group__LLVMCBitReader.html)
* [ ] [Bit Writer](https://llvm.org/doxygen/group__LLVMCBitWriter.html)
* [ ] [Transforms](https://llvm.org/doxygen/group__LLVMCTransforms.html)
* [x] [Core](https://llvm.org/doxygen/group__LLVMCCore.html))
* [ ] [Instruction Builders](https://llvm.org/doxygen/group__LLVMCCoreInstructionBuilder.html)
* [ ] [Module Providers](https://llvm.org/doxygen/group__LLVMCCoreModuleProvider.html)
* [ ] [Memory Buffers](https://llvm.org/doxygen/group__LLVMCCoreMemoryBuffers.html)
* [ ] [Pass Registry](https://llvm.org/doxygen/group__LLVMCCorePassRegistry.html)
* [ ] [Pass Managers](https://llvm.org/doxygen/group__LLVMCCorePassManagers.html)
* [ ] [Threading](https://llvm.org/doxygen/group__LLVMCCoreThreading.html)
* [ ] [Disassembler](https://llvm.org/doxygen/group__LLVMCDisassembler.html)
* [ ] [Error Handling](https://llvm.org/doxygen/group__LLVMCError.html)
* [ ] [Execution Engine](https://llvm.org/doxygen/group__LLVMCExecutionEngine.html)
* [ ] [Initialization Routines](https://llvm.org/doxygen/group__LLVMCInitialization.html)
* [ ] [LTO](https://llvm.org/doxygen/group__LLVMCLTO.html)
* [ ] [ThinLTO](https://llvm.org/doxygen/group__LLVMCTLTO.html)
* [ ] [Object file reading and writing](https://llvm.org/doxygen/group__LLVMCObject.html)
* [ ] [Remarks](https://llvm.org/doxygen/group__LLVMCREMARKS.html)
* [ ] [Target information](https://llvm.org/doxygen/group__LLVMCTarget.html)

## Install

```sh
v install --git https://github.com/v-llvm/bindings
```

## Usage

Using this module requires knowledge of [LLVM](https://llvm.org). This example prints the LLVM IR for an empty function.

```v
module main

import llvm.core

fn main() {
	the_context := core.llvm_context_create()
	builder := core.llvm_create_builder_in_context(the_context)
	
	the_module := core.llvm_module_create_with_name_in_context("vlang", the_context)

	func_args := [core.llvm_int32_type(), core.llvm_int32_type()]
	func_ty := core.llvm_function_type(core.llvm_int32_type(), func_args, false)
	the_function := core.llvm_add_function(the_module, "my_func", func_ty)

	println(core.llvm_print_module_to_string(the_module))
}
```

## Contributing

PRs accepted.

## License

[MIT © Maxim De Clercq](LICENSE)
