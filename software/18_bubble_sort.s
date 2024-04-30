AREA RESET, DATA, READONLY
EXPORT __VECTORS
__VECTORS
    DCD 0X10001000
    DCD RESET_HANDLER
    ALIGN

AREA MY_CODE, CODE, READONLY
ENTRY
EXPORT RESET_HANDLER
RESET_HANDLER
    LDR R0, =SRC
    LDR R1, =DST
    MOV R2, #10

LOOP
    LDR R3, [R0]
    STR R3, [R1]
    ADD R0, R0, #4
    ADD R1, R1, #4
    SUBS R2, R2, #1
    BNE LOOP

    MOV R1, #10

OUTER_LOOP
    MOV R2, R1
    SUB R2, R2, #1

INNER_LOOP
    LDR R0, =DST
    LDR R3, [R0]
    ADD R0, R0, #4
    LDR R4, [R0]
    CMP R3, R4
    BGT SWAP
    CONT
    SUBS R2, R2, #1
    BNE INNER_LOOP

    SUB R1, R1, #1
    CMP R1, #1
    BNE OUTER_LOOP

STOP
    B STOP

SWAP
    STR R3, [R0]
    STR R4, [R0, #-4]
    B CONT

SRC DCD 0X10,0X9,0X8,0X7,0X6,0X5,0X4,0X3,0X2,0X1

AREA MY_DATA, DATA, READWRITE
DST DCD 0X0
END

