; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 7. Validación de formato
; Descripción: Valida que una cadena capturada cumpla con una longitud y formato específicos.

INCLUDE Irvine32.inc

.data
    msgPedir BYTE "Ingrese codigo (ej. TEC-123): ", 0
    msgValido BYTE "Formato valido.", 0
    msgInvalido BYTE "Formato invalido.", 0
    buffer BYTE 30 DUP(0) ; Buffer de 30 posiciones

.code
main PROC
    mov edx, OFFSET msgPedir
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer - 1
    call ReadString      ; Almacena en buffer y devuelve longitud en EAX

    cmp eax, 7           ; Verifica que la longitud sea de 7 caracteres
    jne invalido

    mov esi, 0           ; Inicializa índice ESI
    mov al, buffer[esi]  ; Carga el primer carácter en AL
    cmp al, 'T'          ; Valida que empiece con 'T'
    jne invalido

    mov edx, OFFSET msgValido
    call WriteString
    call Crlf
    jmp fin

invalido:
    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main