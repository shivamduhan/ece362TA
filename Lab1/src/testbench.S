.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

// r0-r3, values
// stack top = function pointer
// next in stack is expected value
testFromParameters:
	pop {r4, r5} // r4 is function pointer, r5 is return value
        adds r4, #1
	mov r12, r4
	movs r4, r5
	mov r5, r12
	push {r4, r5}

	// Clear fail flag
	ldr r4, =failFlag
	movs r5, #0
	str r5, [r4]

	// Set registers values
	movs r4, #0xfe
	movs r5, #0xde
	movs r6, #0xad
	movs r7, #0xbe
	mov r8, r4
	mov r9, r5
	mov r10, r6
	mov r11, r7

	push {lr}

	// Go to the corrresponding function
        blx r12

	// R2 has the return address
	pop {r3}

	// Check if result is correct
	pop {r1, r2}
	cmp r0, r1
	bne onFail

        movs r0, #0xfe
        cmp r0, r4
        bne onFail
	cmp r0, r8
        bne onFail
        movs r0, #0xde
        cmp r0, r5
        bne onFail
        cmp r0, r9
        bne onFail
        movs r0, #0xad
        cmp r0, r6
        bne onFail
        cmp r0, r10
        bne onFail
        movs r0, #0xbe
        cmp r0, r7
        bne onFail
        cmp r0, r11
        bne onFail

	ldr r0, =failFlag
	ldr r0, [r0]
	cmp r0, #1
	beq ret2

	// Increment pass
	ldr r0, =pass
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
ret2:
	bx r3

ret:
	pop {r1}
	bx r3

onFail:
    ldr r0, =failFlag
	movs r1, #1
	str r1, [r0]
	ldr r0, =fail
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
    bx r3

.global main
main:
	movs r0, #25
	movs r1, #4
	movs r2, #3
	movs r3, #55
	ldr r4, =codeSegment1
	movs r5, #48
	push {r4, r5}
	bl testFromParameters

testSegment2:
	movs r0, #55
	rsbs r0, #0
	movs r1, #97
	movs r2, #12
	movs r3, #15
	ldr r4, =codeSegment2
	ldr r5, ans3
	push {r4, r5}
	bl testFromParameters

testSegment3:
	movs r0, #3
	movs r1, #4
	movs r2, #20
	movs r3, #25
	ldr r4, =codeSegment3
	movs r5, #2
	rsbs r5, #0
	push {r4, r5}
	bl testFromParameters

testSegment4:
	movs r0, #35
	movs r1, #40
	movs r2, #35
	movs r3, #25
	ldr r4, =codeSegment4
	movs r5, #42
	push {r4, r5}
	bl testFromParameters

testSegment5:
	movs r0, #4
	movs r1, #1
	movs r2, #16
	movs r3, #2
	ldr r4, =codeSegment5
	movs r5, #24
	push {r4, r5}
	bl testFromParameters

testSegment6:
	bl codeSegment6
	cmp r3, #0
	bne failed
	cmp r1, #255
	bne failed
	ldr r1, data1
	cmp r0, r1
	bne failed
	ldr r3, ans5
	cmp r2, r3
	bne failed

	// Increment pass
	ldr r0, =pass
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]

	b loop

failed:
    ldr r0, =failFlag
	movs r1, #1
	str r1, [r0]
	ldr r0, =fail
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]

loop:
        bl codeSegment7
	b loop

.equ Data1, 0x5
.align 4
ans2: .word -10625
ans3: .word 1388
ans4: .word -2140
ans5: .word 510
data1: .word Data1
.data
.align 4
pass: .word 0x00
fail: .word 0x00
failFlag: .word 0x00

