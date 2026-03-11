# LEBOSS Access Grant Protocol
## Local Entrepreneur Business Operating System Standards

**Status:** Proposal
**Version:** 0.0.4
**Date:** 2026-03-09
**Depends on:** [standards/objects/access-grant.md](objects/access-grant.md)

---

> This document defines the lifecycle and interaction rules for Access Grants within a LEBOSS-compliant system. It specifies required system behaviors — what systems must do when grants are issued, validated, revoked, and expired — without prescribing transport mechanism or implementation format.

---

## 1. Introduction

The Access Grant object (`standards/objects/access-grant.md`) defines what an Access Grant must contain. This protocol defines how Access Grants behave across their operational lifetime.

An Access Grant that exists in storage but is not governed by defined lifecycle rules provides no reliable access control guarantee. A system might honor an expired grant, skip a scope check, or delay the effect of a revocation — all while holding structurally valid grant objects. The Access Grant Protocol prevents these outcomes by specifying the behavioral requirements every LEBOSS-compliant system must satisfy.

This protocol is:
- **implementation-neutral** — it specifies what must happen, not how it is implemented
- **transport-agnostic** — it does not define how grants are requested, transmitted, or exchanged between systems
- **additive** — it does not modify the Access Grant object definition; it defines system behavior around that object

---

## 2. Relationship to Governance Objects and Rules

This protocol operationalizes the following normative rules:

| Rule | Addressed By |
|------|-------------|
| LEBOSS-ACC-1 — no access without an explicit grant | §5 Validation (grant must exist and be active) |
| LEBOSS-ACC-2 — grants must specify scope, operations, duration, purpose | §4 Issuance (all required fields must be present at issuance) |
| LEBOSS-ACC-3 — grants are revocable at any time | §6 Revocation |
| LEBOSS-ACC-4 — providers must operate within granted access | §5 Validation (scope and operation checks) |
| LEBOSS-OBJ-AG-5 — systems must implement revocation | §6 Revocation |
| LEBOSS-OBJ-AG-6 — systems must validate before allowing access | §5 Validation |
| LEBOSS-SEC-3 — all data operations must be auditable | §8 Audit Requirements |

---

## 3. Access Grant Lifecycle

An Access Grant moves through the following states during its lifetime:

```
requested → issued → active → revoked
                          ↓
                       expired
```

### State Definitions

**`requested`**
A party has initiated a request for an Access Grant. The grant object does not yet exist. The governing entity or their delegate is reviewing the request.

A grant in the `requested` state confers no authorization. Systems MUST NOT allow data access on the basis of a request.

**`issued`**
The governing entity or their delegate has created an Access Grant object with all required fields populated. The grant exists as a formal record.

A grant transitions from `issued` to `active` upon the first validated access attempt, or immediately upon issuance if the implementation does not distinguish between issued and active states.

**`active`**
The grant is valid, in-scope, unexpired, and not revoked. Systems MAY authorize data access under an active grant, provided all validation checks in §5 pass.

**`revoked`**
The grant has been explicitly invalidated by the governing entity. Revocation is permanent and irreversible. A revoked grant MUST NOT be reactivated. If access is required after revocation, a new grant MUST be issued.

**`expired`**
The grant has passed its defined expiry condition (`expires_at` timestamp or named condition). Expiry is automatic — it does not require an explicit action by the governing entity.

A grant MAY be in both `expired` and `revoked` states if it was revoked before or after natural expiry.

---

## 4. Grant Issuance

Grant issuance is the act of creating a valid Access Grant object.

### 4.1 Issuance Requirements

**LEBOSS-AGP-1**
A grant MUST NOT be issued by any party other than the governing entity or their explicitly designated delegate.

**LEBOSS-AGP-2**
At the moment of issuance, all required fields defined in the Access Grant object specification MUST be populated. A grant MUST NOT be created in a partial state.

**LEBOSS-AGP-3**
The `issued_at` field MUST reflect the actual time of issuance. Backdating a grant is not permitted.

**LEBOSS-AGP-4**
Grant issuance MUST generate an Audit Record with `action: grant_issued`, referencing the new `grant_id`.

### 4.2 Scope and Operation Specification

The `scope` and `operations` fields MUST be specific at the time of issuance. Vague or open-ended scope definitions that effectively grant unrestricted access MUST NOT be issued.

A grant that specifies `operations: [read, write, transform, export]` with an unrestricted scope is functionally equivalent to full data access and MUST be treated as requiring explicit governing entity approval, not delegated issuance.

### 4.3 Delegation

A delegate MAY issue grants on behalf of the governing entity only if they hold a valid Access Grant that explicitly includes delegation authority. Delegated grants MUST NOT exceed the scope or operations of the delegate's own grant.

---

## 5. Grant Validation

Before authorizing any data access, a LEBOSS-compliant system MUST perform the following validation sequence in full. A failure at any step MUST result in access denial.

### Validation Sequence

**Step 1 — Grant Existence**
The `grant_id` presented with the access request MUST exist in the system's grant registry. Access MUST be denied if no matching grant is found.

**Step 2 — Issuer Authority**
The `issuer_entity` on the grant MUST be the governing entity or a valid delegate. Access MUST be denied if the issuer cannot be verified as authorized.

**Step 3 — Subject Match**
The `subject_identifier` on the grant MUST match the identity of the party requesting access. Access MUST be denied if there is a mismatch.

**Step 4 — Expiration Check**
The grant MUST NOT be expired. Systems MUST evaluate the `expires_at` condition at the time of the access request. Cached grant states MUST be re-evaluated if the cache may have passed the expiry condition.

**Step 5 — Revocation Check**
The grant MUST NOT be revoked. Systems MUST check current revocation status before each access. Revocation status MUST NOT be cached in a way that would allow a revoked grant to remain effective.

**Step 6 — Scope Check**
The requested data MUST fall within the `scope` defined on the grant. Access to data outside the grant's defined scope MUST be denied, even if the same party holds other grants with broader scope.

**Step 7 — Operation Check**
The requested operation MUST be listed in the grant's `operations` field. A `read` operation MUST be denied under a grant that only permits `export`, even if the data is in scope.

### Validation Audit

**LEBOSS-AGP-5**
Every access denial resulting from a failed validation MUST generate an Audit Record with `action: access_denied`, identifying the `grant_id` presented (if any), the failed validation step, and the requesting actor.

**LEBOSS-AGP-6**
Every successful access authorization MUST generate an Audit Record with the appropriate data action type (`read`, `write`, `transform`, or `export`), referencing the `grant_id` under which access was authorized.

---

## 6. Grant Revocation

Revocation is the immediate, permanent invalidation of an Access Grant by the governing entity.

### 6.1 Revocation Requirements

**LEBOSS-AGP-7**
Any active Access Grant MUST be revocable by the governing entity at any time, without requiring justification to the grantee.

**LEBOSS-AGP-8**
Revocation MUST take effect immediately. Systems MUST NOT defer, delay, or queue revocation. Any access attempt after the revocation event MUST fail the revocation check in §5.

**LEBOSS-AGP-9**
Revocation MUST generate an Audit Record with `action: grant_revoked`, referencing the `grant_id` and recording the `revoked_at` timestamp.

**LEBOSS-AGP-10**
A revoked grant MUST NOT be reactivated. If the governing entity wishes to restore access, a new grant with a new `grant_id` MUST be issued.

### 6.2 Revocation Propagation

In distributed systems where grant state may be held in multiple locations (caches, replicas, downstream services), revocation MUST be propagated to all locations. Systems MUST NOT continue to honor a grant in one component after it has been revoked in another.

The specific mechanism for revocation propagation is implementation-defined. Implementations MUST ensure that the maximum time between a revocation event and its effect across all system components is bounded and disclosed to the governing entity.

### 6.3 Partial Revocation

A grant may not be partially revoked. If a governing entity wishes to reduce the scope or operations of an existing grant, the current grant MUST be revoked and a new, narrower grant MUST be issued.

---

## 7. Grant Expiration

Expiration is the automatic transition of an Access Grant from `active` to `expired` upon satisfaction of the grant's `expires_at` condition.

### 7.1 Expiration Requirements

**LEBOSS-AGP-11**
Systems MUST evaluate expiration conditions at the time of each access attempt. A grant that has expired MUST fail validation at Step 4 (§5).

**LEBOSS-AGP-12**
Grant expiration does not require an explicit action by the governing entity. Expiration is automatic upon satisfaction of the expiry condition.

**LEBOSS-AGP-13**
Expiration MUST generate an Audit Record with `action: grant_expired` at the time the expiry condition is first evaluated as satisfied.

**LEBOSS-AGP-14**
Expired grants MUST be retained according to the retention requirements defined in the Access Grant object specification (LEBOSS-OBJ-AG-7). Expiry does not permit deletion.

### 7.2 Condition-Based Expiration

Where a grant's `expires_at` value is a named condition (e.g., "upon termination of service agreement") rather than a fixed timestamp, the system MUST implement a mechanism by which the governing entity can mark the condition as satisfied. Upon marking, the grant transitions to `expired` and the revocation check in §5 must reflect this status immediately.

---

## 8. Audit Requirements

All Access Grant lifecycle events are governed events and MUST produce Audit Records as defined in `standards/objects/audit-record.md`.

### Required Audit Events

| Lifecycle Event | Audit Record Action |
|----------------|---------------------|
| Grant issued | `grant_issued` |
| Grant validated — access permitted | `read` / `write` / `transform` / `export` |
| Grant validated — access denied | `access_denied` |
| Grant revoked | `grant_revoked` |
| Grant expired | `grant_expired` |

### Audit Record Requirements for Grant Events

**LEBOSS-AGP-15**
All Audit Records for grant lifecycle events MUST include the `grant_id` of the affected grant.

**LEBOSS-AGP-16**
Audit Records for `access_denied` events MUST record the reason for denial (which validation step failed).

**LEBOSS-AGP-17**
Audit Records for grant lifecycle events MUST NOT be created retroactively. Each record MUST reflect the actual time of the event.

---

## 9. Protocol Boundaries

This protocol does not define:

- **How grant requests are submitted** — the mechanism by which a party requests a grant from the governing entity is outside this specification
- **How issued grants are delivered** — the transport by which a governing entity communicates an issued grant to the grantee is outside this specification
- **How revocation is communicated** — the signaling mechanism for propagating revocation to grantees and distributed system components is outside this specification
- **Grant format or encoding** — serialization of grant objects is outside this specification

These concerns will be addressed in future proposals as operational experience with the lifecycle protocol accumulates.

---

*LEBOSS Access Grant Protocol 0.0.4 — Open for community review and contribution.*
