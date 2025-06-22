# Task 3

After the 3rd door, Biju is greeted by John von Neumann, the inventor of Merge Sort, among other things. John tells Biju that he has problems understanding Salam's lyrics, and asks him to write 2 functions to help him decipher them.

For this task you will have to separate a text into words according to some delimiters and, after that, sort these words using the qsort function. The sorting will be done first by word length and in case of equality it will be sorted lexicographically.

You will have to implement 2 functions with the signatures `void get_words(char *s, char **words, int number_of_words);` and `void sort(char **words, int number_of_words, int size);` from the file `task3.asm`. The get_words function receives as parameters the text, a vector of strings in which you will have to save the words that you will later sort and the number of words. The sort function will receive the vector of words, the number of words and the size of a word.

## Specifications:
- the text length is less than 1000;
- the word vector will have maximum 100 words of 100 characters each;
- the delimiters you need to take into account are: " ,.\n"
- you are not allowed to use any other sorting method besides qsort. In case you use another method, the score for this task will be lost.

## Example
```
number_of_words: 9
s: "Ana are 27 de mere, si 32 de pere."
after calling get_words: words = ["Ana", "are", "27", "de", "mere", "si", "32", "de", "pere"]
after calling sort: words = ["27", "32", "de", "de", "si", "Ana", "are", "mere", "pere"]
```

## Hint:
- for more information about qsort you can access the link: https://man7.org/linux/man-pages/man3/qsort.3.html

## Scoring
- The task has 25 points, of which one point is for coding-style and implementation details.
