# Language Implementation

A Web application that [scans](https://en.wikipedia.org/wiki/Lexical_analysis), [parses](https://en.wikipedia.org/wiki/Parsing), [interprets](https://en.wikipedia.org/wiki/Interpreter_(computing)), and [compiles](https://en.wikipedia.org/wiki/Compiler) a small programming language (that is far from [Turing-complete](https://simple.wikipedia.org/wiki/Turing_complete)).

## BNF Grammar

```html <!-- The grammar is not really html, but this makes the angle brackets render correctly. -->
<program> ::= start <statement>* end
<statement> ::= <assignment_statement> | <output_statement>
<assignment_statement> ::= <identifier> = <expression>
<output_statement> ::= print ( <expression> )
<expression> ::= <identifier> | <number>
<identifier> ::= /[a-zA-Z]+[a-zA-Z0-9_]*/
<number> ::= /[0-9]+/
```

## Sample program

```
start
  a = 1
  b = a
  print(b) /* This prints 1 */
end
```
