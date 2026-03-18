// init stack
0x3c1c7fff // lui $sp, 0x7fff
0x379cfffc // ori $sp, 0xfffc

// go
0x20040007 // addi $a0, $0, 7
0x0c000000|fibonacci // jal fibonacci
0x8c000000 // lw $0, 0($0) // halt

label fibonacci
0x14040002 // bnez $a0, skipret1
0x00001020 // add $v0, $0, $0
0x03e00008 // jr $ra

label skipret1
0x20020001 // addi $v0, $0 ,1
0x14440001 // bne $a0, $v0, skipret1
0x03e00008 // jr $ra

// create frame
label skipret2
0x239cfff4 // addi $sp, $sp, -12
0xaf9f0000 // sw $ra, 0($sp)
0xaf840004 // sw $a0, 4($sp)
0x2084ffff // addi $a0, $a0, -1
0x0c000000|fibonacci // jal fibonacci
0xaf820008 // sw $v0, 8($sp)
0x8f840004 // lw $a0, 4($sp)
0x2084fffe // addi $a0, %a0, -2
0x0c000000|fibonacci // jal fibonacci
0x8f830008 // lw $v1, 8($sp)
0x00431020 // add $v0, $v0, $v1
//unwind
0x8f9f0000 // lw $ra, 0($sp)
0x239c000c // addi $sp, $sp, 12
0x03e00008 // jr $ra