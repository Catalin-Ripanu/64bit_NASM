# Bonus Task - Vectorial Instructions - SSE, AVX

Biju enters one of the rooms behind Steve. He finds an envelope on which it says "optimize".

## Theory Moment

Computing systems can be of 4 types, depending on how many instructions are executed at the same time and how many data are processed at the same time: SISD, SIMD, MISD, MIMD.

- SISD (single instruction, single data) is the type used by you so far: a single instruction is executed at the same time and work is done on a single data at the same time.
- MIMD (multiple instructions, multiple data): the subject of several courses in the following years (APD, SO, ASC, APP). In this type of architecture, multiple instructions can be executed simultaneously, which can operate on multiple data simultaneously, using threads (execution threads).
- SIMD (single instruction, multiple data): the same instruction is executed on multiple data simultaneously. This type is the subject of an important part of the ASC course.
- MISD (multiple instructions, single data): very rarely encountered type.

Modern processors are MIMD type, since they have multiple cores, which in turn can have one or more threads. However, these modern processors also have implemented SIMD type instructions, which are the purpose of this bonus task.

SIMD instructions, also called vectorial instructions, are [MMX](https://en.wikipedia.org/wiki/MMX_(instruction_set)), [SSE](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) and [AVX](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions). MMX is the first variant of SIMD type instruction set implemented on Intel processors, starting with Intel Pentium P5. SSE (Streaming SIMD Extensions) and AVX (Advanced Vector Extension) are improved variants of MMX instructions. All instruction sets are used for operations on vectors, hence the name vectorial instructions.

Let's suppose we want to add 2 vectors of 8 elements each, of int type. Until now, a for loop would have been used and elements would have been added one by one. SIMD instructions allow us to perform all 8 additions, simultaneously, using only one AVX2 instruction, called VPADDD, or 2 SSE2/AVX instructions. The main difference between the MMX, SSE and AVX instruction sets is the number of bits that can be processed at the same time, AVX512 being the most powerful instruction set, in this sense, being able to process 512 bits at the same time.

To be able to perform these operations on vectors, SIMD instructions use special registers: mm in the case of MMX, xmm in the case of SSE and AVX, ymm in the case of AVX2 and zmm in the case of AVX512.

## Requirement

You are asked to implement a function in 64-bit assembly, `vectorial_ops`, which will receive a scalar, **s**, 3 vectors, **A**, **B** and **C**, and the dimension of the vectors, **n**, and will perform the operation `D = s * A + B .* C`, where `.*` is the element-wise multiplication of 2 vectors (`[1, 2, 3] .* [4, 5, 6] = [1 * 4, 2 * 5, 3 * 6] = [4, 10, 18]`).

The function has the following header:

`void vectorial_ops(int s, int A[], int B[], int C[], int n, int D[])`

## Observations

- You can use any SIMD instruction set to accomplish this task, depending on what you have available on your local machine. To find out what capabilities your processor has, use the command `cat /proc/cpuinfo`.

- It is guaranteed that **n** is a multiple of 16.

- It is guaranteed that the result of any multiplication fits in an int (32 bits).

- If you use AVX to solve the homework, you will receive 0 points on VMchecker, because the machine running the checker does not have AVX support.
Mention in comments or in README that you used AVX, so we know manual verification is needed.

## Scoring

This task is worth 15 points, of which 3 are awarded for coding-style and implementation description.

## Useful Resources

https://docs.oracle.com/cd/E36784_01/html/E36859/gntae.html

https://www.felixcloutier.com/x86/

https://www.intel.com/content/www/us/en/support/articles/000005779/processors.html
