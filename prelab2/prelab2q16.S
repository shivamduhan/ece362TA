.cpu cortex-m0
.thumb
.syntax unified
.fpu softvfp

.text
.global main
main:
    // your code here
    ldr r0, =n
    ldr r0, [r0]
    ldr r1, =array
    movs r2, #0 //running sum
    ldr r3, [r1]
    
loop:
    adds r2, r3
    adds r4, #4
    ldr r3, [r1, r4]
    subs r0, #1
    cmp r0, #0
    bne loop
    
ldr r0, =sum
str r2, [r0]
    wfi

.data
.align 4
sum:	.space 4
n:	.word 5
array:
	.word 2
	.word 3
	.word 5
	.word 7
	.word 11
	.word 13
	.word 17
	.word 19
	.word 23
	.word 29
