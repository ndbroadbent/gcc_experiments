
build/not_a_and_b.c99.o0:	file format Mach-O 64-bit x86-64

Disassembly of section __TEXT,__text:
__text:
; int main(int argc, const char* argv[]) {
100000e20:	55 	pushq	%rbp
100000e21:	48 89 e5 	movq	%rsp, %rbp
100000e24:	48 83 ec 20 	subq	$32, %rsp
100000e28:	c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
100000e2f:	89 7d f8 	movl	%edi, -8(%rbp)
100000e32:	48 89 75 f0 	movq	%rsi, -16(%rbp)
; if(argc != 3) {
100000e36:	83 7d f8 03 	cmpl	$3, -8(%rbp)
100000e3a:	0f 84 26 00 00 00 	je	38 <_main+0x46>
; printf("Usage: %s <a> <b>\n", argv[0]);
100000e40:	48 8b 45 f0 	movq	-16(%rbp), %rax
100000e44:	48 8b 30 	movq	(%rax), %rsi
100000e47:	48 8d 3d 08 01 00 00 	leaq	264(%rip), %rdi
100000e4e:	31 c9 	xorl	%ecx, %ecx
100000e50:	88 ca 	movb	%cl, %dl
100000e52:	88 d0 	movb	%dl, %al
100000e54:	e8 c3 00 00 00 	callq	195
; exit(1);
100000e59:	bf 01 00 00 00 	movl	$1, %edi
100000e5e:	89 45 e8 	movl	%eax, -24(%rbp)
100000e61:	e8 b0 00 00 00 	callq	176
100000e66:	31 c0 	xorl	%eax, %eax
100000e68:	89 c6 	movl	%eax, %esi
100000e6a:	ba 0a 00 00 00 	movl	$10, %edx
; bool a = strtol(argv[1], NULL, 10) != 0;
100000e6f:	48 8b 4d f0 	movq	-16(%rbp), %rcx
100000e73:	48 8b 79 08 	movq	8(%rcx), %rdi
100000e77:	e8 a6 00 00 00 	callq	166
100000e7c:	31 d2 	xorl	%edx, %edx
100000e7e:	89 d6 	movl	%edx, %esi
100000e80:	ba 0a 00 00 00 	movl	$10, %edx
100000e85:	48 83 f8 00 	cmpq	$0, %rax
100000e89:	41 0f 95 c0 	setne	%r8b
100000e8d:	41 80 e0 01 	andb	$1, %r8b
100000e91:	44 88 45 ef 	movb	%r8b, -17(%rbp)
; bool b = strtol(argv[2], NULL, 10) != 0;
100000e95:	48 8b 45 f0 	movq	-16(%rbp), %rax
100000e99:	48 8b 78 10 	movq	16(%rax), %rdi
100000e9d:	e8 80 00 00 00 	callq	128
100000ea2:	48 83 f8 00 	cmpq	$0, %rax
100000ea6:	41 0f 95 c0 	setne	%r8b
100000eaa:	41 80 e0 01 	andb	$1, %r8b
100000eae:	44 88 45 ee 	movb	%r8b, -18(%rbp)
; if (!a && b) {
100000eb2:	f6 45 ef 01 	testb	$1, -17(%rbp)
100000eb6:	0f 85 30 00 00 00 	jne	48 <_main+0xcc>
100000ebc:	f6 45 ee 01 	testb	$1, -18(%rbp)
100000ec0:	0f 84 26 00 00 00 	je	38 <_main+0xcc>
100000ec6:	48 8d 3d 9c 00 00 00 	leaq	156(%rip), %rdi
; printf("!a && b == true (a: %d, b: %d)\n", a, b);
100000ecd:	8a 45 ef 	movb	-17(%rbp), %al
100000ed0:	24 01 	andb	$1, %al
100000ed2:	0f b6 f0 	movzbl	%al, %esi
100000ed5:	8a 45 ee 	movb	-18(%rbp), %al
100000ed8:	24 01 	andb	$1, %al
100000eda:	0f b6 d0 	movzbl	%al, %edx
100000edd:	b0 00 	movb	$0, %al
100000edf:	e8 38 00 00 00 	callq	56
; } else {
100000ee4:	89 45 e4 	movl	%eax, -28(%rbp)
100000ee7:	e9 21 00 00 00 	jmp	33 <_main+0xed>
100000eec:	48 8d 3d 96 00 00 00 	leaq	150(%rip), %rdi
; printf("!a && b == false (a: %d, b: %d)\n", a, b);
100000ef3:	8a 45 ef 	movb	-17(%rbp), %al
100000ef6:	24 01 	andb	$1, %al
100000ef8:	0f b6 f0 	movzbl	%al, %esi
100000efb:	8a 45 ee 	movb	-18(%rbp), %al
100000efe:	24 01 	andb	$1, %al
100000f00:	0f b6 d0 	movzbl	%al, %edx
100000f03:	b0 00 	movb	$0, %al
100000f05:	e8 12 00 00 00 	callq	18
100000f0a:	89 45 e0 	movl	%eax, -32(%rbp)
; }
100000f0d:	8b 45 fc 	movl	-4(%rbp), %eax
100000f10:	48 83 c4 20 	addq	$32, %rsp
100000f14:	5d 	popq	%rbp
100000f15:	c3 	retq

_main:
; int main(int argc, const char* argv[]) {
100000e20:	55 	pushq	%rbp
100000e21:	48 89 e5 	movq	%rsp, %rbp
100000e24:	48 83 ec 20 	subq	$32, %rsp
100000e28:	c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
100000e2f:	89 7d f8 	movl	%edi, -8(%rbp)
100000e32:	48 89 75 f0 	movq	%rsi, -16(%rbp)
; if(argc != 3) {
100000e36:	83 7d f8 03 	cmpl	$3, -8(%rbp)
100000e3a:	0f 84 26 00 00 00 	je	38 <_main+0x46>
; printf("Usage: %s <a> <b>\n", argv[0]);
100000e40:	48 8b 45 f0 	movq	-16(%rbp), %rax
100000e44:	48 8b 30 	movq	(%rax), %rsi
100000e47:	48 8d 3d 08 01 00 00 	leaq	264(%rip), %rdi
100000e4e:	31 c9 	xorl	%ecx, %ecx
100000e50:	88 ca 	movb	%cl, %dl
100000e52:	88 d0 	movb	%dl, %al
100000e54:	e8 c3 00 00 00 	callq	195
; exit(1);
100000e59:	bf 01 00 00 00 	movl	$1, %edi
100000e5e:	89 45 e8 	movl	%eax, -24(%rbp)
100000e61:	e8 b0 00 00 00 	callq	176
100000e66:	31 c0 	xorl	%eax, %eax
100000e68:	89 c6 	movl	%eax, %esi
100000e6a:	ba 0a 00 00 00 	movl	$10, %edx
; bool a = strtol(argv[1], NULL, 10) != 0;
100000e6f:	48 8b 4d f0 	movq	-16(%rbp), %rcx
100000e73:	48 8b 79 08 	movq	8(%rcx), %rdi
100000e77:	e8 a6 00 00 00 	callq	166
100000e7c:	31 d2 	xorl	%edx, %edx
100000e7e:	89 d6 	movl	%edx, %esi
100000e80:	ba 0a 00 00 00 	movl	$10, %edx
100000e85:	48 83 f8 00 	cmpq	$0, %rax
100000e89:	41 0f 95 c0 	setne	%r8b
100000e8d:	41 80 e0 01 	andb	$1, %r8b
100000e91:	44 88 45 ef 	movb	%r8b, -17(%rbp)
; bool b = strtol(argv[2], NULL, 10) != 0;
100000e95:	48 8b 45 f0 	movq	-16(%rbp), %rax
100000e99:	48 8b 78 10 	movq	16(%rax), %rdi
100000e9d:	e8 80 00 00 00 	callq	128
100000ea2:	48 83 f8 00 	cmpq	$0, %rax
100000ea6:	41 0f 95 c0 	setne	%r8b
100000eaa:	41 80 e0 01 	andb	$1, %r8b
100000eae:	44 88 45 ee 	movb	%r8b, -18(%rbp)
; if (!a && b) {
100000eb2:	f6 45 ef 01 	testb	$1, -17(%rbp)
100000eb6:	0f 85 30 00 00 00 	jne	48 <_main+0xcc>
100000ebc:	f6 45 ee 01 	testb	$1, -18(%rbp)
100000ec0:	0f 84 26 00 00 00 	je	38 <_main+0xcc>
100000ec6:	48 8d 3d 9c 00 00 00 	leaq	156(%rip), %rdi
; printf("!a && b == true (a: %d, b: %d)\n", a, b);
100000ecd:	8a 45 ef 	movb	-17(%rbp), %al
100000ed0:	24 01 	andb	$1, %al
100000ed2:	0f b6 f0 	movzbl	%al, %esi
100000ed5:	8a 45 ee 	movb	-18(%rbp), %al
100000ed8:	24 01 	andb	$1, %al
100000eda:	0f b6 d0 	movzbl	%al, %edx
100000edd:	b0 00 	movb	$0, %al
100000edf:	e8 38 00 00 00 	callq	56
; } else {
100000ee4:	89 45 e4 	movl	%eax, -28(%rbp)
100000ee7:	e9 21 00 00 00 	jmp	33 <_main+0xed>
100000eec:	48 8d 3d 96 00 00 00 	leaq	150(%rip), %rdi
; printf("!a && b == false (a: %d, b: %d)\n", a, b);
100000ef3:	8a 45 ef 	movb	-17(%rbp), %al
100000ef6:	24 01 	andb	$1, %al
100000ef8:	0f b6 f0 	movzbl	%al, %esi
100000efb:	8a 45 ee 	movb	-18(%rbp), %al
100000efe:	24 01 	andb	$1, %al
100000f00:	0f b6 d0 	movzbl	%al, %edx
100000f03:	b0 00 	movb	$0, %al
100000f05:	e8 12 00 00 00 	callq	18
100000f0a:	89 45 e0 	movl	%eax, -32(%rbp)
; }
100000f0d:	8b 45 fc 	movl	-4(%rbp), %eax
100000f10:	48 83 c4 20 	addq	$32, %rsp
100000f14:	5d 	popq	%rbp
100000f15:	c3 	retq
Disassembly of section __TEXT,__stubs:
__stubs:
100000f16:	ff 25 f4 00 00 00 	jmpq	*244(%rip)
100000f1c:	ff 25 f6 00 00 00 	jmpq	*246(%rip)
100000f22:	ff 25 f8 00 00 00 	jmpq	*248(%rip)
Disassembly of section __TEXT,__stub_helper:
__stub_helper:
100000f28:	4c 8d 1d d9 00 00 00 	leaq	217(%rip), %r11
100000f2f:	41 53 	pushq	%r11
100000f31:	ff 25 c9 00 00 00 	jmpq	*201(%rip)
100000f37:	90 	nop
100000f38:	68 00 00 00 00 	pushq	$0
100000f3d:	e9 e6 ff ff ff 	jmp	-26 </var/folders/9t/hpqz7_5s27dc8_j_2hd7p_7h0000gn/T/not_a_and_b-52c61d.o+0xa40a7696>
100000f42:	68 0c 00 00 00 	pushq	$12
100000f47:	e9 dc ff ff ff 	jmp	-36 </var/folders/9t/hpqz7_5s27dc8_j_2hd7p_7h0000gn/T/not_a_and_b-52c61d.o+0xa40a7696>
100000f4c:	68 1a 00 00 00 	pushq	$26
100000f51:	e9 d2 ff ff ff 	jmp	-46 </var/folders/9t/hpqz7_5s27dc8_j_2hd7p_7h0000gn/T/not_a_and_b-52c61d.o+0xa40a7696>
