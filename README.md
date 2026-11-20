# zed-fortran

Fortran language support for the Zed editor.

This fork builds on the upstream
[tree-sitter-fortran](https://github.com/stadelmanma/tree-sitter-fortran) grammar
and adapts its queries to Zed:

- highlights use capture names that Zed themes style, cover I/O, preprocessor,
  CUDA Fortran and OpenMP/OpenACC directive lines, and mark FORD/Doxygen
  comments (`!!`, `!>`, `!<`) as doc comments
- outline (modules, types, interfaces, procedures), brackets, indents and
  text objects

The grammar parses free-form source only; fixed-form `.f`/`.F` files parse poorly.

## Language server

[fortls](https://github.com/fortran-lang/fortls) is started from `PATH` with
`--lowercase_intrinsics`. Override the path or arguments in Zed settings:

```json
"lsp": {
  "fortls": {
    "binary": { "path": "/path/to/fortls", "arguments": ["--lowercase_intrinsics"] }
  }
}
```

## Install as a dev extension

Run `zed: install dev extension` and select this directory. It replaces the
`fortran` extension from the registry.
