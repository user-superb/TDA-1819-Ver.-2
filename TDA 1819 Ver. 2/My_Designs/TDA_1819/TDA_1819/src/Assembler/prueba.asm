		.data
A:	.hword	2980
B:	.hword	6912
SUMA:	.hword	0
MAYOR:	.hword	0
MENOR:	.hword	0
		.text
		dadd r3, r0, r0
		lh r1, A(r0)
		lh r2, B(r0)
		slt r3, r1, r2
		andi r3, r3, 0x0001
		bnez r3, A_ES_MENOR
		daddi r4, r2, 0
		daddi r5, r1, 0
		jmp CONT_F
A_ES_MENOR:	daddi r4, r1, 0
		daddi r5, r2, 0
CONT_F:		dadd r6, r1, r2
		pushh r6
		andi r7, r6, 0x0001
		bnez r7, ES_IMPAR_G
		pushh r5
		pushh r4
		jmp CONT_H
ES_IMPAR_G:	pushh r4
		pushh r5
CONT_H:		lh r8, 2(sp)
		bnez r7, ES_IMPAR_H
		sh r8, MENOR(r0)
		lh r8, 4(sp)
		sh r8, MAYOR(r0)
		jmp FIN_H
ES_IMPAR_H:	sh r8, MAYOR(r0)
		lh r8, 4(sp)
		sh r8, MENOR(r0)
FIN_H:		lh r8, 6(sp)
		sh r8, SUMA(r0)
		bnez r7, ES_IMPAR_I
		sh r0, 6(sp)
		jmp CONT_J
ES_IMPAR_I:	sh r7, 6(sp)
CONT_J:		bnez r7, ES_IMPAR_J
		poph r4
		poph r5
		jmp FIN_J
ES_IMPAR_J:	poph r5
		poph r4
FIN_J:		poph r6
		halt
	
