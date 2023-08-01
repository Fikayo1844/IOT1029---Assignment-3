/Write ARM assembly code to store two numbers in R0 and R1.
//Store decimal 15 in register R5.
//If the number in R0 is greater than R1, perform two logical left shifts on register R5, then proceed to terminate the program.
//If the number in R0 is less than R1, perform one logical right shift on register R5, then proceed to terminate the program.
//If both the numbers are equal, perform one right rotation on register R5,  then proceed to terminate the program.

.global _start
_start:
    MOV R0, #9
    MOV R1, #10
    MOV R5, #15

    CMP R0,R1 //Compare the value in R0 to the value in R1
    BGT greater // if R0 > R1, branch to the label 'greater'
    BLT lesser // if R0 < R1, branch to the label 'lesser'
    BEQ equal // if R0 == R1, branch to the label 'equal'

greater_than:
    LSL R5,#2 // Logical shift left the value in R5 x2 -> Equivalent to multiplying by 2^2

    // Terminate the program
    MOV R0,R5 // Indicates this program executed successfully
    MOV R7,#1
    SWI 0

lesser_than:
    LSR R5,#1 //Logical shift right the value in R5 -> Equivalent to dividing by 2^1
    // Terminate the program
    MOV R0,R5 // Indicates this program executed successfully
    MOV R7,#1
    SWI 0

equal_to:
    ROR R5,#1 // Perform a right rotation on R5

    // Terminate the program
    MOV R0,R5 // Indicates this program executed successfully
    MOV R7,#1
    SWI 0