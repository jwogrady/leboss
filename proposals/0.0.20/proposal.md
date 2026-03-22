# Proposal 0.0.20 — Structural Normalization

**Status:** Draft
**Target Version:** 0.0.20
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `glossary/terms.md`

---

## Summary

This proposal improves the internal consistency, cross-reference accuracy, and terminology of the LEBOSS standard without changing its meaning. No new requirements are introduced. No existing requirements are removed. All changes are editorial or structural.

---

## Motivation

Through proposals 0.0.13–0.0.19, the standard grew from 34 rules to 76 across thirteen rule groups, with four new protocol sections (§16–§19) added to the base standard. These additions introduced four categories of structural drift that this proposal resolves:

1. **Stale version references** — `leboss-standard.md` retained "0.0.12" in three locations (preamble, preamble quotation block, §10 Versioning) after the standard was carried forward through 0.0.19.

2. **Terminology inconsistency** — §5.4 dependency rules 4 and 5 used the pre-normalization term "root owner" while the rest of the standard uses "governing entity" (the term defined in the glossary and used throughout all other normative contexts).

3. **Invalid rule cross-references in §14** — The Audit Record Collection Protocol mapping table referenced `LEBOSS-OBJ-AR-1`, `LEBOSS-OBJ-AR-3`, and `LEBOSS-OBJ-AR-4`. These are object-level rule identifiers from `standards/objects/audit-record.md` — they do not appear in the normative rule register (`leboss-normative-rules.md`) and are inconsistent with the register-based cross-reference convention used in §12 and §13. The overlapping register-level rules (`LEBOSS-REC-1`, `LEBOSS-REC-3`) are the correct references.

4. **Misaligned rule cross-references in §15** — The Data Portability Protocol mapping table referenced `LEBOSS-CONT-1` through `CONT-4`. These are Continuity rules governing succession planning and operational resilience — not data portability protocol requirements. The PORT rules (`LEBOSS-PORT-1` through `PORT-6`), added in proposal 0.0.16 specifically to define data portability requirements, are the correct references. `LEBOSS-OWN-3` and `LEBOSS-SVC-1`/`SVC-2` are also applicable and were absent from the table.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — Six targeted edits

| Location | Change | Category |
|----------|--------|----------|
| Header | "Updated Through" → proposal/0.0.20 | Version stamp |
| Preamble (body) | "proposals 0.0.1 through 0.0.12" → "0.0.1 through 0.0.20" | Stale reference |
| Preamble (blockquote) | "proposals 0.0.1 through 0.0.12" → "0.0.1 through 0.0.20" | Stale reference |
| §5.4 rules 4–5 | "root owner" → "governing entity" (2 instances) | Terminology |
| §10 Versioning | "updated through proposal/0.0.12" → "0.0.20" | Stale reference |
| §14 mapping table | Replace OBJ-AR-1, OBJ-AR-3, OBJ-AR-4 rows with REC-1, REC-3 | Cross-reference |
| §15 mapping table | Replace CONT-1 through CONT-4 with OWN-3, SVC-1, SVC-2, PORT-1 through PORT-6 | Cross-reference |
| Footer | "updated through proposal/0.0.19" → "0.0.20" | Version stamp |

### 2. `standards/leboss-normative-rules.md`

- Header and footer updated to proposal/0.0.20. No rule content changed.

### 3. `standards/conformance.md`

- Header updated to proposal/0.0.20. No conformance requirement changed.

### 4. `glossary/terms.md`

- Header updated to proposal/0.0.20. No definition changed.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Version reference corrections; terminology normalization; cross-reference alignment in §14 and §15 | Structural — no meaning change |
| `standards/leboss-normative-rules.md` | Header/footer only | Version stamp |
| `standards/conformance.md` | Header only | Version stamp |
| `glossary/terms.md` | Header only | Version stamp |

**Rule count:** 76 (unchanged)
**MUST/MUST NOT/MAY counts:** unchanged

---

## Backward Compatibility

This proposal introduces no new requirements and removes none. Systems conformant under 0.0.19 are conformant under 0.0.20 without modification. The §14 and §15 cross-reference corrections describe the same behavioral requirements — they correct which rule identifiers are cited as the basis for protocol sections, not the protocol requirements themselves.

---

## Sequence Context

- 0.0.16 — defined PORT rules (LEBOSS-PORT-1 through PORT-6) for data portability
- 0.0.17 — added §17 and MAP rules (cross-system resource identity and mapping)
- 0.0.18 — added §18 and DEL rules (delegation and authority chains)
- 0.0.19 — added §19 and VER rules (conformance verification)
- 0.0.20 — structural normalization: terminology, version references, cross-references

---

*Proposal 0.0.20 — Open for committee review.*
