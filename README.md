# GCC Experiments

https://twitter.com/chordbug/status/1064932667089670144

> resisting my code golf instinct to turn if(!bool1 && bool2) into if(bool1<bool2)


### Brute-force proof that `!a && b` == `a < b`

```c
a = 0
b = 1

if(!a && b)
if(!0 && 1)  // => true

if(a < b)
if(0 < 1)  // => true


a = 1
b = 0

if(!a && b)
if(!1 && 0)  // => false

if(a < b)
if(1 < 0)  // => false


a = 0
b = 0

if(!a && b)
if(!0 && 0)  // => false

if(a < b)
if(0 < 0)  // => false


a = 1
b = 1

if(!a && b)
if(!1 && 1)  // => false

if(a < b)
if(1 < 1)  // => false
```

## Compiler Optimizations

I wanted to see if GCC would perform this optimization.


### Compile the test program

```bash
gcc -g not_a_and_b.c -o ./bin/not_a_and_b

# Or:

./scripts/build
```

### Run the test program

```bash
./bin/not_a_and_b
# Usage: ./not_a_and_b <a> <b>

./bin/not_a_and_b 0 1
# !a && b == true (a: 0, b: 1)

./bin/not_a_and_b 1 0
# !a && b == false (a: 1, b: 0)
```


### Inspect assembly with objdump

Compile with no optimizations:

```bash
LEVEL=0
gcc -O$LEVEL -g not_a_and_b.c -o build/not_a_and_b.o$LEVEL
objdump -d -S build/not_a_and_b.o$LEVEL > not_a_and_b.o$LEVEL.s
```

Open `not_a_and_b.o0.s` in VS Code

> Install the [x86 and x86_64 Assembly extension](https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly) for syntax highlighting.

```s
100000ebe:	44 88 45 ee 	movb	%r8b, -18(%rbp)
; if (!a && b) {
100000ec2:	f6 45 ef 01 	testb	$1, -17(%rbp)
100000ec6:	0f 85 30 00 00 00 	jne	48 <_main+0xcc>
100000ecc:	f6 45 ee 01 	testb	$1, -18(%rbp)
100000ed0:	0f 84 26 00 00 00 	je	38 <_main+0xcc>
100000ed6:	48 8d 3d 9c 00 00 00 	leaq	156(%rip), %rdi
; printf("!a && b == true (a: %d b: %d)\n", a, b);
100000edd:	8a 45 ef 	movb	-17(%rbp), %al
```

You can see that it has two tests and jump instructions (`jne` and `je`), so it's not optimizing this to `a < b`.

---

Run `./scripts/build_and_disassemble` to compile with `-O1`, `-O2`, and `-O3`.


### `-O1`

`not_a_and_b.o1.s`:

```s
100000edc:	4d 85 f6 	testq	%r14, %r14
100000edf:	40 0f 95 c6 	setne	%sil
; if (!a && b) {
100000ee3:	75 0e 	jne	14 <_main+0x53>
100000ee5:	48 85 c0 	testq	%rax, %rax
100000ee8:	74 09 	je	9 <_main+0x53>
; printf("!a && b == true (a: %d b: %d)\n", a, b);
100000eea:	48 8d 3d 88 00 00 00 	leaq	136(%rip), %rdi
```

Still a `jne` and `je` before it calls the `printf` for the first branch.

### `-O2`

`not_a_and_b.o2.s`:

```s
100000edc:	4d 85 f6 	testq	%r14, %r14
100000edf:	40 0f 95 c6 	setne	%sil
; if (!a && b) {
100000ee3:	75 0e 	jne	14 <_main+0x53>
100000ee5:	48 85 c0 	testq	%rax, %rax
100000ee8:	74 09 	je	9 <_main+0x53>
; printf("!a && b == true (a: %d b: %d)\n", a, b);
100000eea:	48 8d 3d 88 00 00 00 	leaq	136(%rip), %rdi
```

Same thing.


### `-O3`

`not_a_and_b.o3.s`:

```s
100000edc:	4d 85 f6 	testq	%r14, %r14
100000edf:	40 0f 95 c6 	setne	%sil
; if (!a && b) {
100000ee3:	75 0e 	jne	14 <_main+0x53>
100000ee5:	48 85 c0 	testq	%rax, %rax
100000ee8:	74 09 	je	9 <_main+0x53>
; printf("!a && b == true (a: %d b: %d)\n", a, b);
100000eea:	48 8d 3d 88 00 00 00 	leaq	136(%rip), %rdi
```

Still the same.



## Conclusion

It doesn't look like GCC optimizes `!a && b` into `a < b`.

> Disclaimer: I don't have much experience with this, so I might be completely wrong and missing something obvious.

## Explanation

https://twitter.com/chordbug/status/1065295501535469569

> I think it doesn't really work in C, becuse booleans don't really exist! a&&b really means “if a≠0 and b≠0, then 1, else 0”. so you get counterexamples like: (2<3) evaluates to 1 but (!2&&3) evaluates to 0

C doesn't have booleans, only integers. `#include <stdbool.h>` doesn't magically add a new boolean type, it just adds some macros for `true => 1` and `false => 0`. But the underlying type is still an integer, so GCC can't make this optimization based on boolean logic, because it doesn't know the values are only going to be `0` and `1`.

---

# Extra Credit

https://twitter.com/cr1901/status/1064933749404721152

> Someone should run that in z3 right now and prove they are equivalent lol

* https://github.com/Z3Prover/z3


https://twitter.com/rand_yosh314/status/1064941948698537985

> Or you could do that in a Tweet:

Let `f` be `f(A,B) = !A & B`, and let `g` be `g(A, B) = A < B`. Then,

```
f(T,T) = T! & T = F = T < T = g(T,T)
f(T,F) = T! & F = F = T < F = g(T,F)
f(F,T) = F! & F = T = F < T = g(F,T)
f(F,F) = F! & F = F = F < F = g(F,T)
```

Hence, `!A & B <=> A < B`.

