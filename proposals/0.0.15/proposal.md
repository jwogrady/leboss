# Proposal 0.0.15 — Audit as System of Record

**Status:** Draft
**Target Version:** 0.0.15
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `glossary/terms.md`

---

## Summary

This proposal formalizes that Audit Records are not merely required logs — they are the **authoritative system of record** for governed actions within a LEBOSS-compliant environment. The history of governed actions is the canonical source of truth. A system must not represent a state of a governed resource that cannot be reconciled with its Audit Record history. Audit is not auxiliary to system integrity — it is foundational.

---

## Motivation

The LEBOSS standard already requires that Audit Records be created, retained, and made accessible. Existing rules (LEBOSS-SEC-3, LEBOSS-SVC-3, LEBOSS-SVC-4) establish that audit records must exist and be available.

What the standard has not established is the **authority** of those records. The standard defines audit as a requirement but not as the source of truth. As a result:

1. A system can satisfy audit requirements by recording events while maintaining separate primary state that is never verified against the audit history.
2. Nothing prevents a system from representing resource state that contradicts its audit records.
3. The Audit Trail is defined as "the mechanism by which data ownership is made verifiable" — but the standard never declares that the audit is the authoritative record rather than one record among several.

This proposal closes that gap without prescribing any implementation mechanism.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Add §8.6 Audit as System of Record

Adds a new conformance section establishing the authoritative status of audit records:

- The Audit Record set is the authoritative representation of governed actions
- A system MUST NOT represent resource state irreconcilable with Audit Record history
- Audit is foundational, not supplementary
- No storage or processing prescription — consistency guarantee only

### 2. `standards/leboss-normative-rules.md` — Add REC rule group

Adds `REC` (Audit as System of Record) to the rule numbering registry with four rules:

- **LEBOSS-REC-1**: Audit Records MUST constitute the authoritative record of governed actions
- **LEBOSS-REC-2**: A system MUST NOT represent resource state irreconcilable with Audit Record history
- **LEBOSS-REC-3**: Audit Records MUST be treated as foundational to system integrity
- **LEBOSS-REC-4**: The standard MUST NOT prescribe how the system of record is stored or processed

Rule count: 44 → 48.

### 3. `standards/conformance.md` — Strengthen §3.4 and add condition 8

- §3.4 Audit Records: adds declaration of authoritative status; adds explicit requirement against irreconcilable state
- Non-conformance condition 8: **Irreconcilable state** (LEBOSS-REC-2)

### 4. `glossary/terms.md` — Add three new entries

- **Audit as System of Record** — the principle and its normative scope
- **Irreconcilable State** — the prohibited condition, with precise definition
- **System of Record** — implementation-neutral definition of authoritative record

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §8.6 Audit as System of Record | Normative addition — 3 new requirements |
| `standards/leboss-normative-rules.md` | Add REC group (4 rules) | Normative addition — rule count 44 → 48 |
| `standards/conformance.md` | Strengthen §3.4; add condition 8 | Normative addition — new non-conformance condition |
| `glossary/terms.md` | Add 3 new entries | Clarification — no new requirements |

---

## Backward Compatibility

Existing LEBOSS-aligned or LEBOSS-compliant systems that already maintain consistent audit records are unaffected. The new requirements formalize what a well-functioning audit system already guarantees: that the audit record and the system state agree.

A system that previously satisfied audit requirements through record creation but maintained state independently of those records may now fail conformance under LEBOSS-REC-2. This is intentional — the proposal elevates the audit requirement from "records exist" to "records are authoritative."

---

## Sequence Context

- 0.0.13 — defined the specification/implementation boundary
- 0.0.14 — required that normative requirements be operationally enforced
- 0.0.15 — established audit records as the authoritative system of record

---

*Proposal 0.0.15 — Open for committee review.*
