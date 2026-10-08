.ORIG x3000


START

AND R0, R0, #0; Clear R0 REGISTER FOR INPUT OUTPUT ETC...
AND R1, R1, #0; Clear R1 MEMORY POINTER
AND R2, R2, #0; Clear R2 ARRAY SIZE TRACKER
AND R3, R3, #0; Clear R3 ACCUMULATOR
AND R4, R4, #0; Clear R4
AND R5, R5, #0; Clear R5

LEA R1, DIGITS; move address of the beginning of the digits into R1 for storage

MAIN_LOOP

LEA R0, PROMPT_DIG; load address of PROMPT_DIG for printing
PUTS    ; prints prompt asking for digit

GETC ;gets digit

OUT; prints 

ADD R3, R0, #-10; subtract 10 to check if its newline char

BRz LOOP_END 

ADD R0, R0, #-16;
ADD R0, R0, #-16;
ADD R0, R0, #-16; subtract 48 to convert from ascii to actual integer

STR R0, R1, #0; store at the address in R1 (began at DIGITS[0])

ADD R1, R1, #1; increase memory address by 1, eg DIGITS[0 + 1]...

ADD R2, R2, #1; increases array size by 1 so we know when to end array when doing summation



BR MAIN_LOOP

LOOP_END ;newline was entered so sum and end

JSR SUM_ALL

BR START ;go back to start 

PROMPT_DIG .STRINGZ "\nEnter a digit (hit enter to stop): "

SUM_ALL

AND R3, R3, #0;

ST R7, RET_ADDR_SUM_ALL;

LEA R1, DIGITS;

SUM_LOOP

LDR R0, R1, #0; load the value at the memory address into R0

ADD R3, R3, R0; add R0 to whatever is in R3.

ADD R1, R1, #1; add to move across array

ADD R2, R2, #-1; decrement for array size

BRp SUM_LOOP

LEA R0, PROMPT_SUM;
PUTS; print prompt

JSR PRINT_SUM;

LD R7, RET_ADDR_SUM_ALL;

RET

RET_ADDR_SUM_ALL .FILL x0000

PROMPT_SUM .STRINGZ "THe sum of the digits is "


PRINT_SUM

AND R0, R0, #0; now free
AND R1, R1, #0; print toggle
AND R2, R2, #0; accumulator for each place
;R3 has the sum of all digits, if a max of 100 digits was entered that means the maximum is 900

ST R7, RET_ADDR_PRINT_SUM;

LOOP_100

ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10;
ADD R3, R3, #-10; -100

BRn LOOP_100_DONE

ADD R2, R2, #1; add 1 to accumulator

BRzp LOOP_100;

LOOP_100_DONE

ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; 
ADD R3, R3, #10; add 100 to get remainder

ADD R2, R2, #0; if zero then dont print anything

BRz NO_PRINT_100

ADD R1, R1, #1; if not zero then add 1 to R1 signifying that all digits need to be printed no matter what now.

ADD R0, R2, #0; move the hundreds digit into R0

ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #3;

OUT;

NO_PRINT_100


AND R2, R2, #0; clear accumulator


LOOP_10

ADD R3, R3, #-10;

BRn LOOP_10_DONE

ADD R2, R2, #1; add 1 to accumulator

BRzp LOOP_10;

LOOP_10_DONE

ADD R3, R3, #10;

ADD R1, R1, #0; if positive print anyways

BRp PRINT_YES

ADD R2, R2, #0; if zero then dont print anything

BRz NO_PRINT_10

PRINT_YES

ADD R1, R1, #1; if not zero then add 1 to R1 signifying that all digits need to be printed no matter what now.

ADD R0, R2, #0; move the tens digit into R0

ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #3;

OUT;

NO_PRINT_10

ADD R0, R3, #0; move R3 into R0 for printing

ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #15;
ADD R0, R0, #3;

OUT;

LD R7, RET_ADDR_PRINT_SUM;

RET

RET_ADDR_PRINT_SUM .FILL x0000


DIGITS .BLKW 100

.END