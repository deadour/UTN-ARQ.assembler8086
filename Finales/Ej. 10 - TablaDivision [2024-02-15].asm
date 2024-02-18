;'Ingrese la tabla de división (1 al 10): 9' 
;0 % 9 = 0 
;9 % 9 = 1 
;18 % 9 = 2 
;27 % 9 = 3 
;36 % 9 = 4 
;45 % 9 = 5 
;54 % 9 = 6 
;63 % 9 = 7 
;72 % 9 = 8 
;81 % 9 = 9

INCLUDE 'emu8086.inc'
ORG 100h

.DATA
    numero DW ?
    resultado DW ?
    mensaje DB 'Ingrese la tabla de division del 1 al 10: $'
    division DB ' % $'
    igual DB ' = $'  
    
.CODE
    MOV AX, @DATA
    MOV DS, AX   
    
    ; Imprimir mensaje solicitando el numero
    MOV AH, 9
    MOV DX, OFFSET mensaje
    INT 21h
    
    ; Leer numero ingresado por el usuario
    CALL SCAN_NUM; lo guarda en CX
    MOV numero, CX ; numero ingresado se guarda en CX y despues en la variable numero.
                                                         
                                                         
                                                         
    ;si es cadena tratar interrupcion. Los numeros tratar con scan num
     
    
    ; Salto de linea
    PRINTN
    
    ; Calcular e imprimir la tabla de division
    MOV CX, 10  ; Iterar del 0 al 9; descuenta 1 a CX y volver al principio
    MOV SI, 0   ; Inicializar contador para division
    
bucle:
    MOV AX, SI          ; Cargar contador 0 * 9; 9 * 1; 9 * 2  | Selecciono SI SI = 0; SI = 1; SI = 2 y eso lo multiplo por el numero que es fijo
    IMUL numero         ; Multiplicar contador por numero
    CALL PRINT_NUM      ; Imprimir resultado de la multiplicacion
    
    MOV DX, OFFSET division       
    ;CALL PRINT_STRING   ; Imprimir "%"
    MOV AH, 9
    INT 21h  
    
    MOV AX, numero      ; Cargar numero ingresado
    CALL PRINT_NUM      ; Imprimir numero ingresado, me conviene usar libreria me conviene una madness
    
    MOV DX, OFFSET igual
    ;CALL PRINT_STRING   ; Imprimir "=" 
    MOV AH, 9
    INT 21h
    
    MOV AX, SI          ; Cargar contador
    CALL PRINT_NUM      ; Imprimir contador
    PRINTN              ; Salto de linea
    
    INC SI              ; Incrementar contador
   
    LOOP bucle          ; Repetir hasta que CX llegue a 0
    
    HLT                 ; Fin del programa
    
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_STRING
    DEFINE_PRINT_NUM_UNS
END