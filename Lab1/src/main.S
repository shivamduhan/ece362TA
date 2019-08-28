.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

/******************************************************************************

Arithmetic operations

Exercise 1
Description:
    R0, R1, R2, and R3 will be initialized with values. Fill in the provided
    subroutine body with assembly language instructions to set the value in R0
    to be (R0 * R1) + R2 - R3. Don't change any registers other than R0 - R3 to
    accomplish this.

******************************************************************************/
.global codeSegment1
codeSegment1:
    /*Student code goes here*/

    /*End of student code*/
    bx lr

/******************************************************************************
Exercise 2
Description:
    R0, R1, R2, and R3 will be initialized with values. Fill in the provided
    subroutine body with assembly language instructions to set the value in R0
    to be ((-R0) * (R3 + R2)) - R1. Don't change any registers other than
    R0 - R3 to accomplish this.

******************************************************************************/
.global codeSegment2
codeSegment2:
    /*Student code goes here*/

    /*End of student code*/
    bx lr

/******************************************************************************
Exercise 3
Description:
    R0, R1, R2, and R3 will be initialized with values. Fill in the provided
    subroutine body with assembly language instructions to set the value in
    R0 to be R3 - R2 - R1 - R0. Don't change any registers other than
    R0 - R3 to accomplish this.

******************************************************************************/
.global codeSegment3
codeSegment3:
    /*Student code goes here*/

    /*End of student code*/
    bx lr

/******************************************************************************

Logical operations
Exercise 4
Description:
    R0, R1, R2, and R3 will be initialized with values. Fill in the provided
    subroutine body with assembly language instructions to set the value in R0
    to be (R0 | R1) & (R2 ^ R3). Don't change any registers other than R0 - R3 to
    accomplish this.

******************************************************************************/
.global codeSegment4
codeSegment4:
    /*Student code goes here*/

    /*End of student code*/
    bx lr

/******************************************************************************

Exercise 5
Description:
    R0, R1, R2, and R3 will be initialized with values. Fill in the provided
    subroutine body with assembly language instructions to set the value in R0
    to be (R0 << R3) | (R2 >> R1).
    Don't change any registers other than R0 - R3 to accomplish this.

******************************************************************************/
.global codeSegment5
codeSegment5:
    /*Student code goes here*/

    /*End of student code*/
    bx lr

.equ Data1, 0x5
/******************************************************************************

Immediate load operations
Exercise 6
Description:
    R0, R1, R2, and R3 are to be initialized to values specified. R0 to Data1,
    R1 to 255 (base 10), R2 to 510 (base 10), R3 to 0

******************************************************************************/
.global codeSegment6
codeSegment6:
    /*Student code goes here*/

    /*End of student code*/
    bx lr

//=====================================================================
// Put all of the .equ statements for codeSegment7 below:
//=====================================================================

//=====================================================================
// Fill in codeSegment7
//=====================================================================
.global codeSegment7
codeSegment7:
    // Student code goes here

    // End of student code
    bx lr
