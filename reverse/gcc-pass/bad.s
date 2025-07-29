	.file	"main.c"
	.text
	.p2align 4
	.globl	_Z5innerPfjjj
	.type	_Z5innerPfjjj, @function
_Z5innerPfjjj:
.LFB30:
	.cfi_startproc
	endbr64
	imull	%ecx, %esi
	pxor	%xmm0, %xmm0
	leal	(%rsi,%rdx), %eax
	cvtsi2ssq	%rax, %xmm0
	movss	%xmm0, (%rdi,%rax,4)
	ret
	.cfi_endproc
.LFE30:
	.size	_Z5innerPfjjj, .-_Z5innerPfjjj
	.p2align 4
	.globl	_Z4loopPfjj
	.type	_Z4loopPfjj, @function
_Z4loopPfjj:
.LFB31:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	je	.L5
	testl	%edx, %edx
	je	.L5
	movl	%edx, %r8d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%r10d, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	addl	$1, %eax
	cvtsi2ssq	%rcx, %xmm0
	movss	%xmm0, (%rdi,%rcx,4)
	cmpl	%eax, %r8d
	jne	.L10
	addl	$1, %r9d
	addl	%edx, %r10d
	addl	%edx, %r8d
	cmpl	%esi, %r9d
	jne	.L7
.L5:
	ret
	.cfi_endproc
.LFE31:
	.size	_Z4loopPfjj, .-_Z4loopPfjj
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%f \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-36864(%rsp), %rax
	cmpq	%rax, %rsp
	je	.L20
.L28:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L28
.L20:
	subq	$3136, %rsp
	orq	$0, 3128(%rsp)
	movl	$39996, %edx
	leaq	3(%rsp), %rsi
	movq	%rsi, %rbx
	movq	%rsi, %r12
	xorl	%esi, %esi
	andq	$-4, %rbx
	shrq	$2, %r12
	leaq	4(%rbx), %rdi
	call	memset@PLT
	movdqa	.LC1(%rip), %xmm3
	movq	%rbx, %rsi
	xorl	%ecx, %ecx
	movdqa	.LC0(%rip), %xmm4
	leaq	400(%rbx), %rdx
	.p2align 4,,10
	.p2align 3
.L22:
	movd	%ecx, %xmm5
	movq	%rsi, %rax
	movdqa	%xmm4, %xmm1
	pshufd	$0, %xmm5, %xmm2
	.p2align 4,,10
	.p2align 3
.L23:
	movdqa	%xmm1, %xmm0
	addq	$16, %rax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	cvtdq2ps	%xmm0, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L23
	addl	$100, %ecx
	addq	$400, %rsi
	leaq	400(%rax), %rdx
	cmpl	$10000, %ecx
	jne	.L22
	pxor	%xmm0, %xmm0
	movl	$2, %edi
	movl	$1, %eax
	leaq	.LC2(%rip), %rsi
	cvtss2sd	12(,%r12,4), %xmm0
	call	__printf_chk@PLT
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L29
	leaq	-16(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L29:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE32:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
