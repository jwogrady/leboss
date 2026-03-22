# Proposal 0.0.23 — Service Provider Boundary

**Status:** Draft
**Target Version:** 0.0.23
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `glossary/terms.md`

---

## Summary

This proposal defines what constitutes a service provider under the LEBOSS standard, closing an exploitable gap identified in the 0.0.21 boundary stress test (Scenario 6: "The Disclosed But Uncontrolled Subprocessor Chain").

The prior standard used "service provider" in over twenty normative rules — including the access grant requirement (ACC-1) and subprocessor disclosure requirement (SVC-5) — without defining the term. This allowed a primary service provider to engage infrastructure operators with physical access to primary operational data and argue those entities were not "service providers" under the standard, therefore not subject to disclosure or access grant requirements.

The fix defines service provider functionally: any entity with the ability to access or control primary operational data is a service provider, regardless of what label is applied to their role. Two new normative rules enforce this definition and close the ungoverned-access loophole.

---

## Motivation

The 0.0.21 stress test (Scenario 6) demonstrated:

1. Provider A discloses subprocessors B, C, D — all of which they directly engage.
2. Provider B operates on cloud infrastructure from Provider E, whose staff have administrative access to servers containing primary operational data.
3. Provider A argues E is "infrastructure" and not a "subprocessor" subject to SVC-5.
4. Provider E has no Access Grant from the governing entity and no disclosure obligation under the narrow interpretation.
5. E's staff can access primary operational data with no governance coverage.

The root cause: "service provider" was undefined. ACC-1 prohibits access without an explicit Access Grant — but "service provider" didn't clearly include infrastructure operators. SVC-5 requires disclosure of "third-party services that have access" — but "access" was interpreted as purposeful application-level access, excluding administrative or incidental access.

With over twenty normative rules depending on the meaning of "service provider," the definitional gap propagated through the entire access control model.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Add §7.0 Service Provider Definition

Adds a new sub-section before §7.1 establishing:

- A service provider is any entity that stores, processes, transmits, or has the ability to access or control primary operational data, including entities providing infrastructure, hosting, or administrative support
- The governing criterion is ability to access or control, not role label
- A MUST NOT rule: no entity may access primary operational data without being subject to service provider obligations

**Also updated:** all version stamps (0.0.22 → 0.0.23).

### 2. `standards/leboss-normative-rules.md` — Add SVC-8 and SVC-9

**LEBOSS-SVC-8** (MUST): Any entity that stores, processes, transmits, or has the ability to access or control primary operational data — including entities providing infrastructure, hosting, or administrative support to systems containing primary operational data — MUST be treated as a service provider and is subject to all applicable service provider obligations, regardless of whether their access is direct, delegated, purposeful, or incidental.

**LEBOSS-SVC-9** (MUST NOT): A conformant system MUST NOT permit any entity to access primary operational data without that entity being subject to the service provider obligations defined in this standard, including disclosure requirements (LEBOSS-SVC-5) and access grant requirements (LEBOSS-ACC-1).

Rule count: 78 → 80. SVC group: 7 → 9 rules, MUST 5 → 6, MUST NOT 2 → 3. Total MUST: 54 → 55, MUST NOT: 27 → 28.

Header and footer updated to proposal/0.0.23.

### 3. `standards/conformance.md` — Add condition 19

**Condition 19 — Ungoverned infrastructure access:** any entity with the ability to access or control systems containing primary operational data is not treated as a service provider, is not disclosed to the governing entity, or is not subject to the service provider obligations and access grant requirements of this standard (LEBOSS-SVC-8, LEBOSS-SVC-9).

Header updated to proposal/0.0.23.

### 4. `glossary/terms.md` — Rewrite Service Provider and Subprocessor

**Service Provider:** Rewritten with functional definition. Any entity with the ability to access or control primary operational data is a service provider. Explicitly includes infrastructure, hosting, and administrative support entities. States that role label does not create exemption. Adds normative rule citations (SVC-1 through SVC-9, ACC-1).

**Subprocessor:** Updated to state explicitly that a subprocessor is a service provider under this standard (LEBOSS-SVC-8), not merely an entity "subject to the same obligations." This closes the interpretation gap where a subprocessor could be treated as categorically different from a service provider.

Header updated to proposal/0.0.23.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §7.0 with definition and MUST NOT rule; version stamps | Normative addition — closes definitional gap |
| `standards/leboss-normative-rules.md` | Add SVC-8, SVC-9; rule count 78 → 80 | Normative addition |
| `standards/conformance.md` | Add condition 19 | Normative addition |
| `glossary/terms.md` | Rewrite Service Provider and Subprocessor | Normative clarification |

**Rule count:** 78 → 80
**MUST count:** 54 → 55 (SVC-8 adds 1 MUST)
**MUST NOT count:** 27 → 28 (SVC-9 adds 1 MUST NOT)
**MAY count:** 5 (unchanged)

---

## Downstream Effect of SVC-8

Because over twenty prior rules depend on the term "service provider" — including ACC-1 (access grant requirement), SVC-5 (disclosure), SVC-3/4 (audit records), SVC-7 (no secondary use) — the new definition extends all of these obligations to infrastructure providers with access capability. No prior rules need to be amended; SVC-8 expands their reach by expanding the definition of who they apply to.

---

## Backward Compatibility

Systems where infrastructure operators already operate under disclosed and governed relationships are unaffected. Systems where infrastructure operators were treated as outside the governance model may now be required to:
- Disclose infrastructure providers with access capability (SVC-5, SVC-8)
- Ensure those providers operate under Access Grant coverage (ACC-1, SVC-9)

This is intentional. The prior state allowed exactly the data access path LEBOSS is designed to prevent.

---

## Sequence Context

- 0.0.21 — Stress test; Scenario 6 identified the undefined "service provider" gap
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closes service provider boundary (SVC-8, SVC-9)

---

*Proposal 0.0.23 — Open for committee review.*
