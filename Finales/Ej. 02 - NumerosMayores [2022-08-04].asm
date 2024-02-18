;Dado un arreglo precargado de 12 números y dado un numero ingresado por teclado. Guardar en otro arreglo de
;salida los números (del arreglo) que son mayores al numero ingresado"

INCLUDE 'emu8086.inc'
ORG 100h

.DATA
    cadena DB 255 DUP (?)   ; Cadena de caracteres
    vocales DB 'aeiou'      ; Vocales en minúscula
    mensaje DB 'Ingrese una cadena de caracteres en minúscula (presione ENTER para finalizar): $'
    msgResultado DB 13, 10, 'Cadena con vocales en mayúscula: $'

.CODE
    MOV AX, @DATA
    MOV DS, AX

    ; Imprimir mensaje de solicitud
    MOV AH, 9
    MOV DX, OFFSET mensaje
    INT 21h

    ; Leer cadena de caracteres desde la entrada estándar
    MOV SI, 0   ; Índice para la cadena
cargar_cadena:
    MOV AH, 01h     ; Función para leer un carácter desde el teclado
    INT 21h         ; Leer un carácter
    CMP AL, 13      ; Verificar si se presionó ENTER
    JE fin_cargar   ; Si es ENTER, terminar la carga de la cadena
    MOV [cadena + SI], AL   ; Almacenar el carácter en la cadena
    INC SI          ; Incrementar el índice
    JMP cargar_cadena   ; Volver a cargar otro carácter

fin_cargar:
    MOV BYTE PTR [cadena + SI], '$'   ; Agregar el carácter nulo al final de la cadena

    ; Imprimir mensaje de resultado
    MOV AH, 9
    MOV DX, OFFSET msgResultado
    INT 21h

    ; Recorrer la cadena y cambiar las vocales a mayúsculas
    MOV SI, 0   ; Reiniciar el índice para recorrer la cadena
detectar_vocales:
    MOV AL, [cadena + SI]   ; Obtener el carácter actual de la cadena
    CMP AL, '$'             ; Verificar si se ha llegado al final de la cadena
    JE fin                 ; Si es el final de la cadena, terminar
    CMP AL, 'a'             ; Comprobar si el carácter es una vocal minúscula
    JB no_vocal
    CMP AL, 'z'
    JA no_vocal
    MOV AH, 0               ; Limpiar AH
    MOV AL, [cadena + SI]   ; Obtener el carácter actual de la cadena
    CMP AL, 'a'             ; Verificar si es 'a'
    JE vocal
    CMP AL, 'e'             ; Verificar si es 'e'
    JE vocal
    CMP AL, 'i'             ; Verificar si es 'i'
    JE vocal
    CMP AL, 'o'             ; Verificar si es 'o'
    JE vocal
    CMP AL, 'u'             ; Verificar si es 'u'
    JE vocal
no_vocal:
    INC SI                  ; Pasar al siguiente carácter de la cadena
    JMP detectar_vocales    ; Probar el siguiente carácter
vocal:
    SUB AL, 32              ; Convertir a mayúscula
    MOV [cadena + SI], AL   ; Almacenar la letra en mayúscula
    INC SI                  ; Pasar al siguiente carácter de la cadena
    JMP detectar_vocales    ; Probar el siguiente carácter

fin:
    ; Imprimir la cadena modificada
    MOV AH, 9
    MOV DX, OFFSET cadena
    INT 21h

    ; Terminar el programa
    MOV AH, 4Ch
    INT 21h

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
