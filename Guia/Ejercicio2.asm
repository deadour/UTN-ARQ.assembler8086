;Realice un programa que intercambie los contenidos de dos valores decimales
;definidos en dato1 y dato2"
;------------------------------------------------------


name "Ejercicio 2"

.Data

dato1 db 9
dato2 db 1
aux db ?

.CODE

mov AL, dato1  ; cargar dato1 en el reg
mov aux, AL    ; guardar dato1 en un aux 

mov AL, dato2  ; cargar dato2 en el reg

mov dato1, AL  ; mover dato2 -> dato1
 
mov AL, aux    ; cargar aux (dato 1) en el reg
mov dato2, AL  ; mover dato1 -> dato2
ret

end