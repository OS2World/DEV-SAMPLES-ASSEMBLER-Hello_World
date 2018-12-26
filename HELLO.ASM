			PAGE	,132
			TITLE	OS/2 sample filter

			.286c
			.xlist
			.list

		extrn DosExit:far
		extrn VioWrtTTY:far

dgroup 	group	UPC_data

UPC_stack	segment para stack

		dw	256 dup('s')

UPC_stack	ends

UPC_data	segment para public 'auto'

msg0		db	'Hello World !!',0ah,0dh
MSG0L		equ	$ - offset msg0
bytesout	dw	0

UPC_data	ends

UPC_code	segment para public 'code'
		assume cs:UPC_code,ds:UPC_data,es:UPC_data,ss:UPC_stack

main		proc
		pusha

; app. code goes here
;-------------------------------------------------------------------------
		push	ds
		mov	si,offset msg0
		push	si
		push	msg0l
		push	0
		call	VioWrtTTY
;-------------------------------------------------------------------------
        	popa
		mov	ax,1
		push	ax
		mov	ax,0
		push	ax
		call DosExit
main		endp

UPC_code	ends
		end	main