# Bonus Task - Assembly 32bit AT&T

Biju enters one of the rooms behind Steve. He finds an envelope on which it says "accept the different".

The task is implementing a function that adds 2 vectors of size `n`, then subtracts from the resulting vector 3 numbers, defined through `#define` (`*_VALUE`), in `positions.h`, from the positions indicated also in `positions.h` (`*_POSITION`), in 32-bit assembly, using AT&T syntax. The positions must be scaled with the vector size, as they are defined for a vector of size 10.

AT&T syntax is the 2nd syntax in which assembly code can be written for the x86 architecture. This syntax is the only one understood by the GNU assembler, GAS and is the only one used in the Linux kernel. As a convention, files that use AT&T syntax have the `.S` extension, while files with Intel syntax use the `.asm` extension. Also, files with AT&T syntax can use GCC preprocessing directives, such as `#define` and `#include`.

The differences between AT&T and Intel are important, especially in how addressing is used and the order of assembly instruction arguments. For details, consult the document from the `Useful Resources` section of this document.

## Example
- n : 5
- v1: 1 2 3 4 5
- v2: 10 9 8 7 6

### Result after addition:
11 11 11 11 11

### Numbers from `positions.h`:
- value: 10, position: 2, scaled position for n = 5: 1
- value: 127, position: 4, scaled position for n = 5: 2
- value: 21, position: 7, scaled position for n = 5: 3

### Final vector:
11 1 -116 -10 11

## Useful Resources
- https://imada.sdu.dk/~kslarsen/dm546/Material/IntelnATT.htm

## Scoring
This task is worth 10 points, of which one point is for implementation description and coding style.

## Hint
We recommend using the `macro` functionality of the assembly language for code pieces that repeat.
