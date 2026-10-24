; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 9. PUSH y POP
; Descripción: Demuestra el almacenamiento temporal en la pila con PUSH y POP.

INCLUDE Irvine32.inc

.data
    msg1 BYTE "Guardando en pila EAX=10, EBX=20...", 0
    msg2 BYTE "EAX recuperado: ", 0

.code
main PROC
    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    mov eax, 10
    mov ebx, 20

    push eax           ; Guarda EAX (10) en la pila (ESP disminuye 4)
    push ebx           ; Guarda EBX (20) en la pila

    pop eax            ; Recupera el último valor (20) en EAX (ESP aumenta 4)
    pop ebx            ; Recupera el primer valor (10) en EBX

    mov edx, OFFSET msg2
    call WriteString
    call WriteInt      ; Imprime EAX, que ahora tiene el 20 intercambiado
    call Crlf

    exit
main ENDP
END main