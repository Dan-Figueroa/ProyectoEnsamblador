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

        Reno:
            Cuernos:
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

            Cuerpo:

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

        Trineo: 

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
            Fin:
                mov ah, 4Ch
                int 21h
    main ENDP
codigo ENDS
END main
