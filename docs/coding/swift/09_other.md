---
tags:
- coding
- swift
---
# Other

## Assertions
Debbuging Aid, crashed program and gives a message if condition not true

``` swift
assert(() -> Bool, "message")
//e.g.
assert(validation() != nil, "the validation functions returned nil")
```

## Other Functions

Global Functions working with `Array`, `Dictionary`, `String`

- Collection == `Array`, `Dictionary`, `String`
- Sliceable == `Array`, `String`

``` swift
let count = countElements(aCollection)     // nbr of elements in collection
let sub = dropFirst(aSliceable)            // drops first thing in sliceable
let sub = dropLast(Sliceable)              // drops last thing in sliceable
let first = first(aCollection)             // first element in collection
let last = last(aCollection)               // last element in collection
let prefix = prefix(aSliceable, X: Int)    // returns first X things
let suffix = suffix(aSliceable, X: Int)    // returns last X things
let reversed: Array = reverse(aCollection) // remembers that String in a collection
let backwardsString = String(reverse(s))   //
```