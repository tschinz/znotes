---
tags:
- coding
- rust
- workspaces
---
# Workspaces

Cargo workspaces allows to organise big projects. Allows develop multiple packages in tandem with only one common `Cargo.lock` file and profile settings. Packages in a workspace can depend on each other.

``` toml title="Cargo.toml"
[workspace]

members = [
 "adder",
 "add-one",
]
```
