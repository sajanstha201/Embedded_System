SUB

	AREA MYCODE,DATA,READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0X10001000
	DCD RESET_HANDLER
	ALIGN  
	AREA CODEE,CODE,READONLY
ENTRY
	EXPORT RESET_HANDLER
RESET_HANDLER
	MOV R1,#10
	MOV R2,#2
	SUB R3,R2,R1
	END