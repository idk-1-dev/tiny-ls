.intel_syntax noprefix

.global main

.data
    current_dir: .string "."
    denied: .string "permission denied.\n"
    denied_len = .-denied
    newline: .string "\n"
    newline_len = .-newline
.bss
    file_fd: .skip 8
    dirp: .skip 4096
.text
main:
    mov rax,257
    mov rdi,-100
    lea rsi,[current_dir]
    mov rdx,0
    syscall

    test rax,rax
    js .permission_denied
    mov [file_fd],rax
.pull:
    mov rax,217
    mov rdi,[file_fd]
    lea rsi,[dirp]
    mov rdx,4096
    syscall
    mov r13,rax
    xor r14,r14
.parse:
    lea rbx,[dirp + r14]
    lea rdi,[rbx + 19]
    xor rdx,rdx
.strlen_loop:
    cmp byte ptr [rdi + rdx],0
    je .print
    inc rdx
    jmp .strlen_loop
.print:
    mov rax,1
    mov rdi,1
    lea rsi,[rbx + 19]
    syscall
    mov rax,1
    mov rdi,1
    lea rsi,[newline]
    mov rdx,newline_len
    syscall

    movzx rdx,word ptr [rbx + 16]
    add r14,rdx
    cmp r14,r13
    jl .parse
    
    mov rax,60
    mov rdi,0
    syscall
.permission_denied:
    mov rax,1
    mov rdi,1
    lea rsi,[denied]
    mov rdx,denied_len
    syscall

    mov rax,60
    mov rdi,1
    syscall
