# Chapter 17 Unusual Control Structures

## Recursion and stack overflow

Use your PL to rewrite the recursive Java factorial code from page 397, reproduced below.

```java
int Factorial(int number) {
    if (number == 1) {
        return 1;
    } else {
        return number * Factorial(number - 1);
    }
}
```

Just before the last `return` statement, add a statement that prints or displays the value of the `number` variable. Run the code to compute the factorial of various numbers. How high can you go before overflowing the call stack?

Also in class, we will observe the effects of some of the concepts covered here by experimenting with `recursion.c`.

## Exception Handling

Using the exception or error handling features of your PL, try to modify the factorial code so that the stack overflow condition is handled gracefully. 

Also in class, we will look at `exception.js` for an example of surprising control paths that result from thrown exceptions.
