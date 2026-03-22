# Proposal 0.0.25 — Actor Identity Portability

**Status:** Draft
**Target Version:** 0.0.25
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`

---

## Summary

This proposal closes an accountability continuity gap identified in the 0.0.21 boundary stress test: actor identity references in governance objects are not required to be portable or interpretable across systems. A governing entity who exports their audit history and migrates to a new environment may find that actor references in Audit Records — who performed each action — cannot be resolved without access to the originating system's identity infrastructure.

The fix is minimal: a new rule group, `ACTOR`, establishes that actor identity in governance objects must be portable and that exports must include sufficient context to preserve accountability semantics. Six rules (ACTOR-1 through ACTOR-6) define what portability requires without prescribing identity systems, authentication mechanisms, or identifier formats. A new non-conformance condition (condition 21) makes opaque actor identity a detectable conformance failure.

---

## Motivation

The LEBOSS governance model requires that every governed action be auditable — that the governing entity can determine what happened, to which resources, and who was accountable. This requirement is expressed across multiple rules: LEBOSS-SEC-3, LEBOSS-SVC-3, LEBOSS-SVC-4, LEBOSS-REC-1, and the full ACP protocol (LEBOSS-ACP-1 through ACP-24).

Audit Records and Access Grants reference actors. What the standard has not established is that those references must remain interpretable after export and migration.

**The exploitable condition:** A system stores actor identity as internal identifiers — a database-assigned user ID, a session-scoped token, an internal role code. The export faithfully includes these identifiers. A receiving system imports the audit history. The governance record shows that "user_id: 5847" revoked an Access Grant at a specific time — but no independent party can determine who user_id 5847 was. Accountability is structurally present but semantically opaque.

This breaks:

- The governing entity's ability to understand their own governance history after migration
- VER rules (LEBOSS-VER-2, VER-4): compliance claims must be supportable through observable audit records — but opaque actor references prevent independent verification
- PORT rules (LEBOSS-PORT-4): exports must be sufficient to reconstruct the governed environment independently — but an audit history with unresolvable actor references is not independently usable

No existing rule requires that actor identity be portable or that exports include sufficient context to interpret actor references. The MAP rules (MAP-1 through MAP-6) address resource identity. This proposal addresses actor identity as a distinct concern.

---

## Specification Changes

### 1. `standards/leboss-normative-rules.md` — Add ACTOR group and update counts

**New rule group: ACTOR — Actor Identity Portability Rules** (6 rules)

- **LEBOSS-ACTOR-1** (MUST): Actor identity references in governance objects must be portable — carrying sufficient context to remain interpretable in a receiving system without access to the originating system's internal state or identity infrastructure.
- **LEBOSS-ACTOR-2** (MUST NOT): A conformant system must not export governance objects containing actor identity references that are meaningful only within the originating system's internal state and are not accompanied by sufficient context for interpretation in a receiving system.
- **LEBOSS-ACTOR-3** (MUST): An export must include sufficient actor identity context for each actor referenced in governance objects to enable a receiving system to determine the accountable party for each governed action without access to the source system or its service providers.
- **LEBOSS-ACTOR-4** (MUST NOT): Governance history must not become opaque as a result of actor identity resolution failure after export or migration. An export that renders actor references in Audit Records unresolvable or uninterpretable does not satisfy this standard.
- **LEBOSS-ACTOR-5** (MUST): Actor identity portability must preserve accountability semantics — it is not sufficient that an actor identifier be structurally present in an export; the identity information must be sufficient to determine accountability for each governed action in a new environment.
- **LEBOSS-ACTOR-6** (MUST NOT): Actor identity in governance objects must not depend on systems or infrastructure external to the governed environment that are unavailable to or inaccessible by an independent receiving system.

**Summary counts updated:** 85 → 91 rules. MUST: 57 → 60. MUST NOT: 31 → 34. MAY: 5 (unchanged).

**Gaps section header updated:** proposal/0.0.24 → proposal/0.0.25.

**Header and footer updated:** proposal/0.0.24 → proposal/0.0.25.

### 2. `standards/leboss-standard.md` — Add §21 Actor Identity Portability

New section establishes the actor identity portability doctrine:

- The accountability gap: governance objects reference actors using identifiers that may be system-internal and not interpretable after export
- What portability requires: sufficient context to determine accountability without the source system
- Accountability semantics distinction: structural presence of an identifier is not the same as interpretability
- Cross-reference to ACTOR-1 through ACTOR-6

**ToC updated:** §21 entry added.

**Version stamps updated:** proposal/0.0.24 → proposal/0.0.25 throughout (header, history, §10, footer).

### 3. `standards/conformance.md` — Add condition 21

**Condition 21 — Opaque actor identity:** the system exports governance objects — including Audit Records, Access Grants, or Integration Descriptors — in which actor identity references are not interpretable in a receiving system, or produces an export in which actor accountability cannot be determined without access to the originating system's identity infrastructure or internal state (LEBOSS-ACTOR-2, LEBOSS-ACTOR-4).

**Header updated:** proposal/0.0.24 → proposal/0.0.25.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-normative-rules.md` | Add ACTOR group (6 rules); update summary counts; update header/footer | Normative addition |
| `standards/leboss-standard.md` | Add §21; update ToC; update version stamps | Normative addition |
| `standards/conformance.md` | Add condition 21; update header | Normative addition |

**Rule count:** 85 → 91
**MUST count:** 57 → 60 (ACTOR-1, ACTOR-3, ACTOR-5 add 3 MUSTs)
**MUST NOT count:** 31 → 34 (ACTOR-2, ACTOR-4, ACTOR-6 add 3 MUST NOTs)
**MAY count:** 5 (unchanged)

---

## What This Proposal Does Not Define

This proposal governs the portability and interpretability of actor identity in governance objects. It does not define:

- Identity systems, authentication mechanisms, or authorization protocols
- Identifier formats (UUIDs, email addresses, or any other structure)
- Specific identity providers or directory services
- Implementation-specific identity models or federation patterns
- How identity context is stored, structured, or encoded in exports

The standard governs **what must be true about actor identity portability** — that references remain interpretable and accountability semantics are preserved. How that requirement is satisfied is implementation-defined.

---

## Relationship to Existing Rules

| Existing Rule | Relationship |
|---------------|-------------|
| LEBOSS-MAP-1 through MAP-6 | MAP rules govern *resource* identity portability. ACTOR rules govern *actor* identity portability. These are complementary, non-overlapping concerns. |
| LEBOSS-PORT-4 | Exports must be sufficient to reconstruct the governed environment independently. ACTOR-3 and ACTOR-5 make this requirement concrete for the actor identity dimension. |
| LEBOSS-VER-2, VER-4 | Compliance claims must be supportable through observable audit records. Opaque actor references prevent independent verification — ACTOR rules close the gap. |
| LEBOSS-REC-1, REC-3 | Audit Records are the authoritative record of governed actions. ACTOR rules ensure that record remains authoritative after migration, not just within the originating system. |
| LEBOSS-ACP (protocol) | ACP defines capture, retention, and integrity requirements for Audit Records. ACTOR rules extend those requirements to require that records remain interpretable across system boundaries. |

---

## Backward Compatibility

Systems where exported governance objects include sufficient actor identity context are unaffected. Systems that export actor identifiers as opaque system-internal references may now be required to:

- Include actor identity context alongside system-internal identifiers in governance object exports
- Ensure that actor references in Audit Records are interpretable to a receiving system

This is intentional. The prior state allowed a system to produce exports that were technically complete while rendering accountability history uninterpretable outside the originating environment.

---

## Sequence Context

- 0.0.21 — Stress test; identified protocol normativity gap and actor identity portability gap
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closed service provider boundary (SVC-8, SVC-9)
- 0.0.24 — Aligned protocol requirements with normative rule register (PROT-1 through PROT-5)
- 0.0.25 — Establishes actor identity portability requirements (ACTOR-1 through ACTOR-6)

---

*Proposal 0.0.25 — Open for committee review.*
