# Proposal 0.0.17 — Cross-System Resource Identity and Mapping

**Status:** Draft
**Target Version:** 0.0.17
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `standards/leboss-resource-model.md`, `glossary/terms.md`

---

## Summary

This proposal defines the requirements for **stable resource identity and cross-system mapping** in a LEBOSS-compliant system. The standard already requires that exports be complete, relationship-preserving, and reconstructable. What it has not specified is what must be true about resource identity to make that reconstruction operationally achievable — specifically, that identity must survive export and import unaltered, and that a receiving system must be able to map imported resources to internal equivalents without source system access.

This proposal closes that gap at the standard level, without prescribing identifier formats, schemas, mapping algorithms, or implementation details.

---

## Motivation

The LEBOSS standard establishes data portability as a normative requirement (§6.4, LEBOSS-OWN-3, LEBOSS-SVC-1). Proposal 0.0.16 defined what constitutes a valid export: complete, relationship-preserving, reconstructable, format-independent, and manifest-bearing.

What remains undefined is the **identity layer** that makes cross-system reconstruction possible. As a result:

1. A system can produce a complete, well-structured export whose resource identities are system-internal values — meaningful only within the source system's database — with no path to resolution in a receiving system.
2. Nothing in the standard requires that a receiving system be able to map imported resources to internal equivalents; the import side of portability is unspecified.
3. Nothing in the standard requires that structural relationships between resources remain resolvable after import.
4. The Resource Model (`leboss-resource-model.md` §9) explicitly defers "cross-environment resource mapping" to a future proposal. This proposal closes that deferred item.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Add §17 Cross-System Resource Identity and Mapping

Adds a new section after §16 (Resource Model) establishing six behavioral requirements:

1. Every governed resource MUST have a stable identity within its environment
2. Resource identity MUST persist through export and import without alteration
3. Exports MUST include sufficient identity information for independent mapping
4. A receiving system MUST be able to map imported resources without source system access
5. Structural relationships MUST remain resolvable after import
6. Identity and mapping MUST NOT depend on proprietary mechanisms

### 2. `standards/leboss-normative-rules.md` — Add MAP rule group

Adds `MAP` (Cross-System Resource Identity and Mapping Rules) to the rule numbering registry with six rules:

- **LEBOSS-MAP-1**: Stable identity — governed resources MUST have stable identity within their environment
- **LEBOSS-MAP-2**: Identity persistence — identity MUST persist through export and import without alteration
- **LEBOSS-MAP-3**: Export sufficiency — exports MUST include sufficient identity information for independent mapping
- **LEBOSS-MAP-4**: Receiving system mapping — receiving system MUST be able to map imported resources without source system access
- **LEBOSS-MAP-5**: Relationship resolvability — structural relationships MUST remain resolvable after import
- **LEBOSS-MAP-6**: No proprietary dependency — identity and mapping MUST NOT depend on proprietary mechanisms

Rule count: 58 → 64.

### 3. `standards/conformance.md` — Add §3.8 and conditions 12–13

- §3.8 Cross-System Resource Identity and Mapping: six specific requirements referencing MAP rules
- Non-conformance condition 12: **Identity-breaking import** (LEBOSS-MAP-4)
- Non-conformance condition 13: **Proprietary identity dependency** (LEBOSS-MAP-6)

### 4. `standards/leboss-resource-model.md` — Resolve §9 deferred item

Removes the "Cross-environment resource mapping — deferred" item from §9 Model Boundaries and adds a reference to LEBOSS-MAP-1 through MAP-6.

### 5. `glossary/terms.md` — Add two new entries

- **Cross-System Resource Mapping** — the mapping requirement for receiving systems; normative rules MAP-3, MAP-4, MAP-5, MAP-6
- **Identity Portability** — identity persistence through export and import; normative rules MAP-1, MAP-2

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §17 with 6 behavioral requirements | Normative addition |
| `standards/leboss-normative-rules.md` | Add MAP group (6 rules); rule count 58 → 64 | Normative addition |
| `standards/conformance.md` | Add §3.8; add conditions 12–13 | Normative addition |
| `standards/leboss-resource-model.md` | Resolve §9 deferred item | Clarification — no new requirements |
| `glossary/terms.md` | Add 2 new entries | Clarification — no new requirements |

---

## Backward Compatibility

Existing systems that produce complete, format-independent exports with stable, namespace-qualified identifiers — as already required by LEBOSS-RM-4 and LEBOSS-RM-5 — are unaffected. The new requirements formalize what a well-designed portability mechanism already guarantees on the identity layer.

A system whose resource identifiers are system-internal values with no external resolution path, or whose export omits identity context sufficient for a receiving system to perform mapping, may now fail conformance under LEBOSS-MAP-3 or LEBOSS-MAP-4. This is intentional — the proposal elevates identity portability from implied to normative.

---

## Sequence Context

- 0.0.14 — required that normative requirements be operationally enforced
- 0.0.15 — established audit records as the authoritative system of record
- 0.0.16 — defined what constitutes a valid, portable, and interoperable export
- 0.0.17 — defined what must be true about resource identity for cross-system migration to be achievable

---

*Proposal 0.0.17 — Open for committee review.*
