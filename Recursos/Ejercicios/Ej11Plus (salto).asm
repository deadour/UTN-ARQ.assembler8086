; Ejercicio x. 
; Recorrer el Vector y cuente la cantidad de contenidos
; que tengan ceros en los bits 0, 1, 4 y 5. Al finalizar
; mostrar la cantidad y los valores que cumplen la condicion
;   
include 'emu8086.inc'
name "0 en posiciones 0,1,4,5" ;Mascara

org 100h

.DATA
; VARIABLES 
    msgCant db 0Dh,0Ah,"Cantidad: ",0 ;agregar un byte en 0 al final para indicar fin de string
    msgVals db 0Dh,0Ah,"Valores: [ ",0  
    Vector db 51,90,11,23,63
    Cant db 0
    
.CODE   

setup:
    LEA si, Vector
    LEA cx, cant 
    MOV di, cx ;determinar direccion inicial para resguardar valores que cumplen
    inc di
    SUB cx, si ;Determina longitud del vector de entrada
                               
                               
                               
    CALL PTHIS 
    db "Analizando valores: ",0     
verificar:
    mov al, [si]    ;recupera valor del vector
    CALL PRINT_NUM
    CALL PTHIS 
    db ", ",0
    mov dl,al       ;Resguarda valor original
    AND al, 033h    ;Aplica mascara
    JNZ avanzar     ;Salta si no es cero
    INC Cant        ;cuenta si cumple
    MOV [di],dl     ;Alamacena valor válido
    INC di
    
    
avanzar:
    INC SI
    loop verificar       

finalizando:
    CMP Cant,0
    JNZ resultado
    CALL PTHIS 
    db "NINGUN VALOR CUMPLE LA CONDICION!",0
    JMP fin
    
resultado:    
    LEA si, msgCant
    CALL PRINT_STRING   ; IMPRIME MENSAJE DE RESULTADO
    
cantidad:    
    MOV ah, 0
    MOV al, Cant
    CALL PRINT_NUM ;Imprime valor de AX!.    
    
    LEA si, msgVals        ; IMPRIME MENSAJE DE RESULTADO
    CALL PRINT_STRING         
    
    LEA di, Cant
    INC di      ;Avanza al inicio del arreglo
    mov cl, Cant   ;Setea CL con cant que cumplen, asi sabe cuánto avanzar con DI    

valores:     
    MOV ah,0
    MOV al,[di]  
    CALL PRINT_NUM    
    CMP cl,1        ;Break del Loop
    JE cerrar
    CALL PTHIS 
    db ", ",0
    INC di
    LOOP valores

cerrar:    
    CALL PTHIS 
    db " ]",0
fin:
    HLT ;Detiene el programa.   

;### Definicion de proc. de la libreria emu8086.inc ###

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  ; definir si se usa print_num.
DEFINE_PTHIS

END