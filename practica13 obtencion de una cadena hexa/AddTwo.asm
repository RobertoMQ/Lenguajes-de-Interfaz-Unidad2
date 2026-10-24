; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13. Obtencion de una cadena hexadecimal
; Descripción: Convierte un registro de 32 bits a una cadena hexadecimal.

INCLUDE Irvine32.inc

.data
    bufferHex BYTE 9 DUP(0) ; 8 caracteres más terminador nulo
    msgHex BYTE "Cadena hexadecimal: ", 0

.code
main PROC
    mov eax, 12AB34CDh   ; Valor numérico a convertir
    mov esi, 7           ; Índice ESI inicia en 7 para escribir de derecha a izquierda
    mov ecx, 8           ; Ciclo de 8 dígitos hexadecimales

extraer_digito:
    mov dl, al           
    and dl, 0Fh          ; Máscara AND para aislar los 4 bits (nibble) inferiores

    cmp dl, 9            ; Verifica si el valor está entre 0-9 o 10-15
    ja es_letra
    
    add dl, '0'          ; Convierte el dígito numérico sumando el código de '0' 
    jmp guardar

es_letra:
    sub dl, 10           ; Resta 10 y suma 'A' para convertir a letra
    add dl, 'A'          ; Carácter 'A' a 'F'

guardar:
    mov bufferHex[esi], dl ; Guarda el dígito en el buffer en orden inverso
    dec esi              ; Decrementa la posición del índice
    shr eax, 4           ; Desplaza 4 bits para exponer el siguiente dígito
    loop extraer_digito

    mov bufferHex[8], 0  ; Añade el terminador nulo al final

    mov edx, OFFSET msgHex
    call WriteString
    mov edx, OFFSET bufferHex
    call WriteString
    call Crlf

    exit
main ENDP
END main