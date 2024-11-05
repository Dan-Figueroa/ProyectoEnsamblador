data SEGMENT
    menu db 0Ah, 0Dh, 'ELIGE UNA OPCION: 1.-COMPARACION DE NUMEROS 2.-OPERACIONES ARITMETICAS 3.-IMAGENES 4.-SALIR: $'
    menu1 db 0Ah, 0Dh, 'ELIGE UNA OPCION: 1.-COMPARACION DE NUMEROS 2.-NUMERO MAYOR 3.-SALIR: $'
    menu2 db 0AH, 0Dh, 'ELIGE UNA OPCION: 1.-SUMA 2.-RESTA 3.-MULTIPLICACION 4.-DIVISION 5.-SALIR: $'
    menu3 db 0AH, 0Dh, 'ELIGE UNA OPCION: 1.-GUANTE 2.-TRINEO 3.-GORRITO 4.-SANTA 5.-SALIR: $'
    msj1 db 0AH, 0DH, 'DAME EL PRIMER NUMERO: $'
    msj2 db 0AH, 0DH, 'DAME EL SEGUNDO NUMERO: $'
    msj3 db 0AH, 0DH, 'DAME EL TERCER NUMERO: $'
    msj4 db 0AH, 0DH, 'DAME EL CUARTO NUMERO: $'
    msj5 db 0AH, 0DH, 'DAME EL QUINTO NUMERO: $'
    msj6 db 0Ah, 0Dh,'INGRESA EL PRIMER NUMERO (2 dígitos):$'
    msj7 db 0Ah, 0Dh,'INGRESA OTRO NUMERO (2 dígitos):$'
    msj8 db 0Ah, 0Dh,'LA SUMA DE LOS 2 NUMEROS ES: $'
    msj9 db 0Ah, 0Dh,'LA RESTA DE LOS 2 NUMEROS ES: $'
    msj10 db 0Ah, 0Dh,'LA MULTIPLICACION DE LOS 2 NUMEROS ES: $'
    msj11 db 0Ah, 0Dh,'LA DIVISION DE LOS 2 NUMEROS ES: $'
    mayor_num1 db 0AH, 0DH, 'EL PRIMER NUMERO ES MAYOR. $'
    mayor_num2 db 0AH, 0DH, 'EL SEGUNDO NUMERO ES MAYOR. $'
    iguales db 0AH, 0DH, 'AMBOS NUMEROS SON IGUALES. $'
    msj_mayor db 0AH, 0DH, 'EL MAYOR NUMERO ES: $'
    division_error_msg db 'ERROR: No se puede dividir por cero!$', 0
    op db ?
    op1 db ?
    op2 db ?
    op3 db ?
    num1 db ?
    num2 db ?
    num3 db ?
    num4 db ?
    num5 db ?
    num6 dw ?           ; Número 1
    num7 dw ?           ; Número 2
    result dw ?         ; Resultado
    mayor_actual db ?
data ENDS

imprimirMensaje MACRO mensaje ;macro para imprimir un mensaje
    mov ah, 09h
    lea dx, mensaje
    int 21h
ENDM

leerNumero MACRO variable ;macro para recibir un numero del usuario 
    mov ah, 01h
    int 21h
    sub al, '0'
    mov variable, al
ENDM

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

read_two_digit_number MACRO numeros
    mov ah, 01h              ; Leer primer dígito
    int 21h
    sub al, '0'              ; Convertir a número
    mov bl, al               ; Almacenar el primer dígito en BL
    mov ah, 01h              ; Leer segundo dígito
    int 21h
    sub al, '0'              ; Convertir a número
    mov bh, al               ; Almacenar el segundo dígito en BH
    ; Combinar los dos dígitos en un número de 2 dígitos decimal
    mov al, bl               ; Primer dígito en AL
    mov ah, 0                ; Limpiar AH
    mov cx, 10               ; Multiplicador de decenas
    mul cx                   ; AL * 10
    add al, bh               ; Sumar el segundo dígito
    mov numeros, ax         ; Almacenar el resultado en la variable
ENDM

sumar MACRO 
    CALL LEER_NUMEROS2
    mov ax, num6
    add ax, num7
    mov result, ax
    imprimirMensaje msj8
    call print_result
ENDM

restar MACRO 
    CALL LEER_NUMEROS2
    mov ax, num6
    sub ax, num7
    mov result, ax
   imprimirMensaje msj9
    call print_result
ENDM

multiplicar MACRO params
    CALL LEER_NUMEROS2
    mov ax, num6
    mov bx, num7
    mul bx
    mov result, ax
    imprimirMensaje msj10
    call print_result
ENDM

dividir MACRO 
    CALL LEER_NUMEROS2
    mov ax, num7
    cmp ax, 0
    JE DIVISION_ERROR
    mov ax, num6
    mov bx, num7
    xor dx, dx              ; Limpiar DX antes de dividir
    div bx
    mov result, ax
    imprimirMensaje msj11
    call print_result
ENDM

dibujoguante MACRO
    ;Fondo
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00010000B
            MOV CH, 0
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H ;fondo 
        ;Puntos
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 3D
            MOV CL, 10D
            MOV DH, 3D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 10D
            MOV DH, 5D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 8D
            MOV DH, 4D
            MOV DL, 9D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 12D
            MOV DH, 4D
            MOV DL, 13D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 5D
            MOV DH, 13D
            MOV DL, 6D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 23D
            MOV CL, 16D
            MOV DH, 23D
            MOV DL, 17D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 43D
            MOV DH, 5D
            MOV DL, 44D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 7D
            MOV CL, 43D
            MOV DH, 7D
            MOV DL, 44D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 6D
            MOV CL, 41D
            MOV DH, 6D
            MOV DL, 42D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 6D
            MOV CL, 45D
            MOV DH, 6D
            MOV DL, 46D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 8D
            MOV CL, 69D
            MOV DH, 8D
            MOV DL, 70D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 22D
            MOV CL, 40D
            MOV DH, 22D
            MOV DL, 41D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 18D
            MOV CL, 74D
            MOV DH, 18D
            MOV DL, 75D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 20D
            MOV CL, 74D
            MOV DH, 20D
            MOV DL, 75D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 19D
            MOV CL, 72D
            MOV DH, 19D
            MOV DL, 73D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 19D
            MOV CL, 76D
            MOV DH, 19D
            MOV DL, 77D
            INT 10H;copo3

        ;Guante1
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 6D
            MOV CL, 25D
            MOV DH, 6D
            MOV DL, 29D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 7D
            MOV CL, 23D
            MOV DH, 7D
            MOV DL, 34D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 8D
            MOV CL, 21D
            MOV DH, 8D
            MOV DL, 34D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 9D
            MOV CL, 19D
            MOV DH, 9D
            MOV DL, 34D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 10D
            MOV CL, 19D
            MOV DH, 10D
            MOV DL, 34D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 11D
            MOV CL, 19D
            MOV DH, 13D
            MOV DL, 40D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 10D
            MOV CL, 24D
            MOV DH, 10D
            MOV DL, 25D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 10D
            MOV CL, 28D
            MOV DH, 10D
            MOV DL, 29D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 11D
            MOV CL, 22D
            MOV DH, 11D
            MOV DL, 23D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 22D
            MOV DH, 13D
            MOV DL, 23D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 11D
            MOV CL, 30D
            MOV DH, 11D
            MOV DL, 31D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 30D
            MOV DH, 13D
            MOV DL, 31D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 11D
            MOV CL, 26D
            MOV DH, 11D
            MOV DL, 27D
            INT 10H;cruz

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 12D
            MOV CL, 24D
            MOV DH, 12D
            MOV DL, 29D
            INT 10H;cruz

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 26D
            MOV DH, 13D
            MOV DL, 27D
            INT 10H;cruz

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 14D
            MOV CL, 19D
            MOV DH, 14D
            MOV DL, 38D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 14D
            MOV CL, 24D
            MOV DH, 14D
            MOV DL, 25D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 14D
            MOV CL, 28D
            MOV DH, 14D
            MOV DL, 29D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 15D
            MOV CL, 19D
            MOV DH, 15D
            MOV DL, 36D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 16D
            MOV CL, 21D
            MOV DH, 16D
            MOV DL, 34D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 17D
            MOV CL, 19D
            MOV DH, 19D
            MOV DL, 36D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 21D
            MOV DH, 20D
            MOV DL, 34D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01100000B
            MOV CH, 21D
            MOV CL, 21D
            MOV DH, 24D
            MOV DL, 34D
            INT 10H;mano
            
        ;Guante2:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 6D
            MOV CL, 55D
            MOV DH, 6D
            MOV DL, 59D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 7D
            MOV CL, 50D
            MOV DH, 7D
            MOV DL, 61D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 8D
            MOV CL, 50D
            MOV DH, 8D
            MOV DL, 63D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 9D
            MOV CL, 50D
            MOV DH, 9D
            MOV DL, 65D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 10D
            MOV CL, 50D
            MOV DH, 10D
            MOV DL, 65D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 11D
            MOV CL, 45D
            MOV DH, 13D
            MOV DL, 65D
            INT 10H;hasta aca rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 10D
            MOV CL, 54D
            MOV DH, 10D
            MOV DL, 55D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 10D
            MOV CL, 58D
            MOV DH, 10D
            MOV DL, 59D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 11D
            MOV CL, 52D
            MOV DH, 11D
            MOV DL, 53D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 52D
            MOV DH, 13D
            MOV DL, 53D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 11D
            MOV CL, 60D
            MOV DH, 11D
            MOV DL, 61D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 60D
            MOV DH, 13D
            MOV DL, 61D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 11D
            MOV CL, 56D
            MOV DH, 11D
            MOV DL, 57D
            INT 10H;cruz

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 12D
            MOV CL, 54D
            MOV DH, 12D
            MOV DL, 59D
            INT 10H;cruz

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 13D
            MOV CL, 56D
            MOV DH, 13D
            MOV DL, 57D
            INT 10H;cruz

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 14D
            MOV CL, 47D
            MOV DH, 14D
            MOV DL, 65D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 14D
            MOV CL, 54D
            MOV DH, 14D
            MOV DL, 55D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 14D
            MOV CL, 58D
            MOV DH, 14D
            MOV DL, 59D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 15D
            MOV CL, 49D
            MOV DH, 15D
            MOV DL, 65D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 16D
            MOV CL, 51D
            MOV DH, 16D
            MOV DL, 63D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 17D
            MOV CL, 49D
            MOV DH, 19D
            MOV DL, 65D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 51D
            MOV DH, 20D
            MOV DL, 63D
            INT 10H;blanoc

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01100000B
            MOV CH, 21D
            MOV CL, 51D
            MOV DH, 24D
            MOV DL, 63D
            INT 10H;mano
ENDM

dibujotrineo MACRO
    ;Fondo:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00010000B
            MOV CH, 0
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H ;fondo 

             MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 3D
            MOV CL, 10D
            MOV DH, 3D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 10D
            MOV DH, 5D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 8D
            MOV DH, 4D
            MOV DL, 9D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 12D
            MOV DH, 4D
            MOV DL, 13D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 23D
            MOV CL, 16D
            MOV DH, 23D
            MOV DL, 17D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 46D
            MOV DH, 5D
            MOV DL, 47D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 7D
            MOV CL, 46D
            MOV DH, 7D
            MOV DL, 47D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 6D
            MOV CL, 44D
            MOV DH, 6D
            MOV DL, 45D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 6D
            MOV CL, 48D
            MOV DH, 6D
            MOV DL, 49D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 8D
            MOV CL, 69D
            MOV DH, 8D
            MOV DL, 70D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 22D
            MOV CL, 40D
            MOV DH, 22D
            MOV DL, 41D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 18D
            MOV CL, 74D
            MOV DH, 18D
            MOV DL, 75D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 20D
            MOV CL, 74D
            MOV DH, 20D
            MOV DL, 75D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 19D
            MOV CL, 72D
            MOV DH, 19D
            MOV DL, 73D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 19D
            MOV CL, 76D
            MOV DH, 19D
            MOV DL, 77D
            INT 10H;copo3

        ;Reno:
            ;Cuernos:
                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00001111B  
                MOV CH, 6D
                MOV CL, 15D
                MOV DH, 7D
                MOV DL, 16D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00001111B  
                MOV CH, 6D
                MOV CL, 19D
                MOV DH, 7D
                MOV DL, 20D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 8D
                MOV CL, 13D
                MOV DH, 10D
                MOV DL, 14D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 10D
                MOV CL, 15D
                MOV DH, 10D
                MOV DL, 16D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 8D
                MOV CL, 17D
                MOV DH, 10D
                MOV DL, 18D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 8D
                MOV CL, 17D
                MOV DH, 8D
                MOV DL, 22D
                INT 10H

            ;Cuerpo:

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B 
                MOV CH, 10D
                MOV CL, 11D
                MOV DH, 10D
                MOV DL, 12D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 11D
                MOV CL, 7D
                MOV DH, 12D
                MOV DL, 14D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 11110000B  
                MOV CH, 11D
                MOV CL, 7D
                MOV DH, 11D
                MOV DL, 10D
                INT 10H; blanco 

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 11D
                MOV CL, 11D
                MOV DH, 11D
                MOV DL, 12D
                INT 10H; ojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 11000000B  ; nariz
                MOV CH, 12D
                MOV CL, 5D
                MOV DH, 12D
                MOV DL, 6D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 13D
                MOV CL, 7D
                MOV DH, 13D
                MOV DL, 30D
                INT 10H

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 11110000B  
                MOV CH, 13D
                MOV CL, 30D
                MOV DH, 13D
                MOV DL, 31D
                INT 10H;punto
            
                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 12D
                MOV CL, 30D
                MOV DH, 12D
                MOV DL, 31D
                INT 10H;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 11110000B  
                MOV CH, 12D
                MOV CL, 32D
                MOV DH, 12D
                MOV DL, 33D
                INT 10H;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 11D
                MOV CL, 32D
                MOV DH, 11D
                MOV DL, 33D
                INT 10H;punto2

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B 
                MOV CH, 14D
                MOV CL, 11D
                MOV DH, 15D
                MOV DL, 29D
                INT 10H;cuerpo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 15D
                MOV CL, 11D
                MOV DH, 15D
                MOV DL, 12D
                INT 10H ;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 14D
                MOV CL, 13D
                MOV DH, 14D
                MOV DL, 14D
                INT 10H ;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 13D
                MOV CL, 15D
                MOV DH, 13D
                MOV DL, 16D
                INT 10H ;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 14D
                MOV CL, 17D
                MOV DH, 14D
                MOV DL, 18D
                INT 10H ;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 15D
                MOV CL, 19D
                MOV DH, 15D
                MOV DL, 22D
                INT 10H ;puntosx2

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 16D
                MOV CL, 23D
                MOV DH, 16D
                MOV DL, 31D
                INT 10H;liston

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 15D
                MOV CL, 32D
                MOV DH, 15D
                MOV DL, 33D
                INT 10H ;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 14D
                MOV CL, 34D
                MOV DH, 14D
                MOV DL, 35D
                INT 10H ;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 13D
                MOV CL, 36D
                MOV DH, 13D
                MOV DL, 37D
                INT 10H ;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 12D
                MOV CL, 38D
                MOV DH, 12D
                MOV DL, 39D
                INT 10H ;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 11D
                MOV CL, 40D
                MOV DH, 11D
                MOV DL, 41D
                INT 10H ;punto

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 10D
                MOV CL, 42D
                MOV DH, 10D
                MOV DL, 43D
                INT 10H ;punto


                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 11110000B  
                MOV CH, 16D
                MOV CL, 15D
                MOV DH, 16D
                MOV DL, 22D
                INT 10H;blanco

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 16D
                MOV CL, 13D
                MOV DH, 16D
                MOV DL, 14D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 10100000B  
                MOV CH, 16D
                MOV CL, 9D
                MOV DH, 16D
                MOV DL, 12D
                INT 10H;verde

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 10100000B  
                MOV CH, 15D
                MOV CL, 9D
                MOV DH, 15D
                MOV DL, 10D
                INT 10H ;puntorverde

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 17D
                MOV CL, 11D
                MOV DH, 17D
                MOV DL, 14D
                INT 10H;comienzo de pata

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 11110000B  
                MOV CH, 17D
                MOV CL, 17D
                MOV DH, 17D
                MOV DL, 25D
                INT 10H;blanco

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 17D
                MOV CL, 26D
                MOV DH, 17D
                MOV DL, 31D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 18D
                MOV CL, 9D
                MOV DH, 19D
                MOV DL, 12D
                INT 10H;pata1

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 20D
                MOV CL, 9D
                MOV DH, 20D
                MOV DL, 12D
                INT 10H;pata1negro

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 18D
                MOV CL, 28D
                MOV DH, 18D
                MOV DL, 33D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 19D
                MOV CL, 30D
                MOV DH, 19D
                MOV DL, 33D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 20D
                MOV CL, 32D
                MOV DH, 20D
                MOV DL, 33D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 00000000B  
                MOV CH, 19D
                MOV CL, 34D
                MOV DH, 20D
                MOV DL, 35D
                INT 10H;negro

        ;Trineo: 

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 9D
                MOV CL, 40D
                MOV DH, 9D
                MOV DL, 51D
                INT 10H;comienzo del trineo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 10D
                MOV CL, 46D
                MOV DH, 10D
                MOV DL, 47D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 10D
                MOV CL, 48D
                MOV DH, 10D
                MOV DL, 51D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 10D
                MOV CL, 52D
                MOV DH, 10D
                MOV DL, 55D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 10D
                MOV CL, 58D
                MOV DH, 10D
                MOV DL, 59D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 10D
                MOV CL, 60D
                MOV DH, 11D
                MOV DL, 74D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 11D
                MOV CL, 56D
                MOV DH, 11D
                MOV DL, 59D
                INT 10H;cafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 11D
                MOV CL, 50D
                MOV DH, 11D
                MOV DL, 55D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 12D
                MOV CL, 50D
                MOV DH, 12D
                MOV DL, 74D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 13D
                MOV CL, 52D
                MOV DH, 13D
                MOV DL, 74D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 14D
                MOV CL, 54D
                MOV DH, 14D
                MOV DL, 72D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 15D
                MOV CL, 56D
                MOV DH, 15D
                MOV DL, 57D
                INT 10H;patas

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 15D
                MOV CL, 67D
                MOV DH, 15D
                MOV DL, 68D
                INT 10H;patas

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 16D
                MOV CL, 48D
                MOV DH, 16D
                MOV DL, 76D
                INT 10H;patas

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 15D
                MOV CL, 48D
                MOV DH, 15D
                MOV DL, 49D
                INT 10H;patas

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 15D
                MOV CL, 75D
                MOV DH, 15D
                MOV DL, 76D
                INT 10H;patas

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 9D
                MOV CL, 62D
                MOV DH, 9D
                MOV DL, 74D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 9D
                MOV CL, 60D
                MOV DH, 9D
                MOV DL, 61D
                INT 10H;puntocafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 8D
                MOV CL, 64D
                MOV DH, 8D
                MOV DL, 74D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 8D
                MOV CL, 62D
                MOV DH, 8D
                MOV DL, 63D
                INT 10H;puntocafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 7D
                MOV CL, 64D
                MOV DH, 7D
                MOV DL, 65D
                INT 10H;puntocafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 7D
                MOV CL, 66D
                MOV DH, 7D
                MOV DL, 76D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 6D
                MOV CL, 66D
                MOV DH, 6D
                MOV DL, 67D
                INT 10H;puntocafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 6D
                MOV CL, 68D
                MOV DH, 6D
                MOV DL, 76D
                INT 10H;rojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01100000B  
                MOV CH, 5D
                MOV CL, 68D
                MOV DH, 5D
                MOV DL, 78D
                INT 10H;puntocafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 10100000B  
                MOV CH, 6D
                MOV CL, 64D
                MOV DH, 6D
                MOV DL, 65D
                INT 10H;puntoverde

                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 5D
                MOV CL, 64D
                MOV DH, 5D
                MOV DL, 67D
                INT 10H;puntocafe

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 10100000B  
                MOV CH, 3D
                MOV CL, 64D
                MOV DH, 4D
                MOV DL, 67D
                INT 10H;puntoverde

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 3D
                MOV CL, 68D
                MOV DH, 4D
                MOV DL, 69D
                INT 10H;litonrojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 10100000B  
                MOV CH, 3D
                MOV CL, 70D
                MOV DH, 4D
                MOV DL, 73D
                INT 10H;puntoverde

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 2D
                MOV CL, 70D
                MOV DH, 2D
                MOV DL, 71D
                INT 10H;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 1D
                MOV CL, 72D
                MOV DH, 1D
                MOV DL, 73D
                INT 10H;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 2D
                MOV CL, 66D
                MOV DH, 2D
                MOV DL, 67D
                INT 10H;puntorojo

                MOV AH, 06H 
                MOV AL, 0
                MOV BH, 01000000B  
                MOV CH, 1D
                MOV CL, 64D
                MOV DH, 1D
                MOV DL, 65D
                INT 10H;puntorojo

ENDM

dibujogorrito MACRO
    ;Fondo:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00010000B
            MOV CH, 0
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H ;fondo 

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 3D
            MOV CL, 10D
            MOV DH, 3D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 10D
            MOV DH, 5D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 8D
            MOV DH, 4D
            MOV DL, 9D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 12D
            MOV DH, 4D
            MOV DL, 13D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 23D
            MOV CL, 16D
            MOV DH, 23D
            MOV DL, 17D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 14D
            MOV CL, 10D
            MOV DH, 14D
            MOV DL, 11D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 1D
            MOV CL, 58D
            MOV DH, 1D
            MOV DL, 59D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 8D
            MOV CL, 69D
            MOV DH, 8D
            MOV DL, 70D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 18D
            MOV CL, 74D
            MOV DH, 18D
            MOV DL, 75D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 20D
            MOV CL, 74D
            MOV DH, 20D
            MOV DL, 75D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 19D
            MOV CL, 72D
            MOV DH, 19D
            MOV DL, 73D
            INT 10H;copo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 19D
            MOV CL, 76D
            MOV DH, 19D
            MOV DL, 77D
            INT 10H;copo3

        ;Gorro:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 1D
            MOV CL, 38D
            MOV DH, 1D
            MOV DL, 41D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 2D
            MOV CL, 36D
            MOV DH, 2D
            MOV DL, 43D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01110000B
            MOV CH, 3D
            MOV CL, 38D
            MOV DH, 3D
            MOV DL, 41D
            INT 10H;blaco pelusa

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11000000B
            MOV CH, 4D
            MOV CL, 38D
            MOV DH, 4D
            MOV DL, 41D
            INT 10H;empieza rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11000000B
            MOV CH, 5D
            MOV CL, 34D
            MOV DH, 5D
            MOV DL, 45D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11000000B
            MOV CH, 6D
            MOV CL, 32D
            MOV DH, 6D
            MOV DL, 47D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11000000B
            MOV CH, 7D
            MOV CL, 30D
            MOV DH, 11D
            MOV DL, 49D
            INT 10H;rojo

            ;puntos cyan

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 8D
            MOV CL, 30D
            MOV DH, 8D
            MOV DL, 31D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 10D
            MOV CL, 30D
            MOV DH, 10D
            MOV DL, 31D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 9D
            MOV CL, 32D
            MOV DH, 9D
            MOV DL, 33D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 8D
            MOV CL, 34D
            MOV DH, 8D
            MOV DL, 35D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 10D
            MOV CL, 34D
            MOV DH, 10D
            MOV DL, 35D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 9D
            MOV CL, 36D
            MOV DH, 9D
            MOV DL, 37D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 8D
            MOV CL, 38D
            MOV DH, 8D
            MOV DL, 39D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 10D
            MOV CL, 38D
            MOV DH, 10D
            MOV DL, 39D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 9D
            MOV CL, 40D
            MOV DH, 9D
            MOV DL, 41D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 8D
            MOV CL, 42D
            MOV DH, 8D
            MOV DL, 43D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 10D
            MOV CL, 42D
            MOV DH, 10D
            MOV DL, 43D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 9D
            MOV CL, 44D
            MOV DH, 9D
            MOV DL, 45D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 8D
            MOV CL, 46D
            MOV DH, 8D
            MOV DL, 47D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 10D
            MOV CL, 46D
            MOV DH, 10D
            MOV DL, 47D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 9D
            MOV CL, 48D
            MOV DH, 9D
            MOV DL, 49D
            INT 10H

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 12D
            MOV CL, 28D
            MOV DH, 14D
            MOV DL, 51D
            INT 10H;parte blanca del gorro de abajo 

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 15D
            MOV CL, 26D
            MOV DH, 17D
            MOV DL, 29D
            INT 10H;cabello

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 15D
            MOV CL, 50D
            MOV DH, 17D
            MOV DL, 53D
            INT 10H;cabello

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01100000B
            MOV CH, 15D
            MOV CL, 30D
            MOV DH, 20D
            MOV DL, 49D
            INT 10H;cara

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01100000B
            MOV CH, 20D
            MOV CL, 35D
            MOV DH, 22D
            MOV DL, 44D
            INT 10H;cuello

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 23D
            MOV CL, 28D
            MOV DH, 23D
            MOV DL, 51D
            INT 10H;camisa

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 24D
            MOV CL, 26D
            MOV DH, 24D
            MOV DL, 53D
            INT 10H;camisa

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 17D
            MOV CL, 32D
            MOV DH, 18D
            MOV DL, 35D
            INT 10H;ojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 18D
            MOV CL, 34D
            MOV DH, 18D
            MOV DL, 35D
            INT 10H;punto del ojo 

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 17D
            MOV CL, 42D
            MOV DH, 18D
            MOV DL, 45D
            INT 10H;ojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 18D
            MOV CL, 44D
            MOV DH, 18D
            MOV DL, 45D
            INT 10H;punto del ojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 20D
            MOV CL, 37D
            MOV DH, 20D
            MOV DL, 40D
            INT 10H;boca
ENDM

dibujosanta MACRO
    ;Fondo:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00010000B
            MOV CH, 0
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H ;fondo 

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 3D
            MOV CL, 10D
            MOV DH, 3D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 10D
            MOV DH, 5D
            MOV DL, 11D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 8D
            MOV DH, 4D
            MOV DL, 9D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 4D
            MOV CL, 12D
            MOV DH, 4D
            MOV DL, 13D
            INT 10H;copo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 5D
            MOV CL, 40D
            MOV DH, 5D
            MOV DL, 41D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 7D
            MOV CL, 40D
            MOV DH, 7D
            MOV DL, 41D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 6D
            MOV CL, 38D
            MOV DH, 6D
            MOV DL, 39D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 6D
            MOV CL, 42D
            MOV DH, 6D
            MOV DL, 43D
            INT 10H;copo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 23D
            MOV CL, 16D
            MOV DH, 23D
            MOV DL, 17D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 14D
            MOV CL, 10D
            MOV DH, 14D
            MOV DL, 11D
            INT 10H;puntos

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 1110000B
            MOV CH, 1D
            MOV CL, 58D
            MOV DH, 1D
            MOV DL, 59D
            INT 10H;puntos

        ;Casa:

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 20D
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H

        ;Chimenea:

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 15D
            MOV CL, 10D
            MOV DH, 19D
            MOV DL, 20D
            INT 10H;palo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 13
            MOV CL, 8
            MOV DH, 14D
            MOV DL, 22D
            INT 10H;arriba

        ;Nieve:

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 13D
            MOV CL, 8D
            MOV DH, 14D
            MOV DL, 9D
            INT 10H;arriba

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 13D
            MOV CL, 8D
            MOV DH, 13D
            MOV DL, 12D
            INT 10H;arriba

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 13D
            MOV CL, 13D
            MOV DH, 15D
            MOV DL, 15D
            INT 10H;arriba

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 13D
            MOV CL, 16D
            MOV DH, 14D
            MOV DL, 18D
            INT 10H;arriba

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 13D
            MOV CL, 19D
            MOV DH, 13D
            MOV DL, 22D
            INT 10H;arribaPALO 

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 0
            MOV DH, 22D
            MOV DL, 2D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 3D
            MOV DH, 21D
            MOV DL, 4D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 5D
            MOV DH, 20D
            MOV DL, 7D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 19D
            MOV CL, 8D
            MOV DH, 23D
            MOV DL, 9D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 10D
            MOV DH, 21D
            MOV DL, 12D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 13D
            MOV DH, 22D
            MOV DL, 16D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 17D
            MOV DH, 20D
            MOV DL, 20D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 19D
            MOV CL, 21D
            MOV DH, 21D
            MOV DL, 23D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 24D
            MOV DH, 22D
            MOV DL, 26D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 27D
            MOV DH, 23D
            MOV DL, 29D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 30D
            MOV DH, 22D
            MOV DL, 32D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 33D
            MOV DH, 20D
            MOV DL, 35D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 36D
            MOV DH, 21D
            MOV DL, 38D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 39D
            MOV DH, 24D
            MOV DL, 41D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 42D
            MOV DH, 22D
            MOV DL, 44D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 45D
            MOV DH, 20D
            MOV DL, 50D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 51D
            MOV DH, 24D
            MOV DL, 57D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 58D
            MOV DH, 23D
            MOV DL, 61D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 62D
            MOV DH, 22D
            MOV DL, 65D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 66D
            MOV DH, 21D
            MOV DL, 68D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 69D
            MOV DH, 23D
            MOV DL, 72D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 73D
            MOV DH, 21D
            MOV DL, 75D
            INT 10H;CASANIEVE

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 20D
            MOV CL, 76D
            MOV DH, 23D
            MOV DL, 79D
            INT 10H;CASANIEVE

        ;Regalos:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 18D
            MOV CL, 0D
            MOV DH, 19D
            MOV DL, 4D
            INT 10H;regalo 1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 18D
            MOV CL, 2D
            MOV DH, 19D
            MOV DL, 3D
            INT 10H;liston

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10110000B
            MOV CH, 11D
            MOV CL, 11D
            MOV DH, 12D
            MOV DL, 19D
            INT 10H;regalo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 11D
            MOV CL, 14D
            MOV DH, 12D
            MOV DL, 16D
            INT 10H;liston

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 10D
            MOV CL, 13D
            MOV DH, 10D
            MOV DL, 14D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 10D
            MOV CL, 16D
            MOV DH, 10D
            MOV DL, 17D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 9D
            MOV CL, 11D
            MOV DH, 9D
            MOV DL, 12D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 9D
            MOV CL, 18D
            MOV DH, 9D
            MOV DL, 19D
            INT 10H;punto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11010000B
            MOV CH, 15D
            MOV CL, 30D
            MOV DH, 19D
            MOV DL, 40D
            INT 10H;regalo3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 17D
            MOV CL, 33D
            MOV DH, 17D
            MOV DL, 34D
            INT 10H;decoro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 18D
            MOV CL, 35D
            MOV DH, 18D
            MOV DL, 36D
            INT 10H;decoro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 15D
            MOV CL, 37D
            MOV DH, 19D
            MOV DL, 38D
            INT 10H;liston

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 16D
            MOV CL, 30D
            MOV DH, 16D
            MOV DL, 40D
            INT 10H;liston

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 17D
            MOV CL, 37D
            MOV DH, 17D
            MOV DL, 38D
            INT 10H;decoro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 16D
            MOV CL, 35D
            MOV DH, 16D
            MOV DL, 36D
            INT 10H;decoro

        ;Santa:

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 20D
            MOV CL, 50D
            MOV DH, 20D
            MOV DL, 55D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 17D
            MOV CL, 48D
            MOV DH, 17D
            MOV DL, 55D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 13D
            MOV CL, 48D
            MOV DH, 13D
            MOV DL, 49D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 13D
            MOV CL, 50D
            MOV DH, 13D
            MOV DL, 51D
            INT 10H;puntorojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 13D
            MOV CL, 52D
            MOV DH, 13D
            MOV DL, 53D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 13D
            MOV CL, 54D
            MOV DH, 13D
            MOV DL, 63D
            INT 10H;barba2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 13D
            MOV CL, 64D
            MOV DH, 13D
            MOV DL, 65D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 13D
            MOV CL, 66D
            MOV DH, 13D
            MOV DL, 67D
            INT 10H;puntorojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 12D
            MOV CL, 50D
            MOV DH, 12D
            MOV DL, 51D
            INT 10H;puntornegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 12D
            MOV CL, 52D
            MOV DH, 12D
            MOV DL, 65D
            INT 10H;barba3

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 12D
            MOV CL, 66D
            MOV DH, 12D
            MOV DL, 67D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 11D
            MOV CL, 68D
            MOV DH, 12D
            MOV DL, 69D
            INT 10H;largonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 11D
            MOV CL, 48D
            MOV DH, 11D
            MOV DL, 49D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 11D
            MOV CL, 50D
            MOV DH, 11D
            MOV DL, 67D
            INT 10H;barba4

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 9D
            MOV CL, 46D
            MOV DH, 10D
            MOV DL, 47D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 10D
            MOV CL, 48D
            MOV DH, 10D
            MOV DL, 69D
            INT 10H;barba5

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 10D
            MOV CL, 70D
            MOV DH, 10D
            MOV DL, 71D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 9D
            MOV CL, 72D
            MOV DH, 10D
            MOV DL, 73D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 9D
            MOV CL, 48D
            MOV DH, 9D
            MOV DL, 51D
            INT 10H;balnco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 8D
            MOV CL, 52D
            MOV DH, 9D
            MOV DL, 65D
            INT 10H;cara

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 9D
            MOV CL, 66D
            MOV DH, 9D
            MOV DL, 71D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 9D
            MOV CL, 72D
            MOV DH, 9D
            MOV DL, 73D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 5D
            MOV CL, 48D
            MOV DH, 8D
            MOV DL, 49D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 7D
            MOV CL, 50D
            MOV DH, 7D
            MOV DL, 69D
            INT 10H;negrogorro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 5D
            MOV CL, 50D
            MOV DH, 6D
            MOV DL, 69D
            INT 10H;nblancogorro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 000000000B
            MOV CH, 4D
            MOV CL, 50D
            MOV DH, 4D
            MOV DL, 69D
            INT 10H;negrogorro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 000000000B
            MOV CH, 3D
            MOV CL, 52D
            MOV DH, 3D
            MOV DL, 53D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 3D
            MOV CL, 54D
            MOV DH, 3D
            MOV DL, 72D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 000000000B
            MOV CH, 2D
            MOV CL, 54D
            MOV DH, 2D
            MOV DL, 55D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 2D
            MOV CL, 56D
            MOV DH, 2D
            MOV DL, 64D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 2D
            MOV CL, 65D
            MOV DH, 2D
            MOV DL, 70D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 000000000B
            MOV CH, 1D
            MOV CL, 56D
            MOV DH, 1D
            MOV DL, 57D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 1D
            MOV CL, 58D
            MOV DH, 1D
            MOV DL, 66D
            INT 10H;linearoja

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 1D
            MOV CL, 67D
            MOV DH, 1D
            MOV DL, 68D
            INT 10H;lpuntonegro


            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 6D
            MOV CL, 72D
            MOV DH, 6D
            MOV DL, 73D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 4D
            MOV CL, 72D
            MOV DH, 5D
            MOV DL, 73D
            INT 10H;lineablanca

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 4D
            MOV CL, 74D
            MOV DH, 5D
            MOV DL, 75D
            INT 10H;lineanegra

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 8D
            MOV CL, 50D
            MOV DH, 8D
            MOV DL, 51D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 8D
            MOV CL, 66D
            MOV DH, 8D
            MOV DL, 69D
            INT 10H;blanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 2D
            MOV CL, 70D
            MOV DH, 8D
            MOV DL, 71D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 3D
            MOV CL, 72D
            MOV DH, 3D
            MOV DL, 73D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 8D
            MOV CL, 54D
            MOV DH, 8D
            MOV DL, 55D
            INT 10H;ojo1

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 8D
            MOV CL, 62D
            MOV DH, 8D
            MOV DL, 63D
            INT 10H;ojo2

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 15D
            MOV CL, 48D
            MOV DH, 16D
            MOV DL, 49D
            INT 10H;mano

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 15D
            MOV CL, 50D
            MOV DH, 15D
            MOV DL, 55D
            INT 10H;rojoaladomano

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 15D
            MOV CL, 56D
            MOV DH, 15D
            MOV DL, 61D
            INT 10H;rojoaladomanonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 15D
            MOV CL, 62D
            MOV DH, 15D
            MOV DL, 65D
            INT 10H;rojoaladomanonegrorojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 14D
            MOV CL, 66D
            MOV DH, 15D
            MOV DL, 67D
            INT 10H;rojoaladomanonegrorojonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 14D
            MOV CL, 68D
            MOV DH, 15D
            MOV DL, 71D
            INT 10H;rojoaladomanonegrorojonegroblanco

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 12D
            MOV CL, 72D
            MOV DH, 15D
            MOV DL, 73D
            INT 10H;rojoaladomanonegrorojonegroblanconegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 16D
            MOV CL, 72D
            MOV DH, 17D
            MOV DL, 73D
            INT 10H;mochila

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 18D
            MOV CL, 72D
            MOV DH, 18D
            MOV DL, 75D
            INT 10H;mochila

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 12D
            MOV CL, 74D
            MOV DH, 17D
            MOV DL, 75D
            INT 10H;verde

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 11D
            MOV CL, 74D
            MOV DH, 11D
            MOV DL, 75D
            INT 10H;negropunto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 11D
            MOV CL, 70D
            MOV DH, 11D
            MOV DL, 73D
            INT 10H;verde

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 12D
            MOV CL, 70D
            MOV DH, 12D
            MOV DL, 71D
            INT 10H;verde

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 13D
            MOV CL, 68D
            MOV DH, 13D
            MOV DL, 71D
            INT 10H;verde

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 12D
            MOV CL, 76D
            MOV DH, 12D
            MOV DL, 77D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 10100000B
            MOV CH, 13D
            MOV CL, 76D
            MOV DH, 16D
            MOV DL, 77D
            INT 10H;verde

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 17D
            MOV CL, 76D
            MOV DH, 17D
            MOV DL, 77D
            INT 10H;negro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 13D
            MOV CL, 78D
            MOV DH, 16D
            MOV DL, 79D
            INT 10H;verde

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 14D
            MOV CL, 46D
            MOV DH, 16D
            MOV DL, 47D
            INT 10H;negropmano

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 14D
            MOV CL, 48D
            MOV DH, 14D
            MOV DL, 53D
            INT 10H;rojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 14D
            MOV CL, 54D
            MOV DH, 14D
            MOV DL, 55D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11110000B
            MOV CH, 14D
            MOV CL, 56D
            MOV DH, 14D
            MOV DL, 61D
            INT 10H;barba

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 14D
            MOV CL, 62D
            MOV DH, 14D
            MOV DL, 63D
            INT 10H;puntonegro

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 14D
            MOV CL, 64D
            MOV DH, 14D
            MOV DL, 65D
            INT 10H;puntorojo

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 16D
            MOV CL, 50D
            MOV DH, 16D
            MOV DL, 55D
            INT 10H;cinto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 16D
            MOV CL, 56D
            MOV DH, 16D
            MOV DL, 61D
            INT 10H;cinto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 11100000B
            MOV CH, 17D
            MOV CL, 56D
            MOV DH, 17D
            MOV DL, 61D
            INT 10H;cinto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 16D
            MOV CL, 62D
            MOV DH, 17D
            MOV DL, 71D
            INT 10H;cinto

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 18D
            MOV CL, 50D
            MOV DH, 20D
            MOV DL, 51D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 18D
            MOV CL, 52D
            MOV DH, 18D
            MOV DL, 69D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 19D
            MOV CL, 52D
            MOV DH, 19D
            MOV DL, 55D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 19D
            MOV CL, 62D
            MOV DH, 19D
            MOV DL, 69D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 19D
            MOV CL, 56D
            MOV DH, 19D
            MOV DL, 61D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 20D
            MOV CL, 62D
            MOV DH, 20D
            MOV DL, 71D
            INT 10H;patas

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00000000B
            MOV CH, 18D
            MOV CL, 70D
            MOV DH, 20D
            MOV DL, 71D
            INT 10H;patas
ENDM

limpiador MACRO
    mov ah,00;Función 00h de la interrupción 10h para borrar La pantalla.
    mov al,03h; Modo de borrar La pantalla.
    int 10h;Llamada a La interrupción 10h.
ENDM

codigo SEGMENT 
    main PROC
        ASSUME DS:data, CS:codigo 
        MOV AX, data
        MOV DS, AX

    MENUPRINCIPAL:
        imprimirMensaje menu
        leerNumero op

        cmp op, 1
        JNE NO_MENU1
        JMP NEAR PTR MENUCOMPARACIONES

        NO_MENU1:
            cmp op, 2
            JNE NO_MENU2
            JMP NEAR PTR MENUOPERACIONES
        NO_MENU2:
            cmp op, 3
            JNE NO_MENU3
            JMP NEAR PTR MENUIMAGENES
        NO_MENU3:
            cmp op, 4
            JMP FIN

        LEER_NUMEROS:           ;procedimiento para pedir 2 numeros 
            imprimirMensaje msj1
            leerNumero num1
            imprimirMensaje msj2
            leerNumero num2
            RET

        LEER_CINCO_NUMEROS:      ;procedimiento para pedir 5 numeros
            imprimirMensaje msj1
            leerNumero num1
            imprimirMensaje msj2
            leerNumero num2
            imprimirMensaje msj3
            leerNumero num3
            imprimirMensaje msj4
            leerNumero num4
            imprimirMensaje msj5
            leerNumero num5
            RET

        MENUCOMPARACIONES:
            imprimirMensaje menu1
            leerNumero op1

            cmp op1, 1
            JE COMPARAR_DOS_NUMEROS  

            cmp op1, 2
            JE COMPARAR_CINCO_NUMEROS 

            cmp op1, 3
            JMP MENUPRINCIPAL     

            JMP MENUCOMPARACIONES 

            COMPARAR_DOS_NUMEROS:
                comparadorNumeros
                JMP MENUCOMPARACIONES  

            COMPARAR_CINCO_NUMEROS:
                comparadorCinco
                JMP MENUCOMPARACIONES  

        MENUOPERACIONES: 
            imprimirMensaje menu2
            leerNumero op2

            cmp op2, 1
            JNE NO_SUMA
            JMP NEAR PTR SUMA

            NO_SUMA:
            cmp op2, 2
            JNE NO_RESTA
            JMP NEAR PTR RESTA

            NO_RESTA:
            cmp op2, 3
            JNE NO_MULTIPLICACION
            JMP NEAR PTR MULTIPLICACION

            NO_MULTIPLICACION:
            cmp op2, 4
            JNE NO_DIVISION
            JMP NEAR PTR DIVISION

            NO_DIVISION:
            cmp op2, 5
            JMP MENUPRINCIPAL

            convert_to_string PROC
                mov bx, 10               ; Divisor para separar los dígitos
                xor cx, cx               ; Limpiar CX para contar dígitos
                mov ax, result           ; Cargar el resultado en AX

                ; Comprobar si el resultado es cero
                cmp ax, 0
                je print_zero            ; Si es cero, imprimir '0' directamente

                convert_loop:
                    xor dx, dx               ; Limpiar DX antes de la división
                    div bx                   ; AX = AX / 10; DX = AX % 10
                    push dx                  ; Guardar el dígito en la pila
                    inc cx                   ; Incrementar contador de dígitos
                    test ax, ax              ; Comprobar si AX es cero
                    jnz convert_loop         ; Continuar si no es cero

                print_digits:
                    pop dx                   ; Obtener el dígito de la pila
                    add dl, '0'              ; Convertir el dígito a ASCII
                    mov ah, 02h              ; Función de impresión de carácter
                    int 21h                  ; Imprimir el carácter
                    loop print_digits        ; Imprimir todos los dígitos
                    ret

                print_zero:
                    mov dl, '0'              ; Si el resultado es cero, configurar '0'
                    mov ah, 02h              ; Función de impresión de carácter
                    int 21h                  ; Imprimir el carácter '0'
                    ret
            convert_to_string ENDP

            print_result PROC
                call convert_to_string    ; Llama a la rutina para imprimir el número como cadena
                ret
            print_result ENDP

            LEER_NUMEROS2 PROC
                imprimirMensaje msj6
                read_two_digit_number num6
                imprimirMensaje msj7
                read_two_digit_number num7
                RET
            LEER_NUMEROS2 ENDP

            SUMA:
                sumar
                JMP MENUOPERACIONES

            RESTA:
                restar
                JMP MENUOPERACIONES

            MULTIPLICACION:
                multiplicar
                JMP MENUOPERACIONES

            DIVISION:
                dividir
                JMP MENUOPERACIONES

            DIVISION_ERROR:
                imprimirMensaje division_error_msg
                JMP MENUOPERACIONES

        MENUIMAGENES:

            imprimirMensaje menu3
            leerNumero op3

            cmp op3, 1
            JNE NO_GUANTE
            JMP NEAR PTR GUANTE

            NO_GUANTE:
                cmp op3, 2
                JNE NO_TRINEO
                JMP NEAR PTR TRINEO
            NO_TRINEO:
                cmp op3, 3
                JNE NO_GORRITO
                JMP NEAR PTR GORRITO

            NO_GORRITO:
                cmp op3, 4
                JNE NO_SANTA
                JMP NEAR PTR SANTA

            NO_SANTA:
                cmp op3, 5
                limpiador
                JMP MENUPRINCIPAL

            GUANTE:
                dibujoguante
                JMP MENUIMAGENES
            TRINEO:
                dibujotrineo
                JMP MENUIMAGENES
            GORRITO:
                dibujogorrito
                JMP MENUIMAGENES
            SANTA:
                dibujosanta
                JMP MENUIMAGENES
    FIN:
        MOV ah, 4Ch
        INT 21h

    main ENDP
codigo ENDS
END main