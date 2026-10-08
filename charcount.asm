.ORIG x3000;

PROMPT_STR .STRINGZ "\nEnter a string: "

START

AND R0, R0, #0; Clear R0 OPEN REGISTER FOR PRINTING and INPUT
AND R1, R1, #0; Clear R1 string BLKW address
AND R2, R2, #0; Clear R2 string BLKW size
AND R3, R3, #0; Clear R3 char address
AND R4, R4, #0; Clear R4 
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

LEA R0, STRING_ENT_CHR;
PUTS;

GETC; 
OUT;

ST R0, CHECK_CHAR;

NOT R0, R0;

ADD R0, R0, #1;

LEA R1, STRING; moves first address of string 

CHAR_FIND

LDR R4, R1, #0; move the character in array to R4;

ADD R4, R0, R4; 

BRnp NO_MATCH;

ADD R5, R5, #1; 

NO_MATCH

ADD R1, R1, #1; progress the address by 1

ADD R2, R2, #-1; only keep checking inside array size

BRp CHAR_FIND

LEA R0, STRING_CH_1;
PUTS;
LD R0, QUOTE;
OUT;
LEA R6, CHECK_CHAR;
LDR R0, R6, #0;
OUT;
LD R0, QUOTE;
OUT;
LEA R0, STRING_CH_2;
PUTS;
ADD R0, R5, #0;
ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #3;
OUT;
LEA R0, STRING_CH_3;
PUTS;

BR START

STRING_ENT_CHR .STRINGZ "\nEnter a character: "

CHECK_CHAR .FILL x0000;

STRING_CH_1 .STRINGZ "\nThe character "
QUOTE .FILL x0022 ; ascii for QUOTE
STRING_CH_2 .STRINGZ " appears "
;num between
STRING_CH_3 .STRINGZ " times."

STRING .BLKW 100

.END