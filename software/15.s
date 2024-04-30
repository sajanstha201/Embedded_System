	AREA    RESET, DATA, READONLY 
	EXPORT  __VECTORS 
__VECTORS  
	DCD  0X40001000    
	DCD  RESET_HANDLER  
	ALIGN 
	AREA MYCODE, CODE, READONLY 
	ENTRY 
	EXPORT RESET_HANDLER 
RESET_HANDLER 
	LDR R0,=NUM 
	LDR R3,=RESULT 
	LDRB R1,[R0]  
	AND R2,R1,#0X0F 
	CMP R2,#09  
	BLS DOWN  
	ADD R2,#07  
DOWN 
	ADD R2,#0X30 
	STRB R2,[R3]  
	AND R4,R1,#0XF0    
	MOV R4,R4,LSR#04  
	CMP R4,#09  
	BLS DOWN1   
	ADD R4,#07 
DOWN1 
	ADD R4,#0X30  
	STRB R4,[R3,#01] 
NUM DCD 0X000003A   
	AREA DATA, DATA, READWRITE 
RESULT DCD 0 
	END
