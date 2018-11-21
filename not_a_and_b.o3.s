
build/not_a_and_b.o3:	file format Mach-O 64-bit x86-64

Disassembly of section __TEXT,__text:
__text:
; int main(int argc, const char* argv[]) {
100000e90:	55 	pushq	%rbp
100000e91:	48 89 e5 	movq	%rsp, %rbp
100000e94:	41 56 	pushq	%r14
100000e96:	53 	pushq	%rbx
100000e97:	48 89 f3 	movq	%rsi, %rbx
; if(argc != 3) {
100000e9a:	83 ff 03 	cmpl	$3, %edi
100000e9d:	75 59 	jne	89 <_main+0x68>
; bool a = strtol(argv[1], NULL, 10) != 0;
100000e9f:	48 8b 7b 08 	movq	8(%rbx), %rdi
100000ea3:	31 f6 	xorl	%esi, %esi
100000ea5:	ba 0a 00 00 00 	movl	$10, %edx
100000eaa:	e8 71 00 00 00 	callq	113
100000eaf:	49 89 c6 	movq	%rax, %r14
; bool b = strtol(argv[2], NULL, 10) != 0;
100000eb2:	48 8b 7b 10 	movq	16(%rbx), %rdi
100000eb6:	31 f6 	xorl	%esi, %esi
100000eb8:	ba 0a 00 00 00 	movl	$10, %edx
100000ebd:	e8 5e 00 00 00 	callq	94
100000ec2:	31 d2 	xorl	%edx, %edx
100000ec4:	48 85 c0 	testq	%rax, %rax
100000ec7:	0f 95 c2 	setne	%dl
; bool a = strtol(argv[1], NULL, 10) != 0;
100000eca:	31 f6 	xorl	%esi, %esi
100000ecc:	4d 85 f6 	testq	%r14, %r14
100000ecf:	40 0f 95 c6 	setne	%sil
; if (!a && b) {
100000ed3:	75 0e 	jne	14 <_main+0x53>
100000ed5:	48 85 c0 	testq	%rax, %rax
100000ed8:	74 09 	je	9 <_main+0x53>
; printf("!a && b == true (a: %d, b: %d)\n", a, b);
100000eda:	48 8d 3d 88 00 00 00 	leaq	136(%rip), %rdi
100000ee1:	eb 07 	jmp	7 <_main+0x5a>
; printf("!a && b == false (a: %d, b: %d)\n", a, b);
100000ee3:	48 8d 3d 9f 00 00 00 	leaq	159(%rip), %rdi
100000eea:	31 c0 	xorl	%eax, %eax
100000eec:	e8 29 00 00 00 	callq	41
; }
100000ef1:	31 c0 	xorl	%eax, %eax
100000ef3:	5b 	popq	%rbx
100000ef4:	41 5e 	popq	%r14
100000ef6:	5d 	popq	%rbp
100000ef7:	c3 	retq
; printf("Usage: %s <a> <b>\n", argv[0]);
100000ef8:	48 8b 33 	movq	(%rbx), %rsi
100000efb:	48 8d 3d 54 00 00 00 	leaq	84(%rip), %rdi
100000f02:	31 c0 	xorl	%eax, %eax
100000f04:	e8 11 00 00 00 	callq	17
; exit(1);
100000f09:	bf 01 00 00 00 	movl	$1, %edi
100000f0e:	e8 01 00 00 00 	callq	1

_main:
; int main(int argc, const char* argv[]) {
100000e90:	55 	pushq	%rbp
100000e91:	48 89 e5 	movq	%rsp, %rbp
100000e94:	41 56 	pushq	%r14
100000e96:	53 	pushq	%rbx
100000e97:	48 89 f3 	movq	%rsi, %rbx
; if(argc != 3) {
100000e9a:	83 ff 03 	cmpl	$3, %edi
100000e9d:	75 59 	jne	89 <_main+0x68>
; bool a = strtol(argv[1], NULL, 10) != 0;
100000e9f:	48 8b 7b 08 	movq	8(%rbx), %rdi
100000ea3:	31 f6 	xorl	%esi, %esi
100000ea5:	ba 0a 00 00 00 	movl	$10, %edx
100000eaa:	e8 71 00 00 00 	callq	113
100000eaf:	49 89 c6 	movq	%rax, %r14
; bool b = strtol(argv[2], NULL, 10) != 0;
100000eb2:	48 8b 7b 10 	movq	16(%rbx), %rdi
100000eb6:	31 f6 	xorl	%esi, %esi
100000eb8:	ba 0a 00 00 00 	movl	$10, %edx
100000ebd:	e8 5e 00 00 00 	callq	94
100000ec2:	31 d2 	xorl	%edx, %edx
100000ec4:	48 85 c0 	testq	%rax, %rax
100000ec7:	0f 95 c2 	setne	%dl
; bool a = strtol(argv[1], NULL, 10) != 0;
100000eca:	31 f6 	xorl	%esi, %esi
100000ecc:	4d 85 f6 	testq	%r14, %r14
100000ecf:	40 0f 95 c6 	setne	%sil
; if (!a && b) {
100000ed3:	75 0e 	jne	14 <_main+0x53>
100000ed5:	48 85 c0 	testq	%rax, %rax
100000ed8:	74 09 	je	9 <_main+0x53>
; printf("!a && b == true (a: %d, b: %d)\n", a, b);
100000eda:	48 8d 3d 88 00 00 00 	leaq	136(%rip), %rdi
100000ee1:	eb 07 	jmp	7 <_main+0x5a>
; printf("!a && b == false (a: %d, b: %d)\n", a, b);
100000ee3:	48 8d 3d 9f 00 00 00 	leaq	159(%rip), %rdi
100000eea:	31 c0 	xorl	%eax, %eax
100000eec:	e8 29 00 00 00 	callq	41
; }
100000ef1:	31 c0 	xorl	%eax, %eax
100000ef3:	5b 	popq	%rbx
100000ef4:	41 5e 	popq	%r14
100000ef6:	5d 	popq	%rbp
100000ef7:	c3 	retq
; printf("Usage: %s <a> <b>\n", argv[0]);
100000ef8:	48 8b 33 	movq	(%rbx), %rsi
100000efb:	48 8d 3d 54 00 00 00 	leaq	84(%rip), %rdi
100000f02:	31 c0 	xorl	%eax, %eax
100000f04:	e8 11 00 00 00 	callq	17
; exit(1);
100000f09:	bf 01 00 00 00 	movl	$1, %edi
100000f0e:	e8 01 00 00 00 	callq	1
Disassembly of section __TEXT,__stubs:
__stubs:
100000f14:	ff 25 f6 00 00 00 	jmpq	*246(%rip)
100000f1a:	ff 25 f8 00 00 00 	jmpq	*248(%rip)
100000f20:	ff 25 fa 00 00 00 	jmpq	*250(%rip)
Disassembly of section __TEXT,__stub_helper:
__stub_helper:
100000f28:	4c 8d 1d d9 00 00 00 	leaq	217(%rip), %r11
100000f2f:	41 53 	pushq	%r11
100000f31:	ff 25 c9 00 00 00 	jmpq	*201(%rip)
100000f37:	90 	nop
100000f38:	68 00 00 00 00 	pushq	$0
100000f3d:	e9 e6 ff ff ff 	jmp	-26 </var/folders/9t/hpqz7_5s27dc8_j_2hd7p_7h0000gn/T/not_a_and_b-4e606c.o+0xa40a7696>
100000f42:	68 0c 00 00 00 	pushq	$12
100000f47:	e9 dc ff ff ff 	jmp	-36 </var/folders/9t/hpqz7_5s27dc8_j_2hd7p_7h0000gn/T/not_a_and_b-4e606c.o+0xa40a7696>
100000f4c:	68 1a 00 00 00 	pushq	$26
100000f51:	e9 d2 ff ff ff 	jmp	-46 </var/folders/9t/hpqz7_5s27dc8_j_2hd7p_7h0000gn/T/not_a_and_b-4e606c.o+0xa40a7696>
