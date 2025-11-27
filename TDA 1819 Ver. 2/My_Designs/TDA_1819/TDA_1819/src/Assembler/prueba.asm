		.data
A:	.hword	2980
B:	.hword	6912
SUMA:	.hword	0
MAYOR:	.hword	0
MENOR:	.hword	0
		.text
		lh r1, A(r0)
		lh r2, B(r0)
		slt r3, r1, r2
		andi r3, r3, 0x0001
		pushh r1
		pushh r2
		lh r4, 2(sp)
		lh r5, 4(sp)
		halt
	
