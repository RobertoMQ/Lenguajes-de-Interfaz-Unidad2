; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 11. Operaciones lógicas
; Descripción: Uso de máscaras con AND, OR, XOR, NOT y TEST en un registro de estado.

INCLUDE Irvine32.inc

.data
    msgEstado BYTE "Estado del registro tras mascara OR: ", 0

.code
main PROC
    mov al, 00000101b  ; Estado inicial: Encendido y conectado (bits 0 y 2)

    or al, 00000010b   ; Máscara OR: Activa la alarma (bit 1) conservando los demás
    
    xor al, 00000010b  ; Máscara XOR: Invierte la alarma (la apaga) si estaba activa

    test al, 00000001b ; Consulta si el bit 0 está activo sin modificar el registro
    jz sin_bit         ; Si ZF=1 (cero), salta al final
    
    movzx eax, al      ; Carga AL en EAX para imprimir (rellena de ceros)
    mov edx, OFFSET msgEstado
    call WriteString
    call WriteBin      ; Imprime la representación binaria
    call Crlf

sin_bit:
    exit
main ENDP
END main