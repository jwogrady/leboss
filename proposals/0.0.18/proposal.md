# Proposal 0.0.18 — Delegation and Authority Chain Constraints

**Status:** Draft
**Target Version:** 0.0.18
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `standards/objects/access-grant.md`, `glossary/terms.md`

---

## Summary

This proposal formalizes the structural constraints that make **delegated access authority safe** in a LEBOSS-compliant system. The standard already permits delegation — a governing entity may designate a delegate to issue Access Grants on their behalf. What it has not established is the constraints that delegation must satisfy: scope bounding, traceability from any delegated action to its root authority, revocation cascade, and prohibition of implicit or inherited access.

This proposal closes that gap at the standard level, without prescribing delegation architectures, role systems, or implementation mechanisms.

---

## Motivation

The LEBOSS access control doctrine requires explicit, scoped Access Grants (§6.3, LEBOSS-ACC-1). The Access Grant Protocol (§12) operationalizes grants at the behavioral level. The Access Grant object (`objects/access-grant.md`) defines the `delegated_from` field and notes that "a delegate MUST NOT issue grants with broader scope or permissions than their own delegated authority."

What the standard has not established is the **structural constraints on delegation chains**:

1. The scope-bounding requirement exists only at the protocol level (AGP §4.3), not at the standard level. A conformance claim cannot be made against a protocol rule alone.
2. Nothing in the standard requires that a delegation chain be fully traceable to a root governing entity grant — only that individual delegated grants reference their immediate originator.
3. Nothing in the standard requires revocation cascade — that revoking a parent grant automatically invalidates all dependent delegated grants.
4. `objects/access-grant.md` §5 explicitly states: "The delegation model itself is not fully specified in this version and will be addressed in a future proposal."

This proposal closes that deferred item.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Add §18 Delegation and Authority Chains

Adds a new section establishing six behavioral requirements for delegation:

1. Delegated authority MUST NOT exceed the scope of the delegating grant
2. A delegated grant MUST reference its originating grant
3. Delegation chains MUST be fully traceable to the root governing entity grant
4. Revocation MUST propagate to all dependent delegated grants
5. A conformant system MUST NOT permit chains that create untraceable or ambiguous authority
6. Delegation MUST NOT create implicit or inherited access

### 2. `standards/leboss-normative-rules.md` — Add DEL rule group

Adds `DEL` (Delegation and Authority Chain Rules) to the rule numbering registry with six rules:

- **LEBOSS-DEL-1**: Scope bounding — delegated authority MUST NOT exceed the delegator's grant
- **LEBOSS-DEL-2**: Originating reference — a delegated grant MUST reference its originating grant
- **LEBOSS-DEL-3**: Full traceability — delegation chains MUST trace to the root governing entity grant
- **LEBOSS-DEL-4**: Revocation cascade — revocation MUST propagate to all dependent grants
- **LEBOSS-DEL-5**: No untraceable chains — system MUST NOT permit ambiguous or unauditable chains
- **LEBOSS-DEL-6**: No implicit access — delegation MUST NOT create implicit or inherited access

Rule count: 64 → 70.

### 3. `standards/conformance.md` — Add §3.9 and conditions 14–15

- §3.9 Delegation and Authority Chains: six specific requirements referencing DEL rules
- Non-conformance condition 14: **Unbounded delegation** (LEBOSS-DEL-1)
- Non-conformance condition 15: **Untraceable authority chain** (LEBOSS-DEL-3, DEL-4, DEL-5)

### 4. `standards/objects/access-grant.md` — Resolve §5 deferred item

Replaces the "delegation model not fully specified" note in §5 with a reference to LEBOSS-DEL-1 through DEL-6 (proposal 0.0.18).

### 5. `glossary/terms.md` — Add two new entries

- **Authority Chain** — the traceable sequence of grants from a delegated action to the root governing entity grant; normative rules DEL-2, DEL-3, DEL-4
- **Delegated Grant** — an Access Grant issued by a delegate; normative rules DEL-1, DEL-2, DEL-5, DEL-6

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §18 with 6 behavioral requirements | Normative addition |
| `standards/leboss-normative-rules.md` | Add DEL group (6 rules); rule count 64 → 70 | Normative addition |
| `standards/conformance.md` | Add §3.9; add conditions 14–15 | Normative addition |
| `standards/objects/access-grant.md` | Resolve §5 deferred delegation model note | Clarification |
| `glossary/terms.md` | Add 2 new entries | Clarification — no new requirements |

---

## Backward Compatibility

Systems that already enforce delegation scope bounding and audit delegation chains are unaffected. The new rules formalize what a well-designed access control mechanism already guarantees.

A system that permits delegates to issue grants beyond their own scope, does not propagate revocations through delegation chains, or permits opaque delegation structures may now fail conformance under LEBOSS-DEL-1, LEBOSS-DEL-4, or LEBOSS-DEL-5. This is intentional — the proposal elevates delegation constraints from implied to normative.

---

## Sequence Context

- 0.0.15 — established audit records as the authoritative system of record
- 0.0.16 — defined what constitutes a valid, portable, and interoperable export
- 0.0.17 — defined resource identity and cross-system mapping requirements
- 0.0.18 — defined delegation scope, traceability, and revocation cascade constraints

---

*Proposal 0.0.18 — Open for committee review.*
