In this folder, modify a copy of your greetings program to work with some numeric data. Use appropriate variables to store and display the name and age values that the user inputs. It should behave as follows.

```
Enter your name: Dave
Enter your age: 20
Hello, Dave! How do you like being 20 years old?
```

Answer the following questions, then commit your work and create a PR.

**1.  Does your toolset/PL allow implicit declarations? If so, can you turn that off?**
```Yes, global variables do not need declarations.  Kind of, creating a meta-table to pass an error whenever calling a new global will effectively turn them off.```


**2. Does your PL allow you to define a variable as you declare it? Can you do this close to the variable's first use, or must it be at the top? Give an example that illustrates your answers.**
```It can be used as it is declared. local x = 2+7```


**3. Does your toolset allow you to filter warning messages? If so, show how to turn on all warnings.**
```I can not find any warning messages filters or toggles```


**4. What levels of scope does your PL have? See the top of p. 245 for examples from a few PLs.**
```global and local (in scope for current and everything under it)```


**5. What features does your PL have for allocating memory dynamically? How is this memory returned to the system?**
```Lua automatically sets memory unless explicitly told to do it another way.  Garbage collection frees up space as variables lose scope and stop holding data.```


