; Materia: Lenguajes de Interfaz 
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 1. Ciclos numéricos
; Descripción: Programa que utiliza un ciclo loop para imprimir números del 1 al 10.

INCLUDE Irvine32.inc

.data
    ; Sin variables

.code
main PROC
    mov ecx, 10      ; El contador del ciclo en 10
    mov eax, 1       ; Iniciar el valor a imprimir en 1

L1:
    call WriteDec    ; Imprime el valor actual de EAX en formato decimal
    call Crlf        ; Salto de línea
    inc eax          ; Incrementar el valor de EAX
    loop L1          ; Decrementa ECX, si no es cero salta a L1

    exit             ; Termina el programa
main ENDP
END main