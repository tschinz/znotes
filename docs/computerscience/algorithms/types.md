---
tags:
  - computerscience
  - datascience
  - algorithms
  - types
---

# Types of Algorithm

## Recursive Algorithm
An algorithms which calls itself with a smaller value as input for solving the current input. In short, it’s an Algorithm that calls itself repeatedly until the problem is solved.

Problems such as the Tower of Hanoi or DFS of a Graph can be easily solved by using these Algorithms.

## Divide and Conquer
In Divide and Conquer algorithms, divide the algorithm into two parts; the first parts divide the problem on hand into smaller subproblems of the same type. Then, in the second part, these smaller problems are solved and then added together (combined) to produce the problem’s final solution.

Merge sorting, and quick sorting can be done with divide and conquer algorithms.

## Dynamic Programming Algorithm
These algorithms work by remembering the results of the past run and using them to find new results. In other words, a dynamic programming algorithm solves complex problems by breaking them into multiple simple subproblems and then it solves each of them once and then stores them for future use.

Fibonacci sequence is a good example for Dynamic Programming algorithms.

## Greedy Algorithm
These algorithms are used for solving optimization problems. In this algorithm, we find a locally optimum solution (without any regard for any consequence in future) and hope to find the optimal solution at the global level.

The method does not guarantee that we will be able to find an optimal solution.

The algorithm has 5 components:

- The first one is a candidate set from which we try to find a solution.
- A selection function that helps choose the best possible candidate.
- A feasibility function that helps in deciding if the candidate can be used to find a solution.
- An objective function that assigns value to a possible solution or to a partial solution
- Solution function that tells when we have found a solution to the problem.

Huffman Coding and Dijkstra’s algorithm are two prime examples where the Greedy algorithm is used.

## Brute Force Algorithms
A brute force algorithm blindly iterates all possible solutions to search one or more than one solution that may solve a function. Think of brute force as using all possible combinations of numbers to open a safe.

## Backtracking Algorithms
Backtracking is a technique to find a solution to a problem in an incremental approach. It solves problems recursively and tries to solve a problem by solving one piece of the problem at a time. If one of the solutions fail, we remove it and backtrack to find another solution.

In other words, a backtracking algorithm solves a subproblem, and if it fails to solve the problem, it undoes the last step and starts again to find the solution to the problem.

For example Sudoku solver or N-Queen Problems can be solved with backtracking algorithms.
