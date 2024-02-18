;Realizar un programa asm8086 dado un vector con 12 elementos fijos precargfados, 
;calcule la sumatoria los contenidos que sean mayor a 2 y visualice el resultado por pantalla precedido por un texto descriptivo.
	
	include 'emu8086.inc'
	org 100h
	;AVISO : En este programa no se a aclarado como deberian de ser de grande los numeros
	;Para numeros mas grandes (16 bits), deberia considerar AX en lugar de al.
	
	mov cx, 12 ;Iterador de bucle
	mov bx, 0  ;Indice del arreglo de entrada
	 
	PRINT 'Programa de IAN. Sumatoria de mayores a 2'
	PRINTN
	
	bucle:
	  mov ah,0
	  mov al, vector[bx]
	  
	  cmp al, auxiliar
	  jg esMayor:
	  jmp exit
	  
	    esMayor:
	        mov al, vector[bx]
	        
	        PRINT 'Este numero : '
	        CALL print_num
	        PRINT ' es mayor que 2'
	        PRINTN
	        mov al, vector[bx]
	        add al, sumatoria 
	        mov sumatoria, al
	        jmp exit  
	  
	  exit:
	    inc bx
	
	
	loop bucle
	
	mov ah,0
	PRINTN
	PRINT 'El total resultante es : '
	mov al,sumatoria
	CALL print_num
	
	ret   
	
	sumatoria db 0
	auxiliar db 2
	vector db 4, 3, 5, 2, 1, 8, 9, 0, 1, 1, 0, 2  ;Deberia dar 29
	    
	DEFINE_PRINT_NUM
	DEFINE_PRINT_NUM_UNS
end