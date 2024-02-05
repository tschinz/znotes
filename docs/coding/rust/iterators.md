---
tags:
- coding
- rust
- iterators
---
# Iterators

Allows to iterate over a sequence of elements, independently how they are stored. All iterators implement the iterator trait.

``` rust
fn main() {

  let v1 = vec![1, 2, 3];

  let v1_iter = v1.iter();

  for value in v1_iter {
    println!("Got: {}" ,value);
  }
}
```

## Consumers vs Adaptors

Two categories of Iterator methods. The adaptors (takes an iterator and returns an iterator) and consumers (takes iterators and returns another type)

``` rust
// example of consumer method
#[test]
fn iterator_sum() {
  let v1 = vec![1, 2, 3];
  let v1_iter = v1. iter();
  let total: i32 = v1_iter.sum();

  assert_eq!(total, 6);
}

// example of adapter method ``map()``
fn main()
  let v1: Vec<i32> = vec![1, 2, 3];
  let v2: Vec<i32> = v1.iter().map(|x| x + 1).collect();

  assert_eq!(v2, ver![2, 3, 4]);
}
```

## Iterators and Closures

``` rust
#[derive(PartialEq, Debug)]
struct Shoe {
  size: u32,
  style: String,
}

fn shoes_in_my_size(shoes: Vec<Shoe>, shoe_size: u32) -> Vec<Shoe> {
  shoes.into_iter().filter(|s| s.size == shoe_size).collect()
}

fn main() {}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn filters_by_size() {
    let shoes = vec![
     Shoe{
       size: 10,
       style: String::from("sneaker"),
     },
     Shoe{
       size: 13,
       style: String::from("sandal"),
     },
     Shoe{
       size: 10,
       style: String::from("boot"),
     },
    ];

    let in_my_size = shoes_in_my_size(shoes, 10);

    assert_eq!(
      in_my_size,
      vec![
        Shoe{
          size: 10,
          style: String::from("sneaker"),
        },
        Shoe{
          size: 10,
          style: String::from("boot"),
        },
      ]
    );
  }
}
```

## Iterator Implementation

Example of a Iterator implementation

``` rust
pub trait Iterator {
  type Item;   // associated type, defined in later

  fn next(&mut self) -> Option<Self::Item>;

  // methods with default implementation not done
}

#[test]
fn iterator_demo() {
  let v1 = vec![1, 2, 3];

  let mut v1_iter = v1.iter();     // returns immutable

  asser_eq!(v1_iter.next(), Some(&1));
  asser_eq!(v1_iter.next(), Some(&2));
  asser_eq!(v1_iter.next(), Some(&3));
  asser_eq!(v1_iter.next(), None;

  let mut v1_iter = v1.iter_mut(); // return mutable

  asser_eq!(v1_iter.next(), Some(&1));
  asser_eq!(v1_iter.next(), Some(&2));
  asser_eq!(v1_iter.next(), Some(&3));
  asser_eq!(v1_iter.next(), None;

  let mut v1_iter = v1.iter_mut(); // return values directly
  asser_eq!(v1_iter.next(), Some(1));
  asser_eq!(v1_iter.next(), Some(2));
  asser_eq!(v1_iter.next(), Some( 3));
  asser_eq!(v1_iter.next(), None;
}
```

Another example of a Iterator implementation

``` rust
struct Counter {
  count: u32,       // memory for the iterator, private
}

impl Counter {
  fn new() -> Counter {
    Counter { count: 0 }  // count gets initialised to 0
  }
}

impl Iteraotr for Counter {
  type Item = u32;    // associated type (returns items of type u32)

  fn next(&mut self) -> Option<Self::Item> {
    if self.count < 5 {
      self.count += 1;
      Some(self.count)
    } else {
      None
    }
  }
}

#[test]
fn calling_next_directly() {
  let mut counter = Counter::new();

  assert_eq!(counter.next(), Some(1));
  assert_eq!(counter.next(), Some(2));
  assert_eq!(counter.next(), Some(3));
  assert_eq!(counter.next(), Some(4));
  assert_eq!(counter.next(), Some(5));
  assert_eq!(counter.next(), None;
}

#[test]
fn using_other_iterator_trait_methods() {
  let sum: u32 = Counter::new();
     .zip(Counter::new().skip(1))  // zip takes 2 iterators and bundlers them together
                                   // skip is an adaptor method returning a iterator skiped by 1 element
     .map(|(a,b)| a * b)           // map takes a closure for each element returns a iterator
     .filter(|x| x % 3 == 0)       // filters
     .sum();                       // sum of all iterator values
  assert_eq!(18,sum);
}

fn main() {}
```
