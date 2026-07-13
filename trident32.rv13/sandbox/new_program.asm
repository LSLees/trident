movi r4, 0x8000
movi r0, 48
movi r1, 18

loop:
	cmp r0, r1
	jeq done
	sub r2, r0, r1
	and r3, r2, r4
	cmp r3, r4
	jeq bigger

	sub r0, r0, r1
	jmp loop

bigger:
	sub r1, r1, r0
	jmp loop

done:
	jmp done