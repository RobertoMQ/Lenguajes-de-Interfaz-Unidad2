; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 12. Desplazamiento y rotación
; Descripción: Demuestra el uso de SHL para multiplicar y SHR para dividir.

INCLUDE Irvine32.inc

.data
    msgOriginal BYTE "Valor original (12): ", 0
    msgSHL BYTE "Desplazamiento SHL (x2): ", 0
    msgSHR BYTE "Desplazamiento SHR (/4): ", 0

.code
main PROC
    mov eax, 12          ; Valor inicial 12[cite: 90]

    mov edx, OFFSET msgOriginal
    call WriteString
    call WriteInt
    call Crlf

    shl eax, 1           ; Multiplica por 2 desplazando un bit a la izquierda
    mov edx, OFFSET msgSHL
    call WriteString
    call WriteInt
    call Crlf

    mov cl, 2            ; Conteo en registro CL = 2 posiciones
    shr eax, cl          ; Divide entre 4 desplazando 2 bits a la derecha
    mov edx, OFFSET msgSHR
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main