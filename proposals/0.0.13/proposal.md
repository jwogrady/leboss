# Proposal 0.0.13 — Specification and Implementation Boundary

**Status:** Proposal
**Branch:** proposal/0.0.13-boundary-separation
**Date:** 2026-03-21
**Builds on:** proposal/0.0.12

---

## Summary

The LEBOSS standard operates as a governance specification throughout — but this
identity is never formally declared. No section enumerates what the standard defines
in scope, what it explicitly defers, or the normative rules governing how external
implementations may reference it. The term "implementation" itself is used across
multiple documents without a glossary definition.

This proposal formalizes that boundary. It adds two subsections to §1 of the base
standard — one enumerating what LEBOSS defines, one enumerating what it does not —
alongside four enforceable rules expressing the relationship between the standard
and implementing systems. No existing rule changes. No new mechanism is introduced.

This is a clarification proposal. It does not change existing behavior.

---

## Motivation

The standard has always operated as a specification-layer document. The Introduction
states "LEBOSS is not a product. It is not a platform. It is a standard." Conformance
§5 states "LEBOSS defines governance rules, not implementation technologies." These
statements are accurate, but they are informal declarations scattered across different
sections. None of them:

- Enumerate what the standard considers in scope
- Enumerate what it explicitly defers to implementing systems
- Carry enforceable normative weight (MUST / MUST NOT)
- Define the term "implementation," which appears throughout without a glossary entry

The practical risk is real: an implementer can read the standard, build a system that
redefines access grant validation behavior, and claim LEBOSS alignment — because
nothing currently prohibits it. The boundary is implied but not enforced.

---

## Specification Changes

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §1.1 and §1.2 | Normative clarification |
| `standards/leboss-normative-rules.md` | Add SPEC rule group (SPEC-1 through SPEC-4); update Summary Counts | New normative rules |
| `standards/conformance.md` | Add non-conformance condition §4 item 7; add cross-reference to §5 | Normative clarification |
| `glossary/terms.md` | Add "Implementation" and "Specification Boundary" entries | Definitional |

### `standards/leboss-standard.md` — §1.1 and §1.2

Adds two subsections to the Introduction:

**§1.1 What This Specification Defines** — Enumerates the six categories that define
the complete scope of normative content in LEBOSS: organizational hierarchy, data
ownership doctrine, access control requirements, audit requirements, service provider
obligations, and conformance criteria.

**§1.2 What This Specification Does Not Define** — Enumerates what LEBOSS explicitly
defers to implementing systems (runtimes, APIs, infrastructure, UIs, architectures)
and states three inline normative rules corresponding to SPEC-2, SPEC-3, and SPEC-4.
Closes with the interpretability constraint: normative requirements in this
specification MUST be interpretable without reference to any specific implementation.

### `standards/leboss-normative-rules.md` — SPEC rule group

Four new rules:

- **LEBOSS-SPEC-1** — The LEBOSS specification MUST NOT impose requirements on
  specific technologies, runtime environments, infrastructure platforms, or API designs.
- **LEBOSS-SPEC-2** — Implementations MAY reference normative LEBOSS rules and use
  the LEBOSS Reference Model as a design vocabulary.
- **LEBOSS-SPEC-3** — Implementations MUST NOT redefine, override, or selectively
  apply normative LEBOSS requirements while claiming LEBOSS alignment or compliance.
- **LEBOSS-SPEC-4** — Implementations MUST remain replaceable. No conformant
  implementation is structurally privileged over another under this standard.

Summary Counts updated: 40 → 44 rules.

### `standards/conformance.md` — §4 and §5

§4 adds non-conformance condition 7: rule redefinition (referencing LEBOSS-SPEC-3).

§5 adds a cross-reference to leboss-standard.md §1.1/§1.2 and the SPEC rule group
at the section head.

### `glossary/terms.md` — two new entries

- **Implementation** — defines what an implementation is, its relationship to the
  standard, and the normative obligations it carries.
- **Specification Boundary** — defines the formal separation between specification
  scope and implementation scope; references SPEC-1 through SPEC-4.

---

## Impact Assessment

| Existing Element | Impact |
|-----------------|--------|
| All existing MUST/MUST NOT rules | Unchanged |
| Conformance tiers (aligned / compliant) | Unchanged |
| All governance object definitions | Unchanged |
| All protocols (AGP, IDP, ACP, DPP) | Unchanged |
| Resource Model | Unchanged |

---

## Backward Compatibility

This proposal adds no new behavioral requirements. Existing implementations that
satisfy the current standard continue to satisfy it after this proposal is applied.
No existing rule is modified or removed.

---

*Proposal 0.0.13 — Community contribution. Open for committee review.*
