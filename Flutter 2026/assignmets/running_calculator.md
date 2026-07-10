Here is a complete, ready-to-copy assignment prompt tailored for students. It breaks down the problem, specifies the constraints, defines clear requirements, and includes an evaluation rubric.

---

# Computer Science Assignment: The Running Calculator

## Objective

The goal of this assignment is to reinforce core programming fundamentals in **Dart**, specifically focusing on console I/O (Input/Output), control flow structures (loops and conditionals), data validation, and modular function design.

Instead of writing a complex string parser, you will implement a **running calculator** that updates its total step-by-step based on sequential user input, mimicking the behavior of a standard handheld calculator.

---

## The Scenario

Imagine a user who wants to perform sequential math operations without writing out a full equation. Your program will start by asking for an initial number. It will then enter a loop, continually asking for a mathematical operator followed by the next number, updating and displaying the cumulative total after each step.

### Expected Console Workflow Example:

```text
=== Running Calculator ===
Enter the first number: 10

Current Total: 10.0
Enter an operator (+, -, *, /) or "clear"/"exit": *
Enter next number: 5

Current Total: 50.0
Enter an operator (+, -, *, /) or "clear"/"exit": +
Enter next number: 6

Current Total: 56.0
Enter an operator (+, -, *, /) or "clear"/"exit": clear
==========================
Enter the first number: 

```

---

## Strict Constraints & Requirements

### 1. No External Packages

You must rely **solely** on Dart’s core standard library (`dart:io`). You are strictly prohibited from using third-party packages (like `expressions` or `math_expressions`) from pub.dev. The logic must be entirely your own.

### 2. Supported Operations

The calculator must support four basic floating-point arithmetic operations:

* Addition (`+`)
* Subtraction (`-`)
* Multiplication (`*`)
* Division (`/`)

### 3. Application Flow & Commands

* **Sequential Inputs:** Do not accept full string expressions (e.g., `5 + 3`). The application must strictly prompt for a number, then an operator, then another number, one by one.
* **The "clear" Command:** If the user types `clear` during the operator prompt, the current total must reset, and the program should prompt for a brand new "first number".
* **The "exit" Command:** If the user types `exit` at *any* prompt (number or operator), the program must gracefully terminate with a closing message.

### 4. Code Architecture (Modular Design)

Your code must be clean, readable, and structured using functions. Do not dump all your logic inside the `main()` function. You should create separate, dedicated functions for:

* Prompting and validating user numeric input.
* Prompting and validating the operator.
* Executing the core arithmetic logic based on the operator.

### 5. Edge Cases & Error Handling

Your application must be resilient and handle the following scenarios without crashing:

* **Invalid Numbers:** If the user inputs text (like `"abc"`) when a number is expected, notify them of the error and prompt them again.
* **Invalid Operators:** If the user inputs an unsupported operator (like `%` or `^`), notify them and prompt them again.
* **Division by Zero:** If a user tries to divide by `0`, display an explicit error message (e.g., `"Error: Cannot divide by zero!"`) and skip the calculation, keeping the previous total intact.

---

## Submission Guidelines

1. Submit a single, well-documented Dart file named `running_calculator.dart`.
2. Ensure your code contains comments explaining the purpose of your loops, conditional blocks, and functions.

---

## Grading Rubric (100 Points Total)

| Criteria | Description | Points |
| --- | --- | --- |
| **Functional Correctness** | The running total calculates perfectly across all four basic operations (`+`, `-`, `*`, `/`). | **30 pts** |
| **Input Validation & Safety** | Program handles invalid numbers, invalid operators, and prevents crashes on division by zero. | **25 pts** |
| **Flow Control & Commands** | The loop functions continuously; `clear` resets the state properly, and `exit` terminates gracefully. | **20 pts** |
| **Code Architecture** | Code is modularized into distinct, single-responsibility functions rather than a giant `main()` block. | **15 pts** |
| **Documentation & Style** | Variable names are descriptive, formatting is clean, and comments explain crucial logic blocks. | **10 pts** |