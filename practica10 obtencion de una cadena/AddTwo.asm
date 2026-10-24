; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 10. Obtención de una cadena decimal
; Descripción: Se cnvertira un número en registro a una cadena decimal usando divisiones y la pila.

INCLUDE Irvine32.inc

.data
    buffer BYTE 11 DUP(0) ; Buffer para cadena
    msg BYTE "Numero convertido a cadena: ", 0

.code
main PROC
    mov eax, 125       ; Valor numérico a convertir
    mov ecx, 0         ; Contador de dígitos
    mov ebx, 10        ; Divisor para obtener dígitos base 10

extraer_digitos:
    mov edx, 0
    div ebx            ; Divide EDX:EAX entre 10
    push edx           ; Guarda el residuo (dígito) en la pila
    inc ecx            ; Incrementa contador de dígitos
    cmp eax, 0         ; Verifica si el cociente es distinto de cero
    jne extraer_digitos

    mov esi, 0
construir_cadena:
    pop edx            ; Recupera residuo invirtiendo el orden (LIFO)
    add dl, '0'        ; Suma '0' para convertir a carácter ASCII
    mov buffer[esi], dl ; Guarda el carácter en el buffer
    inc esi
    loop construir_cadena

    mov buffer[esi], 0 ; Agrega terminador nulo al final

    mov edx, OFFSET msg
    call WriteString
    mov edx, OFFSET buffer
    call WriteString   ; Muestra el numero listo
    call Crlf

    exit
main ENDP
END main