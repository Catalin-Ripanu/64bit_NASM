## Task 4 - Biju's Accounts

After the 4th door, Biju is greeted by Thoralf Skolem, who first defined recursive functions. He gives Biju Tzanca Uraganu's bank account, in a dubious form, and asks him to write several recursive functions to find out how much money Tzanca has in his account.

### Requirement:
You will have to implement 3 recursive functions (Biju likes mutual recursion) that will evaluate an expression received as a parameter:
- `expression(char *p, int *i)`
    - evaluates expressions of the type `term + term` or `term - term`
- `term(char *p, int *i)`
    - evaluates expressions of the type `factor * factor` or `factor / factor`
- `factor(char *p, int *i)`
    - evaluates expressions of the type `(expression)` or `number`, where number is a sequence of digits

### Specifications:
- `p` is the character string
- `i` is the current position in the character string (attention, this will need to be updated in functions)
- numbers will be positive integers, but as a result of operations negative numbers may appear
- divisions will be done on integers
- results fit in the `int` type
- received expressions will be correct
- in short, mutual recursion involves defining two functions in terms of each other. Illustrative in this sense is the following code sequence:
```C
function1()
{    
    // do something 
    function2();
    // do something
}
function2()
{
    // do something 
    function1();
    // do something
}
```
- for more details related to mutual recursion consult [this link](https://en.wikipedia.org/wiki/Mutual_recursion).
- **any solution that does not use mutual recursion will not be scored**

### Test Example:
| `test.in `     | `test.out` |
|----------------|------------|
|```15+8*2000``` | ```16015```|

### Hint:
- The functions you need to implement will call each other
- For signed divisions: [cdq](https://stackoverflow.com/questions/36464879/when-and-why-do-we-sign-extend-and-use-cdq-with-mul-div)

### Scoring:
- The task has 25 points, of which 2 points are for coding-style and implementation details.
