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

        Casa:

            MOV AH, 06H 
            MOV AL, 0
            MOV BH, 01000000B
            MOV CH, 20D
            MOV CL, 0
            MOV DH, 24D
            MOV DL, 79D
            INT 10H

        Chimenea:

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

        Nieve:

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

        Regalos:
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

        Santa:

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

        Fin:
        mov ah, 4Ch
        int 21h
        
    main ENDP
codigo ENDS
END main