# Acervus Programming Language

This document contains the specification for the Acervus bytecode programming
language.


## Context-Free Grammar

```text
program -> line*

line -> directive | label | expression | label " "+ expression

directive -> ".data" | ".code"

label -> [[:alnum:]]+ ":"

expression -> immediate | instruction (" "+ operand)*

immediate -> [[:digit:]]+ | "'" [[:ascii:]] "'" | "\"" [[:ascii:]]+ "\""

operand -> immediate | location

location -> ":" [[:alnum:]]+
```
