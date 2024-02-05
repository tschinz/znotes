---
tags:
- coding
- rust
- concepts
- ownership
- borrowing
- lifetimes
---
# Concepts
## Ownership

In Rust, ownership is a key concept that helps to ensure memory safety and eliminate data races at compile time. Every value in Rust has a variable that owns it, and there can only be one owner at a time. When the owner goes out of scope, the value is dropped and its memory is automatically freed.

``` rust
fn main() {
  let s = String::from("hello"); // s owns the String

  takes_ownership(s);            // s's ownership is moved into the function...
                                 // ... and can no longer be used in main()
  let x = 5;                     // x owns the integer
  makes_copy(x);                 // x is passed by value into the function...
                                 // ... and is still available in main()

} // Here, x goes out of scope, then s. But because s's value was moved, nothing
  // special happens.

fn takes_ownership(some_string: String) { // some_string owns the String
  println!("{}", some_string);
} // Here, some_string goes out of scope and `drop` is called. The backing
  // memory is freed.

fn makes_copy(some_integer: i32) { // some_integer is a copy of the integer
  println!("{}", some_integer);
} // Here, some_integer goes out of scope. Nothing special happens.
```

## Borrowing

Borrowing is a concept that allows a function or code block to temporarily access a value owned by another variable, without taking ownership of it. Borrowing enables code to be more flexible and avoids unnecessary copying of large data structures.

Borrowing has some rules in Rust:

- You can have either one mutable reference or any number of immutable references to a particular piece of data in a particular scope, but not both at the same time.
- References must always be valid.
- You can't modify the data that is being borrowed through an immutable reference.
- You can modify the data that is being borrowed through a mutable reference, but you can't have any other references to the data in the same scope.

``` rust
fn main() {
  let mut s = String::from("hello");

  change(&mut s);

  let r1 = &s; // no problem
  let r2 = &s; // no problem
  println!("{} and {}", r1, r2);
  // r1 and r2 are no longer used after this point
} // s goes out of scope and is dropped. Nothing else happens.

fn change(some_string: &mut String) {
  some_string.push_str(", world");
}
```

## Lifetimes

Lifetimes determines how long a piece of memory is valid. A lifetime is a set of scopes during which a reference to an object is valid. The Rust compiler analyzes lifetimes to ensure that references do not outlive the objects they refer to or create data races.

``` rust
fn print_string(s: &str) {
  println!("{}", s);
}
```

## Deref coercion

Dref can happen automatically for types implementing the deref trait. Converts a reference from one type to another type.

Rust does deref coercion in three cases:

- From `&T` to `&U` when `T: Deref<Target=U>`
- From `&mut T` to `&mut U` when `T DerefMut<Target=U>`
- From `&mut T` to `&U` when `T: Deref<Target=U>`

## Interior mutability

Interior mutability is a pattern that allows for mutation of a value even when it is considered immutable by the compiler. This can be useful in situations where you need to mutate a value that is shared across multiple parts of the program, without requiring it to be wrapped in a mutex or refcell.

Interior mutability is typically achieved through the use of types that provide interior mutability guarantees, such as Cell, RefCell, and Mutex. These types allow for safe mutation of a value by encapsulating it in a container that provides a safe interior reference to the value.

``` rust
use std::cell::Cell;

fn main() {
  let x = Cell::new(5);
  let y = x.get();
  x.set(y + 1);
  println!("x is now {}", x.get());
}
```
