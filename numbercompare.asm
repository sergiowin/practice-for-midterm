.ORIG x3000

PROMPT_1 .STRINGZ "\nEnter the first digit: "

PROMPT_2 .STRINGZ "\nEnter the second digit: "

LINE_BR .STRINGZ "\n"

START

AND R0, R0, #0; Clear R0 OPEN REGISTER FOR PRINTING and INPUT
AND R1, R1, #0; Clear R1 
AND R2, R2, #0; Clear R2 
AND R3, R3, #0; Clear R3 int 1 ascii
AND R4, R4, #0; Clear R4 int 2 ascii
AND R5, R5, #0; Clear R5 int 1 copy
AND R6, R6, #0; Clear R6 int 2 copy
AND R7, R7, #0; Clear R7

LEA R0, PROMPT_1;
PUTS;

GETC; 

OUT;

ADD R3, R0, #0;

ADD R0, R0, #-16;
ADD R0, R0, #-16;
ADD R0, R0, #-16;

ADD R5, R0, #0;

LEA R0, PROMPT_2;
PUTS;

GETC;

OUT;

ADD R4, R0, #0;

ADD R0, R0, #-16;
ADD R0, R0, #-16;
ADD R0, R0, #-16;

ADD R6, R0, #0;

LEA R0, LINE_BR;
PUTS;

NOT R6, R6;

ADD R6, R6, #1; now negative

ADD R0, R5, R6;

BRz EQUI

BRp GR

BRn LT

EQUI

ADD R0, R3, #0;

OUT; 

LEA R0, PROMPT_EQ;

PUTS;

ADD R0, R4, #0;

OUT;

BR START

GR

ADD R0, R3, #0;

OUT;

LEA R0, PROMPT_GR;

PUTS;

ADD R0, R4, #0;

OUT;

BR START

LT

ADD R0, R3, #0;

OUT;

LEA R0, PROMPT_LT;

PUTS;

ADD R0, R4, #0;

OUT;

BR START

PROMPT_GR .STRINGZ " is larger than "

PROMPT_LT .STRINGZ " is less than "

PROMPT_EQ .STRINGZ " is equivalent to "

.END