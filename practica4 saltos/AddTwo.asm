; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4.1. Mayor, menor o igual con entrada del usuario
; Descripción: Lee dos números y decide qué camino de ejecución seguir mediante saltos.

INCLUDE Irvine32.inc

.data
    msgMayor BYTE "El primer numero es mayor", 0
    msgMenor BYTE "El primer numero es menor", 0

.code
main PROC
    call ReadInt
    mov ebx, eax
    call ReadInt
    
    cmp ebx, eax       ; Compara el primer número con el segundo
    jg mayor           ; Salta si es mayor (signo)
    jl menor           ; Salta si es menor (signo)
    jmp fin

mayor:
    mov edx, OFFSET msgMayor
    call WriteString
    call Crlf
    jmp fin

menor:
    mov edx, OFFSET msgMenor
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main