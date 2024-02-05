---
tags:
- coding
- rust
- modules
---
# Modules

Split code in logical units and manage visibility (public/private) between them. Modules can contain, constants, structs, enums functions and other modules. A crate is also a modules which is created by default.

## Module tree

```
crate
+-- front_of_house
    +-- hosting
    |   +-- add_to_whaitlist
    |   +-- seat_at_table
    +-- serving
        +-- take_order
        +-- serve_order
        +-- take_payment
```

## Module Paths

Path to modules can be Absolute or relative.

``` rust
mod front_of_house {
  pub mod hosting {
    pub fn add_to_waitlist() {}

    fn seat_at_table() {}
  }

  mod serving {
    fn take_order() {}

    fn serve_order() {}

    fn take_payment() {}
  }
}

pub fn eat_at_restaurant() {
  // Absolute path
  crate::front_of_house::hosting::add_to_waitlist();

  // Relative path
  front_of_house::hosting::add_to_waitlist!();
}
```

## Modules visibility

- By default a child modules is private and the parent modules can't see it's content.
- Child modules can see all parent modules functionalities
- With `pub` keyword, function can be access from outside.

modules example with visibility

``` rust
mod front_of_house {
  pub mod hosting {
    pub fn add_to_whitelist() {}
  }
}

pub fn eat_at_restaurant() {
  // Absolute path
  crate::front_of_house::hosting::add_to_whitelist();

  // Relative path (start with current modules)
  front_of_house::hosting::add_to_whitelist();
}
```

modules example with visibility and relative paths

``` rust
fn serve_order() {}

mod back_of_house {
  fn fix_incorrect_order() {
    cook_order();            // works because we are in the same module
    super::serve_order();    // the child can get access to the parent with the super keyword.
  }

  fn cook_order() {}
}
```

## Examples

`mod` modules `struc` example

``` rust
mod back_of_house {
  pub struct Breakfast {
     pub toast: String;       // pub can be changed
     seasonal_fruit: String,
  }

  impl Breakfast {
    pub fn summer(toast: &str) -> Breakfast {
      Breakfast {
        toast: String::from(toast),
        seasonal_fruit: String::from("peaches")
      }
    }
  }
}

pub fn eat_at_restaurant() {
  let mut meal: Breakfast = back_of_house::Breakfast::summer("Rye");

  meal.toast = String::from("Wheat");
}
```

`mod` modules `enum` example

``` rust
mod back_of_house {
  pub enum Appetizer {
    Soup,
    Salad,
  }
}

pub fn eat_at_restaurant() {
  let order_1: = back_of_house::Appetizer::Soup;
  let order_2: = back_of_house::Appetizer::Salad;
}
```

## Public Modules

If an external code wants to use part of the modules it needs to be defines public

``` rust
mod front_of_house {
  pub mod hosting {
    pub fn add_to_waitlist() {}
  }
}

// make the module usable by external
pub use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
  hosting::add_to_waitlist();
}
```

## Module definition

In order to put the module definition into a seperate file. The file needs the name of the modules

``` rust title="front_of_house/hosting.rs"
pub fn add_to_waitlist() {}
```

``` rust title="front_of_house.rs"
pub mod hosting;  // import the module hosting definition from the other file
```

``` rust title="lib.rs"
mod front_of_house;  // import the module front_of_house definition from the other file

// make the module usable by external
pub use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
  hosting::add_to_waitlist();
}
```
