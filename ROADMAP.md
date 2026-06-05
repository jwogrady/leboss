# LEBOSS Roadmap

**Status:** informational — planning, not normative
**Current version:** v0.1.0-rc (proposal/0.0.29)

This document records intended direction. It is not part of the normative
specification and introduces no requirements. Anything that would change the
standard itself proceeds through the proposal workflow in
[governance/governance.md](governance/governance.md).

---

## Toward the first Committee Vote (v0.1.0)

- Constitute the committee so a Committee Vote can be called (see
  [governance/committee.md](governance/committee.md)).
- Hold the first Committee Vote on the v0.1.0 candidate.

## Toward a Published standard (v1.0.0)

The gap between a *readable* specification and *machine-checkable* conformance is
the main body of post-v0.1.0 work.

### Machine-readable schemas

The three governance objects — Access Grant, Integration Descriptor, and Audit
Record — are currently defined in prose. Publishing machine-readable schemas
(for example JSON Schema) for each would let implementers validate object shape
mechanically.

- Scope: one schema per governance object, derived from the existing object
  definitions; no new requirements.
- Where a schema would impose a normative constraint, it must be introduced
  through a proposal, not added as a side artifact.
- Status: **not started.** No schemas exist today.

### Conformance test vectors

A starter set of conformance test vectors — concrete example inputs paired with
expected aligned/compliant verdicts — would turn the 25 non-conformance
conditions in [standards/conformance.md](standards/conformance.md) from prose
checks into runnable fixtures.

- Scope: a representative vector for each conformance tier and for the most
  commonly triggered non-conformance conditions.
- This subsumes the idea of a reference implementation: test vectors are the
  smaller, more durable artifact and do not require endorsing any one codebase.
- Status: **not started.** No test vectors exist today.

### Import / round-trip portability

Only data *export* is normative today; import and round-trip portability are
explicitly deferred. Specifying them is standard-content work and must be opened
as a proposal.

---

## Not promises

Everything above is intended direction, not a commitment or a schedule. Items
land only as proposals are accepted through the governance process. Nothing here
should be read as already implemented.
