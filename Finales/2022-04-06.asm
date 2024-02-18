INCLUDE 'emu8086.inc'
ORG 100h

.DATA
    cadena1 DB 100, ?, 100 DUP ('$') ; Definimos una cadena para ingresar la primera cadena
    cadena2 DB 100, ?, 100 DUP ('$') ; Definimos una cadena para ingresar la segunda cadena
    msj_entrada1 DB 'Ingrese la primera cadena: $'
    msj_entrada2 DB 'Ingrese la segunda cadena: $'
    msj_iguales DB 'Las cadenas son iguales.$'
    msj_no_iguales DB 'Las cadenas no son iguales.$'
    salto_linea DB 13, 10, '$' ; Secuencia de escape para un salto de línea

.CODE
    MOV AX, @DATA
    MOV DS, AX

    ; Ingresar la primera cadena
    MOV AH, 9 ; Función para imprimir cadena
    MOV DX, OFFSET msj_entrada1 ; Mensaje para ingresar la primera cadena
    INT 21h
    
    MOV AH, 0Ah ; Función para leer cadena
    MOV DX, OFFSET cadena1 ; Dirección donde se almacenará la cadena ingresada
    INT 21h
    
    ; Imprimir un salto de página
    MOV AH, 9 ; Función para imprimir cadena
    MOV DX, OFFSET salto_linea ; Mensaje para imprimir un salto de línea
    INT 21h
    
    ; Ingresar la segunda cadena
    MOV AH, 9 ; Función para imprimir cadena
    MOV DX, OFFSET msj_entrada2 ; Mensaje para ingresar la segunda cadena
    INT 21h
    
    MOV AH, 0Ah ; Función para leer cadena
    MOV DX, OFFSET cadena2 ; Dirección donde se almacenará la cadena ingresada
    INT 21h
    
        ; Imprimir un salto de página
    MOV AH, 9 ; Función para imprimir cadena
    MOV DX, OFFSET salto_linea ; Mensaje para imprimir un salto de línea
    INT 21h

    MOV SI, 2 ; Inicializamos el índice para cadena1 (saltando el byte de longitud)
    MOV DI, 2 ; Inicializamos el índice para cadena2 (saltando el byte de longitud)
    
    

comparar_cadenas:
    MOV AL, cadena1[SI] ; Cargamos un carácter de cadena1 en AL
    CMP AL, cadena2[DI] ; Comparamos con el carácter correspondiente en cadena2
    JNE no_son_iguales ; Si no son iguales, saltamos a imprimir que no son iguales
    
    INC SI ; Incrementamos el índice para cadena1
    INC DI ; Incrementamos el índice para cadena2
    
    CMP AL, '$' ; Verificamos si hemos llegado al final de la cadena
    JNE comparar_cadenas ; Si no, continuamos comparando
    
    ; Si llegamos aquí, las cadenas son iguales
    MOV AH, 9 ; Función para imprimir cadena
    MOV DX, OFFSET msj_iguales ; Mensaje de cadenas iguales
    INT 21h
    JMP fin

no_son_iguales:
    MOV AH, 9 ; Función para imprimir cadena
    MOV DX, OFFSET msj_no_iguales ; Mensaje de cadenas no iguales
    INT 21h

fin:
    HLT ; Terminamos el programa

DEFINE_PRINT_STRING
END

