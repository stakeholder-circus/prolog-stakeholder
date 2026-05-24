#!/usr/bin/env python3
"""Validate Prolog local deterministic tranche baseline file presence."""

from pathlib import Path

REQUIRED = [
    "AGENTS.md",
    "README.md",
    "STATUS.md",
    "GAPS.md",
    "PARITY.md",
    "AI_DISCLOSURE.md",
    "docs/remotes.md",
    "docs/provenance.md",
    "docs/toolchain.md",
    "docs/traceability/first-push-families.md",
    "scripts/validate_scaffold.py",
    "flake.nix",
    "Dockerfile",
    ".github/workflows/ci.yml",
    ".github/workflows/ci-native.yml",
    ".github/workflows/docker-smoke.yml",
    "Makefile",
    "src/stakeholder.pl",
    "tests/test_cli.sh",
]


def main() -> int:
    missing = [path for path in REQUIRED if not Path(path).exists()]
    if missing:
        for path in missing:
            print(f"missing Prolog deterministic tranche file: {path}")
        return 1
    print("Prolog deterministic tranche baseline files present; run make test for native validation")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
