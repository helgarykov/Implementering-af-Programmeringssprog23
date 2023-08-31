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
# Function readInt
f.readInt:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_i_40_,x10
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_readIntres_41_,x10
# 	mv	x10,_readIntres_41_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function potensPlus
f.potensPlus:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	mv	x18, x10
# was:	mv	_param_a_42_, x10
	mv	x10, x11
# was:	mv	_param_b_43_, x11
# 	mv	_plus_L_45_,_param_a_42_
# 	mv	_arg_47_,_param_b_43_
	mv	x11, x10
# was:	mv	_arg_48_, _param_b_43_
# 	mv	x10,_arg_47_
# 	mv	x11,_arg_48_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_46_,x10
	add	x10, x18, x10
# was:	add	_potensPlusres_44_, _plus_L_45_, _plus_R_46_
# 	mv	x10,_potensPlusres_44_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	jal	p.getint
# was:	jal	p.getint, 
	mv	x11, x10
# was:	mv	_let_n_50_, x10
# 	mv	_lt_L_55_,_let_n_50_
	li	x10, 1
# was:	li	_lt_R_56_, 1
	slt	x10, x11, x10
# was:	slt	_cond_54_, _lt_L_55_, _lt_R_56_
	bne	x10, x0, l.then_51_
# was:	bne	_cond_54_, x0, l.then_51_
	j	l.else_52_
l.then_51_:
	la	x10, s.Incorre_59_
# was:	la	_tmp_58_, s.Incorre_59_
# s.Incorre_59_: string "Incorrect input!"
# 	mv	_let_out_57_,_tmp_58_
# 	mv	x10,_tmp_58_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x10, 0
# was:	li	_mainres_49_, 0
	j	l.endif_53_
l.else_52_:
	mv	x10, x11
# was:	mv	_size_61_, _let_n_50_
	bge	x10, x0, l.safe_62_
# was:	bge	_size_61_, x0, l.safe_62_
	li	x10, 20
# was:	li	x10, 20
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_62_:
	mv	x23, x3
# was:	mv	_let_N_60_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_67_, _size_61_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_67_, _tmp_67_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_67_
	sw	x10, 0(x23)
# was:	sw	_size_61_, 0(_let_N_60_)
	addi	x12, x23, 4
# was:	addi	_addr_63_, _let_N_60_, 4
	mv	x11, x0
# was:	mv	_i_64_, x0
l.loop_beg_65_:
	bge	x11, x10, l.loop_end_66_
# was:	bge	_i_64_, _size_61_, l.loop_end_66_
	sw	x11, 0(x12)
# was:	sw	_i_64_, 0(_addr_63_)
	addi	x12, x12, 4
# was:	addi	_addr_63_, _addr_63_, 4
	addi	x11, x11, 1
# was:	addi	_i_64_, _i_64_, 1
	j	l.loop_beg_65_
l.loop_end_66_:
# 	mv	_arr_70_,_let_N_60_
	lw	x21, 0(x23)
# was:	lw	_size_69_, 0(_arr_70_)
	mv	x18, x3
# was:	mv	_let_arr_68_, x3
	slli	x10, x21, 2
# was:	slli	_tmp_78_, _size_69_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_78_, _tmp_78_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_78_
	sw	x21, 0(x18)
# was:	sw	_size_69_, 0(_let_arr_68_)
	addi	x20, x18, 4
# was:	addi	_addrg_73_, _let_arr_68_, 4
	mv	x19, x0
# was:	mv	_i_74_, x0
	addi	x22, x23, 4
# was:	addi	_elem_71_, _arr_70_, 4
l.loop_beg_75_:
	bge	x19, x21, l.loop_end_76_
# was:	bge	_i_74_, _size_69_, l.loop_end_76_
	lw	x10, 0(x22)
# was:	lw	_res_72_, 0(_elem_71_)
	addi	x22, x22, 4
# was:	addi	_elem_71_, _elem_71_, 4
# 	mv	x10,_res_72_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_tmp_77_,x10
# 	mv	_res_72_,_tmp_77_
	sw	x10, 0(x20)
# was:	sw	_res_72_, 0(_addrg_73_)
	addi	x20, x20, 4
# was:	addi	_addrg_73_, _addrg_73_, 4
	addi	x19, x19, 1
# was:	addi	_i_74_, _i_74_, 1
	j	l.loop_beg_75_
l.loop_end_76_:
# 	mv	_arr_81_,_let_N_60_
	lw	x10, 0(x23)
# was:	lw	_size_80_, 0(_arr_81_)
	mv	x19, x3
# was:	mv	_let_difs_79_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_115_, _size_80_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_115_, _tmp_115_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_115_
	sw	x10, 0(x19)
# was:	sw	_size_80_, 0(_let_difs_79_)
	addi	x12, x19, 4
# was:	addi	_addrg_84_, _let_difs_79_, 4
	mv	x11, x0
# was:	mv	_i_85_, x0
	addi	x13, x23, 4
# was:	addi	_elem_82_, _arr_81_, 4
l.loop_beg_86_:
	bge	x11, x10, l.loop_end_87_
# was:	bge	_i_85_, _size_80_, l.loop_end_87_
	lw	x15, 0(x13)
# was:	lw	_res_83_, 0(_elem_82_)
	addi	x13, x13, 4
# was:	addi	_elem_82_, _elem_82_, 4
# 	mv	_eq_L_93_,_res_83_
	li	x16, 0
# was:	li	_eq_R_94_, 0
	li	x14, 0
# was:	li	_cond_92_, 0
	bne	x15, x16, l.false_95_
# was:	bne	_eq_L_93_, _eq_R_94_, l.false_95_
	li	x14, 1
# was:	li	_cond_92_, 1
l.false_95_:
	bne	x14, x0, l.then_89_
# was:	bne	_cond_92_, x0, l.then_89_
	j	l.else_90_
l.then_89_:
	li	x14, 0
# was:	li	_arr_ind_96_, 0
	addi	x15, x18, 4
# was:	addi	_arr_data_97_, _let_arr_68_, 4
	lw	x16, 0(x18)
# was:	lw	_size_98_, 0(_let_arr_68_)
	bge	x14, x0, l.nonneg_100_
# was:	bge	_arr_ind_96_, x0, l.nonneg_100_
l.error_99_:
	li	x10, 25
# was:	li	x10, 25
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_100_:
	bge	x14, x16, l.error_99_
# was:	bge	_arr_ind_96_, _size_98_, l.error_99_
	slli	x14, x14, 2
# was:	slli	_arr_ind_96_, _arr_ind_96_, 2
	add	x15, x15, x14
# was:	add	_arr_data_97_, _arr_data_97_, _arr_ind_96_
	lw	x15, 0(x15)
# was:	lw	_fun_arg_res_88_, 0(_arr_data_97_)
	j	l.endif_91_
l.else_90_:
	mv	x17, x15
# was:	mv	_arr_ind_103_, _res_83_
	addi	x14, x18, 4
# was:	addi	_arr_data_104_, _let_arr_68_, 4
	lw	x16, 0(x18)
# was:	lw	_size_105_, 0(_let_arr_68_)
	bge	x17, x0, l.nonneg_107_
# was:	bge	_arr_ind_103_, x0, l.nonneg_107_
l.error_106_:
	li	x10, 27
# was:	li	x10, 27
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_107_:
	bge	x17, x16, l.error_106_
# was:	bge	_arr_ind_103_, _size_105_, l.error_106_
	slli	x17, x17, 2
# was:	slli	_arr_ind_103_, _arr_ind_103_, 2
	add	x14, x14, x17
# was:	add	_arr_data_104_, _arr_data_104_, _arr_ind_103_
	lw	x14, 0(x14)
# was:	lw	_minus_L_101_, 0(_arr_data_104_)
# 	mv	_minus_L_109_,_res_83_
	li	x16, 1
# was:	li	_minus_R_110_, 1
	sub	x17, x15, x16
# was:	sub	_arr_ind_108_, _minus_L_109_, _minus_R_110_
	addi	x15, x18, 4
# was:	addi	_arr_data_111_, _let_arr_68_, 4
	lw	x16, 0(x18)
# was:	lw	_size_112_, 0(_let_arr_68_)
	bge	x17, x0, l.nonneg_114_
# was:	bge	_arr_ind_108_, x0, l.nonneg_114_
l.error_113_:
	li	x10, 27
# was:	li	x10, 27
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_114_:
	bge	x17, x16, l.error_113_
# was:	bge	_arr_ind_108_, _size_112_, l.error_113_
	slli	x17, x17, 2
# was:	slli	_arr_ind_108_, _arr_ind_108_, 2
	add	x15, x15, x17
# was:	add	_arr_data_111_, _arr_data_111_, _arr_ind_108_
	lw	x15, 0(x15)
# was:	lw	_minus_R_102_, 0(_arr_data_111_)
	sub	x15, x14, x15
# was:	sub	_fun_arg_res_88_, _minus_L_101_, _minus_R_102_
l.endif_91_:
# 	mv	_res_83_,_fun_arg_res_88_
	sw	x15, 0(x12)
# was:	sw	_res_83_, 0(_addrg_84_)
	addi	x12, x12, 4
# was:	addi	_addrg_84_, _addrg_84_, 4
	addi	x11, x11, 1
# was:	addi	_i_85_, _i_85_, 1
	j	l.loop_beg_86_
l.loop_end_87_:
# 	mv	_arr_117_,_let_difs_79_
	lw	x18, 0(x19)
# was:	lw	_size_118_, 0(_arr_117_)
	li	x20, 0
# was:	li	_let_result_116_, 0
	addi	x19, x19, 4
# was:	addi	_arr_117_, _arr_117_, 4
	mv	x21, x0
# was:	mv	_ind_var_119_, x0
l.loop_beg_121_:
	bge	x21, x18, l.loop_end_122_
# was:	bge	_ind_var_119_, _size_118_, l.loop_end_122_
	lw	x11, 0(x19)
# was:	lw	_tmp_120_, 0(_arr_117_)
	addi	x19, x19, 4
# was:	addi	_arr_117_, _arr_117_, 4
	mv	x10, x20
# was:	mv	x10, _let_result_116_
# 	mv	x11,_tmp_120_
	jal	f.potensPlus
# was:	jal	f.potensPlus, x10 x11
# 	mv	_tmp_123_,x10
	mv	x20, x10
# was:	mv	_let_result_116_, _tmp_123_
	addi	x21, x21, 1
# was:	addi	_ind_var_119_, _ind_var_119_, 1
	j	l.loop_beg_121_
l.loop_end_122_:
	mv	x10, x20
# was:	mv	_tmp_125_, _let_result_116_
# 	mv	_let_w_124_,_tmp_125_
# 	mv	x10,_let_w_124_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x20
# was:	mv	_mainres_49_, _let_result_116_
l.endif_53_:
# 	mv	x10,_mainres_49_
	addi	x2, x2, 28
	lw	x23, -28(x2)
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
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
s.Incorre_59_:
	.word	16
	.asciz	"Incorrect input!"
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