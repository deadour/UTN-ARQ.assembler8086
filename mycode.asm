MAQUETA BÁSICA
include 'emu8086.inc'
ORG 100h
.DATA
 ; Definir variables 
 
.CODE
    ; Configurar el segmento de datos
    mov ax, @data
    mov ds, ax     
    
    ; Aca va el programa
    HLT 
    
    ;Definicion de librerias
    define_scan_num
    define_print_num
    define_print_num_uns
END

---INTERRUPCIONES
*Mostrar Cadena en Pantalla: (int 21h / AH=9)
'Carga el registro AH con el valor '9'
Carga el registro DX con la direccion de la cadena a mostrar.
Realiza la llamada a la interrupcion 'int 21h''
    
    mov ah, 9
    lea dx, mensaje    ; mov dx, offset mensaje
    int 21h

* Leer Caracter del Teclado: (int 21h / AH=1)
'Lee un caracter desde el teclado y almacena su codigo ASCII en el registro AL
Carga el registro AH con el valor '1'
Realiza la llamada a la interrupcion 'int 21h''
    
    mov ah, 1
    int 21h
    
--- USO DE LIBRERIAS
SCAN_NUM
'Procedimiento que obtiene un numero CON SIGNO de varios dígitos desde teclado y almacena el resultado en el registro CX. Para usarlo, declare: DEFINE_SCAN_NUM antes de la directiva END. Se obtiene en formato DECIMAL. Si lo quieres en ASCII debes sumarle 0'

PRINT_NUM
'Procedimiento que imprime un numero CON SIGNO almacenado en el registro AX. Para usarlo, declare: DEFINE_PRINT_NUM y DEFINE_PRINT_NUM_UNS antes de la directiva END. El numero debe estar en formato DECIMAL. Si esto en ASCII debes restarle 0.'
PRINT_NUM_UNS

'Procedimiento que imprime un numero SIN SIGNO almacenado en el registro AX. Para usarlo, declare: DEFINE_PRINT_NUM_UNS antes de la directiva END.'

--- VECTORES

*Definir un Vector 
.DATA
    vectorPrecargado db 10, 20, 30, 40, 50
    vectorVacio db 255 dup(?)   ; Capacidad maxima para 255 elementos
    longitudVector dw 0

*Acceder a los elementos del Vector
mov bx, 0   ; Utilizo el registro BX como indice, empezando desde el 0
mov vector[bx], cx
mov ax, vector[bx]

*Recorrer el Vector
    recorrido:
        mov al, vector[bx]
        ; Realizar operaciones con el elemento
        ; ...
        inc bx
        loop recorrido


--- SEGMENTOS
*Definir una Tabla
.DATA
    tabla DB 2, 9, 5, 12, 45, 33, 99, 67, 3, 1
    fin_tabla DB ?

Acceder a los elementos de la Tabla
MOV BX, OFFSET tabla   ; Carga en BX la dirección inicial de la tabla
MOV CL, OFFSET fin_tabla - OFFSET tabla   ; Carga en CL la cantidad de elementos

Recorrer la Tabla
    recorrido:
        MOV AL, [BX] ; [BX] contenido de la direccion de BX
        ; Realizar operaciones con el elemento
        ; ...
        INC BX
        loop recorrido

OPERACIONES BÁSICAS
Conversión de Minúsculas a Mayúsculas
sub AL, 32  ; Convertir minúscula a mayúscula

Conversión entre Número y ASCII
sub AL, '0'  ; Convertir de ASCII a número
add AL, '0'  ; Convertir de número a ASCII

Cargar una Direccion
mov [385Ah], 14   ; mueve el valor 14 a la direccion 385Ah
mov [385Bh], 22   ; mueve el valor 22 a la direccion 385Bh

Operaciones Aritméticas
Suma (ADD):
mov ax, variable1   ; AX ? variable1
add ax, variable2   ; AX ? (AX) + variable2

mov ax, [direccion1]   ; AL ? (direccion1)
add ax, [direccion2]   ; AL ? (AL) + (direccion2)
; Resultado en AX

Resta (SUB):
mov ax, variable1
sub ax, variable2

mov ax, [direccion1]
sub ax, [direccion2]
; Resultado en AX

Multiplicación (IMUL):
mov ax, variable1
imul variable2  ; Resultado en AX

mov ax, [direccion1]
imul [direccion2]
; Resultado en DX:AX (DX bits mas altos y AX bits mas bajos)

División (IDIV):
mov ax, variable1
idiv variable2

mov ax, [direccion1]
idiv word ptr [direccion2]
; Cociente en AX, residuo en DX

Operaciones Lógicas
Operación AND:
mov ax, variable1
and ax, variable2

mov ax, [direccion1]
and ax, [direccion2]
; Resultado en ax

Operación OR:
mov ax, variable1
or ax, variable2

mov ax, [direccion1]
or ax, [direccion2]
; Resultado en ax

Operación XOR:
mov ax, variable1
xor ax, variable2

mov ax, [direccion1]
xor ax, [direccion2]
; Resultado en ax

Operación NOT:
mov ax, variable1
not ax

mov ax, [direccion1]
not ax
; Resultado en ax

