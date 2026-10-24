; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 14. Captura y almacenamiento de datos numericos
; Descripción: Lee una cadena, valida sus dígitos y la convierte a número DWORD.

INCLUDE Irvine32.inc

.data
    msgPedir BYTE "Ingresa cantidad (ej. 125): ", 0
    msgRes   BYTE "Guardado en variable (mostrado en binario): ", 0
    buffer   BYTE 10 DUP(0) 
    cantidad DWORD ?     ; Variable para almacenar el valor numérico final

.code
main PROC
    mov edx, OFFSET msgPedir
    call WriteString

    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString      ; Captura como texto en el buffer

    mov esi, 0
    mov eax, 0           ; Inicializa acumulador numérico en 0
    mov ebx, 10          ; Multiplicador base 10[cite: 110]

convertir_caracter:
    movzx edx, buffer[esi] ; Carga el byte actual en EDX
    cmp dl, 0            ; Verifica si se llegó al terminador nulo
    je finalizar
    
    cmp dl, '0'          ; Valida que el carácter sea mayor o igual a '0'
    jb finalizar
    cmp dl, '9'          ; Valida que el carácter sea menor o igual a '9'
    ja finalizar

    sub dl, '0'          ; Convierte el carácter ASCII a valor numérico
    
    push edx             ; Respalda el dígito actual en la pila
    mul ebx              ; Multiplica el acumulador EAX por 10 (EDX se borra aquí)
    pop edx              ; Recupera el dígito actual
    add eax, edx         ; Suma el dígito al acumulado
    
    inc esi
    jmp convertir_caracter

finalizar:
    mov cantidad, eax    ; Guarda el valor procesado en la variable DWORD
    
    mov edx, OFFSET msgRes
    call WriteString
    mov eax, cantidad
    call WriteBin        ; Muestra el valor real almacenado en binario
    call Crlf

    exit
main ENDP
END main