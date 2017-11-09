	.file	1 "motor.c"
	.section .mdebug.abi32
	.previous
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,72,$31		# vars= 48, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
$L2:
	addiu	$2,$fp,20
	move	$4,$2
	jal	my_scan
	nop

	lw	$3,20($fp)
	li	$2,82			# 0x52
	bne	$3,$2,$L3
	nop

	sw	$0,16($fp)
	j	$L5
	nop

$L6:
	jal	my_motor2
	nop

	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
$L5:
	lw	$2,16($fp)
	nop
	sltu	$2,$2,10
	bne	$2,$0,$L6
	nop

	j	$L2
	nop

$L3:
	lw	$3,20($fp)
	li	$2,76			# 0x4c
	bne	$3,$2,$L2
	nop

	sw	$0,16($fp)
	j	$L10
	nop

$L11:
	jal	my_motor1
	nop

	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
$L10:
	lw	$2,16($fp)
	nop
	sltu	$2,$2,10
	bne	$2,$0,$L11
	nop

	j	$L2
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.align	2
	.globl	my_motor1
	.ent	my_motor1
my_motor1:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$4,1			# 0x1
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,8			# 0x8
	jal	ext_out
	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_motor1
	.size	my_motor1, .-my_motor1
	.align	2
	.globl	my_motor2
	.ent	my_motor2
my_motor2:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$4,8			# 0x8
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,1			# 0x1
	jal	ext_out
	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_motor2
	.size	my_motor2, .-my_motor2
	.align	2
	.globl	ext_out
	.ent	ext_out
ext_out:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	li	$3,800			# 0x320
	lw	$2,16($fp)
	nop
	sw	$2,0($3)
	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ext_out
	.size	ext_out, .-ext_out
	.align	2
	.globl	my_scan
	.ent	my_scan
my_scan:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,780			# 0x30c
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	j	$L20
	nop

$L21:
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
$L20:
	li	$2,784			# 0x310
	lw	$3,0($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L21
	nop

	j	$L23
	nop

$L24:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	beq	$2,$0,$L25
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,27
	beq	$2,$0,$L25
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$3,$2,64
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	j	$L28
	nop

$L25:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	bne	$2,$0,$L29
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,58
	beq	$2,$0,$L29
	nop

	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	j	$L28
	nop

$L29:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,$L32
	nop

	lw	$3,8($fp)
	li	$2,64			# 0x40
	sw	$2,0($3)
	j	$L28
	nop

$L32:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,27			# 0x1b
	bne	$3,$2,$L34
	nop

	lw	$3,8($fp)
	li	$2,91			# 0x5b
	sw	$2,0($3)
	j	$L28
	nop

$L34:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,29			# 0x1d
	bne	$3,$2,$L36
	nop

	lw	$3,8($fp)
	li	$2,93			# 0x5d
	sw	$2,0($3)
	j	$L28
	nop

$L36:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,32
	bne	$2,$0,$L38
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	beq	$2,$0,$L38
	nop

	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	j	$L28
	nop

$L38:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,58			# 0x3a
	bne	$3,$2,$L41
	nop

	lw	$3,8($fp)
	li	$2,63			# 0x3f
	sw	$2,0($3)
	j	$L28
	nop

$L41:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,59			# 0x3b
	bne	$3,$2,$L43
	nop

	lw	$3,8($fp)
	li	$2,61			# 0x3d
	sw	$2,0($3)
	j	$L28
	nop

$L43:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,60			# 0x3c
	bne	$3,$2,$L45
	nop

	lw	$3,8($fp)
	li	$2,59			# 0x3b
	sw	$2,0($3)
	j	$L28
	nop

$L45:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L47
	nop

	lw	$3,8($fp)
	li	$2,58			# 0x3a
	sw	$2,0($3)
	j	$L28
	nop

$L47:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,62			# 0x3e
	bne	$3,$2,$L49
	nop

	lw	$3,8($fp)
	li	$2,10			# 0xa
	sw	$2,0($3)
	j	$L28
	nop

$L49:
	lw	$3,8($fp)
	li	$2,64			# 0x40
	sw	$2,0($3)
$L28:
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,4
	sw	$2,8($fp)
$L23:
	li	$2,784			# 0x310
	lw	$3,0($2)
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,62			# 0x3e
	bne	$3,$2,$L24
	nop

	lw	$2,8($fp)
	nop
	sw	$0,0($2)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$2,780			# 0x30c
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$2,776			# 0x308
	sw	$0,0($2)
	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_scan
	.size	my_scan, .-my_scan
	.ident	"GCC: (GNU) 4.2.0"
