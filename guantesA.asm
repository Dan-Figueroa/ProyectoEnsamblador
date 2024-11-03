data SEGMENT
data ENDS

codigo SEGMENT
    main PROC
        ASSUME DS:data, CS:codigo
        mov AX, data
        mov DS, AX
        Fondo:
            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 00010000B
            MOV CH, 0
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H ;fondo 
        Puntos:
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

        Guante1:
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
            
        Guante2:
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
        Fin:
            mov ah, 4Ch
            int 21h
    main ENDP
codigo ENDS
END main
