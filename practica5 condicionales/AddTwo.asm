; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5.1. Repetir hasta que el usuario ingrese cero
; Descripción: Ciclo condicional que solicita números y termina al recibir un 0.

INCLUDE Irvine32.inc

.data
    msgPedir BYTE "Ingresa un numero (0 para salir): ", 0

.code
main PROC
ciclo:
    mov edx, OFFSET msgPedir
    call WriteString   
    
    call ReadInt       ; Lee un entero y lo guarda en EAX
    cmp eax, 0         ; Verifica si el número es cero
    je fin             ; Salta al final si EAX = 0
    
    call WriteInt
    call Crlf
    jmp ciclo          ; Salto incondicional para repetir

fin:
    exit
main ENDP
END main