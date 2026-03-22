# Proposal 0.0.28 — Delegation Chain Lifetime Integrity

**Status:** Draft
**Target Version:** 0.0.28
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`

---

## Summary

This proposal closes a temporal integrity gap identified in the 0.0.21 boundary stress test (Scenario 4: \"The Audit-Retention Cliff\"): a delegation chain can satisfy all structural DEL rules — correct scope, traceable to root, no ambiguity — while the audit evidence that makes that chain independently verifiable expires under normal retention policy.

The DEL group (DEL-1 through DEL-6) establishes structural constraints on delegation: a delegate cannot exceed the authority that delegated to them, every delegation must reference its origin, chains must trace to the root governing entity grant, and revocation must propagate. These rules are enforced at the time of issuance and evaluation. None of them require that the evidence supporting the chain remain available for as long as the chain is active.

The fix is a new rule group, `DCL`, with six rules (DCL-1 through DCL-6) that bind delegation authority to the continued existence of its verifiable evidence. A delegation chain that has become unverifiable — for any reason — cannot continue to authorize access under this standard. A new non-conformance condition (condition 24) makes unverifiable delegation chain lifetime a disqualifying conformance failure.

---

## Motivation

The LEBOSS delegation model requires that every delegated grant trace back to a root governing entity grant (DEL-3). This traceability requirement is structural: it governs the form of the chain at the time it is evaluated. It does not govern the persistence of the evidence that supports that evaluation.

Consider the following scenario:

1. The governing entity issues a root grant (Grant A) to Service Provider B.
2. Service Provider B delegates a subset of that authority to Integration C (Grant B, referencing Grant A).
3. Audit records for Grant A's issuance — the root governing entity grant — are created at the time of issuance.
4. Six months later, audit records for Grant A expire under the system's retention policy.
5. Integration C continues to operate under Grant B.
6. An independent evaluator attempts to verify the delegation chain: Grant B → Grant A → governing entity.
7. The root audit records are gone. The chain traces structurally in the system's internal state, but cannot be independently validated.

Under the current standard, step 6 reveals no conformance failure. DEL-3 is satisfied because the system can assert the chain. But assertion by the system is not independent validation — and the audit evidence required to support independent validation no longer exists.

**The exploitable condition:** A service provider can maintain active delegation authority while the evidence that would allow an independent party — including the governing entity — to verify the legitimacy of that authority has expired. The governing entity cannot independently confirm that their authority actually granted what is being exercised on their behalf.

This gap is particularly significant because it allows authority chains to persist beyond the point at which the governing entity could meaningfully audit them. The purpose of the traceability requirement (DEL-3) is to ensure that authority is always traceable to the governing entity's actual authorization. That purpose is defeated if the records supporting that traceability do not persist as long as the authority they support.

---

## Specification Changes

### 1. `standards/leboss-normative-rules.md` — Add DCL group and update header, counts, and Gaps

**New rule group: DCL — Delegation Chain Lifetime Rules** (6 rules)

- **LEBOSS-DCL-1** (MUST): A delegation chain must remain independently verifiable for its entire active lifetime — meaning the chain can be traced to a valid root governing entity grant through evidence that does not rely on assertions made by the implementing system or its service providers.
- **LEBOSS-DCL-2** (MUST NOT): A conformant system must not maintain active delegation grants whose authority chain cannot be independently validated. A delegation chain that has become unverifiable — whether through loss of supporting audit evidence or any other cause — must be treated as having no valid authority.
- **LEBOSS-DCL-3** (MUST): The audit evidence supporting each step in a delegation chain must persist for at least as long as the delegation remains active. A delegation chain that outlives the verifiable record of its origin does not satisfy this standard.
- **LEBOSS-DCL-4** (MUST NOT): A conformant system must not allow a delegation chain to remain active after the supporting audit records establishing the root governing entity grant have become unavailable or irrecoverable.
- **LEBOSS-DCL-5** (MUST): Loss of verifiability in any link of a delegation chain must propagate as a validity failure to all grants in that chain. A delegation chain is only as verifiable as its least-verified link.
- **LEBOSS-DCL-6** (MUST NOT): A conformant system must not substitute its own assertions, internal state, or configuration as evidence of delegation authority when independent audit evidence is unavailable. System trust is not a substitute for independently verifiable evidence.

**Summary counts updated:** 103 → 109 rules. MUST: 66 → 69. MUST NOT: 40 → 43. MAY: 5 (unchanged).

**Gaps section updated:** through proposal 0.0.28.

**Header updated:** proposal/0.0.27 → proposal/0.0.28.

### 2. `standards/leboss-standard.md` — Add §24 Delegation Chain Lifetime Integrity

New section establishes the delegation lifetime doctrine:

- The distinction between structural verifiability (DEL) and temporal verifiability (DCL)
- The specific failure mode: audit evidence expiring while delegation remains active
- What this section does NOT define (no retention durations, no storage mechanisms)
- Key behavioral requirements citing DCL-1 through DCL-6

**ToC updated:** `24. [Delegation Chain Lifetime Integrity](#24-delegation-chain-lifetime-integrity)` added.

**Version stamps updated:** proposal/0.0.27 → proposal/0.0.28 throughout.

### 3. `standards/conformance.md` — Add condition 24

**Condition 24 — Unverifiable delegation chain lifetime:** the system maintains active delegation grants whose authority chain cannot be independently validated due to loss or expiration of supporting audit evidence, or treats system assertions as sufficient substitute for independently verifiable delegation evidence when that evidence is unavailable (LEBOSS-DCL-2, LEBOSS-DCL-4, LEBOSS-DCL-6).

**Header updated:** proposal/0.0.27 → proposal/0.0.28.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-normative-rules.md` | Add DCL group (6 rules); update summary counts; update Gaps section | Normative addition — binds delegation authority to verifiable evidence lifetime |
| `standards/leboss-standard.md` | Add §24; update ToC; update version stamps | Normative addition |
| `standards/conformance.md` | Add condition 24; update header | Normative addition |

**Rule count:** 103 → 109
**MUST count:** 66 → 69 (DCL-1, DCL-3, DCL-5 add 3 MUSTs)
**MUST NOT count:** 40 → 43 (DCL-2, DCL-4, DCL-6 add 3 MUST NOTs)
**MAY count:** 5 (unchanged)

---

## Relationship to Existing Rules

**DCL vs DEL:** The DEL group establishes structural constraints on delegation — scope limits, origin references, traceability, revocation propagation. DEL rules operate at the time of issuance and evaluation; they govern the form of the chain. DCL extends this into the temporal dimension: the chain must remain verifiable for as long as it remains active. DEL asks "is this chain structurally valid?" DCL asks "can this chain be independently verified right now, and will it continue to be?"

**DCL and REC:** REC-1 establishes that the set of audit records for a governed environment constitutes the authoritative record of governed actions. REC-3 requires that audit records be treated as foundational. DCL-3 and DCL-4 operationalize these principles within the delegation domain: the audit records that establish delegation authority are not merely records of what happened — they are the foundation of current and ongoing authority. Their unavailability is not a historical loss; it is a present authority failure.

**DCL and AUD:** AUD defines what audit records must contain (resolution requirements). DCL defines how long audit evidence supporting delegation must remain available. These rules are complementary: AUD ensures the records are sufficient; DCL ensures they persist long enough to serve their purpose.

**DCL and VER:** VER-4 requires that a system provide sufficient visibility for an independent party to verify conformance. DCL-1 and DCL-6 directly operationalize this within the delegation domain: independent verifiability of delegation authority is not optional, and system assertions cannot substitute for it.

**DCL and DEL-3:** DEL-3 requires that delegation chains be fully traceable to a valid root governing entity grant. DCL-1 extends this by requiring that the traceability be achievable through independent evidence, not just through the system's internal state. DEL-3 establishes what must be true structurally; DCL-1 establishes that this truth must be demonstrable without relying on the system that made the claim.

---

## What This Proposal Does Not Define

This proposal does not define:

- Retention durations or minimum retention periods for any audit record category
- Storage mechanisms, archival systems, or backup strategies
- How a system must detect or respond to evidence degradation
- Implementation strategies for maintaining delegation evidence
- Any specific data persistence technology or architecture

The standard governs the relationship between delegation authority and its evidentiary basis. How a system ensures that audit evidence persists for the required period is an implementation concern.

---

## Backward Compatibility

Systems where audit evidence already persists for the lifetime of delegation chains are unaffected. Systems where audit retention windows are shorter than delegation lifetimes may now be required to either:
- Extend the retention of delegation-supporting audit evidence to match delegation lifetime, or
- Expire delegations when their supporting evidence becomes unavailable

This is intentional. The prior state allowed a system to claim delegation traceability (DEL-3) while the evidence that would allow independent verification of that traceability was routinely deleted under standard retention policy.

---

## Sequence Context

- 0.0.21 — Stress test; Scenario 4 identified the audit-retention vs delegation gap
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closed service provider boundary (SVC-8, SVC-9)
- 0.0.24 — Aligned protocol requirements with normative rule register (PROT-1 through PROT-5)
- 0.0.25 — Established actor identity portability requirements (ACTOR-1 through ACTOR-6)
- 0.0.26 — Established governing entity authenticity requirements (GEA-1 through GEA-6)
- 0.0.27 — Defined audit resolution floor (AUD-1 through AUD-6)
- 0.0.28 — Binds delegation authority to verifiable evidence lifetime (DCL-1 through DCL-6)

---

*Proposal 0.0.28 — Open for committee review.*
