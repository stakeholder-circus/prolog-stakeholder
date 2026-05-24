# Docker validation is intentionally deferred for this M1-safe local Prolog tranche.
# The native validation lane uses GNU Prolog on macOS.
FROM alpine:3.20
CMD ["sh", "-c", "echo 'Docker validation deferred for prolog-stakeholder'; exit 1"]
