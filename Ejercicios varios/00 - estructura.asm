TITLE ESTRUCTURA_BASICA ;Titulo

; ACA SE DECLARAN VARIABLES
DATOS SEGMENT


;
                    
DATOS ENDS; 

; ACA SE DEFINE UNA PILA

PILA SEGMENT;


 DB 64 DUP(0);  
 
PILA ENDS;  

CODIGO SEGMENT
    
INICIO PROC FAR 
    
     
    ;NEAR (SE LLAMA EL PROCEDIMIENTO DESDE EL MISMO SEGMENTO
    ;FAR (SE LLAMA EL PROCEDIMIENTO DESDE OTRO SEGMENTO, EL PRIMER PROCEDIMIENTO PRINCIPAL VA CON FAR  
   
ASSUME DS: DATOS, CS: CODIGO, SS: PILA; (DS: DATASEGMENT; CS:CODESEGMENT; SS: STACKSEGMENT)


PUSH DS ;PARA QUE SE GUARDE EN DS LA DIRECCIÓN DEL SEGMENTO PREFIJO DEL PROGRAMA Y SE GUARDE EN EL STACK CON LA PILA 

MOV AX, 0 ;MOV TIENE DOS OPERANDOS, EL PRIMERO ES EL DESTINO Y EL SEGUNDO LA FUENTE

PUSH AX

MOV AX, DATOS

MOV DS, AX
MOV ES, AX

; A PARTIR DE ACA EMPIEZA EL CODIGO DEL PROGRAMA.-

;------------------

 
 
;------------------  

RET

INICIO ENDP ;(PROCEDIMIENTO) 

CODIGO ENDS

END INICIO   

                        
;8086 tiene 8 registros de 16 bits:
;------------------------------------
;AX: registro ACUMULADOR: almacena resultados de escritura, lectura 


; 16 bits 111111111 00000000
;             AH      AL

;---
;BX: registro BASE, apuntador o indice  


;CD: registro CONTADOR, muy importante para los bucles.


;DX: registro de DATOS: fuente de donde salen los datos.

;SI: registro INDICE FUENTE
;DI: registro INDICE DESTINO

;SI OBTIENE LA DIRECCION DE ALGUN ELEMENTO Y SE COPIA EN DI:
    ;SI TOMA LA DIRECCION DEL ELEMENTO DEL ARREGLO Y LO COPIA EN DI; SI COPIA LA DIRECCION Y LA PASA A DI.


;BP: registro APUNTADOR BASE, manipula la pila sin afectar a la cola de segmentos

;SP: registro APUNTADOR PILA, apunta a un area especifica de memoria y sirve para almancer los datos bajo la estructura LIFO.  



;--- SUMA

MOV AL, 5 ; 5 PASA A AL.
ADD AL, 7; ADD SUMA 7 AL CONTENIDO DE AL. AL TIENE 8 BITS, ENTONCES AL COMO MAXIMO 256 BITS.

 