---
tags:
- computer science
- algorithms
- sorting
---

# Sorting / Search Algorithms
Sorting algorithms are essential tools in computer science and software development, used to arrange data in a specific order (usually ascending or descending). By organizing data efficiently, sorting makes it easier to search, analyze, and process information, forming the backbone of many applications and algorithms. **Different sorting techniques offer various trade-offs** in terms of speed, memory usage, and simplicity, making it essential to choose the right algorithm based on the data size and characteristics.

See also the jupyter notebook on this topic: [Sorting Algorithms](daysofalgo/014-sorting-algorithms.ipynb)

## Binary Search
Binary Search is an efficient algorithm for finding a target value within a sorted array. It works by repeatedly dividing the search interval in half, reducing the number of elements to check. Binary search has a time complexity of $O(\log n)$, making it much faster than linear search for large datasets.

See also: [Binary Search Notebook](daysofalgo/006-binary-search.ipynb)

```rust
fn binary_search(arr: &[i32], target: i32) -> Option<usize> {
    let mut left = 0;
    let mut right = arr.len();

    while left < right {
        let mid = left + (right - left) / 2;

        if arr[mid] == target {
            return Some(mid);
        } else if arr[mid] < target {
            left = mid + 1;
        } else {
            right = mid;
        }
    }

    None // Target not found
}

fn main() {
    let sorted_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let target = 7;

    match binary_search(&sorted_array, target) {
        Some(index) => println!("Element found at index: {}", index),
        None => println!("Element not found"),
    }
}
```

## Selection Sort
Selection Sort is a simple sorting algorithm that repeatedly selects the smallest (or largest) element from an unsorted array and places it at the beginning (or end) of the sorted portion. This process continues until the entire array is sorted.

- Time Complexity - $O(n^2)$ in all cases, making it inefficient for large datasets.
- Space Complexity - $O(1)$, as it sorts the array in place.
- Usage -  Best suited for small or mostly sorted arrays where simplicity is preferred over performance.

```rust
fn selection_sort(arr: &mut [i32]) {
    let n = arr.len();
    for i in 0..n {
        // Assume the minimum is the first element
        let mut min_index = i;

        // Find the smallest element in the rest of the array
        for j in (i + 1)..n {
            if arr[j] < arr[min_index] {
                min_index = j;
            }
        }

        // Swap the found minimum element with the first unsorted element
        arr.swap(i, min_index);
    }
}

fn main() {
    let mut arr = [64, 25, 12, 22, 11];
    selection_sort(&mut arr);
    println!("Selection Sorted Array: {:?}", arr);
}
```
