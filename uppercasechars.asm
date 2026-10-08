.ORIG x3000

PROMPT_STR .STRINGZ "\nEnter a string: "

START

AND R0, R0, #0; Clear R0 OPEN REGISTER FOR PRINTING and INPUT
AND R1, R1, #0; Clear R1 string BLKW address
AND R2, R2, #0; Clear R2 string BLKW size
AND R3, R3, #0; Clear R3 gen purpose reg
AND R4, R4, #0; Clear R4 accumulator
AND R5, R5, #0; Clear R5
AND R6, R6, #0; Clear R6 
AND R7, R7, #0; Clear R7


LEA R0, PROMPT_STR; load prompt address into R0
PUTS; print prompt

LEA R1, STRING; load first address in string blkw to R1

CHAR_LOOP

GETC; 

ADD R0, R0, #-10; 

BRz NEWLINE

ADD R0, R0, #10; get orig value back

OUT;

STR R0, R1, #0;

ADD R1, R1, #1; add 1 to memory address

ADD R2, R2, #1; add 1 to string size

BR CHAR_LOOP

NEWLINE

LEA R0, UPPERCASE;
PUTS;

LEA R1, STRING;

COUNT

LDR R0, R1, #0;

LD R3, LOWER_LIM;

NOT R3, R3; 

ADD R3, R3, #1; add 1 for twos complement

ADD R0, R0, R3;

BRn NO_MATCH

LDR R0, R1, #0;

LD R3, UPPER_LIM;

NOT R3, R3;

ADD R3, R3, #1;

ADD R0, R3, R0;

BRp NO_MATCH

ADD R4, R4, #1;

NO_MATCH

ADD R1, R1, #1;

ADD R2, R2, #-1;

BRp COUNT


ADD R0, R4, #0; move count into R0

ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #3;

OUT;

BR START

LOWER_LIM .FILL x0041
UPPER_LIM .FILL  x005A






UPPERCASE .STRINGZ "\nUppercase Count: "

STRING .BLKW 100

.END