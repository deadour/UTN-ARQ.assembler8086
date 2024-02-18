;EJERCICIO 3
;Realice un programa que sume dos numeros enteros,
;ingresados por teclado


include 'emu8086.inc'

ORG 100h

;imprime titulos con salto de linea
PRINTN 'SUMA DE DOS NUMEROS'
PRINTN '==== == === ======='

print 'Ingrese numero 1 :'
CALL scan_num           ; pide numero y almacena en CX.
ADD AX, CX              ; suma numero ingresado en CX a AX.
printn                  ; salto de linea

print 'Ingrese denominador :'
CALL scan_num           ; pide numero y almacena en CX.
ADD AX, CX              ; acumula CX en AX.
printn                  ; salto de linea

; imprime el resultado de la suma
print 'La suma es: '
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
