IDENTIFICATION DIVISION.
       PROGRAM-ID. AleatorioEnter.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SEED            PIC 9(8).
       01 RANDOM-NUM      PIC V9999.
       01 RESULTADO       PIC 99.
       01 TECLA-ENTER     PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           *> Inicializamos la semilla con la hora actual para que varíe
           ACCEPT SEED FROM TIME.
           COMPUTE RANDOM-NUM = FUNCTION RANDOM (SEED).
           
           DISPLAY "--- Generador de Numeros Aleatorios (1-99) ---".
           DISPLAY "Presiona ENTER para generar uno nuevo o 'Q' para salir.".

           PERFORM UNTIL TECLA-ENTER = 'Q' OR TECLA-ENTER = 'q'
               ACCEPT TECLA-ENTER
               
               IF TECLA-ENTER NOT = 'Q' AND TECLA-ENTER NOT = 'q'
                   *> Genera el siguiente número de la secuencia
                   COMPUTE RANDOM-NUM = FUNCTION RANDOM
                   *> Escalamos el número (0-1) a un rango de 1 a 99
                   COMPUTE RESULTADO = (RANDOM-NUM * 99) + 1
                   DISPLAY "Numero: " RESULTADO " (Presiona Enter...)"
               END-IF
           END-PERFORM.

           DISPLAY "Programa finalizado.".
           STOP RUN.
