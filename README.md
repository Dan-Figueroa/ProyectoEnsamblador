# ProyectoEnsamblador
un proyecto completo de ensamblador con operaciones aritméticas, comparación de numeros e imágenes, este proyecto se realizo con un dispositivo mac por lo que se ocupo el Visual Estudio Code y la extrension MASM/TASM 
<img width="884" alt="Captura de pantalla 2024-11-03 a la(s) 1 45 25 a m" src="https://github.com/user-attachments/assets/4be375bd-b267-4f0b-ad9d-76afd24ef21d">

puntos claves de este proyecto

1.- comparacion de 2 numeros para ver cual es mayor

    comparadorNumeros MACRO ;macro para comparar cual de los 2 numeros es mayor con un mensaje 
    ; Leer dos números
    CALL LEER_NUMEROS
    
    ; Comparar los dos números
    mov al, num1            
    cmp al, num2           
    jg num1_mayor  ;salt condicionado si el num1>num2         
    jl num2_mayor   ;salt condicionado si el num2>num1    

    ; Si son iguales
    imprimirMensaje iguales
    jmp fin_comparacion

    num1_mayor:
        imprimirMensaje mayor_num1
        jmp fin_comparacion

    num2_mayor:
        imprimirMensaje mayor_num2

    fin_comparacion:
    ENDM

2.- comparacion de 5 numeros para ver cual es el mayor

    comparadorCinco MACRO
      ; Leer cinco números
      CALL LEER_CINCO_NUMEROS
    
    ; Iniciar `mayor_actual` con el valor de `num1`
    mov al, num1
    mov mayor_actual, al
    
    ; Comparar con num2
    mov al, num2
    cmp al, mayor_actual
    jle siguiente_num3
    mov mayor_actual, al
    
    siguiente_num3:
        ; Comparar con num3
        mov al, num3
        cmp al, mayor_actual
        jle siguiente_num4
        mov mayor_actual, al

    siguiente_num4:
        ; Comparar con num4
        mov al, num4
        cmp al, mayor_actual
        jle siguiente_num5
        mov mayor_actual, al
    
    siguiente_num5:
        ; Comparar con num5
        mov al, num5
        cmp al, mayor_actual
        jle fin_comparacion5
        mov mayor_actual, al
    
    fin_comparacion5:
        ; Imprimir el mensaje y el mayor número encontrado
        imprimirMensaje msj_mayor
        add mayor_actual, '0'   ; Convertir el número a carácter ASCII
        mov dl, mayor_actual
        mov ah, 02h             ; Servicio para imprimir un carácter en DL
        int 21h
    ENDM
3.- operaciones aritmeticas con mas de de un digito

3.1-suma:

    codigo:
3.2-resta:

    codigo:
3.3-division:

    codigo:
3.4-multiplicacion:

    codigo:
