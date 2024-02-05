---
tags:
- coding
- rust
- traits
---
# Traits

Shared behaviour of objects.

In the example summarize_author does not have a default implementation and needs to be implemented by all objects claiming the trait. summarize has a default implementation and does not need to be implemented by all objects.

## Implement traits

``` rust
pub struct NewsArticle {
  pub author: String,
  pub headline: String,
  pub content: String,
}

// implement the summary trait for the struct NewsArticle
impl Summary for NewsArticle {
  fn summarize_author(&self) -> String {
    format!("{}", self.author)
  }
}

pub struct Tweet {
  pub username: String,
  pub content: String,
  pub reply: bool,
  pub retweet: bool,
}

// implement the summary trait for the struct NewsArticle
impl Summary for Tweet {
  fn summarize_author(&self) -> String {
    format!("@{}", self.username)
  }
  fn summarize(&self) -> String {
    format!("{}, by {}", self.username, self.content)
  }
}

// define the trait "Summary" without the implementation
pub trait Summary {
  fn summarize_author(&self) -> String; // only body without default implementation

  fn summarize(&self) -> String {       // with default implementation
    String::from("(Read more from {} ...)", self.summarize_author())
  }
}
```

## Function needing trait objects

Implement functions needing objects implementing a given trait

``` rust
// define method for object using a trait with the impl syntax
pub fn notify(item: &impl Summary) {
  println!("Breaking news! {}", item.summarize());
}

// or can be defined like this with the trait-bound syntax
pub fn notify<T: Summary>(item: &T) {
  println!("Breaking news! {}", item.summarize());
}

//---------------------------------------------------------------------------
// needing multiple traits with impl syntax
pub fn notify(item1: &(impl Summary + Display), item2: &impl Summary) {
  // ...
}

// needing multiple traits with the trait-bound syntax
pub fn notify<T: Summary + Display>(item1: &T, item2: &impl T) {
  // ...
}

//---------------------------------------------------------------------------
// Can become quite compilated to read
pub some_function<T: Display + Clone, U: Clone + Debug>(t: &T, u: &U) -> i32 {
 // ...
}

// can be simplified with the where clause
pub some_function<T, U>(t: &T, u: &U) -> i32
 where T: Display + Clone,
       U: Clone + Debug
{
  // ...
}
```

## Return values

``` rust
fn returns_summarizable() -> impl Summary {  // returns a object implementing the Summary trait
  Tweet {
    username: String::from("horse_ebook"),
    content: String::from("tweet content"),
    reply: false,
    retweet: false,
  }
}

fn main() {
 println!("{}", returns_summarizable().summarize());
}
```

## Conditionally Implement Methods using trait bounds

``` rust
use std::fmt::Display;

struct Pairt<T> {
  x: T,
  y: T,
}

impl<T> Pair<T> {
  fn new(x: T, y: T) -> Self {
    Self {x,y}
  }
}

impl<T: Display+ PartialOrd> Pair<T> {
  fn cmp_display(&self) {
    if self.x >= self.y {
      println!("The largest member is x= {}", self.x);
    } else {
      println!("The largest member is y= {}", self.y);
    }
  }
}
```

// implement a trait on a type implementing another trait
```rust
// implement ToString trait on types implementing the Display trait
   impl<T: Display> ToString for T {
     //...
   }
```

## Trait implementation

### `deref` trait

``` rust
struct MyBox<T>(T);

impl<T> MyBox<T> {
  fn new(x: T) -> MyBox<T> {
    MyBox(x)
  }
}

impl<T> DeRef for MyBox<T> {
  type Target = T;

  //fn deref(&self) -> &Self::Target {
  fn deref(&self) -> &T {
    &self.0
  }
}

fn main() {
   let x = 5;
   let y = myBox::new(x); // smart pointer

   assert_eq!(5, x);
   assert_eq!(5, *y);
   // assert_eq!(5, *(y.defref()));  // thats what rust used
}
```

### deref coercion

Deref can happen automatically for types implementing the deref trait. Converts a reference from one type to another type.

Rust does deref coercion in three cases:

- From `&T` to `&U` when `T: Deref<Target=U>`
- From `&mut T` to `&mut U` when `T DerefMut<Target=U>`
- From `&mut T` to `&U` when `T: Deref<Target=U>`

``` rust
fn main(){
  let m: = MyBox::new(String::from("Rust"));
  hello(&m);
  // &MyBox<String> -> &String -> &str //deref coercion happens in two steps here
}

fn hello(name: &str) {
  println!("Hello, {}!", name)
}
```

### `drop` trait

Can be implemented at any type and defines what happens if a variable goes out of scope. It is to cleanup allocated memory.

``` rust
struct CustomSmartPointer {
  data: String,
}

impl Drop for CustomSmartPointer {
  fn drop(&mut self) {
    println:("Dropping CustomSmartPointer with data `{}`!", self.data);
  }
}

fn main() {
  let c = CustomSmartPointer {
    data: String::from("my stuff"),
  }
  let d = CustomSmartPointer {
    data: String::from("other stuff"),
  }

  //optional manually execute drop
  //c.drop() wrong potential twice free'd memory
  drop(c);
  println!("CustomSmartPointers created.");
}
```
