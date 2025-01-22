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

    

  ]
  == B) Disassemble the following RV64I encoded instructions into assembly. Be sure to show your work.

  #part[
  0x0083b283
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

]
]
