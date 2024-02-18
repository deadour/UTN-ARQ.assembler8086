include 'emu8086.inc'

ORG 100h

.data
    input db 100 dup (''), '$'

.code
    printn 'Ingrese un string'
    mov SI, 0
    mov CX, 0 ; Pongo a cero el indice y el contador.

cargar_cadena:
    mov ah, 01h ; Funcion que lee un caracter ingresado y lo almacena en AL.
    int 21h
    cmp al, 13 ; 13 es el codigo ASCII para el ENTER.
    JE fin_carga
    
    mov input[SI], AL
    inc SI
    JMP cargar_cadena

fin_carga:
    mov bx, SI ; Almaceno la longitud de la cadena (SI) en BX.
    mov SI, 0

recorrer_string:
    cmp bx, SI ; Verifica si se ha llegado al final de la cadena.
    JE fin ; Si SI es igual a BX, termina.
    mov AL, input[SI]
    cmp al, 'e'
    JNE no_es_e ; Si no es 'E', salta a no_es_e.
    
    cmp input[SI + 1], 's' ; Compara el siguiente caracter con 'S'.
    JNE no_es_s ; Si no es 'S', salta a no_es_s.

    inc CX ; Incrementa el contador si se encuentra 'es'.
    inc SI ; Salta dos posiciones para verificar el proximo carácter.
    JMP recorrer_string ; Continúa recorriendo la cadena.
    
no_es_s:
    inc SI ; Si no se encuentra 'S', salta al siguiente caracter.
    JMP recorrer_string ; Continúa recorriendo la cadena.
    
no_es_e:
    inc SI ; Si no se encuentra 'E', salta al siguiente caracter.
    JMP recorrer_string ; Continúa recorriendo la cadena.

fin:
    printn
    print 'La cantidad de e,s contabilizados es: '
    MOV AX, CX
    CALL print_num

RET

define_print_num
define_print_num_uns

END
