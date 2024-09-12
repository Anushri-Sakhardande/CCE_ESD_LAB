	AREA RESET, DATA, READONLY
   EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, = SRC ; R0 has input 
	LDR R1, = DST
	MOV R6, #0 ; count
	MOV R9, #10; has 10 iterator
Lp	LDR R2, [R0] ; R2 has the first value in R0
	MOV R3,#2 ; starting with 2
	LSR R8, R2, #1 ; LSR has n/2
	CMP R2, #2 ; comparing with 2..
	BHI Check_Prime ; if > 2 go to prime
	CMP R2, #2 ; comparing with 2..
	BEQ COUNT ; if equal add count
UP			ADD R0,#4 ; moving to next address 
			SUB R9,#1 ; iterator count sub by 1
			CMP R9,#0 ; if 0
			BEQ Finish ; yes-> finish
			CMP R9,#0 ; if 0
			BHI Lp ; if greater move to next number
Finish  STR R6, [R1] ; store 
Stop	B Stop
;COUNT ADD R6, #1
Check_Prime LDR R2, [R0] ; loading r2 value again incase we loose it
			CMP R3,R8 ; comparing to see it still can go on or not < n/2
			BEQ COUNT ; if equal..just inc count 
Ke1			SUB R2, R3
			CMP R2,#0
			BEQ UP
			CMP R2,#0
			BMI S
			BPL Ke1 ; BHI ot working for -ve number comparision
S			ADD R3,#1
			B Check_Prime
COUNT ADD R6,#1 
	  B UP
			
SRC DCD 13,12,11,10,8,5,2,3,4,5
		;13,12 12 11 12 12 12 12 12 
	AREA mydata, DATA, READWRITE
DST DCD 0
	END