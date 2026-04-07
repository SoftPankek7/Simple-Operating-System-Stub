# Simple Operating System Stub
A little stub that points to a C kernel; and has a simple build system made in python + json.
**This was made to help create OSes easier.**

----
## C Kernel
Entry point: ``__os_entry()``
No libraries included.

----
## Assembly bootloader
Simple & compact - not meant for many features;
it is just made to work.
*Made with AI (I cant be bothered)*

----
## Python Build System
Very simple python builder; relying on ``os.json`` to build it.
*Made with AI (I cant be bothered)*

### Required packages

- i686-elf-gcc
- i686-elf-ld
- nasm
- qemu-system-x86_64 ***(Not strictly, unless you want to emulate it quickly)***
- python3

### os.json

Example:
```json
{
    "bootloader": "src/bootloader.asm",
    "kernel_entry": "src/main.c",
    "components": [],
    "linker_script": "link.ld",
    "output": "build/os.img",
    "qemu_args": "-m 32M -display gtk"
}
```
Anatomy:
| name | description |
|----|----|
|``bootloader``| the path to the Assembly bootloader. |
|``kernel_entry``| the path to the C Kernel. |
|``components``| a list of C files referenced (ignore headers) |
|``linker_script``| the file used to link the OS together. |
|``output``| where the final ``.img`` is placed |
|``qemu_args``| arguments passed to qemu to emulate the OS |
