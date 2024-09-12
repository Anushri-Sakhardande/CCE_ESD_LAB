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
	LDR R0,=SRC	
	LDR R1,=DST
	MOV R3,#0x0
	MOV R5,#8;counter 
UP LDR R2,[R0],#4
	ROR R3,R3,#4
	ADD R3, R2, R3
	SUBS R5,#1
	BNE UP
	ROR R3,R3,#4
	STR R3, [R1]
STOP B STOP
SRC DCD 0x00000008, 0x00000007, 0x00000006, 0x00000005, 0x00000004, 0x00000003, 0x00000002, 0x00000001
	AREA mydata, DATA, READWRITE
DST DCD 0
	END