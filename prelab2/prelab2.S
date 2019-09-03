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

	
