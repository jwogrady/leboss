# Proposal 0.0.16 — Data Portability Format Requirements

**Status:** Draft
**Target Version:** 0.0.16
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `glossary/terms.md`

---

## Summary

This proposal formalizes what constitutes a **valid, portable, and interoperable export** in a LEBOSS-compliant system. The standard already requires that exports exist and be machine-readable. What it has not specified is what makes an export *sufficient* — complete enough to reconstruct the governed environment elsewhere, relationship-preserving, independent of proprietary tooling, and verifiable by the governing entity without vendor involvement.

This proposal closes that gap at the standard level, without prescribing any specific format, schema, or transport mechanism.

---

## Motivation

The LEBOSS standard establishes data portability as a normative requirement (§6.4, LEBOSS-OWN-3, LEBOSS-SVC-1). The Data Portability Protocol (`leboss-data-portability-protocol.md`) defines behavioral rules for export authority, scope, and completeness (LEBOSS-DPP-1 through DPP-28).

What the standard has not established is the **definition of a valid export** — the structural guarantees an export must satisfy to be considered portable. As a result:

1. A system can produce an "export" that omits governance objects or audit history and technically satisfy the letter of the portability requirement.
2. Nothing in the standard requires that exported data be sufficient to reconstruct the governed state — an export of raw data with no relationship information satisfies existing rules.
3. Nothing in the standard prohibits proprietary export formats that require vendor tools to decode, making portability nominal rather than operational.
4. GAP-3 in the normative rule register identifies the canonical encoding as partially unresolved. This proposal addresses the structural requirements; format encoding remains deferred.

This proposal closes the gap on what makes an export valid without prescribing how export is implemented.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Expand §6.4 Data Portability

Adds five numbered requirements defining what constitutes a valid export:

1. **Completeness** — must include primary operational data, all governance objects, and all Audit Records within the retention window; no category omitted without governing entity authorization
2. **Relationship preservation** — structural relationships between resources, governance objects, and Audit Records must be recoverable from the export alone
3. **Reconstructability** — must be sufficient to rebuild the governed environment's operational state in an independent system
4. **Format independence** — must use documented, non-proprietary formats with documentation sufficient for independent implementation
5. **Manifest** — must include a manifest of categories, time range, and record counts for independent verification

### 2. `standards/leboss-normative-rules.md` — Add PORT rule group

Adds `PORT` (Data Portability Requirements) to the rule numbering registry with six rules:

- **LEBOSS-PORT-1**: Completeness — complete export MUST include all primary operational data, governance objects, and Audit Records
- **LEBOSS-PORT-2**: A conformant system MUST NOT produce an export omitting any governed resource category without authorization
- **LEBOSS-PORT-3**: Relationship preservation — structural relationships MUST be recoverable from the export alone
- **LEBOSS-PORT-4**: Reconstructability — export MUST be sufficient to rebuild operational state independently
- **LEBOSS-PORT-5**: Format independence — exports MUST use documented, non-proprietary formats
- **LEBOSS-PORT-6**: Manifest — exports MUST include a manifest for independent completeness verification

Rule count: 52 → 58.

Updates GAP-3 status to reflect resolution of structural requirements in 0.0.16.

### 3. `standards/conformance.md` — Strengthen §3.5 and add conditions 10–11

- §3.5 Data Portability: adds five specific portability conformance requirements referencing PORT rules
- Non-conformance condition 10: **Non-reconstructable export** (LEBOSS-PORT-4)
- Non-conformance condition 11: **Proprietary format dependency** (LEBOSS-PORT-5)

### 4. `glossary/terms.md` — Add three new entries

- **Complete Export** — the completeness requirement defined at standard level; normative rules PORT-1, PORT-2
- **Export Manifest** — the structured verification artifact required with every export; normative rule PORT-6
- **Reconstructable Export** — the reconstructability and format independence requirement; normative rules PORT-3, PORT-4, PORT-5

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Expand §6.4 with 5 portability requirements | Normative addition |
| `standards/leboss-normative-rules.md` | Add PORT group (6 rules); rule count 52 → 58 | Normative addition |
| `standards/conformance.md` | Strengthen §3.5; add conditions 10–11 | Normative addition |
| `glossary/terms.md` | Add 3 new entries | Clarification — no new requirements |

---

## Backward Compatibility

Existing systems that produce complete, non-proprietary, independently usable exports are unaffected. The new requirements formalize what a well-designed portability mechanism already guarantees.

A system that previously satisfied portability requirements by producing partial exports, exports in proprietary formats, or exports without relationship information may now fail conformance under LEBOSS-PORT-2, LEBOSS-PORT-4, or LEBOSS-PORT-5. This is intentional — the proposal elevates the portability requirement from "exports exist" to "exports are usable."

---

## Sequence Context

- 0.0.13 — defined the specification/implementation boundary
- 0.0.14 — required that normative requirements be operationally enforced
- 0.0.15 — established audit records as the authoritative system of record
- 0.0.16 — defined what constitutes a valid, portable, and interoperable export

---

*Proposal 0.0.16 — Open for committee review.*
