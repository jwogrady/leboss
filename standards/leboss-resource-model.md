# LEBOSS Resource Model
## Local Entrepreneur Business Operating System Standards

**Status:** Proposal
**Version:** 0.0.8
**Date:** 2026-03-09
**Branch:** proposal/0.0.8
**Referenced by:** [standards/objects/access-grant.md](objects/access-grant.md), [standards/objects/audit-record.md](objects/audit-record.md), [standards/leboss-data-portability-protocol.md](leboss-data-portability-protocol.md)

---

> This document defines the structure, identity, and ownership model for governed resources within a LEBOSS-compliant system. A resource is any identifiable operational asset that actors may operate on, Access Grants may authorize access to, and Audit Records must identify. This model makes the scope and target fields of all prior governance protocols structurally precise.

---

## 1. Introduction

Every governance operation in LEBOSS acts upon something. An Access Grant authorizes a party to perform operations within a defined scope. An Audit Record documents what resource was affected by a governed event. The Data Portability Protocol requires export of every resource in a governed environment. Yet until this proposal, the specification has defined governance behavior without formally defining the objects that behavior acts upon.

The Resource Model closes this structural gap. It defines what a resource is, how resources are identified, how ownership is established, and how existing protocols reference resources in a consistent, verifiable way.

This model is:
- **definitional** — it establishes the structure and semantics of resources, not behavioral rules for managing them
- **implementation-neutral** — it does not mandate a specific storage format, identifier scheme, or type taxonomy
- **retrospectively applicable** — the `scope` field of the Access Grant, the `resource_identifier` field of the Audit Record, and the export scope definitions of the Data Portability Protocol are all understood to reference resources as defined in this model

---

## 2. Relationship to Governance Objects

The Resource Model provides the structural foundation for scope and target references across existing governance objects:

| Governance Object | Resource Reference | How This Model Applies |
|-------------------|-------------------|------------------------|
| Access Grant | `scope` field | A scope is a reference to one or more resources; the Resource Model defines what may be referenced |
| Audit Record | `resource_identifier` field | A resource identifier is the stable identifier of the affected resource; this model defines what that identifier must satisfy |
| Integration Descriptor | `data_flows` field | Data flow entries reference resource categories; this model defines how categories map to resources |
| Data Portability export manifest | export categories | A complete export must include all resources owned by the governing entity; this model defines what constitutes a resource for enumeration purposes |

---

## 3. Resource Definition

A **resource** is an identifiable operational asset within a LEBOSS-governed environment that:

1. is owned by a governing entity
2. can be the target of a governed operation (read, write, transform, or export)
3. can be referenced by an Access Grant, an Audit Record, or an Integration Descriptor
4. exists within a defined namespace

Resources are not system constructs — they are representations of real operational assets the business generates and relies upon. A dataset of customer records, a workflow definition, a configuration artifact, and a service endpoint are all resources in the LEBOSS sense if they are operational assets within the governed environment.

**LEBOSS-RM-1**
Every operational asset within a LEBOSS-governed environment that may be accessed, modified, or exported MUST be representable as a resource as defined in this model. A system that permits governed operations on assets that are not representable as resources does not satisfy the auditability and authorization requirements of the LEBOSS specification.

---

## 4. Resource Identifier

A resource identifier is the stable, unique label by which a resource is referenced within governance objects, audit records, and export manifests.

### 4.1 Identifier Requirements

**LEBOSS-RM-2**
Every resource MUST have a resource identifier. A resource without an identifier cannot be the target of a governed operation — it cannot be referenced in an Access Grant scope, cannot be recorded in an Audit Record, and cannot be included in an export manifest.

**LEBOSS-RM-3**
Resource identifiers MUST be unique within the resource's namespace (§7). Two distinct resources within the same namespace MUST NOT share an identifier.

**LEBOSS-RM-4**
Resource identifiers MUST be stable. An identifier assigned to a resource MUST continue to identify the same resource for the lifetime of that resource within the governed environment. Identifier reassignment — retiring an identifier from one resource and assigning it to another — is not permitted.

**LEBOSS-RM-5**
Resource identifiers MUST be consistent across export and import operations. A resource exported from a LEBOSS-compliant system and imported into another MUST carry its original identifier, enabling audit records and access grants that reference the resource to remain valid across environments.

### 4.2 Identifier Format

**LEBOSS-RM-6**
The format of a resource identifier is implementation-defined. Implementations MAY use URIs, UUIDs, hierarchical path expressions, or other stable identifier schemes. Whatever format is chosen MUST be documented and consistently applied across all governance objects within the governed environment.

**LEBOSS-RM-7**
Resource identifiers MUST be human-interpretable in context. An identifier that cannot be correlated to a resource without access to proprietary internal state is not compliant. The governing entity MUST be able to understand which resource an identifier refers to from the documentation provided with an export or audit record.

---

## 5. Resource Types

Resource types classify operational assets by their functional role within the governed environment. Type classification determines which governance rules apply to a resource, which data categories it belongs to, and how it appears in export manifests.

### 5.1 Required Type Classification

**LEBOSS-RM-8**
Every resource MUST be assigned a resource type. A resource without a type cannot be meaningfully referenced in an Access Grant scope or included in a typed export manifest category.

**LEBOSS-RM-9**
The following resource type categories MUST be supported by any LEBOSS-compliant system. Each category represents a class of operational assets the specification recognizes as requiring governance:

| Type Category | Description | Examples |
|--------------|-------------|---------|
| `data_collection` | A structured set of primary operational records | Customer records, transaction history, appointment schedules, inventory |
| `configuration` | Settings, parameters, and structural definitions that govern system behavior | Workflow definitions, notification rules, access control lists, integration settings |
| `governance_object` | A formal LEBOSS governance artifact | Access Grants, Integration Descriptors, Audit Records |
| `service_endpoint` | An addressable interface through which data flows into or out of the governed environment | API endpoints, webhook receivers, integration connectors |
| `workflow` | A defined sequence of operations or business logic | Automated sequences, approval chains, scheduled processes |

**LEBOSS-RM-10**
Implementations MAY define additional resource type categories beyond those listed in §5.1 to support implementation-specific asset classification. Additional types MUST be documented and MUST NOT contradict the categories defined here.

### 5.2 Type and Data Categories

**LEBOSS-RM-11**
Where a resource is of type `data_collection`, it MUST be associated with one or more data categories as defined in the `data_categories` field of the Audit Record object and the `data_flows` field of the Integration Descriptor. This association enables Access Grant scopes and Integration Descriptor flow definitions to reference data categories that resolve to specific `data_collection` resources.

---

## 6. Resource Ownership

Every resource exists within the ownership hierarchy of the LEBOSS Reference Model. Ownership establishes which governing entity has authority over a resource — who may authorize access, who may request export, and who must be notified of governance events involving the resource.

### 6.1 Ownership Requirements

**LEBOSS-RM-12**
Every resource MUST be associated with a governing entity (Universe). A resource that has no governing entity association is ungoverned and MUST NOT be the target of governed operations within a LEBOSS-compliant system.

**LEBOSS-RM-13**
Where a governed environment contains multiple brand entities (Galaxies), each resource MUST be associated with the specific brand entity within whose data boundary it exists, in addition to the governing entity association. Operations on a resource MUST be authorized within the correct brand entity boundary.

**LEBOSS-RM-14**
Resource ownership MUST be preserved across export and import operations. A resource exported from a governed environment carries its ownership association. An import into a new environment MUST either preserve the original ownership association or establish a new, explicit association — it MUST NOT leave the resource's ownership undefined.

### 6.2 Ownership and Access Authority

**LEBOSS-RM-15**
Only the governing entity that owns a resource — or a party holding a valid Access Grant issued by that governing entity — may authorize operations on that resource. A resource's ownership defines the authority chain for all governance operations involving it.

---

## 7. Resource Namespace

A resource namespace is the bounded scope within which resource identifiers are unique and meaningful. Namespaces prevent identifier collisions across governing entities, brand entities, and system environments.

### 7.1 Namespace Requirements

**LEBOSS-RM-16**
Every resource identifier MUST be qualified by a namespace. A bare identifier with no namespace context cannot be resolved unambiguously across environments and MUST NOT appear in governance objects, audit records, or export manifests.

**LEBOSS-RM-17**
At a minimum, a namespace MUST include the governing entity identifier and, where applicable, the brand entity identifier. Implementations MAY define additional namespace dimensions (for example, environment type: production, staging) but MUST NOT omit the governing entity dimension.

**LEBOSS-RM-18**
Namespace qualification MUST be consistent across all governance objects within a governed environment. An Access Grant scope, an Audit Record resource identifier, and an export manifest entry that all refer to the same resource MUST use the same namespace-qualified identifier.

### 7.2 Namespace Portability

**LEBOSS-RM-19**
Export packages MUST include namespace definitions alongside resource identifiers, sufficient for an independent system to understand the namespace context of every resource identifier in the export. A receiving system that encounters a namespaced identifier in an import package MUST be able to determine its governing entity and brand entity context without external lookup.

---

## 8. Relationship to Access Grants

Access Grants are the mechanism by which the governing entity authorizes parties to perform operations on resources. The Resource Model defines the structure that makes Access Grant scopes precise and verifiable.

### 8.1 Scope Resolution

**LEBOSS-RM-20**
The `scope` field of an Access Grant MUST reference one or more resources, resource type categories, or data categories that resolve to a defined set of resources within the granted namespace. A grant scope that cannot be resolved to an identifiable set of resources does not satisfy the Access Grant Protocol's requirement that scope be explicitly defined.

**LEBOSS-RM-21**
When validating an Access Grant against a resource operation request (Step 6 of the Access Grant Protocol validation sequence), the system MUST resolve the grant's `scope` to its constituent resources and confirm that the requested resource falls within that set. A resource that is not within the grant's resolved scope MUST result in denial of the operation.

### 8.2 Operation and Resource Binding

**LEBOSS-RM-22**
An authorized operation always combines an operation type (read, write, transform, export) with a resource. Access Grants MUST specify both. An Access Grant that authorizes an operation without a resource reference, or that references a resource without specifying permitted operations, is incomplete and MUST NOT be treated as valid.

**LEBOSS-RM-23**
Audit Records for authorized and denied operations MUST reference both the `resource_identifier` of the resource involved and the `grant_id` of the Access Grant under which the operation was evaluated. These two references together form the complete governance record of an operation: what was acted upon, and under what authority.

---

## 9. Model Boundaries

This model does not define:

- **Resource lifecycle management** — how resources are created, versioned, archived, or deleted is outside this specification; a Resource Lifecycle Protocol is deferred to a future proposal
- **Resource discovery** — how parties enumerate available resources within a governed environment is outside this specification
- **Type taxonomy enforcement** — while required type categories are defined, mandatory sub-classifications within categories are outside this specification
- **Cross-environment resource mapping** — how resources are matched between source and destination environments during migration is outside this specification

These concerns will be addressed in future proposals.

---

*LEBOSS Resource Model 0.0.8 — Open for community review and contribution.*
