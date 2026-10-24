INCLUDE Irvine32.inc

.data
mensaje BYTE "Entorno configurado correctamente", 0

.code
main PROC
    mov edx, OFFSET mensaje
    call WriteString
    exit
main ENDP
END main