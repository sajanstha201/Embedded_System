AREA RESET, DATA, READONLY
	EXPORT __VECTORS

__VECTORS
	
	DCD 0X10001000
	DCD RESET_HANDLER
	ALIGN
	AREA MYCODE, CODE,READONLY
	ENTRY
	EXPORT RESET_HANDLER

RESET_HANDLER
	
	LDR R0,=SRC
	LDR R1,=KEY
	LDR R4,=DST
	MOV R8,#10
	LDR R3,[R1]
UP	LDR R2,[R0],#4
	CMP R3,R2
	BEQ FOUND
	SUBS R8,#1
	CMP R8,#0
	BEQ DOWN
	BNE UP
DOWN MOV R9,#0
	STRB R9,[R4]
	B STOP
FOUND MOV R9,#1
	STRB R9,[R4]
STOP
	B STOP
SRC DCD 0,1,2,3,4,5,6,7,8,9
KEY DCD 3

	AREA MYDATA,DATA,READWRITE
DST DCD 0
	END



