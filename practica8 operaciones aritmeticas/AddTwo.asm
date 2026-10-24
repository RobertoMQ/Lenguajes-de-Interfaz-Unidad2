; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 8. Operaciones aritméticas
; Descripción: Realiza sumas y restas utilizando ADD y SUB para calcular existencias.

INCLUDE Irvine32.inc

.data
    msgInicial BYTE "Existencia inicial: 50", 0
    msgFinal BYTE "Existencia final: ", 0

.code
main PROC
    mov edx, OFFSET msgInicial
    call WriteString
    call Crlf

    mov eax, 50        ; Existencia inicial en eax
    add eax, 20        ; Entrada de mercancía (50+20)
    sub eax, 15        ; Salida de mercancía (70-15)

    mov edx, OFFSET msgFinal
    call WriteString
    call WriteInt      ; Muestra el resultado final (55)
    call Crlf

    exit
main ENDP
END main