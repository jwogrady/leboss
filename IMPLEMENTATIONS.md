# LEBOSS Implementations

This document tracks systems implementing or aligning with the LEBOSS specification.

---

## Implementations

| Project        | Description | Maturity | Conformance Level | LEBOSS Version |
|----------------|-------------|----------|-------------------|----------------|
| *(none yet)*   | -           | -        | -                 | -              |

No implementations are registered yet. The first entry here will be a genuine first.

---

## How to Register an Implementation

If you are building a system that implements the LEBOSS standard, open a pull request adding a row to the table above.

Include each field:

- **Project** — the name of your project or product, ideally linked to its repository or site.
- **Description** — one sentence on what it does and how it implements LEBOSS.
- **Maturity** — release stage: one of `in-development`, `alpha`, `beta`, `production`.
- **Conformance Level** — your self-declared level against the standard:
  - `in-development` — building toward conformance; not yet claiming a level.
  - `LEBOSS-aligned` — preserves the ownership hierarchy and element boundaries.
  - `LEBOSS-compliant` — satisfies all MUST-level requirements.

  See [standards/conformance.md](standards/conformance.md) for the exact definitions of the two tiers. ("Conformant" is **not** a defined term — use *aligned* or *compliant*.)
- **LEBOSS Version** — the specification version your implementation targets (e.g., `v0.1.0-rc`).

### Conformance is self-declared

There is no third-party certification or conformance authority in this version. A
listed level is the maintainer's own claim. That claim must be **supportable by
observable system behavior** (per the Conformance Verification rules,
LEBOSS-VER-2 / VER-4 / VER-6) — a reviewer should be able to confirm it from how
the system actually behaves, not from the label alone. Do not list a conformance
level you cannot substantiate.

---

## Conformance

Implementations claiming LEBOSS-compliant status must satisfy the requirements defined in:

[standards/conformance.md](standards/conformance.md)

The conformance document defines the minimum requirements for:

- Governing Entity ownership boundary
- Resource Model
- Access Grants
- Audit Records
- Data Portability

---

## Questions

Open an issue in this repository to ask questions about implementing the standard.

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to submit proposals or feedback that could improve implementability.
