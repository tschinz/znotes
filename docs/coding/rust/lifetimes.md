---
tags:
- coding
- rust
- lifetimes
---
# Lifetimes

The memory management of Rust knows with the help of the borrow checker the lifetime of many variables. Lifetimes are annotated with tick and starting with a `` `a ``.

In the following example r is not valid for the println statement since the x was note valid anymore. (Dangling pointer). The compiler will find this error.

``` rust
fn main() {
  let r: &i32;          // ---------+-- a'
                        //          |
  {                     //          |
    let x = 5;          // -+-- 'b' |
    r = &x              //  |       |
  }                     // -+       |
                        //          |
  println!("r: {}", r); //          |
}                       // ---------+
```

## Generic Lifetimes in Functions

In some cases especially for return values given as references the compiler needs to be informed of the lifetime of the return value copmared to the input arguments.

``` rust
fn main() {
  let string1 = String::from("abcd");

  {
    let string2 = String::from("xyz");

    let result = longest(string1.as_str(), string2.as_str());
    println!("The longest string is {}", result);
  }
}

// since the output is a reference it's lifetime needs to be defined.
// return values has the lifetime of the smallest lifetime of the arguments x and y
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
  if x.len() > y.len() {
    x
  } else {
    y
  }
}
```

### Lifetime Annotation Syntax

``` rust
&i32        // a reference
&'a i32     // a reference with an explicit Lifetime
&'a mut i32 // a mutable reference with an explicit lifetime
```

A a return value to a reference to a variable created inside a function is not possible since the lifetime of the variable ends at the end of the function

``` rust
fn longest<'a>(x: &str, y:&str) -> &'a str {
  let result = String::from("text");
  result.as_str()     // not possible since reference not valid after function end
}
fn longest<'a>(x: &str, y:&str) -> &'a str {
  let result = String::from("text");
  result     // return an own type which moves ownership
}
```

### Lifetime Annotations in Stucts Definitions

``` rust
struct ImportantExcerpt<'a> {
  part: &'a str,             // lifetime annotation is needed since it is a reference
}

fn main() {
  let novel = String::from("Text");
  lef first_sentence = novel.split('.').next().expect("Could not find a '.'");
  let i = ImportantExcerpt {
     part: first_sentence,
  };
}
```

## Lifetime Elision

Sometimes the compiler can referr the lifetime by performing three lifetime elision rules:

- Lifetime of Arguments of a functions is called "input lifetime"
- Lifetime of return values of a function is called "output lifetime"

1. Each parameter that is a reference gets its own lifetime parameter
2. If there is exactly one input lifetime parameter, that lifetime is assigned to all output lifetime parameters;
3. If there are multiple input lifetime parameters, but one of them is `&self` or `&mut self` the lifetime of self is assigned to all output lifetime parameters

Example

``` rust
fn first_word(s: &str) -> &str{
// fn first_word<'a>(s: &'a str) -> &'a str { // thanks to the rules 1&2 the compiler sees this
  let bytes = s.as_bytes();

  for (i, &item) in bytes.iter().enumrate() {
    if item == b'' {
      return &s[0..i];
    }
  }
}
```

## Lifetime Annotation in Methods

Example with [&self]{.title-ref}

``` rust
struct ImportantExcerpt<'a> {
  part: &'a str,
}

impl<'a> ImportantExerpt<'a> {
  fn return_part(&self, announcement: &str) -> &str {
  //fn return_part<'a>(&'a self, announcement: &str) -> &'a str { // compiler sees this thanks to rule 1&3
    println!("Attention please: {}", accouncement);
    self.part
  }
}
```

## Example with Generics, Traits, Trait Bounds and Lifetimes

``` rust
use std::fmt::Display;

fn longest_with_an_announcement<'a, T>( // Lifetime and Generic definition
  x: &'a str,                           // input lifetime annotation
  y: &'a str,                           // input lifetime annotation
) -> &'a str                            // output lifetime annotation (smallest of input lifetime annotation)
where                                   // Trait bound
  T: Display,                           // implement only where type T implements Display
{
  println!("Announcement! {}", ann);
  if x.len() ° y.len() {
    x
  } else {
    y
  }
}
```
