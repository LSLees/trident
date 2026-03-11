addi r0, r0, 5
c:
	addi r1, r1, 1
	bne r0, r1, c
	addi r3, r3, 1
	sub r0, r0, r0
	sub r1, r1, r1
	jmp 0