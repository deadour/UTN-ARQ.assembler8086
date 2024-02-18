; Programa en ensamblador 8086 para imprimir la tabla de multiplicar del valor ingresado por el usuario del 1 al 10

INCLUDE 'emu8086.inc'
ORG 100h

.DATA
    numero DW ?
    resultado DW ?
    mensaje DB 'Ingrese tabla del 1 al 10: $'
    multiplicacion DB ' x ', 0
    igual DB ' = ', 0
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ; Imprimir mensaje solicitando el n�mero
    MOV AH, 9
    MOV DX, OFFSET mensaje
    INT 21h
    
    ; Leer n�mero ingresado por el usuario
    CALL SCAN_NUM
    MOV numero, CX
    
    ; Salto de l�nea
    PRINTN
    
    ; Calcular e imprimir la tabla de multiplicar
    MOV CX, 10  ; Iterar del 1 al 10
    MOV SI, 1   ; Inicializar contador para multiplicaci�n
    
bucle:
    MOV AX, numero      ; Cargar n�mero
    MOV BX, SI          ; Cargar contador
    IMUL BX             ; Multiplicar n�mero por contador
    MOV resultado, AX   ; Almacenar resultado
    
    ; Imprimir resultado
    CALL PRINT_NUM     ; Imprimir n�mero ingresado
    MOV DX, OFFSET multiplicacion
    CALL PRINT_STRING  ; Imprimir "x"
    CALL PRINT_NUM     ; Imprimir contador
    MOV DX, OFFSET igual
    CALL PRINT_STRING  ; Imprimir "="
    CALL PRINT_NUM     ; Imprimir resultado
    PRINTN             ; Salto de l�nea
    
    INC SI             ; Incrementar contador
    LOOP bucle        ; Repetir hasta que CX llegue a 0
    
    HLT               ; Fin del programa
    
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_STRING
    DEFINE_PRINT_NUM_UNS
END

