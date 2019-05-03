# Unusual Datatypes

We will be exploring memory management and pointer issues in class using some C code that you will find in this folder.

In the spaces below, describe the following.

## 1. Your PL's support for structures or records. Also, your PL's support for object-oriented concepts, a related idea which we will explore later on.
```arrays, multi-dimensional arrays, linked lists, graphs, and a few others, object orientation allows classes, inheritence, privacy, and methods```

## 2. Your PL's support for reference or pointer types.
```"we should never store pointers to Lua strings outside the C functoin tha tretrieved them.....Instead, when we need such pointers, we create a reference and store it in C" ~Ierusalimschy ```

## 3. Your PL's features related to global data and/or access routines.
```there exists a "global environment" which is a regular table.  *note* Passive reading through /Programming Lua/ shows that most of Lua operates around this basis of table structures```
 