; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparación y prueba
; Descripción: Demuestra el uso de CMP actualizando banderas sin guardar el resultado.

INCLUDE Irvine32.inc

.data
    msgIguales BYTE "Los valores comparados son iguales.", 0

.code
main PROC
    mov eax, 10
    mov ebx, 10
    cmp eax, ebx       ; Se compara eax y ebx el resultado del cpm es 0 por lo tanto se enciende ZF
    je iguales         ; Salta si esta activa la ZF
    jmp fin

iguales:
    mov edx, OFFSET msgIguales
    call WriteString
    call Crlf
fin:
    exit
main ENDP
END main