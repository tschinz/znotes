---
tags:
- coding
- rust
- generics
---
# Generics

generics is a way to create functions which can take different types of inputs and perform the "same" action. By convention generics are used starting from `T` onwards `T, U, V, W` etc.

``` rust
fn main() {
  let number_list = vec![34, 50, 25, 100, 65];
  let largest = get_largest(number_list);
  println!("The largest number is {}", largest);

  let char_list = vec!['y', 'm', 'a', 'q'];
  let largest = get_largest(char_list);
  println!("The largest char is {}", largest);
}

// function with generics type T as input which can be ordered and copied
fn get_largest<T: PartialOrd + Copy>(list Vec<T>) -> T {
  let mut largest = list[0];
  for item in list {
    if item > largest{
      largest = item;
    }
  }
  largest
}
```

multiple generics with `structs`

``` rust
struct Point<T, U> {
  x: T,
  y: U,
}

impl<T, U> Point<T, U> {
  fn mixup<V, W>(self, other: Point<V, W>) -> Point<T, W> {
    Point {
      x: self.x,
      y: other.y,
    }
  }
}

fn main() {
  let p1 = Point {x: 5, y: 10 };
  let p2 = Point {x: 5.0, y: 10.0 };
  let p3 = Point {x: 5, y: 10.0 };
  let p4 = Point {x: "Hello, y: 'c'};

  let p5 = p3.mixup(p4);

  println!("p5.x = {}, p5.y = {}", p5.x, p5.y);
}
```

generics with `enum`. The `Option` and `Result` enum are implemented using generics.

``` rust
fn main() {
  enum Option<T> {
    Some(T),
    None,
  }

  enum Result<T, E> {
    Ok(T),
    Err(E),
  }
}
```