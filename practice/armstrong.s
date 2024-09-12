	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM
	LDR R1,[R0]
	MOV R2,R1
	
COUNT LSR R2,#4 ;count digits
	ADD R3,#1 ; R3 has n 
	TEQ R2,#0
	BNE COUNT
	MOV R7,R3
	ADD R7,#1
	MOV R0,R1
DIGITS AND R2,R1,#0x0F      ;extract and power n
	ROR R1,#4
	ADD R6,R5 ; R6 has the sum of pow of digits
	SUBS R7,#1
	BNE POW
	
	MOV R5,#0
	LSL R1,#4
	MOV R4,#0x0A ; convert the bcd to hex for comparison
HEX AND R2,R1,#0xF0000000
	ROR R2,#28
	LSL R1,#4
	SUBS R3,#1
	MLA R5,R5,R4,R2
	BNE HEX
	
	LDR R0,=RESULT
	CMP R5,R6
	BNE NOCASE
	MOV R2,#1
	STR R2,[R0]
STOP 
		B STOP
NOCASE MOV R2,#-1
	STR R2,[R0]
		B STOP
		
POW MOV R4,R3
	MOV R5,#1 ; should have answer of power 
MULTIPLY MUL R5,R2
		SUBS R4,#1
		BNE MULTIPLY
		B DIGITS
		
NUM DCD 0x16
	AREA mydata,DATA,READWRITE
RESULT DCD  0
	END
