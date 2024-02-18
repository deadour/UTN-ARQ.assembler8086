
; 
name "PartePrograma2"
.MODEL SMALL
org 300h
.DATA
    vec db 10,21,2,200,35,44,21,9,11,22 ; cargar un vector con constantes
    vec1 db ?
    punt1 db ?
    punt2 db ?
.CODE   
    mov ax,	@Data
    mov ds, ax
    
    ; INMEDIATO
    mov cx,8FFFh    ; muevo literal de 16 bits en registro CX
    mov ax, 3FFFh
    mov dh, 8Fh     ; muevo literal de 8 bits en parte alta de registro DX   
   ret     
   
   

END                   ; directiva para detener el compilador.