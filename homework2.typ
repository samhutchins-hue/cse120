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


  ]

  #part[
    number of cycles an instruction should take
  ]

  #part[
    clock frequency of the processor
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
