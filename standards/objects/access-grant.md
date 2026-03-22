# Access Grant Object
## LEBOSS Governance Object Definition

**Status:** Proposal
**Version:** 0.0.3
**Date:** 2026-03-09
**Rules Addressed:** LEBOSS-ACC-1, ACC-2, ACC-3, ACC-4

---

## 1. Purpose

An Access Grant is the structured authorization primitive that permits a specific party to access primary operational data within a LEBOSS-compliant system.

No data access MAY occur without a valid, in-scope Access Grant. The Access Grant is the mechanism by which LEBOSS-ACC-1 ("No service provider MAY access primary operational data without an explicit, scoped access grant") is made verifiable.

---

## 2. Object Definition

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `grant_id` | Identifier | A unique identifier for this Access Grant. MUST be unique within the governed environment. |
| `issuer_entity` | Identifier | The identifier of the governing entity (Universe equivalent) or their designated delegate who issued this grant. |
| `subject_identifier` | Identifier | The identifier of the party to whom the grant is issued (service provider, system, or role). |
| `scope` | Structured value | The data scope covered by this grant. MUST identify which element or data boundary the grant covers (e.g., a specific Galaxy, Planet, or data category). |
| `operations` | List | The operations permitted under this grant. MUST be drawn from the defined operation set: `read`, `write`, `transform`, `export`. |
| `purpose` | String | A human-readable statement of the purpose for which access is granted. |
| `issued_at` | Timestamp | The date and time at which the grant was issued. |
| `expires_at` | Timestamp or Condition | The date/time or condition at which this grant expires. MAY be a fixed timestamp or a condition (e.g., "upon termination of service agreement"). |
| `revocable` | Boolean | MUST be `true`. All Access Grants are revocable. This field is present to make revocability explicit and machine-readable. |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `revoked_at` | Timestamp | If the grant has been revoked, the date and time of revocation. |
| `revocation_reason` | String | A human-readable statement of why the grant was revoked. |
| `delegated_from` | Identifier | If this grant was issued by a delegate rather than the governing entity directly, the identifier of the originating grant that authorized the delegation. |
| `conditions` | List | Additional conditions that must be satisfied for the grant to remain valid (e.g., IP restrictions, time-of-day limits). |
| `subprocessors` | List | Identifiers of any subprocessors who will operate under this grant. MUST be disclosed per LEBOSS-SVC-5. |

---

## 3. Normative Requirements

**LEBOSS-OBJ-AG-1**
Every Access Grant MUST contain all required fields. An Access Grant missing any required field is invalid and MUST NOT be treated as authorization for data access.

**LEBOSS-OBJ-AG-2**
The `issuer_entity` field MUST identify the governing entity or a party explicitly delegated by the governing entity. Access Grants issued by unauthorized parties are invalid.

**LEBOSS-OBJ-AG-3**
The `operations` field MUST contain at least one permitted operation. An Access Grant with no defined operations grants no access.

**LEBOSS-OBJ-AG-4**
The `scope` field MUST be specific enough to identify the data boundary covered. A grant with an unbounded or undefined scope is invalid.

**LEBOSS-OBJ-AG-5**
All Access Grants MUST be revocable. Systems MUST implement a mechanism for the governing entity to revoke any Access Grant at any time.

**LEBOSS-OBJ-AG-6**
Systems MUST validate the following before allowing data access under an Access Grant:
- The grant exists and all required fields are present
- The grant has not expired
- The grant has not been revoked
- The requested operation is within the grant's permitted `operations`
- The requested data is within the grant's defined `scope`

**LEBOSS-OBJ-AG-7**
Access Grants MUST be retained for a minimum of the duration of the service relationship plus a reasonable period for dispute resolution. Minimum retention SHOULD be no less than 12 months following grant expiry or revocation.

**LEBOSS-OBJ-AG-8**
Access Grants MUST be available to the governing entity upon request, in a human-readable form.

---

## 4. Operation Set

The permitted values for the `operations` field are:

| Operation | Description |
|-----------|-------------|
| `read` | Retrieve data without modification |
| `write` | Create or modify data |
| `transform` | Process or derive new data from existing data |
| `export` | Extract data from the governed environment |

Implementations MAY define additional operation types but MUST NOT grant access for unlisted operations under a grant that does not include them.

---

## 5. Relationship to Delegation

A governing entity MAY designate a delegate to issue Access Grants on their behalf. Delegated grants MUST reference the `delegated_from` field to establish the chain of authority. A delegate MUST NOT issue grants with broader scope or permissions than their own delegated authority.

The standard-level constraints governing delegation — scope bounding, traceability, revocation cascade, and prohibition of implicit access — are defined in [`standards/leboss-normative-rules.md`](../leboss-normative-rules.md) (LEBOSS-DEL-1 through DEL-6), added in proposal 0.0.18.

---

## 6. Relationship to Other Objects

- An Access Grant MAY reference an Integration Descriptor when granting access to an external integration.
- Every data access event governed by an Access Grant SHOULD produce an Audit Record referencing the `grant_id`.

---

*Access Grant Object — LEBOSS 0.0.3 — Open for community review.*
