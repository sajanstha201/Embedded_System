	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	
	DCD 0x1001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler	
	
	LDR R0,=src
	LDR R1,=dst
	ldr r2,[r0]
	and r3,r2,#0x0f
	cmp r3,#09
	subgt r3,#07
	
	mov r2,r2,lsr#08
	and r4,r2,#0x0f
	cmp r4,#09
	subgt r4,#07
	mov r4,r4,lsl#04
	orr r5,r4,r3
	str r5,[r1]
STOP
	B STOP
src DCD 0x00003235
	AREA mydata, DATA, READWRITE
dst DCD 0
	END
