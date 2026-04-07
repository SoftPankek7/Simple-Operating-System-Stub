; bootloader.asm — minimal, no fluff
[bits 16]
[org 0x7C00]

    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; load 16 sectors from disk into 0x8000
    mov ah, 0x02
    mov al, 16
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov bx, 0x8000
    int 0x13
    jc .hang

    lgdt [.gdt_desc]
    mov eax, cr0
    or  eax, 1
    mov cr0, eax
    jmp 0x08:.pm

[bits 32]
.pm:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax
    mov esp, 0x90000
    call 0x8000

.hang:
    cli
    hlt
    jmp .hang

.gdt:
    dq 0                        ; null
    dq 0x00CF9A000000FFFF       ; code: base=0, limit=4GB, ring0, exec
    dq 0x00CF92000000FFFF       ; data: base=0, limit=4GB, ring0, rw
.gdt_desc:
    dw $ - .gdt - 1
    dd .gdt

times 510-($-$$) db 0
dw 0xAA55