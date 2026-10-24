; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 2. Captura y desplegado de mensajes
; Descripción: Solicita al usuario un nombre y lo imprime en pantalla.

INCLUDE Irvine32.inc

.data
    mensaje1 BYTE "Ingresa tu nombre: ", 0
    mensaje2 BYTE "Hola, ", 0
    buffer   BYTE 50 DUP(0)

.code
main PROC
    mov edx, OFFSET mensaje1
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString

    mov edx, OFFSET mensaje2
    call WriteString

    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP
END main