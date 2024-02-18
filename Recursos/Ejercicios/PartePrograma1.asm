; suma  vector y guarda resultado en Ax
;name "PartesPrograma1"

org 0500h
mov bx,9Ch ; en bx tenemos la posición dentro del vector
mov dx,var
mov var, bx

mov ah,02h
int 21h  
mov dx,offset mensaje           
mov ah,09h
int 21h  


ret ; volver al sistema operativo 

vec db 10,20,2,200,34,44,21,8,10,22; cargar un vector con constantes
var db  5
mensaje db "hola mundo$"
var3    db  ?
