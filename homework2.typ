#import "templates/assign.typ": *

#show: project.with(
  title: "cse120 - hw2",
  authors: (
  "Sam Hutchins",
  ),
)

#question("Question 1 (8 points)")[
== A) Ideally, an ISA will cleanly separate the architecture (what) from the implementation (how). For each of the aspects below, argue whether it should be part of the architecture (exposed in the ISA) or hidden in the implementation.
  #part[
    number of integer general purpose registers

    This should be part of the architecture as it allows the programmer to create efficient solutions to problems. The programmer and compiler need to know exactly how many registers are provided to write assembly code and perform register allocations. If this information is hidden, it will not be possible for compilers to optimize the code as efficiently as possible.
  ]

  #part[
    number of cycles an instruction should take

    This should be hidden in implementation as it is entirely dependent on the hardware. The hardware could improve, changing the number of cycles an instruction should take. If this were locked to an ISA, constant updates would be required to be made to stay up-to-date with hardware which makes no sense. This also has no link to what an instruction should do.

  ]

  #part[
    clock frequency of the processor

    The clock frequency of the processor is another hidden implementation that has no correlation with ISA. This will change overtime with better hardware, leading to a constant change. ISA does not handle performance characteristics, but functional behavior. A change in clock frequency does not alter the behavior of an instruction, and an ISA can perform the same instructions at different clock rates, meaning that clock frequency is purely an implementation detail.
  ]

  #part[
    bandwidth (in bits) of the bus between memory and processor

    Bandwidth of the bus between memory and processor is a detail that should remain in implementation and has no functional implementation in the ISA.
  ]
  == B) Disassemble the following RV64I encoded instructions into assembly. Be sure to show your work.

  #part[
  0x0083b283

    00000000100000111011001010000011

    opcode: 0000011: I-type

    | imm[11:0] | rs1 | funct3 | rd | opcode |

    opcode 7 bits: 0000011
    rd 5 bits: 00101
    funct3 3 bits: 011
    rs1 5 bits: 00111
    imm[11:0] 12 bits:000000001000

    ld x5 x7 8

  ]

  #part[
  0x0062c2b3

  000000000110 00101 100 00101 0110011


| funct7|	rs2|	rs1|	funct3|	rd|	opcode|

  opcode 7 bits: 0110011

  rd 5 bits: 00101 

  funct3 3 bits: 100 

  rs1 5 bits: 00101 

  rs2: 00110 

  funct7: 0000000

  x5 = t0,
  x6 = t1

  xor t0 t0 t1

  ]

  == C) Assemble the following assembly into encoded RV64I instructions. Be sure to show your work

  #part[
    addi x10, x10, 8

    addi -> I-type

    | imm[11:0] | rs1 | funct3 | rd | opcode |

    imm[11:0] = 000000001000

    rs1 = 01010

    funct3 = 000

    rd = 01010

    opcode = 0010011

    0000 0000 1000 0101 0000 0101 0001 0011

    0x00850513

  ]

  #part[
    sd x11, 16(x10)

    opcode = 0100011
    funct3 = 011

    S-type

    |imm[11:5]| rs2| rs1| funct3| imm[4:0]| opcode| 

    imm[11:5] = 0010000

    rs2 = 01010

    rs1 = 01011

    funct3 = 011

    imm[4:0] = 10000

    opcode = 0100011

    0010 0000 1010 0101 1011 1000 0010 0011

    0x20a5b823


  ]
]

#question("Question 2 (10 points)")[
A) Translate the following C snippets into RV64I assembly. You may assume all
variables are already in registers (except for the contents of array a). Each solution
should take 4 lines or less. Comment each line of your assembly.
#part[
i) y = a - b + c;
]
#part[
total += a[i];
  ]
]
== B) Comment the following assembly, and then translate it into 1 line of C.

#part[
  
  ld x5, 0(x10)  -> load into x5 the value in memory at address (x10 + 0)

  addi x5, x5, 1 -> increment the value in x5 by 1

  sd x5, 0(x10)  -> store x5 back into memory at address (x10 + 0)

  a = b[0];

  a++;

  b[0] = a;

]

== C) Translate the following C snippets into RV64I assembly. Comment each line.

#part[

if (x == 4)

x = 0;

------------------------------------

```
  li t0, 4

  beq t1, t0, if_condition
j done

if_condition:
  li t1, 4

done:

```
]

#part[
  
  if (y >= 2)

  y = 5;

------------------------------------

```
    li t0, 2

    bge t1, t0, if_condition

    j done

  if_condition:
    li t1, 5

  done:

```

]

== D) Comment the following assembly, and then translate it into simplified C (without using goto).

#part[

slt x10, x5, x6    -> if x5 is less than x6, store 1 in x10, else, store 0 in x10

beq x10, x0, L1    -> if x10 is equal to x0, branch to label L1

xor x7, x0, x5     -> exclusive or x5 with x0, x0 is always 0, so it copies x5 into x7

j L2               -> jump to label L2

L1: or x7, x6, x0  -> label L1, store into x7 the result of x6 logical or x0, x0 is always 0, so it copies x6 into x7

L2:                -> label L2

------------------------------------

```c
if (a < b) {
  c = a;
} else {
  c = b;
}

```
]

#question("Question 3 (10 points)")[
== A) Comment the following assembly, and then translate it into simplified C (without using goto).

  #part[

    bge r0, a0, L2  -> if (0 >= a0), branch to label L2

L1: andi t0, a0, 1  -> t0 = (a0 & 1)

  add a1, a1, t0    -> a1 = a1 + t0

  srai a0, a0, 1    -> arithmetic shift right a0 by 1 (divide by 2)

  blt r0, a0, L1    -> if (0 < a0), branch back to label L1

L2:

------------------------------------

  ```c
  while (a > 0) {
    b = (a & 1);
    c = c + b;
    a = a >> 1;
  }
  ```
  ]

]

== B) Translate the following C into RV64I assembly. Be sure to follow the calling convention and comment each line of your assembly.

```c
long array_total(long* a, long n) {
  long total = 0;
  for (long i=0; i<n; i++) {
    total += a[i];
  }
  return total;
}
```
------------------------------------

```
array_total:
  li t0, 0              // total = 0
  li t1, 0              // i = 0

loop_start:
  bge t1, a1, loop_end // if i >= n, exit loop

  slli t2, t1, 3      // t2 = i * 8
  add t2, a0, t2      // t2 = address of a[i]
  ld t3, 0(t2)        // load a[i] into t3

  add t0, t0, t3      // total += a[i]
  addi t1, t1, 1      // i++

  j loop_start        // jump to start of loop

loop_end:
mv a0, t0             // return total
ret a0

```
#question("Question 4 (12 points)")[

  In this problem, you will be writing assembly for the following C code:

  ```c
long foo(long x, long y) {
  if (x == y)
    return x;
  long result;
  if (x > y)
    result = foo(x - y, y);
  else
    result = foo(x, y - x);
  return result;
}

  ```

When possible, strive to reduce the instruction count while maintaining the original
program intent (recursive function). Be sure to comment each line of your assembly
and to respect the calling convention.
  #part[

  ```
  foo:
    beq a0, a1, return_x  // if x == y, return x
    li t0, 0
    bgt a0, a0, x_greater // if x > y, branch to x_greater label
                          // otherwise, continue with execution which will encounter y_greater label
                          // ensures one less jump for optimzation
  y_greater:              // label for if y > x
    sub a1, a1, a0        // y = y - x
    call foo              // foo(x, y-x)
    j end_foo             // jump to ret

  x_greater:              // label if x > y
    sub a0, a0, a1        // x = x - y
    call foo              // foo(x-y, y)
                          // no jump to a return label as next instruction is a ret.
                          // this is for optimization
  end_foo:                // for when returning foo
    ret

  return_x:               // for when returning x
    ret
  ```

  ]

]
