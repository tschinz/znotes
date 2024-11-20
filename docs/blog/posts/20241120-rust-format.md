---
draft: false
date: 2024-11-20
authors:
  - tschinz
categories:
  - rust
  - macros
  - format!()
  - println!()
  - print!()
---

# Rust String Formatting - An ASCII-Art Cheatsheet!

For once a post of a different kind. Let's talk about the versatile Rust String formatting and how to use it. The ASCII-Art shows the different elements in the `format!()`, `print!()` and `println!()` macros.

For example what is the output of the following code?

```rust
print!("{0:*>+10.3e}", std::f64::consts::E);
```

<!-- more -->

Whether you’re formatting strings for logging, debugging, or crafting a polished UI, these macros have you covered. Here’s a quick guide to mastering their syntax.

```
"{" [argument][":"][[fill]align][sign]["#"]["0"][width][.precision][type] "}"
        /             /    /      /    /    /                \        \
       /             /    /      /    /    |                  \        \
      /             /    /      /    /     |- padding "0"      \        |
     /             /    /      /    |                           \       |
    /             /    /      |     |- alternate formatting      \      |
   /             /    /       |     |- (human-reable)             \     |
  /             /    /        |                                    |    |
 |             /    /         |- "" - default                      |    |
 |            /    /          |- + - + prefix        by tschinz    |    |
 |           /    |                                                |    |
 |          /     |                  nbr of descendants - integer -|    |
 |         |      |                                                     |
 |         |      |- < - left (default)      "" - default follows type -|
 |         |      |- > - right              "b" - binary ---------------|
 |         |      |- ^ - center             "o" - octal ----------------|
 |         |                                "x" - hex ------------------|
 |         |- any character for padding     "X" - Hex ------------------|
 |                                          "e" - scientific -----------|
 |- "" - follows arg sequence (default)     "E" - Scientific -----------|
 |- integer - selects arg by position       "p" - pointer addr ---------|
 |- identifier - selects arg by name        "?" - debug (trait req) ----|
```

## Core formatting options
```
formatting = [argument][:][[fill]align][sign][#][0][width][.precision][type]
argument   = integer | identifier
fill       = <any character>
align      = "<" | ">" | "^"
sign       = "+"
"#"        = alternate formatting
"0"        = zero-padding
width      = integer
precision  = integer
type       = "b" | "o" | "x" | "X" | "e" | "E" | "p" | "?"
```

## Quick Examples

### Align and Padding
```rust
format!("{:<8}", 1);  // "1       " - Left-align
format!("{:>08}", 1); // "00000001" - Right-align with zero-padding
format!("{:^8}", 1);  // "   1    " - Center-align
```

### Precision
```rust
format!("{:.3}", 2.71828); // "2.718" - 3 decimal places
```

### Types
```rust
format!("{:b}", 42);       // "101010" - Binary
format!("{:#x}", 255);     // "0xff" - Hexadecimal with prefix
format!("{:e}", 1.23e4);   // "1.23e4" - Scientific notation
```

### The Solution

Lastly the output of the code snippet from the beginning is:

```rust
print!("{0:*>+10.3e}", std::f64::consts::E); // "**+2.718e0"
```

Check out the official [std::fmt](https://doc.rust-lang.org/std/fmt/) Rust Library Documentation for more detailed information.

With this cheatsheet, you’ll master Rust’s string formatting macros in no time. 💪 Share this post to help others level up their Rust game!

For the full article see [Rust String Formatting - A ASCII-Art Cheatsheet!](https://tschinz.github.io/znotes/blog/2024/11/20/rust-string-formatting---a-ascii-art-cheatsheet.html) and more examples [here](./../../coding/rust/syntax.md#format-printlnand-print-macros)

<!-- https://tschinz.github.io/znotes/coding/rust/syntax.html#format-printlnand-print-macros -->

`#rust #rustlang #formatting #macros #ascii-art #engineering #systems-engineering #hei #hesso`
