---
tags:
- coding
- rust
- memory
---
# Memory Regions

## Stack

Scratch space for function calls. Memory in the stack is automatically allocated and disallocated if one function is enteres or exited.

## Heap

Values in head are not bound to the call stack of the program. They live until the memory is *freed*.

Main interaction with the Heap is to use the `Box` type. `Box` is a smart pointer that represents ownership of an object in the heap.

``` rust
let x = Box:new(5)
```

## Static Memory

Regions automatically loaded into the programs's memory when a program is executed.

Static memory hold the memory for variables you decalre with the `static` keyword as well as certain constnant values from the code.
