;EJERCICIO 1
;Realice un programa Assembler que permita sumar el contenido de las siguientes
;direcciones 2Ah, 2Bh, 2Ch y 2Dh guardando el resultado en 2Eh. Cargar dichas
;direcciones previamente con los valores de operandos.
                                                                
                                                                
ORG 100h;

mov ax, @Data
mov ds, ax

mov [2Ah], 14 ;muevo el numero al contenido de la direccion 2AH.
mov [2Bh], 22 ;muevo el numero al contenido de la direccion 2BH.
mov [2Ch], 51 ;muevo el numero al contenido de la direccion 2CH.
mov [2Dh], 33 ;muevo el numero al contenido de la direccion 2DH.

MOV AL, [2Ah] ; AL = AL + (2AH)
ADD AL, [2Bh] ; AL = AL + (2BH)
ADD AL, [2Ch] ; AL = AL + (2CH)
ADD AL, [2Ch] ; AL = AL + (2DH)

MOV [2Eh], AL ; mueve (AL) a 2Eh

end                                                      