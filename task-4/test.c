#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define MAX_LINE 100001
 int ParseSummands(char* expr,int* i);
	// Parse a number or an expression in parenthesis
	int ParseAtom(char* expr,int* i) {

		// Check if there is parenthesis
		if(*(expr+*i) == '(') {
			(*i)++;
			int res = ParseSummands(expr,i);
			(*i)++;
			return res;
		}
		// It should be a number; convert it to double
		char* end_ptr;
		int res = (int )strtod(expr+*i, &end_ptr);
		// Advance the pointer and return the result
		(*i)+=end_ptr-(expr+*i);
		// Advance the pointer and return the result
		return res;
	}

	// Parse multiplication and division
	int ParseFactors(char* expr,int* i) {
		int num1 = ParseAtom(expr,i);
		for(;;) {
			// Save the operation and position
			char op = *(expr+*i);
		//	int* pos = i;
			if(op != '/' && op != '*')
				return num1;
			(*i)++;
			int num2 = ParseAtom(expr,i);
			// Perform the saved operation
			if(op == '/') {
				// Handle division by zero
				num1 /= num2;
			}
			else
				num1 *= num2;
		}
	}

	// Parse addition and subtraction
	int ParseSummands(char* expr,int* i) {
		int num1 = ParseFactors(expr,i);
		for(;;) {
			char op = *(expr+*i);
			if(op != '-' && op != '+')
				return num1;
			(*i)++;
			int num2 = ParseFactors(expr,i);
			if(op == '-')
				num1 -= num2;
			else
				num1 += num2;
		}
	}
int main() {
		char expr[MAX_LINE];
         char* p;
         int i=0;
         scanf("%s",expr);
         p=expr;
		int res = ParseSummands(p,&i);
		printf("%d \n",res);
}