	//prelab2
	//Step 1
	movs r0, #29
	movs r1, #65
	subs r2, r0, r1
	//29-65=-36. NZCV: 1000. R2=0xFFFFFFDC

	//Step 2

	ldr r0, var
	movs r3, #16
	movs r1, r0
	rors r1, r3
	movs r2, r1
	rors r2, r3

	.align 4
var:	 .word 0x12345678
	// R0 = 0x12345678. R1 = 0x56781234 (Rotate by 16 bits). NZCV = 0000
	// R2 = 0x12345678 (Rotate by another 16 bits, result is 32 bit rotate).

	//Step 3

	ldr r0, =var //Loads the address of var = 0x20000000
	lsrs r1, r0, #4 //logical right shift by 4 bits r1 = 0x00200000
	lsls r2, r1, #4 //logical left shift by 4 bits. r2 = r0
	movs r0, #7 //r0 = 0x7

	.data
	.align 4
var:	 .word 0x12345678

	//Step 4

	ldr r0, =var // r0 is the address of var which is at the top of stack = 0x200000000
	ldr r1, [r0] // Get the value specified at the address var
	ldr r2, =0xFFFF0000
	bics r1, r2 // r1 = 0x00005678, first 16 bits of r1 are SMALLER THAN r2

	.data
	.align 4
var:	.word 0x12345678

	//Step 5

	movs r0, #32
	movs r1, #24
	mov r2, sp // r2 is the address pointer by stack pointer = 0x20002000
	push {r0, r1} //push 32 and 24 on the stack. Stack pointer now points to 1 byte below starting memory address i.e. sp = 0x20001FF8

	//Step 6
	movs r0, #0x32
	movs r1, #0x24
	mov r11, sp //mov value of stack pointer into r11. stack pointer points to the top of the stack i.e. 0x20002000
	push {r0, r1} //push value to stack
	mov r12,sp // mov value of stack pointer into r12. stack pointer = 0x20001FF8 i.e. 1 byte below the stack. 
	movs r0, #0x88 
	movs r1, #0x99
	pop {r0, r2} //assigned value for r0 will be lost so r0 will be unchanged from, its og val of 0x32 but r1 value will changed to 0x99 since we didn't po p it. SP now points back to 0x20002000.

	//Step 7

	movs r0, #0x18
	movs r1, #0xF1
	subs r0, r1 //subtract. negative flag is set
	add r0, r1 //add, everything is back to og. 

	//Step 8
	eors r0, r0 //will just 0 out everything
	movs r1, #32
	subs r0, r0, r1 
	adds r0, #32 // sub 32, add 32 will result in 0. Zero flag set. Carry flag set

	//Step 9
	mov  r12, sp //move val of stack pointer to r12 i.e. 0x20002000
	movs r0, #0x27 //
	movs r1, #0x34 //
	push {r0, r1} //push r0 and r1 to stack
	movs r0, #0x45
	movs r1, #0x67 //new val of r1 is 0x67
	add  sp,#4 
	pop {r0} //r0 will not be changed since it has been popped. sp is back.

	//Step 10
	movs r0, #0x75
	ldr  r1,=0xffffffce
	rsbs r0,r1,#0 //r0 = 0x32

	//Step 11
	movs r0, #0x43
	movs r1, #0x44
	movs r2, #0x55
	subs r0, r1 //decimal value -1, r0 = 0xFFFFFFFFF 
	sbcs r2, r1 //arithmetic val 11, -1 carry so r2 = 0x10 final answer

	//Step 12
	ldr  r0, =0x8b9faef8
	ldr  r1, =0x55555555
	eors r0, r1 //r0 = 0xDECAFBAD, negative flag set coz negative number

	//step 13
	ldr  r0, =0xfedc //16 bit value
	sxth r0, r0 //sign extend half word i.e. 16 bits and keep negative sign so r0 = 0xfffffedc and negative flag is 1
	lsls r1, r0, #4 //Logical left shift by 4 bits so r0 = 0xffffedc0, 1 got shifted out so carry flag is 1

	//step 14
	ldr r0, =0xabcd
	rev r0, r0 //byte(8 bit) reverse in 32 bit so r0 = 0xcdab00000

	//step 15
	ldr r0, =0xEEEEEEEE
	mvns r1, r0 //Bitwise not. 1110 becomes 0001. 
	

	


	
	
	
	
	
	
	
	

	
