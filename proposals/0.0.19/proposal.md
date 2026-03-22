# Proposal 0.0.19 — Conformance Verification

**Status:** Draft
**Target Version:** 0.0.19
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `glossary/terms.md`

---

## Summary

This proposal defines what it means for a LEBOSS conformance claim to be valid and verifiable. The standard has accumulated a complete set of normative rules across fourteen groups. What it has not established is the structural requirements governing how those rules are evaluated and how compliance is asserted.

A system that satisfies all normative rules but makes no verifiable demonstration of that satisfaction provides no governance guarantee. This proposal closes that gap by formalizing that conformance must be demonstrable through observable system behavior, that partial compliance cannot be represented as full compliance, and that independent verification must be possible without relying on system-reported assertions alone.

---

## Motivation

The LEBOSS standard defines conformance requirements in `standards/conformance.md` and normative rules across fourteen rule groups. What neither document establishes is:

1. That compliance claims must be supportable through evidence — not assertion
2. That partial satisfaction of normative rules may not be represented as full compliance
3. That a system bearing any non-conformance condition cannot validly claim compliance
4. That a system must provide sufficient visibility for independent verification
5. That conformance levels (if any) must be clearly bounded and non-ambiguous
6. That documentation and stated intent are categorically insufficient as compliance evidence

These gaps make LEBOSS conformance claims difficult to evaluate. A system could declare compliance without exposing any means of independent verification. This proposal closes that by elevating verification from an implied expectation to a normative requirement.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Add §19 Conformance Verification

Adds a new section establishing six behavioral requirements for conformance verification:

1. A LEBOSS-compliant system MUST satisfy all applicable normative rules; partial satisfaction MUST NOT be represented as full compliance
2. Compliance claims MUST be supportable through observable behavior and audit records
3. A system MUST NOT claim compliance if any non-conformance condition is present
4. A system MUST provide sufficient visibility for independent verification
5. Where conformance levels are defined, they MUST be clearly bounded; partial satisfaction MUST NOT be represented as meeting a level
6. Verification MUST NOT be satisfied by documentation or stated intent alone

### 2. `standards/leboss-normative-rules.md` — Add VER rule group

Adds `VER` (Conformance Verification Rules) to the rule numbering registry with six rules:

- **LEBOSS-VER-1**: All normative rules MUST be satisfied; partial satisfaction MUST NOT be represented as full compliance
- **LEBOSS-VER-2**: Compliance claims MUST be supportable through observable behavior and audit records; self-declaration MUST NOT constitute a valid claim
- **LEBOSS-VER-3**: A system MUST NOT claim compliance if any non-conformance condition is present
- **LEBOSS-VER-4**: A system MUST provide sufficient visibility for independent verification
- **LEBOSS-VER-5**: Conformance levels MUST be clearly bounded; partial satisfaction MUST NOT be misrepresented
- **LEBOSS-VER-6**: Verification MUST NOT be satisfied by documentation or stated intent alone

Rule count: 70 → 76.

### 3. `standards/conformance.md` — Add §3.10 and conditions 16–17

- §3.10 Conformance Verification: six specific requirements referencing VER rules
- Non-conformance condition 16: **False compliance claim** (LEBOSS-VER-1, VER-3)
- Non-conformance condition 17: **Unverifiable conformance** (LEBOSS-VER-2, VER-4, VER-5, VER-6)

### 4. `glossary/terms.md` — Add two new entries

- **Conformance Claim** — a declaration that a system satisfies a LEBOSS conformance tier; valid only when supportable through observable evidence; normative rules VER-1, VER-2, VER-3
- **Conformance Evidence** — observable artifacts that support a conformance claim; normative rules VER-2, VER-4, VER-6

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §19 with 6 behavioral requirements | Normative addition |
| `standards/leboss-normative-rules.md` | Add VER group (6 rules); rule count 70 → 76 | Normative addition |
| `standards/conformance.md` | Add §3.10; add conditions 16–17 | Normative addition |
| `glossary/terms.md` | Add 2 new entries | Clarification — no new requirements |

---

## Backward Compatibility

Systems that already enforce normative rules operationally and maintain audit records providing observable evidence of conformance are unaffected. These systems can already support independent verification.

A system that claims compliance based solely on documentation, policy declarations, or stated intent — without operational enforcement or observable evidence — may now fail conformance under LEBOSS-VER-2 and LEBOSS-VER-6. This is intentional: the proposal elevates verifiability from an implied expectation to an explicit normative requirement.

---

## Sequence Context

- 0.0.15 — established audit records as the authoritative system of record
- 0.0.16 — defined what constitutes a valid, portable, and interoperable export
- 0.0.17 — defined resource identity and cross-system mapping requirements
- 0.0.18 — defined delegation scope, traceability, and revocation cascade constraints
- 0.0.19 — defined conformance verification: verifiability, evidence requirements, and claim validity

---

*Proposal 0.0.19 — Open for committee review.*
