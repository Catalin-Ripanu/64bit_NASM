## Task 2 - Turing's Nightmare

After the 2nd door, Biju is greeted by Alan Turing. He puts in front of him a [Stack Machine](https://en.wikipedia.org/wiki/Stack_machine), that is, a machine that only knows how to use the stack, through push and pop type instructions, to work with memory. Biju's challenge is to implement 2 functions on this machine:

### CMMMC (LCM)
The first function is `int cmmmc(int a, int b)`, which calculates the least common multiple of 2 numbers, given as parameters. It is guaranteed that the result of multiplying a and b fits in 4 bytes.

### Parentheses
The second function is `int par(int str_length, char *str)`, which verifies if a sequence of parentheses is correct. This receives a string that contains only round parentheses and the length of the string, and returns 1, if the sequence is correct, or 0, if the sequence is wrong.

#### Example
For the sequence `((()())(()))`, the result will be 1
For the sequence `(())((`, the result will be 0

## Scoring
- The task has 25 points, of which 2 points are for coding-style and implementation details.
