# Integration Descriptor Object
## LEBOSS Governance Object Definition

**Status:** Proposal
**Version:** 0.0.3
**Date:** 2026-03-09
**Rules Addressed:** LEBOSS-ACC-5, ARCH-10, ARCH-11

---

## 1. Purpose

An Integration Descriptor is the structured record of an authorized external integration within a LEBOSS-compliant system.

External integrations (Satellite equivalents) are the point of greatest data sovereignty risk in the LEBOSS reference model. Before any external integration MAY receive data, it MUST be explicitly authorized at the brand entity or governing entity level (LEBOSS-ACC-5). The Integration Descriptor is the object that records that authorization.

Without an Integration Descriptor, a connection to an external platform cannot be verified as explicitly authorized, and the requirement that all data flows through external integrations be logged and auditable (LEBOSS-ARCH-11) cannot be enforced.

---

## 2. Object Definition

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `integration_id` | Identifier | A unique identifier for this integration within the governed environment. |
| `provider` | String | The name or identifier of the external platform or service being integrated. |
| `authorized_by` | Identifier | The identifier of the governing entity or brand entity that issued the authorization for this integration. |
| `authorized_at` | Timestamp | The date and time at which the integration was authorized. |
| `authorization_level` | Enum | The level at which authorization was granted. MUST be one of: `governing_entity` or `brand_entity`. |
| `permissions_granted` | List | The explicit set of permissions granted to this integration. Each entry MUST correspond to a defined operation (`read`, `write`, `transform`, `export`) applied to a defined data scope. |
| `data_flows` | List | A description of data flows associated with this integration. Each entry MUST specify direction (`inbound` or `outbound`) and the data category involved. |
| `active` | Boolean | Whether this integration is currently active and authorized to receive data. |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `authentication_method` | String | The authentication mechanism used to connect to the external provider (e.g., OAuth 2.0, API key, webhook). |
| `permissions_requested` | List | The permissions originally requested by the integration, prior to governing entity review. MAY differ from `permissions_granted`. |
| `linked_grant_id` | Identifier | The `grant_id` of an Access Grant that governs this integration's data access. |
| `deactivated_at` | Timestamp | If the integration has been deactivated, the date and time of deactivation. |
| `deactivation_reason` | String | A human-readable statement of why the integration was deactivated. |
| `subprocessors` | List | Any subprocessors used by the external provider that may have access to data flowing through this integration. |

---

## 3. Normative Requirements

**LEBOSS-OBJ-ID-1**
An Integration Descriptor MUST exist for every active external integration before that integration MAY receive any primary operational data.

**LEBOSS-OBJ-ID-2**
The `authorized_by` field MUST identify the governing entity or brand entity that issued the authorization. Integrations authorized by parties without the authority to grant access are invalid.

**LEBOSS-OBJ-ID-3**
The `permissions_granted` field MUST be explicitly defined. An Integration Descriptor with undefined or unbounded permissions is invalid.

**LEBOSS-OBJ-ID-4**
An integration with `active` set to `false` MUST NOT receive primary operational data. Systems MUST enforce this check before transmitting data to any external integration.

**LEBOSS-OBJ-ID-5**
Integration Descriptors MUST be available to the governing entity upon request. The governing entity MUST be able to enumerate all active and historical integrations at any time.

**LEBOSS-OBJ-ID-6**
All data flows through an active integration MUST produce Audit Records referencing the `integration_id`.

**LEBOSS-OBJ-ID-7**
Integration Descriptors MUST be retained for the duration of the integration's active period plus a minimum of 12 months following deactivation.

---

## 4. Authorization Levels

The `authorization_level` field indicates where in the ownership hierarchy the authorization was granted:

| Level | Description |
|-------|-------------|
| `governing_entity` | Authorization issued at the root owner level. Applies across all brand entities unless scoped otherwise. |
| `brand_entity` | Authorization issued at the brand entity level. Applies only within that brand entity's data boundary. |

A `brand_entity`-level authorization MUST NOT grant access to data outside that brand entity's boundary.

---

## 5. Relationship to Access Grants

An Integration Descriptor describes the registration and authorization of an external integration. An Access Grant governs the data access that integration may perform. These are complementary objects:

- An Integration Descriptor establishes that an integration is authorized to exist and operate.
- An Access Grant defines specifically what data that integration may access and what operations it may perform.

For external integrations, both objects SHOULD be present. The `linked_grant_id` field on the Integration Descriptor establishes the relationship.

---

## 6. Deactivation

Deactivating an integration (setting `active` to `false`) MUST immediately prevent the integration from receiving data. Deactivation does not delete the Integration Descriptor — the record MUST be retained for audit purposes.

If an integration is reactivated after deactivation, a new authorization event MUST be recorded and the `authorized_at` and `authorized_by` fields MUST reflect the new authorization.

---

*Integration Descriptor Object — LEBOSS 0.0.3 — Open for community review.*
