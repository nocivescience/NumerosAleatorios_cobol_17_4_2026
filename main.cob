IDENTIFICATION DIVISION.
       PROGRAM-ID. GuardarAleatorios.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           *> 1. Relacionamos el nombre interno con el nombre físico del archivo
           SELECT ARCHIVO-LOG ASSIGN TO "numeros.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       *> 2. Definimos cómo luce una fila dentro del archivo
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
           *> Abrimos el archivo en modo EXTEND (para añadir al final) 
           *> o OUTPUT (para crearlo de cero cada vez)
           OPEN OUTPUT ARCHIVO-LOG.

           ACCEPT SEED FROM TIME.
           COMPUTE RANDOM-NUM = FUNCTION RANDOM (SEED).
           
           DISPLAY "Generando numeros en 'numeros.txt'. 'Q' para salir.".

           PERFORM UNTIL TECLA-ENTER = 'Q' OR TECLA-ENTER = 'q'
               ACCEPT TECLA-ENTER
               
               IF TECLA-ENTER NOT = 'Q' AND TECLA-ENTER NOT = 'q'
                   COMPUTE RANDOM-NUM = FUNCTION RANDOM
                   COMPUTE RESULTADO = (RANDOM-NUM * 99) + 1
                   
                   DISPLAY "Guardado: " RESULTADO
                   
                   *> 3. Movemos el dato al registro y lo escribimos
                   MOVE RESULTADO TO VALOR-TXT
                   WRITE REGISTRO-NUMERO
               END-IF
           END-PERFORM.

           *> ¡Importante! Siempre cerrar el archivo
           CLOSE ARCHIVO-LOG.
           DISPLAY "Proceso terminado. Revisa numeros.txt".
           STOP RUN.
           