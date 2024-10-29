extern i686_ISR_Handler

; CPU pushes to the stack: ss, esp, eflags, cs, eip
%macro ISR_NOERRORCODE 1
global i686_ISR%1:
i686_ISR%1:
    push 0              ; Push Dummy Error Code
    push %1             ; Push Interrupt Number
    jmp isr_common
%endmacro

%macro ISR_ERRORCODE 1
global i686_ISR%1:
i686_ISR%1:
                        ; CPU pushes an error code to the stack
    push %1             ; Push Interrupt Number
    jmp isr_common
%endmacro

%include "arch/i686/isrs_gen.inc"
isr_common:
    pusha               ; Pushes in Order: eax, ecx, edx, ebx, esp, ebp, esi, edi
    xor eax, eax        ; Push ds
    mov ax, ds
    push eax
    mov ax, 0x10        ; Use Kernel Data Segment
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    push esp            ; pass pointer to stack to C, so we can access all the pushed information
    call i686_ISR_Handler
    add esp, 4
    pop eax             ; restore old segment
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    popa                ; pop what we pushed with pusha
    add esp, 8          ; remove error code and interrupt number
    iret                ; will pop: cs, eip, eflags, ss, esp