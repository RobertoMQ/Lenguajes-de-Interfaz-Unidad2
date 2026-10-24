; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6.1. Control de ocupación de un estacionamiento
; Descripción: Utiliza INC y DEC para llevar el registro de autos en un estacionamiento.

INCLUDE Irvine32.inc

.data
    msgMenu BYTE "1. Entra un auto, 2. Sale un auto, 0. Salir: ", 0
    msgTotal BYTE "Autos actuales: ", 0

.code
main PROC
    mov ecx, 0

ciclo:
    mov edx, OFFSET msgTotal
    call WriteString
    mov eax, ecx
    call WriteInt
    call Crlf

    mov edx, OFFSET msgMenu
    call WriteString
    call ReadInt

    cmp eax, 0
    je fin
    cmp eax, 1
    je entra
    cmp eax, 2
    je sale
    jmp ciclo

entra:
    inc ecx            ; Incrementa ocupación
    jmp ciclo

sale:
    cmp ecx, 0
    je ciclo
    dec ecx            ; Decrementa ocupación
    jmp ciclo

fin:
    exit
main ENDP
END main