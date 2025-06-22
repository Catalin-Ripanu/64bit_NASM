# Task 1 - Album Sorting

Entering through the first door, Biju is greeted by Allen Newell, one of the inventors of linked lists. He challenges Biju to sort the albums of one of his rivals, Bogdan from Ploiesti. His albums, being precious, are kept in nodes of a singly-linked list.

Biju must implement the function with signature `struct node* sort(int n, struct node* node);` from the file task1.asm, which "links" the nodes from the list in ascending order. The function receives the number of nodes and the address of the vector and returns the address of the first node from the resulting list.

The structure of a node is:
```c
struct node {
    int val;
    struct node* next;
};
```
and initially, the `next` field is set to `NULL`.

## Specifications:
- n >= 1
- the sequence contains distinct consecutive numbers starting with 1 (ex: 1 2 3 ...)
- the vector structure must NOT be modified (node swapping is forbidden)
- sorting must be done in-place
- using auxiliary structures is permitted, as long as the nodes of the resulting list are those from the initial vector
- using the `qsort` function from libc is NOT permitted

## Example
```
Initially:
| Address   | Value     | Next      |
| --------- | --------- | --------- |
| 0x32      | 2         | NULL      |
| 0x3A      | 1         | NULL      |
| 0x42      | 3         | NULL      |

The call to function `sort` returns `0x3A` (address of the node with value 1) and the vector will look like this:
| Address   | Value     | Next      |
| --------- | --------- | --------- |
| 0x32      | 2         | 0x42      |
| 0x3A      | 1         | 0x32      |
| 0x42      | 3         | NULL      |
```

## Hint:
- for implementing the sorting you can be inspired by [Selection Sort](https://www.geeksforgeeks.org/selection-sort/)

## Scoring
- The task has 25 points, of which one point is for coding-style and implementation details.
