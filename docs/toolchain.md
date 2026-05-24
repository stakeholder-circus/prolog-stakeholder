# Toolchain

Prolog native validation uses GNU Prolog on arm64 macOS.

## Proven commands

- `gprolog --version`
- `gplc --version`
- `make compiler-proof`
- `make test`

Toolchain source: Homebrew bottled `gnu-prolog` 1.5.0. Docker, Nix, and Prolog package managers are not required for the current deterministic first tranche.
