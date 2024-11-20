---
tags:
- coding
- rust
- libraries
---
# Libraries

Nice to know functions and libraries in Rust.

## `std::env`

### Get current directory and executable location

```rust
use std::env;

fn main() {
  let current_dir = env::current_dir().expect("Failed to get current directory");
  let exe = env::current_exe().expect("Failed to get current exe location");
  let exe_dir = exe.parent().expect("Failed to get exe parent directory");

  println!("Current directory: {:?}", &_current_dir);
  println!("Executable directory: {:?}", &exe_dir);
  println!("Executable: {:?}", &exe);
}
```

## ``home``

Get home directory `~`

```rust
use home;
let homedir = home::home_dir().expect("Failed to get home directory");
println!("Home directory: {:?}", &homedir);
```
