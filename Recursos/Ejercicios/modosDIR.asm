
; 
name "modo_dir"
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
    
    ;DIR POR REGISTRO
    mov bx,ax
    add cx,bx
    add dh,cl       ; suma registro de 8 bits dh+cl
    
    ;DIR DIRECTO
    mov [1FFAh],cx  ; mueve regostro completo cx a dir 1FFA(h
    mov al, [1FFAh] ;mueve primeros 16 bits a parte baja de registro AX
    
    ;DIR INDIRECTO
    mov ax, [bx]    ; mueve a AX el contenido del contenido de BX
    MOV AX, [DI]
    MOV AX, [SI]
     
    ;Base register: BX, BP
    ;Index register: SI, DI
    ;DIR BASE
    mov dx, [bx+05] ; mueve a DX el contenido de direccion conformada
                    ; por registro base(BX/BP) mas desplazamiento (05h) 

    ;DIR INDEXADO
    MOV si, 1FFAh
    mov [si+3],dx
    mov dx, [si+5]  ;mueve  a DX el contenido de direccion conformada
                    ; por registri indice (SI/DI) mas desplazamiento
    
    MOV di, 1FFAh
    mov [di+3],dx
    mov dx, [di+5]
    
    ;DIR BASE INDEXADO CON DESPLAZAMIENTO
    
    mov [BX+si+5],dx
    mov [BP+si+5],dx 

   ; MODIFICAMOS EL SEGMENTO DE DATOS
   mov  ax,800h
   mov  ds,ax
     
     mov dx,3FFFh
     mov [1FFAh],dx 
   
   
   ret     
   
   

END                   ; directiva para detener el compilador.