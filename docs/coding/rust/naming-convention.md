---
tags:
- coding
- rust
- naming
---
# Naming Convenctions

| Item                    | Convention |
| ----------------------- | ---------------------------------------------------- |
| Crates                  | `unclear` |
| Modules                 | `snake_case` |
| Types                   | `UpperCamelCase` |
| Traits                  | `UpperCamelCase` |
| Enum variants           | `UpperCamelCase` |
| Functions               | `snake_case` |
| Methods                 | `snake_case` |
| General constructors    | `new` or `with_more_details` |
| Conversion constructors | `from_some_other_type` |
| Macros                  | `snake_case!` |
| Local variables         | `snake_case` |
| Statics                 | `SCREAMING_SNAKE_CASE` |
| Constants               | `SCREAMING_SNAKE_CASE` |
| Type parameters         | concise `UpperCamelCase`, usually single uppercase letter: `T` |
| Lifetimes               | short `lowercase`, usually a single letter: `'a`, `'de`, `'src` |
