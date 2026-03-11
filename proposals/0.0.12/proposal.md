# Proposal 0.0.12 — Conformance Terminology Standardization

**Status:** Draft
**Author:** Community
**Target Version:** 0.0.12
**Scope:** `standards/conformance.md`, `glossary/terms.md`, `presentations/slidev/governance.md`

---

## Summary

This proposal standardizes conformance terminology across all LEBOSS documents. It formally declares the two-tier conformance model that already exists implicitly in the standard, resolves an undefined third term ("LEBOSS-conformant"), and ensures all documents use consistent language.

---

## Motivation

The LEBOSS standard uses three conformance adjectives:

- **LEBOSS-aligned** — used in `standards/leboss-standard.md` §8 for structural/architectural conformance
- **LEBOSS-compliant** — used throughout all protocol documents and `standards/conformance.md` for full normative conformance
- **LEBOSS-conformant** — appears once in `presentations/slidev/governance.md` without definition

The two-tier distinction between "aligned" and "compliant" is coherent and deliberate — it exists in the standard — but it is never stated. As a result:

1. Implementers reading the standard cannot determine whether "LEBOSS-aligned" and "LEBOSS-compliant" are synonyms or distinct claims.
2. The glossary Compliance entry does not capture the two-tier model.
3. "LEBOSS-conformant" introduces a third, undefined term.

This proposal fixes the declaration gap without introducing new normative requirements.

---

## Specification Changes

### 1. `standards/conformance.md` — Add Conformance Tiers section

Insert a new §1 "Conformance Tiers" section (informative) before the existing requirements, and renumber existing sections:

**New §1 — Conformance Tiers (Informative)**

```
LEBOSS defines two conformance tiers:

**LEBOSS-aligned** — A system that preserves the LEBOSS ownership hierarchy,
data boundaries, dependency rules, and access control relationships defined in
the Reference Model (§5 of the base standard). LEBOSS-aligned is the structural
conformance claim. It asserts that the system's architecture is organized
consistently with the LEBOSS model, regardless of the internal naming used.

**LEBOSS-compliant** — A system that satisfies all MUST-level requirements in
`standards/conformance.md` §3 (Minimum Requirements). LEBOSS-compliant is the
normative conformance claim. It asserts full behavioral conformance with all
protocols, governance object rules, and data ownership requirements.

All LEBOSS-compliant systems are also LEBOSS-aligned. LEBOSS-aligned systems
are not required to be LEBOSS-compliant.

The term "LEBOSS-conformant" is not a defined LEBOSS conformance term and
MUST NOT be used as a conformance claim.
```

### 2. `glossary/terms.md` — Update Compliance entry

Replace:

```
## Compliance

Alignment with the normative requirements of the LEBOSS standard. A system that
meets all structural, organizational, and data ownership requirements of the
applicable published version of the standard may be described as LEBOSS-compliant.

Formal compliance criteria are to be defined in a subsequent version of the standard.
```

With:

```
## Compliance

LEBOSS defines two conformance tiers:

**LEBOSS-aligned** — The structural conformance claim. A system that preserves
the LEBOSS ownership hierarchy, data boundaries, dependency rules, and access
control relationships defined in the Reference Model, regardless of the internal
naming used.

**LEBOSS-compliant** — The normative conformance claim. A system that satisfies
all MUST-level requirements in `standards/conformance.md`. All LEBOSS-compliant
systems are also LEBOSS-aligned.

Conformance requirements are defined in [`standards/conformance.md`](../standards/conformance.md).
```

### 3. `presentations/slidev/governance.md` — Fix lone "LEBOSS-conformant"

Replace "LEBOSS-conformant" with "LEBOSS-compliant" at the single occurrence.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/conformance.md` | Add informative §1 Conformance Tiers | Informative — no new MUST/SHOULD requirements |
| `glossary/terms.md` | Update Compliance entry | Clarification — no change to existing definitions |
| `presentations/slidev/governance.md` | Replace "LEBOSS-conformant" with "LEBOSS-compliant" | Correction |

---

## Backward Compatibility

This proposal adds no new normative requirements. Existing implementations that call themselves LEBOSS-aligned or LEBOSS-compliant are unaffected — the proposal declares what was already implicit in the standard. No existing rule changes.

---

*Proposal 0.0.12 — Community contribution. Open for committee review.*
