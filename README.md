# SSA-2020

## Description

**SSA-2020** is a custom compiler designed to process source code written in plain text files (`.txt`). The compiler implements a finite state machine approach, supports Reverse Polish Notation (RPN), and generates an assembly file, which can then be compiled into an executable `.exe` file.

This project is an educational/experimental tool for learning the principles of compiler construction, syntax analysis, finite state machines, and low-level code generation.

---

## Features

- **Processes input `.txt` files** containing user code.
- **Lexical and syntax analysis** using a finite state machine.
- **Supports expressions in Reverse Polish Notation (RPN)**.
- **Generates assembly (`.asm`) files** from the parsed code.
- **Automatically compiles `.asm` to an executable `.exe` file** (requires an assembler such as [NASM](https://www.nasm.us/) and a compiler such as [MinGW](http://mingw-w64.org/)).

---

## Architecture

1. **Parser**: Reads the input `.txt` file, converts expressions to RPN, and builds a parse tree.
2. **Analyzer**: Uses a finite state machine for syntax parsing and state transitions.
3. **Code Generator**: Generates a `.asm` file based on the parse tree and RPN.
4. **Build Process**: Compiles the assembly source into an executable file.

---

## Quick Start

### Dependencies

- [.NET Core SDK](https://dotnet.microsoft.com/download)
- [NASM](https://www.nasm.us/) (for assembling `.asm` files)
- [GCC/MinGW](http://mingw-w64.org/) (for generating `.exe` files)

### Build & Run

```bash
git clone https://github.com/YanKorzun/SSA-2020.git
cd SSA-2020

# Build the .NET project
dotnet build

# Run the compiler (example)
dotnet run --project SSA-2020.csproj -- input.txt

# This generates output.asm
# Build .exe from output.asm
nasm -f win64 output.asm -o output.obj
gcc output.obj -o output.exe
```

> **Note:** Make sure the paths to nasm and gcc are included in your PATH environment variable.

---

## Example Input File (`input.txt`)

```
a = 2
b = 3
c = a b +
print c
```

---

## Example Generated Assembly (`output.asm`)

```asm
section .data
    a dq 0
    b dq 0
    c dq 0

section .text
    global main
main:
    mov rax, 2
    mov [a], rax
    mov rax, 3
    mov [b], rax
    mov rax, [a]
    add rax, [b]
    mov [c], rax
    ; print c
    ...
    ret
```

---

## Contacts

- Author: [Siarhei Siarheyeu](https://github.com/YanKorzun)

---

## License

MIT License