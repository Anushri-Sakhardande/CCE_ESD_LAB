	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10001000;Stack Pointervalue WBAC
	DCD Reset_Handler;reset vectors
	ALIGN 
	AREA mycode, CODE, READONLY 
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=BCD
	LDR R1,[R0]
	AND R2,R1,#0xF0
	LSR R2,#4
	AND R3,R1,#0x0F
	MOV R4,#0x0A
	MLA R5,R2,R4,R3
	LDR R0,=HEX
	STR R5,[R0]
BCD DCD 0x00000039
	AREA mydata, DATA, READWRITE
HEX DCD 0
	END