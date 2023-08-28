	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function mul
f.mul:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_1_,x10
# 	mv	_param_y_2_,x11
# 	mv	_divide_L_4_,_param_x_1_
# 	mv	_divide_R_5_,_param_y_2_
	beq	x11, x0, l.zero_divisor_6_
# was:	beq	_divide_R_5_, x0, l.zero_divisor_6_
	div	x12, x10, x11
# was:	div	_mulres_3_, _divide_L_4_, _divide_R_5_
l.zero_divisor_6_:
# Division by zero error handling
	mv	x10, x12
# was:	mv	x10, _mulres_3_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function testMul
f.testMul:
	sw	x1, -4(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -12
	mv	x18, x10
# was:	mv	_param_i_7_, x10
# 	mv	_eq_L_13_,_param_i_7_
	li	x10, 0
# was:	li	_eq_R_14_, 0
	li	x11, 0
# was:	li	_cond_12_, 0
	bne	x18, x10, l.false_15_
# was:	bne	_eq_L_13_, _eq_R_14_, l.false_15_
	li	x11, 1
# was:	li	_cond_12_, 1
l.false_15_:
	bne	x11, x0, l.then_9_
# was:	bne	_cond_12_, x0, l.then_9_
	j	l.else_10_
l.then_9_:
	li	x10, 0
# was:	li	_testMulres_8_, 0
	j	l.endif_11_
l.else_10_:
	jal	p.getint
# was:	jal	p.getint, 
	mv	x19, x10
# was:	mv	_let_n1_16_, x10
	jal	p.getint
# was:	jal	p.getint, 
	mv	x11, x10
# was:	mv	_let_n2_17_, x10
	mv	x10, x19
# was:	mv	_arg_20_, _let_n1_16_
# 	mv	_arg_21_,_let_n2_17_
# 	mv	x10,_arg_20_
# 	mv	x11,_arg_21_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_tmp_19_,x10
# 	mv	_let_result_18_,_tmp_19_
# 	mv	x10,_let_result_18_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_minus_L_23_,_param_i_7_
	li	x10, 1
# was:	li	_minus_R_24_, 1
	sub	x10, x18, x10
# was:	sub	_arg_22_, _minus_L_23_, _minus_R_24_
# 	mv	x10,_arg_22_
	jal	f.testMul
# was:	jal	f.testMul, x10
# 	mv	_testMulres_8_,x10
l.endif_11_:
# 	mv	x10,_testMulres_8_
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
# was:	li	_arg_27_, 5
# 	mv	x10,_arg_27_
	jal	f.testMul
# was:	jal	f.testMul, x10
# 	mv	_let_result_26_,x10
	li	x10, 0
# was:	li	_mainres_25_, 0
# 	mv	x10,_mainres_25_
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