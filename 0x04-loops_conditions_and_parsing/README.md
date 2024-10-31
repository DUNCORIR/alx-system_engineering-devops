0x04. Loops, conditions and parsing
DevOps
Shell
Bash
Scripting

0. Loops: Implement different types of loops:

for loops: Iterate over a list of items or a range of numbers.
while loops: Continue until a specific condition becomes false.
until loops: Continue until a specific condition becomes true.

1. Conditions:

Use if-else statements to create branching logic based on conditions.
Use case statements as an alternative to multiple if-elif conditions, especially for pattern matching.
Test command conditions using test or [ ] for comparisons.

2. Parsing:

Use command-line arguments to make scripts dynamic and versatile.
Work with strings and numbers and use pattern matching with grep, sed, awk, or shell wildcards.
3. Scripting Best Practices:

Write clear, commented, and modular scripts.
Use indentation and consistent naming conventions for readability.
Make scripts executable with chmod +x script_name.

Loops sample:

Loops help automate repetitive tasks.
Practice using for, while, and until loops, which are essential in Bash for iterating over items, files, or ranges.

Variable assignment and arithmetic:

Variables are assigned without spaces, like variable=value.
Arithmetic in Bash is done using $((expression)).

Comparison operators:

Numeric comparisons: -eq, -ne, -lt, -le, -gt, -ge.
String comparisons: =, !=, -z (checks if a string is empty), and -n (checks if a string is not empty).

File test operators:

Used to check properties of files and directories, like existence, type, and permissions.
Examples:
-e filename: Check if a file exists.
-d directory: Check if it’s a directory.
-f file: Check if it’s a regular file.
-r, -w, -x file: Check if a file is readable, writable, or executable.

Make your scripts portable:

Writing portable scripts means making them compatible across different environments.
Use #!/bin/bash or #!/bin/sh shebangs to specify the shell.
Avoid shell-specific syntax unless necessary, and test your script on multiple shells if needed.
