# Deterministic tranche traceability

| Group | Prolog path | Source | Class |
| --- | --- | --- | --- |
| classic-six | src/stakeholder.pl | Rust/Java canonical contract | dedicated |
| modern-core | src/stakeholder.pl | Rust/Java canonical contract | dedicated |
| later families | src/stakeholder.pl | grouped fallback policy | grouped fallback |
| CLI | src/stakeholder.pl, tests/test_cli.sh | stakeholder-core contract | deterministic |
| provider | src/stakeholder.pl, tests/test_cli.sh | provider isolation policy | explicit fail-fast |
