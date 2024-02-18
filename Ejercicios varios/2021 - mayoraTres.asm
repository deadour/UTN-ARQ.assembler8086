	name "mayores-a-tres"
	
	include 'emu8086.inc'
	ORG 100h
	
	.DATA
	; el vector es precargado con valores
	; en secuencia para mayor comodidad
	vector db 1,2,3,4,5,6,7,8,9,10,11,12,13
	
	.CODE
	     ;mov ax,@Data
	     ;mov ds, ax
	     mov bx,0 ; en bx tenemos la posicion dentro del vector, inicia en 0
	     mov cx,13 ; descontador cantidad de posiciones del vector.
	     mov ax,0 ; suma
	     mov dx,0
	     
	     
	     bucle:
	        mov Al,vector[bx] ; cargamos en DL el elemento del vector indicado en BX
	        inc bx ; incrementamos BX, avanza el vector         
	        cmp Al, 3
	        
	        jg imprimirNum ; salto condicional si es mayor a tres.
	        
	        
	      next:
	        loop bucle 
	        
	        
	      ret       
	      imprimirNum: 
	                CALL print_num ; imprime varlor de AX.
	                print ','
	                call next
	               
	        
	
	;--- definicion de procedimientos de impresion
	;--- y captura de datos de libreria emu8086.inc
	
	 ; definir si se usa print_num.
	 ;el print num me modificaba el cx y no permitia avanzar
	DEFINE_PRINT_NUM
	DEFINE_PRINT_NUM_UNS 
	
END 