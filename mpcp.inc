.686
.model flat, stdcall
option casemap:none

;; biblioteca standard de C
includelib libcmt.lib
includelib libvcruntime.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib

;; Funcoes do sistema
printf	PROTO C format:PTR BYTE, rest: VARARG
scanf   PROTO C format:PTR BYTE, rest: VARARG

atoi	PROTO C strarg:PTR BYTE
atof	PROTO C strarg:PTR BYTE

rand	PROTO C
srand	PROTO C semente:SDWORD

;; acesso ao teclado
_getch	PROTO C

;; Imprimir cadeia de carateres
puts	PROTO C  strarg:PTR BYTE
;; Obter cadeia de carateres (buffer dever ter tamanho suficiente)
gets	PROTO C	 buffer:PTR BYTE

;; Tratar cadeias de carateres
strlen	PROTO C	strarg:PTR BYTE
strcat	PROTO C strarg1:PTR BYTE, strarg2:PTR BYTE
strcpy	PROTO C strarg1:PTR BYTE, strarg2:PTR BYTE

;; para terminar um programa
ExitProcess	PROTO arg: SDWORD