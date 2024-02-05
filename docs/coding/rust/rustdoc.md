---
tags:
- coding
- rust
- rustdoc
---
# RustDoc

Documentation comment uses markdown for formatting. Documentation comment examples with be run as a test.

``` rust
//! indicate module-level or crate-level documentation
/// rustdoc documentation supporting markdown
```

``` rust
//! Fast and easy queue abstraction.
//!
//! Provides an abstraction over a queue.  When the abstraction is used
//! there are these advantages:
//! - Fast
//! - [`Easy`]
//!
//! [`Easy`]: http://thatwaseasy.example.com

/// This module makes it easy.
pub mod easy {

  /// Use the abstraction function to do this specific thing.
  pub fn abstraction() {}

  /// Adds one to the number given.
  ///
  /// # Examples
  ///
  /// ```
  /// let arg = 5;
  /// let answer = my_crate::add_one(arg);
  ///
  /// asser_eq!(6, answer);
  /// ```
  pub fn add_one(x: i32) -> i32 {
    x + 1
  }
}
```

Build and open the documentation

``` bash
cargo doc --open
```
