; Materia: Lenguajes de Interfaz
; Alumno: Angel Roberto Mendoza Quintero
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 15. Manipulacion de archivos
; Descripción: Crea un archivo txt, le escribe un dato y libera sus recursos.

INCLUDE Irvine32.inc

.data
    nombreArchivo BYTE "inventario.txt", 0     ; Dirección del nombre del archivo
    datosEscribir BYTE "125", 0                ; Buffer con los datos en RAM
    archivoHandle DWORD ?                      ; Identificador del archivo devuelto por EAX
    msgExito BYTE "Archivo creado, escrito y cerrado exitosamente.", 0

.code
main PROC
    ; 1. Crear / Abrir Archivo
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile      ; Devuelve el handle (identificador) en EAX
    mov archivoHandle, eax     ; Guarda el identificador para usos posteriores

    ; 2. Escribir Datos
    mov eax, archivoHandle     ; Pasa el handle almacenado en EAX
    mov edx, OFFSET datosEscribir ; Dirección del buffer con los datos en EDX
    mov ecx, 3                 ; Cantidad explícita de bytes de texto a escribir
    call WriteToFile           ; Copia los bytes de memoria al archivo

    ; 3. Cerrar Archivo
    mov eax, archivoHandle
    call CloseFile             ; Libera los recursos asociados a la apertura

    mov edx, OFFSET msgExito
    call WriteString
    call Crlf

    exit
main ENDP
END main