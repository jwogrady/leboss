# Proposal 0.0.27 — Audit Resolution Requirements

**Status:** Draft
**Target Version:** 0.0.27
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`

---

## Summary

This proposal closes a structural gap identified in the 0.0.21 boundary stress test (Scenario 2: \"The Coarse-Grained Audit Log\"): a system can satisfy all existing audit requirements — REC rules, ACP behavioral rules, immutability guarantees — while producing audit records so coarse that they cannot support meaningful compliance verification.

The existing audit requirements establish that records MUST exist, MUST be immutable, MUST be treated as authoritative, and MUST be available to the governing entity. None of these requirements address the *resolution* of those records: whether they contain enough detail to determine what actually happened, whether the action was within authorized scope, or whether accountability can be assigned independently.

The fix is a new rule group, `AUD`, with six rules (AUD-1 through AUD-6) that define the minimum informational content required for an audit record to satisfy accountability and verifiability obligations under this standard. A new non-conformance condition (condition 23) makes insufficient audit resolution a disqualifying conformance failure.

---

## Motivation

The LEBOSS standard's audit model rests on a chain of obligations:

1. Every governed action MUST be recorded (SEC-3, SVC-3, REC-1)
2. Records MUST be immutable (via Audit Record Collection Protocol, ACP-12 through ACP-14)
3. Records MUST be authoritative (REC-1 through REC-3)
4. Records MUST be available to the governing entity (SVC-4)
5. Records MUST support independent verification of compliance (VER-2, VER-4)

The gap appears at step 5. VER-2 requires that compliance claims be supportable through observable system behavior and audit records. VER-4 requires sufficient visibility for an independent party to verify conformance. But neither rule, nor any rule in the REC group, defines what level of detail in an audit record is sufficient to support that verification.

**The exploitable condition:** A system can produce audit records that document only that a data access event occurred — with no indication of which specific resources were accessed, no record of what operation was performed, no outcome recorded, and no basis for evaluating whether the access was within the authorized grant scope. Every REC rule and every ACP behavioral rule is satisfied. The audit log exists, is immutable, and is available. It is also useless for governance.

This is not a hypothetical. Event-driven logging architectures commonly record event types without resource payloads. Batch processing systems log job completions rather than individual operations. High-volume systems aggregate audit events for storage efficiency. In all these cases, a governing entity who requests their audit history for a compliance review receives a record that tells them events occurred but cannot tell them what those events were, whether they were authorized, or who was accountable.

---

## Specification Changes

### 1. `standards/leboss-normative-rules.md` — Add AUD group and update header, counts, and Gaps

**New rule group: AUD — Audit Resolution Requirements** (6 rules)

- **LEBOSS-AUD-1** (MUST): Audit records must contain sufficient detail to determine what specific resources were accessed or affected, what operation was performed, and the outcome of that operation.
- **LEBOSS-AUD-2** (MUST): Audit records must be sufficiently granular to allow determination of whether the access was within the scope authorized by the applicable Access Grant.
- **LEBOSS-AUD-3** (MUST NOT): A conformant system must not produce audit records that aggregate, summarize, or omit resource-level and operation-level detail in a manner that prevents verification of whether individual governed actions were within authorized scope.
- **LEBOSS-AUD-4** (MUST): Audit records must support reconstruction of governed actions from the audit record alone, without reliance on system state, service provider cooperation, or information not present in the record itself.
- **LEBOSS-AUD-5** (MUST NOT): A conformant system must not produce audit records interpretable only with knowledge of internal system state, internal nomenclature, or conventions unavailable to an independent evaluator.
- **LEBOSS-AUD-6** (MUST NOT): A conformant system must not satisfy audit recording requirements by producing records that document the occurrence of governed events while omitting the detail required to evaluate whether those events were authorized.

**Summary counts updated:** 97 → 103 rules. MUST: 63 → 66. MUST NOT: 37 → 40. MAY: 5 (unchanged).

**Gaps section updated:** through proposal 0.0.27.

**Header updated:** proposal/0.0.26 → proposal/0.0.27.

### 2. `standards/leboss-standard.md` — Add §23 Audit Resolution Requirements

New section establishes the audit resolution doctrine:

- The distinction between audit existence and audit sufficiency
- The gap between satisfying recording requirements and enabling meaningful verification
- What this section does NOT define (no schemas, no formats, no storage systems)
- Key behavioral requirements citing AUD-1 through AUD-6

**ToC updated:** `23. [Audit Resolution Requirements](#23-audit-resolution-requirements)` added.

**Version stamps updated:** proposal/0.0.26 → proposal/0.0.27 throughout.

### 3. `standards/conformance.md` — Add condition 23

**Condition 23 — Insufficient audit resolution:** the system produces audit records that satisfy recording requirements but omit the resource-level or operation-level detail required to verify whether governed actions were within authorized scope, or produces an audit corpus that an independent party cannot use to evaluate governed action legality without access to system state, internal nomenclature, or service provider cooperation (LEBOSS-AUD-3, LEBOSS-AUD-5, LEBOSS-AUD-6).

**Header updated:** proposal/0.0.26 → proposal/0.0.27.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-normative-rules.md` | Add AUD group (6 rules); update summary counts; update Gaps section | Normative addition — defines audit resolution floor |
| `standards/leboss-standard.md` | Add §23; update ToC; update version stamps | Normative addition |
| `standards/conformance.md` | Add condition 23; update header | Normative addition |

**Rule count:** 97 → 103
**MUST count:** 63 → 66 (AUD-1, AUD-2, AUD-4 add 3 MUSTs)
**MUST NOT count:** 37 → 40 (AUD-3, AUD-5, AUD-6 add 3 MUST NOTs)
**MAY count:** 5 (unchanged)

---

## Relationship to Existing Rules

**AUD vs REC:** The REC group establishes that audit records are the authoritative system of record and must be immutable (REC-1 through REC-4). AUD does not modify the system-of-record obligations — it defines the resolution floor that makes those records useful for verification. REC says audit records are authoritative; AUD says they must contain enough to be worth consulting.

**AUD and VER:** VER-2 requires that compliance claims be supportable through observable system behavior and audit records. VER-4 requires sufficient visibility for independent conformance verification. AUD-4 and AUD-6 directly operationalize these requirements within the audit domain: audit records must support independent verification of rule compliance, not merely document that events occurred.

**AUD and ACC:** AUD-2 requires that audit granularity enables evaluation against the applicable Access Grant. This connects audit resolution to grant scope enforcement: an audit corpus that cannot be compared to grant scope cannot support ACC-4 compliance evaluation (a service provider MUST operate only within the scope of explicitly granted access).

**AUD and REC-2:** REC-2 prohibits representing resource state irreconcilably with audit history. AUD extends this: if audit records lack resource-level detail, reconciliation is impossible regardless of intent. AUD does not replace REC-2 — it defines a prerequisite for it.

---

## What This Proposal Does Not Define

This proposal does not define:

- Audit record schemas or field structures
- Logging formats (JSON, structured logging, syslog, etc.)
- Storage systems, retention mechanisms, or log aggregation architecture
- Specific field names, attribute types, or data representations
- Implementation strategies for achieving audit granularity

The standard governs what level of detail must be present in an audit record. How that detail is captured, structured, and stored is an implementation concern deferred to the implementing system and, where applicable, to the Audit Record Collection Protocol (LEBOSS-ACP-1 through ACP-24).

---

## Backward Compatibility

Systems that already produce sufficiently detailed audit records are unaffected. Systems that produce coarse-grained audit logs — documenting event occurrence without resource-level or operation-level specificity — may now be required to increase audit granularity to satisfy AUD-1 through AUD-6.

This is intentional. A system that records only that a data access occurred, without recording what was accessed, what was done to it, or whether the operation completed successfully, provides no meaningful basis for governance accountability — regardless of how immutably that non-information is stored.

---

## Sequence Context

- 0.0.21 — Stress test; Scenario 2 identified the coarse-grained audit gap
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closed service provider boundary (SVC-8, SVC-9)
- 0.0.24 — Aligned protocol requirements with normative rule register (PROT-1 through PROT-5)
- 0.0.25 — Established actor identity portability requirements (ACTOR-1 through ACTOR-6)
- 0.0.26 — Established governing entity authenticity requirements (GEA-1 through GEA-6)
- 0.0.27 — Defines audit resolution floor (AUD-1 through AUD-6)

---

*Proposal 0.0.27 — Open for committee review.*
