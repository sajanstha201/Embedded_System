AREA MYCODE, DATA, READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0X10001000
	DCD RESET_HANDLER
	ALIGN
	AREA CODEE,CODE,READONLY
	ENTRY
	EXPORT RESET_HANDLER
RESET_HANDLER
	LDR R0,=SRC
	LDR R1,=DST
	LDR R2,[R0]
	STR R2,[R1]
STOP
	B STOP
	AREA CD,DATA,READONLY
SRC DCD 8
	AREA DD,DATA,READWRITE
DST DCD 0
	END
