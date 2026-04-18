INDENTIFICATION DIVISION.
         PROGRAM-ID. Pract1.
            ENVIRONMENT DIVISION.
            INPUT-OUTPUT SECTION.
            FILE-CONTROL.
                SELECT ARCHIVO-LOG ASSIGN TO "numeros2.txt"
                    ORGANIZATION IS LINE SEQUENTIAL.
            DATA DIVISION.
            FILE SECTION.
            FD  ARCHIVO-LOG.
            01  REGISTRO-NUMERO.
                05  VALOR-TXT      PIC 99.
            WORKING-STORAGE SECTION.
            01  SEED            PIC 9(8).
            01  RANDOM-NUM      PIC V9999.
            01  RESULTADO       PIC 99.
            01  TECLA-ENTER     PIC X.
            PROCEDURE DIVISION.
            MAIN-PROCEDURE.
                OPEN OUTPUT ARCHIVO-LOG.
                ACCEPT SEED FROM TIME.
                COMPUTE RANDOM-NUM = FUNCTION RANDOM (SEED).
                DISPLAY "Generando numeros en 'numeros2.txt'. 'Q' para salir."
                PERFORM UNTIL TECLA-ENTER = 'Q' OR TECLA-ENTER = 'q'
                    ACCEPT TECLA-ENTER
                    IF TECLA-ENTER NOT = 'Q' AND TECLA-ENTER NOT = 'q'
                        COMPUTE RANDOM-NUM = FUNCTION RANDOM
                        COMPUTE RESULTADO = (RANDOM-NUM * 99) + 1
                        DISPLAY "Guardado: " RESULTADO
                        MOVE RESULTADO TO VALOR-TXT
                        WRITE REGISTRO-NUMERO
                    END-IF
                END-PERFORM.