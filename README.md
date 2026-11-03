# tls

A minimal, flagless implementation of the Unix `ls` command written from scratch in pure GNU Assembler (`gas`) using raw Linux system calls. 

This is a lightweight, zero-dependency practice project that currently accepts zero command-line flags and handles basic directory listing. More features and flags will be added over time.

## Requirements

- GNU Assembler (`as`)
- GNU Linker (`ld`)
- Linux (x86_64)

## Build & Run

```bash
# Build the executable
make

# Run the program
./tls

# Clean up build artifacts
make clean

## Example

```text
❯ tls
test.py
user.s
.
..
```
