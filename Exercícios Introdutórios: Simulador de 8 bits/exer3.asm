; Simple example
; Writes Hello World to the output

	JMP start
hello: DB "Hello World!" ; Variable
       DB 0	; String terminator

start:
	MOV C, hello    ; Point to var 
	MOV D, 232	; Point to output
	CALL print
        HLT             ; Stop execution

print:			; print(C:*from, D:*to)
	PUSH A
	PUSH B
	MOV B, 0

.loop:
	MOV A, [C]           ; Get char from var
	CMP A, 97            ; Compare with 'a' (ASCII value)
	JB .not_lowercase    ; Jump if it's not a lowercase letter
	CMP A, 122           ; Compare with 'z' (ASCII value)
	JA .not_lowercase    ; Jump if it's not a lowercase letter
	MOV [D], A           ; Write to output
	INC D

.not_lowercase:
	INC C
	CMP B, [C]           ; Check if end
	JNZ .loop            ; Jump if not

	POP B
	POP A
	RET
