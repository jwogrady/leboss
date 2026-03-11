# LEBOSS Data Portability Protocol
## Local Entrepreneur Business Operating System Standards

**Status:** Proposal
**Version:** 0.0.7
**Date:** 2026-03-09
**Depends on:** [standards/objects/audit-record.md](objects/audit-record.md), [standards/leboss-audit-protocol.md](leboss-audit-protocol.md)

---

> This document defines the behavioral requirements for operational data export and environment migration within a LEBOSS-compliant system. It makes data ownership practically exercisable — ensuring the governing entity can obtain a complete, accurate, and independently usable copy of their operational data environment at any time.

---

## 1. Introduction

The LEBOSS doctrine establishes that operational data belongs to the governing entity, not to the platforms that store and process it. Prior proposals have built the governance layer: normative rules, structured objects, authorization protocols, integration controls, and audit coverage. This protocol defines the enforcement layer — the system behaviors that make ownership exercisable in practice.

Without enforceable portability, data ownership is a contractual claim that cannot be acted upon. A governing entity that cannot extract their complete operational environment, in a usable format, at a time of their choosing, does not practically own their data regardless of what any agreement says. The Data Portability Protocol eliminates this gap.

This protocol is:
- **implementation-neutral** — it specifies what must happen, not how it is implemented
- **format-agnostic** — it does not mandate a specific export format, but defines what any format must satisfy
- **complementary to the Audit Record Collection Protocol** — export events are governed events and produce audit records under the behavioral framework established in 0.0.6

---

## 2. Relationship to Governance Objects and Rules

This protocol operationalizes the following normative rules:

| Rule | Addressed By |
|------|-------------|
| LEBOSS-CONT-1 — governed systems must support data portability | §3 Export Authority, §4 Export Scope |
| LEBOSS-CONT-2 — governing entities must be able to exit systems with their data | §3 Export Authority, §5 Export Completeness |
| LEBOSS-CONT-3 — data must be exportable in a machine-readable format | §6 Export Neutrality |
| LEBOSS-CONT-4 — export obligations survive contract termination | §5 Export Completeness, §7 Migration Considerations |
| LEBOSS-SEC-3 — all data operations must be auditable | §8 Audit Requirements |

---

## 3. Export Authority

An operational data export is a governed operation. Only the governing entity — or a party explicitly delegated by the governing entity through a valid Access Grant — may initiate an export of operational data.

### 3.1 Authority Verification

**LEBOSS-DPP-1**
A LEBOSS-compliant system MUST verify the authority of the requesting party before initiating any export operation. Export requests from parties without governing entity authority MUST be denied. The verification process MUST follow the grant validation sequence defined in the Access Grant Protocol (§5 of `leboss-access-grant-protocol.md`).

**LEBOSS-DPP-2**
Export authority MUST NOT be granted by implication, by service agreement, or by default access permissions. Export authority requires an explicit Access Grant with `export` as a permitted operation and a scope covering the requested data.

**LEBOSS-DPP-3**
A service provider MUST NOT initiate or deliver an export of the governing entity's operational data to any third party without an explicit, valid Access Grant from the governing entity authorizing that specific export to that specific party.

**LEBOSS-DPP-4**
Authority verification MUST generate an Audit Record regardless of whether the export request is approved or denied.

### 3.2 Self-Service Export

**LEBOSS-DPP-5**
A LEBOSS-compliant system MUST provide the governing entity with the ability to initiate an operational data export through a mechanism within their direct control. Export capability MUST NOT require a service request to the service provider, though service-provider-assisted export MAY be offered as an additional option.

---

## 4. Export Scope

An operational data export MUST include the complete data environment of the governing entity. The following categories constitute the minimum required scope of a full export.

### 4.1 Required Export Categories

**LEBOSS-DPP-6**
A full operational data export MUST include all of the following categories:

| Category | Description |
|----------|-------------|
| Primary operational data | All customer records, transaction history, scheduling records, communications, inventory, and employee records within the governed environment |
| Configuration state | All settings, customizations, workflow definitions, and structural configurations that affect how the operational environment functions |
| Integration records | All Integration Descriptors and associated Access Grants for any external integration that has operated within the governed environment |
| Audit records | All Audit Records generated within the governed environment, for the full period they are required to be retained |
| Governance objects | All Access Grants, Integration Descriptors, and any other governance objects associated with the governed environment |

**LEBOSS-DPP-7**
A full export MUST NOT exclude any of the categories defined in §4.1 without explicit, written authorization from the governing entity. A service provider MAY NOT omit categories for operational convenience, storage cost, or any other reason not explicitly authorized.

**LEBOSS-DPP-8**
For environments organized by brand entity (Galaxy), a full export MUST include data from all brand entities within the governing entity's scope, unless the governing entity explicitly requests a scoped export limited to one or more specific brand entities.

### 4.2 Partial Exports

**LEBOSS-DPP-9**
A LEBOSS-compliant system MAY support partial exports scoped to a specific brand entity, data category, or time range. Partial exports MUST be clearly labeled as partial, identifying the scope, the categories included, and the categories excluded.

**LEBOSS-DPP-10**
A partial export MUST NOT be presented to the governing entity as a complete export of their operational environment. Labeling or documentation that obscures the partial nature of an export is a compliance violation.

---

## 5. Export Completeness

### 5.1 Completeness Requirements

**LEBOSS-DPP-11**
A LEBOSS-compliant system MUST ensure that all data present in the governed environment at the time of the export request is included in the export package, subject to the scope defined in §4. Data that exists in the system at export time but is omitted from the export package renders the export incomplete.

**LEBOSS-DPP-12**
A LEBOSS-compliant system MUST include a manifest with every export package. The manifest MUST enumerate the data categories included, the time range covered, the record counts per category where determinable, and the timestamp at which the export was generated.

**LEBOSS-DPP-13**
The governing entity MUST be able to verify export completeness using the manifest without relying on the service provider's confirmation. The manifest MUST be sufficient for an independent party to assess whether the export covers the claimed scope.

**LEBOSS-DPP-14**
Export completeness obligations survive contract termination. A governing entity MUST be able to request a complete export at any time, including after notice of contract termination has been given, and up to the data retention deadline defined in the service agreement. A service provider MUST NOT restrict export access as a consequence of contract termination.

### 5.2 Data Currency

**LEBOSS-DPP-15**
An export MUST reflect the state of operational data at a defined point in time, which MUST be recorded in the export manifest. The governing entity MUST be informed if any operational data has changed between the export generation timestamp and delivery.

---

## 6. Export Neutrality

### 6.1 Format Requirements

**LEBOSS-DPP-16**
Exports MUST use machine-readable formats. A format is machine-readable for the purposes of this protocol if it can be parsed and interpreted by software without requiring access to proprietary tools owned or controlled by the service provider.

**LEBOSS-DPP-17**
The format used for each exported data category MUST be documented. Documentation MUST be provided to the governing entity at the time of export or made continuously available. The documentation MUST be sufficient for an independent system to ingest and use the exported data.

**LEBOSS-DPP-18**
A LEBOSS-compliant system MUST NOT require the governing entity to use a proprietary tool, API, or software package owned by the service provider in order to open, read, or use their exported data.

**LEBOSS-DPP-19**
Where a data category is exported in multiple representations (for example, both a normalized relational form and a denormalized flat file), all representations MUST be clearly labeled and their relationship to each other documented.

### 6.2 Format Evolution

**LEBOSS-DPP-20**
If the export format changes between versions of the system, the governing entity MUST be notified of the change before it takes effect. Prior export packages produced under a previous format remain valid and the service provider MUST retain the ability to produce exports in the prior format for the duration of the data retention period applicable to that data.

---

## 7. Migration Considerations

### 7.1 Migration Support

**LEBOSS-DPP-21**
A LEBOSS-compliant system SHOULD support migration workflows that allow an exported environment to be received by a compatible system. This includes producing export packages in a form that enables another system to reconstitute the governing entity's operational environment without requiring manual data transformation.

**LEBOSS-DPP-22**
Import mechanisms and compatibility requirements for receiving systems are not defined by this protocol. Migration support is a SHOULD requirement at this stage of the standard; mandatory import compatibility requirements are deferred to a future proposal.

### 7.2 Continuity During Migration

**LEBOSS-DPP-23**
The act of requesting or generating an export MUST NOT disrupt the ongoing operation of the governed environment. Export generation is a read operation and MUST NOT lock, pause, or alter primary operational data.

**LEBOSS-DPP-24**
Where an export operation spans an extended time period, the system MUST record the start and end timestamps of the export generation process in the export manifest. Any changes to operational data that occur during export generation MUST be handled consistently — either captured in the export as part of the time-bounded snapshot or documented as outside the export scope.

---

## 8. Audit Requirements

Export events are among the highest-risk operations in a governed environment — they are the moments at which the governing entity's complete operational data leaves the system. Full audit coverage of export events is required.

### 8.1 Required Audit Events

**LEBOSS-DPP-25**
A LEBOSS-compliant system MUST generate an Audit Record for each of the following events:

| Event | Audit Record `action` Value |
|-------|---------------------------|
| Export requested | `export_requested` |
| Export authority verified | `export_authorized` |
| Export authority denied | `access_denied` |
| Export generation started | `export_started` |
| Export generation completed | `export_completed` |
| Export delivered to governing entity | `export` |
| Export request denied (incomplete authority) | `access_denied` |

**LEBOSS-DPP-26**
All Audit Records for export events MUST identify the `actor_identifier` of the party that initiated the request, the `grant_id` of the Access Grant under which the export was authorized, and the scope of the export as defined by the manifest.

**LEBOSS-DPP-27**
An Audit Record for `export_completed` MUST reference the manifest identifier of the export package produced. This creates a persistent governance record linking the authorization event to the specific export artifact.

**LEBOSS-DPP-28**
All export event Audit Records are subject to the retention and integrity requirements of the Audit Record Collection Protocol (`standards/leboss-audit-protocol.md`). Export event records MUST be retained for the full applicable retention period, and MUST NOT be deleted when the associated export package is deleted.

---

## 9. Protocol Boundaries

This protocol does not define:

- **Export package format** — the specific schema, encoding, or file format for export packages is outside this specification; a future LEBOSS Portability Format proposal will address this
- **Import or reconstitution mechanisms** — how a receiving system ingests an export package is outside this specification
- **Delivery mechanism** — whether exports are delivered as downloads, object storage transfers, physical media, or other means is outside this specification
- **Encryption requirements** — whether and how export packages must be encrypted in transit or at rest is outside this specification
- **Cross-provider migration orchestration** — coordinating migration between a source and destination provider is outside this specification

These concerns will be addressed in future proposals.

---

*LEBOSS Data Portability Protocol 0.0.7 — Open for community review and contribution.*
