# LEBOSS Audit Record Collection Protocol
## Local Entrepreneur Business Operating System Standards

**Status:** Proposal
**Version:** 0.0.6
**Date:** 2026-03-09
**Branch:** proposal/0.0.6
**Depends on:** [standards/objects/audit-record.md](objects/audit-record.md), [standards/leboss-access-grant-protocol.md](leboss-access-grant-protocol.md), [standards/leboss-integration-protocol.md](leboss-integration-protocol.md)

---

> This document defines the behavioral requirements for audit event capture, correlation, retention, and integrity within a LEBOSS-compliant system. It ensures that the audit records required by prior protocols are reliably produced and remain verifiable by the governing entity.

---

## 1. Introduction

The Audit Record object (`standards/objects/audit-record.md`) defines what a record must contain. The Access Grant Protocol (`standards/leboss-access-grant-protocol.md`) and the Integration Descriptor Protocol (`standards/leboss-integration-protocol.md`) each define which governance events must produce Audit Records. This protocol defines the system behaviors that make those requirements enforceable: how events are captured, how records are linked to the governance objects that produced them, how long they must be retained, and how their integrity is verified.

Audit records that are required but not guaranteed are assertions, not evidence. This protocol eliminates the gap between what is required and what is enforced.

This protocol is:
- **implementation-neutral** — it specifies what must happen, not how it is implemented
- **storage-agnostic** — it does not define the database schema, file format, or delivery mechanism for audit records
- **additive** — it complements the Audit Record object definition and prior protocol requirements without modifying them

---

## 2. Relationship to Governance Objects and Rules

This protocol operationalizes the following normative rules:

| Rule | Addressed By |
|------|-------------|
| LEBOSS-SEC-3 — all data operations must be auditable | §3 Audit Event Capture |
| LEBOSS-SVC-3 — service providers must maintain complete audit records | §3 Audit Event Capture, §5 Retention |
| LEBOSS-SVC-4 — audit records must be available to the governing entity | §7 Audit Verification |
| LEBOSS-OBJ-AR-1 — Audit Records must be created for every governed event | §3 Audit Event Capture |
| LEBOSS-OBJ-AR-2 — Audit Records must be created at the time of the event | §3 Audit Event Capture |
| LEBOSS-OBJ-AR-3 — Audit Records must not be modified after creation | §6 Integrity |
| LEBOSS-OBJ-AR-4 — Audit Records must be retained for a minimum of 36 months | §5 Retention |
| LEBOSS-OBJ-AR-5 — Audit Records must be available to the governing entity | §7 Audit Verification |

---

## 3. Audit Event Capture

Audit event capture is the act of creating an Audit Record at the moment a governed event occurs. A governed event is any action that reads, writes, transforms, or exports primary operational data, or any action that modifies or transitions a governance object.

### 3.1 Required Capture Events

A LEBOSS-compliant system MUST generate an Audit Record for each of the following events:

| Event | Audit Record `action` Value |
|-------|---------------------------|
| Access Grant issued | `grant_issued` |
| Access Grant revoked | `grant_revoked` |
| Access Grant expired | `grant_expired` |
| Integration registered | `integration_registered` |
| Integration authorized | `integration_authorized` |
| Integration activated | `integration_activated` |
| Integration suspended | `integration_suspended` |
| Integration reactivated | `integration_activated` |
| Integration deactivated | `integration_deactivated` |
| Data operation permitted | `read` / `write` / `transform` / `export` |
| Data operation denied | `access_denied` |

**LEBOSS-ACP-1**
A LEBOSS-compliant system MUST generate an Audit Record for every event listed in §3.1. Absence of a required Audit Record for a completed event is a compliance violation.

**LEBOSS-ACP-2**
Audit Records MUST be created at the time the event occurs. Retroactive creation, batching, or deferred writing of Audit Records is not permitted. A record that arrives after the event it documents is not a compliant Audit Record.

**LEBOSS-ACP-3**
If a required Audit Record cannot be created at the time of the event (for example, due to a storage failure), the system MUST treat the failure as a governed event requiring its own record once storage is restored. The original event MUST be recorded retroactively with its original timestamp, and the capture failure MUST also be recorded as a separate event.

**LEBOSS-ACP-4**
A system MUST NOT defer or suppress creation of an Audit Record in response to load, performance constraints, or operational mode. Audit capture is not a degradable capability.

### 3.2 Capture Completeness

**LEBOSS-ACP-5**
A LEBOSS-compliant system MUST be able to demonstrate, upon governing entity request, that all required Audit Records for a defined time period have been produced. A system that cannot account for gaps in its audit record sequence is not compliant.

---

## 4. Audit Event Correlation

Audit Records do not exist in isolation. Governance actions occur within a context of related objects: a data operation is authorized by an Access Grant, which may be linked to an Integration Descriptor, which was issued by a governing entity. Correlation requirements ensure that Audit Records reference the governance objects and events that produced them, enabling reconstruction of the full governance history for any action.

### 4.1 Correlation Fields

**LEBOSS-ACP-6**
Where a data operation is performed under an Access Grant, the Audit Record MUST include the `grant_id` of that grant. A data operation record that does not identify the grant under which it was authorized does not satisfy the auditability requirement.

**LEBOSS-ACP-7**
Where a data operation or lifecycle event involves an external integration, the Audit Record MUST include the `integration_id` of the Integration Descriptor associated with the event. A record that cannot be linked to its integration context does not satisfy the integration audit requirement (LEBOSS-OBJ-ID-6).

**LEBOSS-ACP-8**
Where a data operation is denied, the Audit Record MUST include both the `grant_id` (if a grant was presented) and the `integration_id` (if the request came through an integration), as well as the specific reason for denial.

**LEBOSS-ACP-9**
Where a governance lifecycle event is caused by another governance event (for example, an integration suspension caused by grant revocation), the Audit Record for the caused event SHOULD reference the `event_id` of the causing event. This enables reconstruction of causal chains in the audit record without requiring a separate process log.

### 4.2 Cross-Protocol Correlation

When a grant revocation cascades to integration suspension under the Access Grant Protocol and Integration Descriptor Protocol respectively, two Audit Records are required — one for `grant_revoked` and one for `integration_suspended`. Both records MUST carry the same `grant_id`. The `integration_suspended` record SHOULD reference the `event_id` of the `grant_revoked` record (per LEBOSS-ACP-9), making the causal relationship explicit.

**LEBOSS-ACP-10**
In any cascade event (where one governance action automatically triggers another), each triggered event MUST produce its own Audit Record. The records MUST be linkable through shared identifier references. A single record covering a cascade chain is not compliant.

---

## 5. Audit Retention Requirements

### 5.1 Minimum Retention Period

**LEBOSS-ACP-11**
A LEBOSS-compliant system MUST retain all Audit Records for a minimum of 36 months from the timestamp of the event, as defined in LEBOSS-OBJ-AR-4. This requirement is not waivable by configuration, service agreement, or operational policy.

**LEBOSS-ACP-12**
Where a dispute, legal hold, or governing entity investigation is active at the time the minimum retention period would expire, the Audit Records relevant to that matter MUST be retained until the matter is resolved, regardless of the retention period elapsed.

### 5.2 Deletion Controls

**LEBOSS-ACP-13**
A LEBOSS-compliant system MUST NOT delete Audit Records before the expiration of the applicable retention period. Deletion controls MUST be enforced at the storage layer, not merely at the application layer.

**LEBOSS-ACP-14**
Service providers MUST NOT delete Audit Records upon termination of the service relationship. Upon termination, Audit Records MUST be transferred to the governing entity or retained per the governing entity's explicit written instruction, consistent with LEBOSS-OBJ-AR-8.

**LEBOSS-ACP-15**
If a governing entity instructs the deletion of Audit Records before the minimum retention period has elapsed, the system MUST record that instruction as an Audit Record with `action: record_deletion_authorized` and retain that record itself for the remainder of the original retention period.

---

## 6. Audit Record Integrity

Audit Records are only meaningful if they cannot be altered after creation. An audit record that can be silently modified provides no governance assurance. Integrity requirements ensure that unauthorized modification of any Audit Record is detectable.

### 6.1 Immutability Requirements

**LEBOSS-ACP-16**
A LEBOSS-compliant system MUST store Audit Records in a manner that prevents modification after creation. Acceptable storage mechanisms include append-only logs, cryptographically signed records, write-once storage, and other mechanisms that render modification detectable.

**LEBOSS-ACP-17**
A LEBOSS-compliant system MUST NOT expose any interface — internal or external — through which a stored Audit Record's content fields can be modified. Read and append operations are the only permitted operations on the Audit Record store.

**LEBOSS-ACP-18**
Any attempt to modify a stored Audit Record MUST generate a new Audit Record documenting the attempt, including the `actor_identifier` of the party that made the attempt and the `resource_identifier` of the targeted record.

### 6.2 Integrity Verification

**LEBOSS-ACP-19**
A LEBOSS-compliant system MUST support a verification process by which the governing entity — or a designated auditor — can confirm that a set of Audit Records has not been modified since creation. The specific mechanism (cryptographic hash, digital signature, third-party attestation) is implementation-defined.

**LEBOSS-ACP-20**
The verification process MUST be available on demand by the governing entity. It MUST NOT require cooperation from the party whose actions are under review.

---

## 7. Audit Verification

Audit verification is the process by which the governing entity confirms the completeness and integrity of the audit record for a defined scope (time period, actor, data category, or governance object).

### 7.1 Governing Entity Access

**LEBOSS-ACP-21**
A LEBOSS-compliant system MUST provide the governing entity with the ability to query Audit Records by time range, actor identifier, resource identifier, action type, `grant_id`, and `integration_id`. These query dimensions are the minimum required; implementations MAY support additional query dimensions.

**LEBOSS-ACP-22**
Query access to Audit Records MUST be provided to the governing entity without requiring prior notice to or cooperation from the party whose actions are being reviewed.

### 7.2 Completeness Verification

**LEBOSS-ACP-23**
A LEBOSS-compliant system MUST be able to produce, upon governing entity request, a complete list of all Audit Records for a defined time period and scope. The list MUST be sufficient for the governing entity to identify gaps — missing records for events that should have produced them.

**LEBOSS-ACP-24**
A LEBOSS-compliant system MUST NOT alter, filter, suppress, or omit Audit Records in response to a governing entity access or verification request. The governing entity receives the full, unmodified record of what occurred.

---

## 8. Protocol Boundaries

This protocol does not define:

- **Storage format or schema** — how Audit Records are stored (database, log file, object store) is outside this specification
- **Delivery mechanism** — how Audit Records are transmitted to the governing entity or made queryable is outside this specification
- **Export or portability format** — the format in which Audit Records are exported for governing entity custody is deferred to a future proposal
- **Cryptographic specifics** — which hash functions, signature schemes, or attestation mechanisms satisfy the integrity requirements is implementation-defined
- **Cross-environment aggregation** — how Audit Records from multiple service providers are consolidated is outside this specification

These concerns will be addressed in future proposals.

---

*LEBOSS Audit Record Collection Protocol 0.0.6 — Open for community review and contribution.*
