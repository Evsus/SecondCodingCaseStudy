.intel_syntax noprefix
    .section	.rodata
.LC0:
    .string	"%d\n"
    .text
    .globl	main
    .type	main, @function
main:
.LFB0:
    .cfi_startproc
    push	rbp
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    mov	rbp, rsp
    .cfi_def_cfa_register 6
    sub rsp, 16
# proof = 100
    mov eax, 100
    mov DWORD PTR [rbp-4], eax
# iAm = proof
    mov eax, DWORD PTR [rbp-4]
    mov DWORD PTR [rbp-8], eax
# great = iAm
    mov eax, DWORD PTR [rbp-8]
    mov DWORD PTR [rbp-12], eax
# print(great)
    mov esi, DWORD PTR [rbp-12]
    mov edi, OFFSET FLAT:.LC0
    mov eax, 0
    call    printf
# standard teardown for any program     
    leave
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE0:
    .size	main, .-main