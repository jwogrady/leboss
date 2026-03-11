# LEBOSS Integration Descriptor Protocol
## Local Entrepreneur Business Operating System Standards

**Status:** Proposal
**Version:** 0.0.5
**Date:** 2026-03-09
**Depends on:** [standards/objects/integration-descriptor.md](objects/integration-descriptor.md), [standards/leboss-access-grant-protocol.md](leboss-access-grant-protocol.md)

---

> This document defines the lifecycle and behavioral rules for external integrations within a LEBOSS-compliant system. It makes integrations governed actors with explicit state, enforced authorization, and full audit coverage — rather than static registry entries.

---

## 1. Introduction

The Integration Descriptor object (`standards/objects/integration-descriptor.md`) defines what must be recorded about an authorized external integration. The Access Grant Protocol (`standards/leboss-access-grant-protocol.md`) defines how authorizations are issued and enforced. This protocol defines how integrations behave across their operational lifetime, and how those two prior specifications are applied specifically to the external integration context.

External integrations are the point of greatest data sovereignty risk in the LEBOSS reference model. They represent boundaries at which primary operational data may flow to systems outside the governing entity's direct control. This risk requires not only that integrations be registered and authorized, but that their behavior be continuously governed and immediately adjustable.

This protocol is:
- **implementation-neutral** — it specifies what must happen, not how it is implemented
- **transport-agnostic** — it does not define how integrations connect to external platforms
- **complementary to the Access Grant Protocol** — integration authorization depends on valid Access Grants; this protocol defines the integration-specific layer on top

---

## 2. Relationship to Governance Objects and Rules

This protocol operationalizes the following normative rules:

| Rule | Addressed By |
|------|-------------|
| LEBOSS-ACC-5 — integrations must be explicitly authorized before receiving data | §4 Registration, §5 Authorization |
| LEBOSS-ARCH-10 — integrations must not become unauthorized data exit paths | §6 Operational Validation |
| LEBOSS-ARCH-11 — all data flows through integrations must be logged and auditable | §8 Audit Requirements |
| LEBOSS-OBJ-ID-1 — Integration Descriptor must exist before data transmission | §4 Registration |
| LEBOSS-OBJ-ID-4 — inactive integrations must not receive data | §7 Suspension and Deactivation |
| LEBOSS-OBJ-ID-6 — all data flows must produce Audit Records | §8 Audit Requirements |

---

## 3. Integration Lifecycle

An external integration moves through the following states during its lifetime:

```
registered → authorized → active → suspended → deactivated
                                       ↑           ↓
                                       └── (reactivation possible)
```

### State Definitions

**`registered`**
An Integration Descriptor has been created for the external integration. The integration is recorded in the system but has not yet been authorized to receive data.

A registered integration MUST NOT receive primary operational data. Registration is not authorization.

**`authorized`**
The governing entity has reviewed the integration and issued a valid Access Grant covering its defined permissions and data scope. The integration may proceed to operational activation.

An authorized integration MUST NOT yet transmit data until the system confirms activation. Authorization is the approval; activation is the operational readiness confirmation.

**`active`**
The integration is operational. It holds a valid, unexpired, unrevoked Access Grant and is permitted to send and receive data within its defined scope and permissions.

Systems MUST validate the integration's authorization before each data operation (§6).

**`suspended`**
The governing entity has temporarily halted the integration's data access. Suspension takes effect immediately and completely. A suspended integration MUST NOT receive or transmit primary operational data.

Suspension is reversible. The governing entity may reactivate a suspended integration, transitioning it back to `active` after re-confirming authorization.

**`deactivated`**
The integration has been permanently terminated. Deactivation is irreversible. A deactivated integration MUST NOT be reactivated. If the governing entity later wishes to reconnect the same external platform, a new Integration Descriptor with a new `integration_id` MUST be created.

---

## 4. Integration Registration

Registration is the act of creating an Integration Descriptor for an external integration.

### 4.1 Registration Requirements

**LEBOSS-IDP-1**
An Integration Descriptor MUST be created before any external integration MAY receive primary operational data. There is no grace period or provisional access during registration.

**LEBOSS-IDP-2**
At the moment of registration, all required fields defined in the Integration Descriptor object specification MUST be populated. A descriptor MUST NOT be created in a partial state.

**LEBOSS-IDP-3**
The `active` field MUST be set to `false` at registration. An integration is not active at the moment of registration.

**LEBOSS-IDP-4**
Registration MUST generate an Audit Record with `action: integration_registered`, referencing the new `integration_id`.

### 4.2 Permissions at Registration

The `permissions_requested` field SHOULD be populated at registration to document what the external provider requested. The `permissions_granted` field MUST remain empty or unset until authorization (§5) occurs. Systems MUST NOT treat `permissions_requested` as equivalent to `permissions_granted`.

---

## 5. Authorization Requirements

Authorization is the explicit approval by the governing entity for an integration to receive data, formalized through the issuance of an Access Grant.

### 5.1 Authorization Requirements

**LEBOSS-IDP-5**
An integration MUST NOT transition to `active` state without a linked, valid Access Grant. The `linked_grant_id` field on the Integration Descriptor MUST reference an Access Grant that is currently `active` as defined by the Access Grant Protocol.

**LEBOSS-IDP-6**
The Access Grant linked to an integration MUST define `scope` and `operations` that are equal to or narrower than the permissions recorded in the Integration Descriptor's `permissions_granted` field. An integration MUST NOT operate under a grant broader than its registered permissions.

**LEBOSS-IDP-7**
Authorization MUST be issued at the `governing_entity` or `brand_entity` level as defined in the Integration Descriptor object specification. The `authorization_level` field MUST be set at the time of authorization.

**LEBOSS-IDP-8**
Authorization MUST generate an Audit Record with `action: integration_authorized`, referencing the `integration_id` and the `grant_id` of the linked Access Grant.

### 5.2 Grant Revocation Cascade

If the Access Grant linked to an active integration is revoked under the Access Grant Protocol:

**LEBOSS-IDP-9**
The integration MUST be immediately suspended upon revocation of its linked Access Grant. The governing entity is not required to issue a separate suspension command — grant revocation cascades automatically to integration suspension.

**LEBOSS-IDP-10**
An integration that has been suspended due to grant revocation MUST NOT be reactivated until a new Access Grant has been issued and linked.

---

## 6. Operational Validation

Before allowing any data operation involving an active integration, a LEBOSS-compliant system MUST perform the following validation sequence. A failure at any step MUST result in denial of the data operation.

### Validation Sequence

**Step 1 — Integration State Check**
The integration MUST be in `active` state. Operations MUST be denied for integrations in any other state.

**Step 2 — Descriptor Existence**
A valid Integration Descriptor with the presented `integration_id` MUST exist in the system.

**Step 3 — Grant Validity**
The Access Grant referenced in `linked_grant_id` MUST pass all seven validation steps defined in the Access Grant Protocol (§5 of `leboss-access-grant-protocol.md`). An integration operating under an expired, revoked, or out-of-scope grant MUST be denied.

**Step 4 — Operation Permission Check**
The requested operation MUST appear in both the `permissions_granted` field of the Integration Descriptor and the `operations` field of the linked Access Grant.

**Step 5 — Data Flow Direction Check**
The direction of the data operation (inbound or outbound) MUST match an entry in the `data_flows` field of the Integration Descriptor. Outbound operations transmitting data categories not listed in `data_flows` MUST be denied.

### Validation Audit

**LEBOSS-IDP-11**
Every denied data operation involving an integration MUST generate an Audit Record with `action: access_denied`, identifying the `integration_id`, the `grant_id`, and the failed validation step.

**LEBOSS-IDP-12**
Every permitted data operation MUST generate an Audit Record referencing both the `integration_id` and the `grant_id` under which the operation was authorized.

---

## 7. Suspension and Deactivation

### 7.1 Suspension

Suspension is the immediate, reversible halting of an integration's data access by the governing entity.

**LEBOSS-IDP-13**
The governing entity MUST be able to suspend any active integration at any time, without requiring justification to the integration provider.

**LEBOSS-IDP-14**
Suspension MUST take effect immediately. No data operations are permitted for a suspended integration. Systems MUST NOT defer, delay, or queue suspension.

**LEBOSS-IDP-15**
Suspension MUST generate an Audit Record with `action: integration_suspended`, referencing the `integration_id` and recording the timestamp.

**LEBOSS-IDP-16**
A suspended integration MAY be reactivated by the governing entity. Reactivation MUST confirm that the linked Access Grant remains valid. If the grant has expired or been revoked during the suspension period, a new grant MUST be issued before reactivation.

**LEBOSS-IDP-17**
Reactivation of a suspended integration MUST generate an Audit Record with `action: integration_activated`.

### 7.2 Deactivation

Deactivation is the permanent termination of an integration's authorization within the governed environment.

**LEBOSS-IDP-18**
The governing entity MUST be able to deactivate any integration (in any state) at any time.

**LEBOSS-IDP-19**
Deactivation MUST take effect immediately. A deactivated integration MUST NOT receive or transmit primary operational data.

**LEBOSS-IDP-20**
Deactivation MUST generate an Audit Record with `action: integration_deactivated`, referencing the `integration_id`.

**LEBOSS-IDP-21**
Upon deactivation, the linked Access Grant MUST be revoked if it has not already been revoked. A deactivated integration MUST NOT leave an active grant in place.

**LEBOSS-IDP-22**
A deactivated integration MUST NOT be reactivated. The `active` field on the Integration Descriptor MUST be set to `false` permanently. A new Integration Descriptor with a new `integration_id` MUST be created if the governing entity later wishes to reconnect the same external platform.

**LEBOSS-IDP-23**
The Integration Descriptor for a deactivated integration MUST be retained according to the retention requirements defined in the Integration Descriptor object specification. Deactivation does not permit deletion of the descriptor record.

---

## 8. Audit Requirements

All integration lifecycle events are governed events and MUST produce Audit Records as defined in `standards/objects/audit-record.md`.

### Required Audit Events

| Lifecycle Event | Audit Record Action |
|----------------|---------------------|
| Integration registered | `integration_registered` |
| Integration authorized | `integration_authorized` |
| Integration activated | `integration_activated` |
| Data operation permitted | `read` / `write` / `transform` / `export` |
| Data operation denied | `access_denied` |
| Integration suspended | `integration_suspended` |
| Integration reactivated | `integration_activated` |
| Integration deactivated | `integration_deactivated` |

### Audit Record Requirements for Integration Events

**LEBOSS-IDP-24**
All Audit Records for integration lifecycle events MUST include the `integration_id` of the affected integration.

**LEBOSS-IDP-25**
All Audit Records for data operations MUST include both the `integration_id` and the `grant_id` under which the operation was authorized or denied.

**LEBOSS-IDP-26**
Audit Records for `access_denied` events MUST record which validation step (§6) failed.

---

## 9. Protocol Boundaries

This protocol does not define:

- **How integrations authenticate to the governed system** — the connector or credential mechanism is outside this specification
- **How suspension is communicated to external providers** — the signaling mechanism for stopping an integration at the external platform is outside this specification
- **API shape or payload format** — what data is exchanged and in what format is outside this specification
- **Integration discovery or marketplace** — how integrations are found, installed, or offered is outside this specification

These concerns will be addressed in future proposals.

---

*LEBOSS Integration Descriptor Protocol 0.0.5 — Open for community review and contribution.*
