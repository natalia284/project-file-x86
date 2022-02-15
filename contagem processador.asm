%include "io.inc"
extern printf

%define BUF_SIZE 1

section .data
in_file_err_msg db 'erro', 0
in_file_name db "/home/vai/Documents/teste", 0 ;caminho do arquivo 
cont dd 0 
letra db'%c', 0
numero db '%d', 0 

section .bss
fd_in resd 1
in_buf resd BUF_SIZE

section .text
global main
main:
    mov ebp, esp; for correct debugging             
 
    ;abrir arquivo teste.txt
    mov EAX,5            
    mov EBX,in_file_name 
    mov ECX,0            
    mov EDX,0700o        
    int 0x80
    mov [fd_in],EAX    
    
    mov bl, 0 ; zera bl para verificação 
    
    ler_arquivo: 
    push ebx ;guarda o ebx
    mov EAX,3             
    mov EBX, [fd_in]      
    mov ECX, in_buf       
    mov EDX, BUF_SIZE     
    int 0x80
    
    pop ebx ;tira o ebx guardado
    
    ;confere se chegou no fim do arquivo
    cmp DWORD[in_buf], 10
    je fim_arquivo 
    
    ; verifica o 'p'
    s0: 
    cmp bl, 0
    jne s1
    call valida_p  
    ;inc bl
    ;je s1
    jmp ler_arquivo
    
    ; verifica se tem 'r'
    s1:    
    cmp bl, 1
    jne s2
    ;call ler_arquivo 
    call valida_r
    jmp ler_arquivo
    
    ; verifica se tem 'o'
    s2: 
    cmp bl, 2
    jne s3
    ;call ler_arquivo
    call valida_o 
    jmp ler_arquivo

    ; verifica se tem 'c'    
    s3:
    cmp bl, 3
    jne s4
    ;call ler_arquivo 
    call valida_c 
    jmp ler_arquivo
    
    ; verifica se tem 'e'    
    s4:
    cmp bl, 4
    jne s5
    ;call ler_arquivo
    call valida_e 
    jmp ler_arquivo
    
    ; verifica se tem 's'    
    s5: 
    cmp bl, 5
    jne s6
    ;call ler_arquivo
    call valida_s 
    jmp ler_arquivo
    
    ; verifica se tem 's'    
    s6: 
    cmp bl, 6
    jne s7
    ;call ler_arquivo
    call valida_s2 
    jmp ler_arquivo
    
    ; verifica se tem 'a'    
    s7:
    cmp bl, 7
    jne s8
    ;call ler_arquivo
    call valida_a 
    jmp ler_arquivo
    
    ; verifica se tem 'd'    
    s8: 
    cmp bl, 8
    jne s9
    ;call ler_arquivo
    call valida_d 
    jmp ler_arquivo
    
    ; verifica se tem 'o'    
    s9: 
    cmp bl, 9
    jne s10
    ;call ler_arquivo
    call valida_o2 
    jmp ler_arquivo 
    
    ; verifica se tem 'r'    
    s10: 
    cmp bl, 10
    ;jne s11
    ;call ler_arquivo
    call valida_r2 
    cmp bl, 11
    je contar 
    ;jmp ler_arquivo    

    ; faz a contagem da palavra 'processador'    
    contar: 
    inc DWORD[cont]
    mov bl, 0
    jmp ler_arquivo
    
;---------------------------------
valida_p: 
;Receives: in_buf
;Returns: bl=1 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'p'
jne fim_p_falso
mov bl, 1
fim_p:
leave
ret
fim_p_falso: 
mov bl, 0 
leave
ret
;---------------------------------
valida_r: 
;Receives: in_buf
;Returns: bl=2 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'r'
jne fim_r_falso 
mov bl, 2
fim_r:
leave
ret 
fim_r_falso: 
mov bl, 0
leave
ret 

;---------------------------------
valida_o: 
;Receives: in_buf
;Returns: bl=3 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'o'
jne fim_o_falso 
mov bl, 3
fim_o:
leave
ret 
fim_o_falso:
mov bl, 0
leave
ret 
;---------------------------------
valida_c:  
;Receives: in_buf
;Returns: bl=4 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'c'
jne fim_c_falso
mov bl, 4
fim_c:
leave
ret 
fim_c_falso: 
mov bl, 0
leave
ret

;---------------------------------
valida_e:  
;Receives: in_buf
;Returns: bl=5 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'e'
jne fim_e_falso
mov bl, 5
fim_e:
leave
ret 
fim_e_falso: 
mov bl, 0
leave
ret 
;---------------------------------
valida_s:  
;Receives: in_buf
;Returns: bl=6 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 's'
jne fim_s_falso 
mov bl, 6
fim_s:
leave
ret 
fim_s_falso:
mov bl, 0
leave
ret 
;---------------------------------

;---------------------------------
valida_s2:  
;Receives: in_buf
;Returns: bl=7 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 's'
jne fim_s2_falso 
mov bl, 7
fim_s2:
leave
ret 
fim_s2_falso:
mov bl, 0
leave
ret
;---------------------------------

valida_a:  
;Receives: in_buf
;Returns: bl=8 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'a'
jne fim_a_falso 
mov bl, 8
fim_a:
leave
ret 
fim_a_falso:
mov bl, 0
leave
ret 
;---------------------------------
valida_d:  
;Receives: in_buf
;Returns: bl=9 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'd'
jne fim_d_falso
mov bl, 9
fim_d:
leave
ret
fim_d_falso:
mov bl, 0
leave
ret
valida_o2: 
;Receives: in_buf
;Returns: bl=10 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'o'
jne fim_o2_falso
mov bl, 10
fim_o2:
leave
ret 
fim_o2_falso:
mov bl, 0
leave
ret 
;---------------------------------
valida_r2:  
;Receives: in_buf
;Returns: bl=11 se for cartere 'p' e bl = 0 caso contrário
;---------------------------------
enter 0,0
mov bl, 0
cmp DWORD[in_buf], 'r'
jne fim_r2_falso
mov bl, 11
fim_r2:
leave
ret 
fim_r2_falso:
mov bl, 0
leave
ret 
;---------------------------------
fim_arquivo: 

;fecha arquivo
mov EAX,6              
mov EBX,[fd_in]
int 0x80

;imprime a quantidade de palavras 'processador' encontradas no arquivo
push DWORD[cont]      
push numero 
call printf 
add esp, 8 

xor eax, eax 
ret
