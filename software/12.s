	AREA DD,DATA,READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0X10001000
	DCD RESET_HANDLER
	ALIGN
	AREA MYCODE,CODE,READONLY
	ENTRY
	EXPORT RESET_HANDLER
RESET_HANDLER
	LDR R0,=NUM1
	LDR R1,=NUM2
	LDR R2,=DST
	LDR R3,[R0]
	LDR R4,[R1]
LOOP
	CMP R3,R4
	BEQ DONE
	BPL YES
	SUBS R4,R4,R3
	B LOOP
YES
	SUBS R3,R3,R4
	B LOOP
DONE
	STR R3,[R2]
NUM1 DCD 12
NUM2 DCD 4
	AREA DDD,DATA,READWRITE
DST DCD 0
	END