# Audit Record Object
## LEBOSS Governance Object Definition

**Status:** Proposal
**Version:** 0.0.3
**Date:** 2026-03-09
**Rules Addressed:** LEBOSS-SEC-3, SVC-3, SVC-4

---

## 1. Purpose

An Audit Record is the structured record of a governance event within a LEBOSS-compliant system.

The LEBOSS normative rules require that all data operations be auditable (LEBOSS-SEC-3), that service providers maintain complete audit records of all data access and transformations (LEBOSS-SVC-3), and that those records be available to the governing entity upon request (LEBOSS-SVC-4). The Audit Record is the object that satisfies these requirements.

An Audit Record does not prevent unauthorized access — it creates a verifiable record that access occurred, under what authority, and to what effect. It is the mechanism by which data ownership is made verifiable rather than merely asserted.

---

## 2. Object Definition

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `event_id` | Identifier | A unique identifier for this audit event. MUST be unique within the governed environment. |
| `timestamp` | Timestamp | The date and time at which the event occurred. MUST reflect the actual time of the event, not the time of record creation. |
| `actor_identifier` | Identifier | The identifier of the party that performed the action. This MAY be a service provider, a system component, an integration, or a human user. |
| `action` | Enum | The type of action performed. MUST be one of the defined action types (see Section 4). |
| `resource_identifier` | Identifier | The identifier of the data resource or object acted upon. MUST be specific enough to identify the affected data boundary or record. |
| `outcome` | Enum | The result of the action. MUST be one of: `success`, `failure`, `partial`. |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `grant_id` | Identifier | The `grant_id` of the Access Grant under which this action was performed, if applicable. |
| `integration_id` | Identifier | The `integration_id` of the Integration Descriptor associated with this event, if applicable. |
| `affected_entity` | Identifier | The identifier of the brand entity or governed data environment within which the event occurred. |
| `request_source` | String | The origin of the request (e.g., IP address, system identifier, API endpoint). |
| `data_categories` | List | The categories of primary operational data involved in the event (e.g., `customer_records`, `transaction_history`). |
| `transformation_summary` | String | For `transform` actions, a human-readable summary of what transformation was applied. |
| `failure_reason` | String | For `outcome: failure` or `outcome: partial`, a description of why the action did not fully succeed. |

---

## 3. Normative Requirements

**LEBOSS-OBJ-AR-1**
An Audit Record MUST be created for every governed event. A governed event is any action that reads, writes, transforms, or exports primary operational data, or any action that modifies a governance object (Access Grant, Integration Descriptor).

**LEBOSS-OBJ-AR-2**
Audit Records MUST be created at the time of the event. Retroactive creation of Audit Records is not permitted.

**LEBOSS-OBJ-AR-3**
Audit Records MUST NOT be modified after creation. An audit trail that can be altered is not an audit trail.

**LEBOSS-OBJ-AR-4**
Audit Records MUST be retained for a minimum of 36 months from the date of the event, or for the duration of any active dispute related to the event, whichever is longer.

**LEBOSS-OBJ-AR-5**
Audit Records MUST be available to the governing entity upon request. The governing entity MUST be able to query audit records by time range, actor, resource, and action type.

**LEBOSS-OBJ-AR-6**
Where an action is performed under an Access Grant, the Audit Record SHOULD reference the `grant_id` of that grant.

**LEBOSS-OBJ-AR-7**
Where an action involves an external integration, the Audit Record SHOULD reference the `integration_id` of the relevant Integration Descriptor.

**LEBOSS-OBJ-AR-8**
A service provider MUST NOT delete Audit Records, even upon termination of the service relationship. Audit Records MUST be transferred to the governing entity or retained per the governing entity's instruction.

---

## 4. Action Types

The permitted values for the `action` field are:

| Action | Description |
|--------|-------------|
| `read` | Data was retrieved without modification |
| `write` | Data was created or modified |
| `transform` | Data was processed or used to derive new data |
| `export` | Data was extracted from the governed environment |
| `grant_issued` | An Access Grant was created |
| `grant_revoked` | An Access Grant was revoked |
| `integration_authorized` | An Integration Descriptor was created or an integration was activated |
| `integration_deactivated` | An integration was deactivated |
| `access_denied` | An access attempt was made but rejected (missing, expired, or invalid grant) |

Implementations MAY define additional action types but MUST record all events corresponding to the defined types.

---

## 5. Immutability

Audit Records are immutable by definition. Implementations MUST use storage mechanisms that prevent modification of existing records. Acceptable approaches include append-only logs, cryptographically signed records, and write-once storage systems.

The specific immutability mechanism is implementation-defined and not prescribed by this version of the standard.

---

## 6. Relationship to Other Objects

- Audit Records reference Access Grants via `grant_id` to establish the authority under which an action was performed.
- Audit Records reference Integration Descriptors via `integration_id` to establish the integration channel through which an action occurred.
- Governance object lifecycle events (grant issuance, revocation, integration authorization, deactivation) are themselves governed events and MUST produce Audit Records.

---

*Audit Record Object — LEBOSS 0.0.3 — Open for community review.*
