;EJERCICIO 3
;Realice un programa que sume dos numeros enteros,
;ingresados por teclado

include 'emu8086.inc'

ORG 100h

;imprime titulos con salto de linea
PRINTN 'MULTIPLICACION DE DOS NUMEROS'
PRINTN '============ == === ===== ======='

print 'Ingrese el primer numero :'
CALL scan_num           ; pide numero y almacena en CX.
MOV AX, CX              ; almacena el primer numero en AX.
printn                  ; salto de linea

print 'Ingrese el segundo numero :'
CALL scan_num           ; pide numero y almacena en CX.
MOV BX, CX              ; almacena el segundo numero en BX.
IMUL BX                  ; multiplica el segundo numero por el primer numero almacenado en BX.
printn                  ; salto de linea

; imprime el resultado de la multiplicacion
print 'El resultado de la multiplicacion es: '
CALL print_num          ; imprime valor de AX.

RET                     ; vuelve al sistema operativo.

;--- definicion de procedimientos de impresion
;--- y captura de datos de libreria emu8086.inc
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS    ; definir si se usa print_num.
DEFINE_PTHIS
END                     ; directiva para detener el compilador.
