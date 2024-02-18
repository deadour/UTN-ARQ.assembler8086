; Ejercicio 1-Comp. 
; Dado dos números ingresados por teclado, 
; determinar cuál es el mayor de ellos,
; y si este es múltiplo del menor
;   
include 'emu8086.inc'
name "Mayor & Múltiplo"

org 100h

.DATA 
   opMy dw ?
   opMn dw ?
   

.CODE
   CALL PTHIS
   db "1er Op: ",0
   CALL   SCAN_NUM     
   MOV    opMy, cx 
   MOV    ax,cx
   CALL PTHIS
   db  13,10,"2do Op: ",0  
   CALL   SCAN_NUM     
   MOV    opMn, cx
   
   CMP cx, ax   
   JNA mayor ;Salta si CX <= AX
   MOV opMy,cx
   mov opMn,ax

mayor:
   CALL PTHIS
   db  13,10,"El Mayor es=",0   
   MOV ax, opMy   
   CALL PRINT_NUM  ;Imprime AX
   CALL PTHIS
   db   " y el Menor es=",0    
   MOV ax, opMn
   CALL PRINT_NUM   
     
   MOV cx, opMn
   MOV ax,opMy      
multiplo:
     SUB ax,cx
     JZ esMultiplo 
     JS noMultiplo
     JMP multiplo 

esMultiplo:
   CALL PTHIS
   db  0Dh,0Ah,"Numeros Son Multiplos",0 
   JMP fin
   
noMultiplo:
   CALL PTHIS
   db  0Dh,0Ah,"Numeros NO son Multiplos",0  
   
fin:   
   CALL PTHIS
   db  13,10,"Presione tecla para terminar...",0
   MOV ah, 1
   INT 21h
   
   HLT
   
DEFINE_PRINT_NUM_UNS  ; Requerido por PRINT_NUM.
DEFINE_PRINT_NUM
DEFINE_SCAN_NUM
;DEFINE_PRINT_STRING
DEFINE_PTHIS

END