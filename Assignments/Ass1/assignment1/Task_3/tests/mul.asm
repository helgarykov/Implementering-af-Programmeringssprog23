	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	mv	x18, x10
# was:	mv	_param_x_1_, x10
# 	mv	_param_y_2_,x11
# 	mv	_eq_L_8_,_param_y_2_
	li	x10, 1
# was:	li	_eq_R_9_, 1
	li	x12, 0
# was:	li	_cond_7_, 0
	bne	x11, x10, l.false_10_
# was:	bne	_eq_L_8_, _eq_R_9_, l.false_10_
	li	x12, 1
# was:	li	_cond_7_, 1
l.false_10_:
	bne	x12, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	mv	x10, x18
# was:	mv	_mulres_3_, _param_x_1_
	j	l.endif_6_
l.else_5_:
# 	mv	_eq_L_15_,_param_y_2_
	li	x12, 0
# was:	li	_minus_L_17_, 0
	li	x10, 1
# was:	li	_minus_R_18_, 1
	sub	x12, x12, x10
# was:	sub	_eq_R_16_, _minus_L_17_, _minus_R_18_
	li	x10, 0
# was:	li	_cond_14_, 0
	bne	x11, x12, l.false_19_
# was:	bne	_eq_L_15_, _eq_R_16_, l.false_19_
	li	x10, 1
# was:	li	_cond_14_, 1
l.false_19_:
	bne	x10, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	li	x10, 0
# was:	li	_minus_L_20_, 0
# 	mv	_minus_R_21_,_param_x_1_
	sub	x10, x10, x18
# was:	sub	_mulres_3_, _minus_L_20_, _minus_R_21_
	j	l.endif_13_
l.else_12_:
# 	mv	_lt_L_26_,_param_y_2_
	li	x10, 0
# was:	li	_lt_R_27_, 0
	slt	x10, x11, x10
# was:	slt	_cond_25_, _lt_L_26_, _lt_R_27_
	bne	x10, x0, l.then_22_
# was:	bne	_cond_25_, x0, l.then_22_
	j	l.else_23_
l.then_22_:
	mv	x10, x18
# was:	mv	_arg_30_, _param_x_1_
# 	mv	_plus_L_32_,_param_y_2_
	li	x12, 1
# was:	li	_plus_R_33_, 1
	add	x11, x11, x12
# was:	add	_arg_31_, _plus_L_32_, _plus_R_33_
# 	mv	x10,_arg_30_
# 	mv	x11,_arg_31_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_minus_L_28_,x10
# 	mv	_minus_R_29_,_param_x_1_
	sub	x10, x10, x18
# was:	sub	_mulres_3_, _minus_L_28_, _minus_R_29_
	j	l.endif_24_
l.else_23_:
# 	mv	_plus_L_34_,_param_x_1_
	mv	x10, x18
# was:	mv	_arg_36_, _param_x_1_
# 	mv	_minus_L_38_,_param_y_2_
	li	x12, 1
# was:	li	_minus_R_39_, 1
	sub	x11, x11, x12
# was:	sub	_arg_37_, _minus_L_38_, _minus_R_39_
# 	mv	x10,_arg_36_
# 	mv	x11,_arg_37_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_35_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_34_, _plus_R_35_
l.endif_24_:
l.endif_13_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function testMul
f.testMul:
	sw	x1, -4(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -12
	mv	x18, x10
# was:	mv	_param_i_40_, x10
# 	mv	_eq_L_46_,_param_i_40_
	li	x10, 0
# was:	li	_eq_R_47_, 0
	li	x11, 0
# was:	li	_cond_45_, 0
	bne	x18, x10, l.false_48_
# was:	bne	_eq_L_46_, _eq_R_47_, l.false_48_
	li	x11, 1
# was:	li	_cond_45_, 1
l.false_48_:
	bne	x11, x0, l.then_42_
# was:	bne	_cond_45_, x0, l.then_42_
	j	l.else_43_
l.then_42_:
	li	x10, 0
# was:	li	_testMulres_41_, 0
	j	l.endif_44_
l.else_43_:
	jal	p.getint
# was:	jal	p.getint, 
	mv	x19, x10
# was:	mv	_let_n1_49_, x10
	jal	p.getint
# was:	jal	p.getint, 
	mv	x11, x10
# was:	mv	_let_n2_50_, x10
	mv	x10, x19
# was:	mv	_arg_53_, _let_n1_49_
# 	mv	_arg_54_,_let_n2_50_
# 	mv	x10,_arg_53_
# 	mv	x11,_arg_54_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_tmp_52_,x10
# 	mv	_let_result_51_,_tmp_52_
# 	mv	x10,_let_result_51_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_minus_L_56_,_param_i_40_
	li	x10, 1
# was:	li	_minus_R_57_, 1
	sub	x10, x18, x10
# was:	sub	_arg_55_, _minus_L_56_, _minus_R_57_
# 	mv	x10,_arg_55_
	jal	f.testMul
# was:	jal	f.testMul, x10
# 	mv	_testMulres_41_,x10
l.endif_44_:
# 	mv	x10,_testMulres_41_
	addi	x2, x2, 12
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x10, 5
# was:	li	_arg_60_, 5
# 	mv	x10,_arg_60_
	jal	f.testMul
# was:	jal	f.testMul, x10
# 	mv	_let_result_59_,x10
	li	x10, 0
# was:	li	_mainres_58_, 0
# 	mv	x10,_mainres_58_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	j	l.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.true:
	.word	4
	.asciz	"true"
	.align	2
s.false:
	.word	5
	.asciz	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000