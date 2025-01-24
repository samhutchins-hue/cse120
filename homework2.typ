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

    0000 0000 1000 0011 1011 0010 1000 0011

    opcode: 0000011



  ]

  #part[
  0x0062c2b3
  ]

  == C) Assemble the following assembly into encoded RV64I instructions. Be sure to show your work

  #part[
    addi x10, x10, 8
  ]

  #part[
    sd x11, 16(x10)
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
  
  ld x5, 0(x10)

  addi x5, x5, 1

  sd x5, 0(x10)

]

C) Translate the following C snippets into RV64I assembly. Comment each line.

#part[

if (x == 4)

x = 0;
]

#part[

  if (y >= 2)

y = 5;
]

D) Comment the following assembly, and then translate it into simplified C (without using goto).

#part[

slt x10, x5, x6

beq x10, x0, L1

xor x7, x0, x5

j L2

L1: or x7, x6, x0

L2:
]

#question("Question 3 (10 points)")[
== A) Comment the following assembly, and then translate it into simplified C (without using goto).

  #part[

    bge r0, a0, L2

L1: andi t0, a0, 1

  add a1, a1, t0

  srai a0, a0, 1

  blt r0, a0, L1

L2:
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

  ]

]
