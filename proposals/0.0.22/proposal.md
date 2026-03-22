# Proposal 0.0.22 — Primary Operational Data Clarification

**Status:** Draft
**Target Version:** 0.0.22
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`, `glossary/terms.md`

---

## Summary

This proposal closes an exploitable ambiguity in the definition of primary operational data. The prior definition in §6.1 used "includes but is not limited to" preceding an illustrative list of data categories. This structure allowed a technically compliant system to apply a narrow working definition — limited to the listed categories — and produce a structurally valid export that omitted business-critical operational content.

The fix establishes that primary operational data is defined by its functional role in the governed business environment, not by categorical label. A system must treat data as primary operational data if it is materially required for the operation, continuity, accountability, or reconstruction of the governed environment. The illustrative list is retained but explicitly demoted to informative status. An anti-evasion rule is added that prohibits excluding materially required data from ownership, audit, or portability obligations through classification as auxiliary, metadata, configuration, or supplementary content.

---

## Motivation

Boundary Stress Test (proposal/0.0.21, Scenario 1: "The Precisely Incomplete Export") demonstrated that a system could:

1. Export a subset of operational data (e.g., customer records and transactions) while omitting other categories (e.g., communications, workflow configuration, operational notes).
2. Produce a manifest accurately reflecting what was exported.
3. Satisfy all PORT rules — PORT-1 through PORT-6 — for the categories it included.
4. Claim full compliance.

The mechanism enabling this exploit: §6.1's definition of primary operational data was not normatively closed. The phrase "includes but is not limited to" preceding an illustrative list left the boundary of the term open to implementation-level interpretation. PORT-1 requires a complete export of primary operational data — but does not itself define what primary operational data is. §6.1 was the authoritative definition, and that definition was permissively open.

The fix must close the definitional boundary without producing an exhaustive categorical list (which would be rigid, implementation-specific, and require amendment for every new data type) and without narrowing the standard's applicability to specific industries or system designs. The solution is to make the definition functional: data is primary operational data because of its role, not its label.

---

## Specification Changes

### 1. `standards/leboss-standard.md` — §6.1 Primary Data Ownership

**Replace** the "includes but is not limited to" structure with:

- A normative statement that primary operational data is defined by functional role
- A MUST-level requirement to treat materially required data as primary operational data
- A MUST NOT prohibition against excluding materially required data through classification
- The prior illustrative list, explicitly labeled as informative examples rather than a definition
- Addition of "workflow state and operational configuration when materially required for reconstruction" to the illustrative list (addressing the scenario directly)

**Also updated:** preamble (0.0.20 → 0.0.22), blockquote (0.0.20 → 0.0.22), §10 Versioning footer (0.0.20 → 0.0.22), document footer (0.0.20 → 0.0.22).

### 2. `standards/leboss-normative-rules.md` — Add OWN-9 and OWN-10

Two new rules in the Ownership group:

**LEBOSS-OWN-9** — Data MUST be treated as primary operational data if it is materially required for the operation, continuity, accountability, or reconstruction of the governed business environment, regardless of how it is labeled or classified within the implementing system. *(Source: §6.1)*

**LEBOSS-OWN-10** — A conformant system MUST NOT exclude data from primary operational data ownership, audit, or portability obligations by classifying it as auxiliary, metadata, configuration, or supplementary when that data is materially required for continuity, accountability, or reconstruction of the governed environment. *(Source: §6.1)*

Rule count: 76 → 78. OWN group: 8 → 10 rules, MUST count: 5 → 7. Total MUST: 53 → 55.

Header and footer updated to proposal/0.0.22.

### 3. `standards/conformance.md` — §3.5 and §4

**§3.5 Data Portability:** Add two sentences after the PORT-6 bullet, clarifying that export completeness must be evaluated against the functional scope of primary operational data (LEBOSS-OWN-9) and that a system must not satisfy the completeness requirement through a narrow definition that excludes materially required data (LEBOSS-OWN-10).

**§4 Non-Conformance Conditions:** Add condition 18: **Functionally incomplete export** — the system applies a definition of primary operational data narrow enough to exclude data materially required for continuity, accountability, or reconstruction, producing exports that satisfy structural completeness requirements while omitting business-critical operational content (LEBOSS-OWN-10, LEBOSS-PORT-1).

Header updated to proposal/0.0.22.

### 4. `glossary/terms.md` — Primary Operational Data

**Replace** the prior definition (which mirrored the §6.1 illustrative list) with:

- The functional definition: materially required for operation, continuity, accountability, or reconstruction
- An explicit statement that the boundary is functional, not categorical
- A MUST NOT statement against narrowing scope to exclude materially required content
- The illustrative examples, labeled as informative
- Normative rule citations: LEBOSS-OWN-1, LEBOSS-OWN-9, LEBOSS-OWN-10

Header updated to proposal/0.0.22.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | §6.1 functional definition + MUST/MUST NOT + version stamps | Normative clarification — closes definitional gap |
| `standards/leboss-normative-rules.md` | Add OWN-9, OWN-10; rule count 76 → 78 | Normative addition |
| `standards/conformance.md` | §3.5 functional completeness sentence; §4 condition 18 | Normative addition |
| `glossary/terms.md` | Primary Operational Data definition rewritten | Normative clarification |

**Rule count:** 76 → 78
**MUST count:** 53 → 54 (OWN-9 adds 1 MUST)
**MUST NOT count:** 26 → 27 (OWN-10 adds 1 MUST NOT)
**MAY count:** 5 (unchanged)

---

## Backward Compatibility

Systems that already apply a broad, functional interpretation of primary operational data are unaffected — their existing behavior satisfies the new requirements.

Systems that applied a narrow categorical interpretation limited to the illustrative list may now need to expand their definition of primary operational data scope. This is intentional: those systems were exploiting the definitional gap the proposal closes. A system conformant under 0.0.20 using a narrow interpretation was exploiting a gap — not meeting the spirit of the standard. The new rules formalize what was always intended.

No prior OWN, PORT, REC, or VER rules are weakened. All prior rules carry forward unchanged.

---

## Sequence Context

- 0.0.21 — Boundary stress test; Scenario 1 identified the "precisely incomplete export" loophole
- 0.0.22 — Closes the loophole by defining primary operational data functionally and adding anti-evasion rules

---

*Proposal 0.0.22 — Open for committee review.*
