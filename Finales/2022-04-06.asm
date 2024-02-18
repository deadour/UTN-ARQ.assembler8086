INCLUDE 'emu8086.inc'
ORG 100h

.DATA
    cadena1 DB 100, ?, 100 DUP ('$') ; Definimos una cadena para ingresar la primera cadena
    cadena2 DB 100, ?, 100 DUP ('$') ; Definimos una cadena para ingresar la segunda cadena
    msj_entrada1 DB 'Ingrese la primera cadena: $'
    msj_entrada2 DB 'Ingrese la segunda cadena: $'
    msj_iguales DB 'Las cadenas son iguales.$'
    msj_no_iguales DB 'Las cadenas no son iguales.$'
    salto_linea DB 13, 10, '$' ; Secuencia de escape para un salto de l�nea

.CODE
    MOV AX, @DATA
    MOV DS, AX

    ; Ingresar la primera cadena
    MOV AH, 9 ; Funci�n para imprimir cadena
    MOV DX, OFFSET msj_entrada1 ; Mensaje para ingresar la primera cadena
    INT 21h
    
    MOV AH, 0Ah ; Funci�n para leer cadena
    MOV DX, OFFSET cadena1 ; Direcci�n donde se almacenar� la cadena ingresada
    INT 21h
    
    ; Imprimir un salto de p�gina
    MOV AH, 9 ; Funci�n para imprimir cadena
    MOV DX, OFFSET salto_linea ; Mensaje para imprimir un salto de l�nea
    INT 21h
    
    ; Ingresar la segunda cadena
    MOV AH, 9 ; Funci�n para imprimir cadena
    MOV DX, OFFSET msj_entrada2 ; Mensaje para ingresar la segunda cadena
    INT 21h
    
    MOV AH, 0Ah ; Funci�n para leer cadena
    MOV DX, OFFSET cadena2 ; Direcci�n donde se almacenar� la cadena ingresada
    INT 21h
    
        ; Imprimir un salto de p�gina
    MOV AH, 9 ; Funci�n para imprimir cadena
    MOV DX, OFFSET salto_linea ; Mensaje para imprimir un salto de l�nea
    INT 21h

    MOV SI, 2 ; Inicializamos el �ndice para cadena1 (saltando el byte de longitud)
    MOV DI, 2 ; Inicializamos el �ndice para cadena2 (saltando el byte de longitud)
    
    

comparar_cadenas:
    MOV AL, cadena1[SI] ; Cargamos un car�cter de cadena1 en AL
    CMP AL, cadena2[DI] ; Comparamos con el car�cter correspondiente en cadena2
    JNE no_son_iguales ; Si no son iguales, saltamos a imprimir que no son iguales
    
    INC SI ; Incrementamos el �ndice para cadena1
    INC DI ; Incrementamos el �ndice para cadena2
    
    CMP AL, '$' ; Verificamos si hemos llegado al final de la cadena
    JNE comparar_cadenas ; Si no, continuamos comparando
    
    ; Si llegamos aqu�, las cadenas son iguales
    MOV AH, 9 ; Funci�n para imprimir cadena
    MOV DX, OFFSET msj_iguales ; Mensaje de cadenas iguales
    INT 21h
    JMP fin

no_son_iguales:
    MOV AH, 9 ; Funci�n para imprimir cadena
    MOV DX, OFFSET msj_no_iguales ; Mensaje de cadenas no iguales
    INT 21h

fin:
    HLT ; Terminamos el programa

DEFINE_PRINT_STRING
END

