# Bonus Task - Assembly 64bit

Biju enters one of the rooms behind Steve. He finds an envelope on which it says "accept the present".

The task is implementing a function that intertwines 2 vectors `void intertwine(int *v1, int n1, int *v2, int n2, int *v);`, in 64-bit assembly.

By intertwining we mean creating a new vector, which contains, alternately, the elements of the 2 vectors.

## Example
- v1 = 1 1 1 1
- v2 = 2 2
- intertwining: 1 2 1 2 1 1

## Attention
If one vector is longer than the other, its elements will be placed at the end of the resulting vector.

## Scoring
This task is worth 10 points, of which one point is for implementation description and coding style.
