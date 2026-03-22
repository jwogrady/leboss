# LEBOSS Normative Rule Register
## Local Entrepreneur Business Operating System Standards

**Status:** Draft
**Target Release:** v0.1.0
**Updated Through:** proposal/0.0.28
**Derived from:** [leboss-standard.md](leboss-standard.md)

---

> This document extracts every normative requirement from the LEBOSS Standard into a flat, enumerable rule register. Rules are drawn directly from the standard and do not introduce new requirements. This register is intended as an implementer reference and a compliance checklist.
>
> In all cases, the full specification in [leboss-standard.md](leboss-standard.md) is authoritative. Where this register and the standard appear to conflict, the standard governs.

---

## Rule Numbering

Rules are identified as `LEBOSS-{group}-{number}` where group indicates the category:

- `OWN` — Ownership Rules
- `ACC` — Access Rules
- `ARCH` — Architectural Rules
- `SEC` — Security Rules
- `CONT` — Continuity Rules
- `SVC` — Service Provider Rules
- `SPEC` — Specification Boundary Rules
- `ENF` — Enforcement Responsibility Rules
- `REC` — Audit as System of Record Rules
- `PORT` — Data Portability Requirements Rules
- `MAP` — Cross-System Resource Identity and Mapping Rules
- `DEL` — Delegation and Authority Chain Rules
- `VER` — Conformance Verification Rules
- `PROT` — Protocol Normativity Rules
- `ACTOR` — Actor Identity Portability Rules
- `GEA` — Governing Entity Authenticity Rules
- `AUD` — Audit Resolution Requirements Rules
- `DCL` — Delegation Chain Lifetime Rules

---

## Ownership Rules

**LEBOSS-OWN-1**
All primary operational data generated within a LEBOSS-compliant system MUST be owned by the governing entity (root owner) to which it belongs.
*Source: §6.1*

**LEBOSS-OWN-2**
A service provider MUST NOT acquire ownership of primary operational data through access to it.
*Source: §7.1*

**LEBOSS-OWN-3**
A LEBOSS-compliant system MUST provide the governing entity with the ability to export all primary operational data in a standard, machine-readable format at any time.
*Source: §6.4*

**LEBOSS-OWN-4**
The governing entity MUST be informed of where primary operational data is stored and processed, including the jurisdiction of that infrastructure.
*Source: §6.5*

**LEBOSS-OWN-5**
Service providers MAY collect derived data (operational telemetry) necessary to provide and improve the service. The type of derived data collected MUST be disclosed in advance and consented to.
*Source: §6.2*

**LEBOSS-OWN-6**
Derived data MUST NOT include primary operational data without explicit authorization from the governing entity.
*Source: §6.2*

**LEBOSS-OWN-7**
Derived data MUST NOT be used to benefit third parties without explicit authorization from the governing entity.
*Source: §6.2*

**LEBOSS-OWN-8**
Derived data MUST be deleted upon termination of the service relationship, unless the governing entity consents otherwise.
*Source: §6.2*

**LEBOSS-OWN-9**
Data MUST be treated as primary operational data if it is materially required for the operation, continuity, accountability, or reconstruction of the governed business environment — regardless of how it is labeled or classified within the implementing system.
*Source: §6.1*

**LEBOSS-OWN-10**
A conformant system MUST NOT exclude data from primary operational data ownership, audit, or portability obligations by classifying it as auxiliary, metadata, configuration, or supplementary when that data is materially required for continuity, accountability, or reconstruction of the governed environment.
*Source: §6.1*

---

## Access Rules

**LEBOSS-ACC-1**
No service provider MAY access primary operational data without an explicit, scoped access grant issued by the governing entity or their designated delegate.
*Source: §6.3*

**LEBOSS-ACC-2**
Every access grant MUST specify: the scope of data covered, the operations permitted, the duration or expiration conditions, and the stated purpose.
*Source: §6.3*

**LEBOSS-ACC-3**
Access grants are revocable at any time by the governing entity.
*Source: §6.3*

**LEBOSS-ACC-4**
A service provider MUST operate only within the scope of explicitly granted access. Any access beyond the grant scope is a violation of this standard.
*Source: §7.2*

**LEBOSS-ACC-5**
External integration components (Satellites) MUST be explicitly authorized at the brand entity or governing entity level before they MAY receive any data.
*Source: §5.4, rule 4*

---

## Architectural Rules

**LEBOSS-ARCH-1**
The system MUST organize its architecture to reflect the ownership hierarchy and data boundaries defined in LEBOSS Standard §5, regardless of internal naming conventions.
*Source: §5.1, §8.1*

**LEBOSS-ARCH-2**
Each data environment MUST be associated with exactly one governing entity (root owner).
*Source: §8.1*

**LEBOSS-ARCH-3**
A brand entity MUST belong to exactly one governing entity.
*Source: §5.4, rule 5*

**LEBOSS-ARCH-4**
A customer interface MUST belong to exactly one brand entity.
*Source: §5.4, rule 6*

**LEBOSS-ARCH-5**
A backend service component MUST serve at least one customer interface. A backend with no associated interface has no purpose in the hierarchy.
*Source: §5.4, rule 1*

**LEBOSS-ARCH-6**
A customer interface MUST be supported by at least one backend service.
*Source: §5.4, rule 2*

**LEBOSS-ARCH-7**
An internal capability component MUST operate within the data boundary of a single brand entity.
*Source: §5.4, rule 3*

**LEBOSS-ARCH-8**
Brand-level data boundaries MUST be maintained. Data belonging to one brand entity MUST NOT be accessible to another brand entity without an explicit cross-entity access grant.
*Source: §8.1*

**LEBOSS-ARCH-9**
Backend service components MUST maintain data separation from other backend components in the same or different brand entities.
*Source: §5.2, Element 3*

**LEBOSS-ARCH-10**
External integration components MUST NOT become a path through which primary operational data leaves the governing entity's control without explicit authorization.
*Source: §5.2, Element 5*

**LEBOSS-ARCH-11**
All data flows in or out through external integration components MUST be logged and auditable.
*Source: §5.2, Element 5*

---

## Security Rules

**LEBOSS-SEC-1**
Data MUST be separated by business entity at the architectural level.
*Source: §4, Principle 3*

**LEBOSS-SEC-2**
Access MUST follow the principle of least privilege. No party MAY access more data than their explicit grant authorizes.
*Source: §4, Principle 3; §8.4*

**LEBOSS-SEC-3**
All data operations MUST be auditable.
*Source: §4, Principle 3*

**LEBOSS-SEC-4**
Implementations MUST NOT leave ownership, accountability, or access scope ambiguous.
*Source: §4, Principle 1*

**LEBOSS-SEC-5**
All external integration boundaries MUST be explicitly authorized and audited.
*Source: §8.4*

---

## Continuity Rules

**LEBOSS-CONT-1**
Systems MUST be designed for long-term resilience, transparent ownership transitions, and deliberate succession planning.
*Source: §4, Principle 4*

**LEBOSS-CONT-2**
Data MUST remain accessible and portable through ownership transitions.
*Source: §4, Principle 4*

**LEBOSS-CONT-3**
Implementations MUST NOT bind data to a specific person, role, or service agreement in a way that makes it inaccessible upon that person's departure or that agreement's termination.
*Source: §4, Principle 4*

**LEBOSS-CONT-4**
LEBOSS-compliant systems MUST allow new capabilities, workflows, and integrations to be added without disrupting existing operations.
*Source: §4, Principle 5*

---

## Service Provider Rules

**LEBOSS-SVC-1**
Upon termination of a service relationship, the provider MUST facilitate the complete and timely export of all primary operational data in a machine-readable format.
*Source: §7.4*

**LEBOSS-SVC-2**
A service provider MUST NOT withhold, delay, or degrade the quality of a data export upon exit.
*Source: §7.4*

**LEBOSS-SVC-3**
The service provider MUST maintain complete audit records of all data access and transformations performed under the grant.
*Source: §7.3*

**LEBOSS-SVC-4**
Audit records MUST be available to the governing entity upon request.
*Source: §7.3*

**LEBOSS-SVC-5**
If the service provider uses third-party services that have access to primary operational data, these subprocessors MUST be disclosed to the governing entity.
*Source: §7.5*

**LEBOSS-SVC-6**
Disclosed subprocessors are subject to the same LEBOSS requirements as the primary service provider.
*Source: §7.5*

**LEBOSS-SVC-7**
The service provider MUST NOT use primary operational data for any purpose beyond delivering the contracted service — including training machine learning models, building aggregate datasets, or improving services for other customers — without explicit written consent from the governing entity.
*Source: §7.6*

**LEBOSS-SVC-8**
Any entity that stores, processes, transmits, or has the ability to access or control primary operational data — including entities providing infrastructure, hosting, or administrative support to systems containing primary operational data — MUST be treated as a service provider under this standard and is subject to all applicable service provider obligations, regardless of whether their access is direct, delegated, purposeful, or incidental.
*Source: §7.0*

**LEBOSS-SVC-9**
A conformant system MUST NOT permit any entity to access primary operational data without that entity being subject to the service provider obligations defined in this standard, including disclosure requirements (LEBOSS-SVC-5) and access grant requirements (LEBOSS-ACC-1).
*Source: §7.0*

---

## Specification Boundary Rules

**LEBOSS-SPEC-1**
The LEBOSS specification MUST NOT impose requirements on specific technologies, runtime environments, infrastructure platforms, or API designs.
*Source: §1.2*

**LEBOSS-SPEC-2**
Implementations MAY reference normative LEBOSS rules and use the LEBOSS Reference Model as a design vocabulary.
*Source: §1.2*

**LEBOSS-SPEC-3**
Implementations MUST NOT redefine, override, or selectively apply normative LEBOSS requirements while claiming LEBOSS alignment or compliance.
*Source: §1.2*

**LEBOSS-SPEC-4**
The LEBOSS standard does not designate any specific implementation as preferred or required. Implementations MUST remain replaceable — no conformant implementation is structurally privileged over another under this standard.
*Source: §1.2*

---

## Enforcement Responsibility Rules

**LEBOSS-ENF-1**
Normative requirements defined in this standard MUST be enforced in operation.
Documentation of compliance, policy declarations, and stated intent MUST NOT be
treated as satisfying normative requirements.
*Source: §8.6*

**LEBOSS-ENF-2**
A LEBOSS-compliant system MUST ensure that governed actions — including data access,
grant validation, grant revocation, audit record creation, and data export — are
subject to rule enforcement at the time they occur.
*Source: §8.6*

**LEBOSS-ENF-3**
A system MUST NOT be described as LEBOSS-aligned or LEBOSS-compliant if it permits
governed actions to proceed without enforcement of applicable normative requirements,
whether by design, configuration, exception, or operational failure.
*Source: §8.6, conformance.md §4*

**LEBOSS-ENF-4**
The LEBOSS standard MUST NOT prescribe a specific enforcement architecture, mechanism,
or technology. The obligation to enforce normative requirements does not constrain the
means by which enforcement is achieved.
*Source: §1.2, §8.6*

---

## Audit as System of Record Rules

**LEBOSS-REC-1**
The set of Audit Records for a governed environment MUST constitute the authoritative record of governed actions within that environment.
*Source: §8.7*

**LEBOSS-REC-2**
A LEBOSS-compliant system MUST NOT represent the state of a governed resource in a manner that is irreconcilable with the Audit Record history for that resource.
*Source: §8.7*

**LEBOSS-REC-3**
Audit Records MUST be treated as foundational to system integrity. A system that treats audit records as supplementary or secondary to its primary state mechanism does not satisfy LEBOSS audit requirements.
*Source: §8.7*

**LEBOSS-REC-4**
The LEBOSS standard MUST NOT prescribe how the system of record is stored or processed. Only the consistency guarantee between Audit Record history and represented resource state is normative.
*Source: §8.7*

---

## Data Portability Requirements Rules

**LEBOSS-PORT-1**
A complete export MUST include all primary operational data, all governance objects (Access Grants, Integration Descriptors), and all Audit Records within the system's retention window.
*Source: §6.4*

**LEBOSS-PORT-2**
A conformant system MUST NOT produce an export that omits any governed resource category without explicit governing entity authorization.
*Source: §6.4*

**LEBOSS-PORT-3**
An export MUST preserve the structural relationships between resources, governance objects, and Audit Records such that those relationships are recoverable from the export alone.
*Source: §6.4*

**LEBOSS-PORT-4**
An export MUST be sufficient to reconstruct the governed environment's operational state in an independent system without reliance on the exporting system or its service providers.
*Source: §6.4*

**LEBOSS-PORT-5**
Exports MUST use documented, non-proprietary formats. The documentation for the export format MUST be sufficient for an independent party to implement a reader without access to proprietary tools or vendor assistance.
*Source: §6.4*

**LEBOSS-PORT-6**
Exports MUST include a manifest identifying the resource categories included, the time range covered, and the record counts for each category, sufficient for the governing entity to verify completeness independently.
*Source: §6.4*

---

## Cross-System Resource Identity and Mapping Rules

**LEBOSS-MAP-1**
Every governed resource MUST have a stable identity within its environment. An identity that changes over time, or that depends on system-internal state not present in an export, cannot serve as a basis for governance continuity across systems.
*Source: §17*

**LEBOSS-MAP-2**
Resource identity MUST persist through export and import without alteration. The identity a resource carries in an export package MUST be the same identity used to reference it in governance objects — Access Grants, Audit Records, and Integration Descriptors — within that environment.
*Source: §17*

**LEBOSS-MAP-3**
An export MUST include sufficient identity information for each resource to enable a receiving system to uniquely identify and map that resource independently, without access to the source system or its service providers.
*Source: §17*

**LEBOSS-MAP-4**
A receiving system importing a LEBOSS export MUST be able to map each imported resource to an internal equivalent without requiring access to the source system or its service providers.
*Source: §17*

**LEBOSS-MAP-5**
Structural relationships between resources MUST remain resolvable in the receiving system after import. An import that renders previously resolvable relationships between resources unresolvable does not satisfy this standard.
*Source: §17*

**LEBOSS-MAP-6**
Resource identity and mapping MUST NOT depend on proprietary mechanisms, vendor-controlled systems, or undocumented processes.
*Source: §17*

---

## Delegation and Authority Chain Rules

**LEBOSS-DEL-1**
Delegated authority MUST NOT exceed the scope, operations, or duration of the grant from which it was delegated. A delegate cannot authorize more than they were themselves authorized to authorize.
*Source: §18*

**LEBOSS-DEL-2**
A delegated grant MUST reference the originating grant that authorized the delegation. A grant with no traceable originating authority is invalid and MUST NOT be treated as a basis for access.
*Source: §18*

**LEBOSS-DEL-3**
A delegation chain MUST be fully traceable from any point in the chain to the root governing entity grant. A chain that cannot be resolved to a valid root governing entity grant does not satisfy this standard.
*Source: §18*

**LEBOSS-DEL-4**
Revocation of a grant MUST propagate to all grants in the delegation chain that depend on it. A delegated grant that continues to authorize access after its originating grant has been revoked constitutes a conformance failure.
*Source: §18*

**LEBOSS-DEL-5**
A conformant system MUST NOT permit delegation chains that introduce ambiguity in access authority or that cannot be fully audited.
*Source: §18*

**LEBOSS-DEL-6**
Delegation MUST NOT create implicit or inherited access. Access authorized through delegation is bounded by explicit grant scope at every step in the chain.
*Source: §18*

---

## Conformance Verification Rules

**LEBOSS-VER-1**
A LEBOSS-compliant system MUST satisfy all applicable normative rules. Partial satisfaction of normative rules MUST NOT be represented as full compliance.
*Source: §19*

**LEBOSS-VER-2**
Compliance claims MUST be supportable through observable system behavior and audit records. Self-declaration without supporting evidence MUST NOT constitute a valid compliance claim.
*Source: §19*

**LEBOSS-VER-3**
A system MUST NOT claim LEBOSS compliance if any non-conformance condition defined in conformance.md §4 is present.
*Source: §19*

**LEBOSS-VER-4**
A system MUST provide sufficient visibility into its governed operations to allow an independent party to verify conformance without relying solely on system-reported assertions.
*Source: §19*

**LEBOSS-VER-5**
Where conformance levels are defined, those levels MUST be clearly bounded and non-ambiguous. A system MUST NOT represent partial satisfaction of a conformance level as meeting that level.
*Source: §19*

**LEBOSS-VER-6**
Verification MUST NOT be satisfied by documentation, policy declaration, or stated intent alone. Conformance requires observable evidence of enforcement in governed operations.
*Source: §19*

---

## Summary Counts

| Group | Rules | MUST | MUST NOT | MAY | SHOULD |
|-------|-------|------|----------|-----|--------|
| Ownership (OWN) | 10 | 6 | 4 | 1 | — |
| Access (ACC) | 5 | 3 | 1 | 2 | — |
| Architectural (ARCH) | 11 | 9 | 2 | — | — |
| Security (SEC) | 5 | 4 | 1 | 1 | — |
| Continuity (CONT) | 4 | 4 | 1 | — | — |
| Service Provider (SVC)              | 9  | 6  | 3  | — | — |
| Specification Boundary (SPEC)       | 4  | 2  | 2  | 1 | — |
| Enforcement Responsibility (ENF)    | 4  | 2  | 3  | — | — |
| Audit as System of Record (REC)     | 4  | 2  | 2  | — | — |
| Data Portability Requirements (PORT) | 6 | 5  | 1  | — | — |
| Cross-System Identity and Mapping (MAP) | 6 | 5  | 1  | — | — |
| Delegation and Authority Chains (DEL)   | 6 | 3  | 3  | — | — |
| Conformance Verification (VER)          | 6 | 4  | 4  | — | — |
| Protocol Normativity (PROT)             | 5 | 2  | 3  | — | — |
| Actor Identity Portability (ACTOR)      | 6 | 3  | 3  | — | — |
| Governing Entity Authenticity (GEA)     | 6 | 3  | 3  | — | — |
| Audit Resolution Requirements (AUD)     | 6 | 3  | 3  | — | — |
| Delegation Chain Lifetime (DCL)         | 6 | 3  | 3  | — | — |
| **Total**                           | **109** | **69** | **43** | **5** | **—** |

---

## Protocol Normativity Rules

**LEBOSS-PROT-1**
The following protocol documents are incorporated into the normative framework of this standard: the Access Grant Protocol (`standards/leboss-access-grant-protocol.md`, LEBOSS-AGP-1 through AGP-17), the Integration Descriptor Protocol (`standards/leboss-integration-protocol.md`, LEBOSS-IDP-1 through IDP-26), the Audit Record Collection Protocol (`standards/leboss-audit-protocol.md`, LEBOSS-ACP-1 through ACP-24), and the Data Portability Protocol (`standards/leboss-data-portability-protocol.md`, LEBOSS-DPP-1 through DPP-28). A system claiming LEBOSS compliance MUST satisfy the requirements of all incorporated protocol documents. Only protocol provisions expressed in normative language (MUST, MUST NOT, SHALL) are incorporated as binding requirements under this rule. Explanatory, descriptive, or non-normative content in protocol documents is not binding.
*Source: §20*

**LEBOSS-PROT-2**
A conformant system MUST NOT treat protocol-level behavioral rules as non-binding guidance. A MUST or MUST NOT requirement defined in an incorporated LEBOSS protocol document carries the same normative weight as a rule listed directly in this register.
*Source: §20*

**LEBOSS-PROT-3**
Conformance evaluation MUST NOT be performed against this register alone while ignoring behavioral requirements defined in incorporated protocol documents. Full conformance requires satisfaction of all register rules and all applicable protocol-level rules.
*Source: §20*

**LEBOSS-PROT-4**
Incorporated protocol documents MUST NOT introduce normative requirements that are not traceable to the governance model defined in this standard. A protocol provision is traceable if it operationalizes a requirement within an established rule group or directly enforces a principle, doctrine, or obligation defined in this standard.
*Source: §20*

**LEBOSS-PROT-5**
Where an incorporated LEBOSS protocol defines required behavior through MUST or MUST NOT language, that requirement MUST be treated as normatively binding by virtue of the protocol's incorporation under LEBOSS-PROT-1. No separate rule listing in this register is required for a protocol rule to constitute a binding obligation under this standard.
*Source: §20*

---

## Actor Identity Portability Rules

**LEBOSS-ACTOR-1**
Actor identity references in governance objects — including Audit Records, Access Grants, and Integration Descriptors — MUST be portable. An actor reference is portable if it can be interpreted in a receiving system without access to the originating system's internal state or identity infrastructure.
*Source: §21*

**LEBOSS-ACTOR-2**
A conformant system MUST NOT export governance objects containing actor identity references that are meaningful only within the originating system's internal state and that are not accompanied by sufficient context for interpretation in a receiving system.
*Source: §21*

**LEBOSS-ACTOR-3**
An export MUST include sufficient actor identity context for each actor referenced in governance objects to enable a receiving system to determine the accountable party for each governed action without access to the source system or its service providers.
*Source: §21*

**LEBOSS-ACTOR-4**
Governance history MUST NOT become opaque as a result of actor identity resolution failure after export or migration. An export that renders actor references in Audit Records unresolvable or uninterpretable does not satisfy this standard.
*Source: §21*

**LEBOSS-ACTOR-5**
Actor identity portability MUST preserve accountability semantics. It is not sufficient that an actor identifier be structurally present in an export — the identity information must be sufficient to determine accountability for each governed action in a new environment.
*Source: §21*

**LEBOSS-ACTOR-6**
Actor identity in governance objects MUST NOT depend on systems or infrastructure external to the governed environment that are unavailable to or inaccessible by an independent receiving system.
*Source: §21*

---

## Governing Entity Authenticity Rules

**LEBOSS-GEA-1**
A governing entity MUST represent independent authority that exists outside the implementing system. A governing entity that can only be created, defined, or validated by the implementing system or by a service provider does not constitute a valid governing entity under this standard.
*Source: §22*

**LEBOSS-GEA-2**
A conformant system MUST NOT permit a service provider to unilaterally create, modify, reassign, or revoke governing entity authority without the authorization of the party the governing entity represents.
*Source: §22*

**LEBOSS-GEA-3**
A governing entity's authority MUST NOT be dependent on identifiers, accounts, or credentials that are exclusively controlled by a service provider or platform. Ownership authority that ceases to exist upon termination of a service relationship does not satisfy this standard.
*Source: §22*

**LEBOSS-GEA-4**
A governing entity's authority MUST remain valid and transferable across system migrations. A change in implementing system, service provider, or infrastructure does not extinguish governing entity authority.
*Source: §22*

**LEBOSS-GEA-5**
A conformant system MUST NOT treat system-generated identifiers alone as sufficient basis for governing entity authority. The authority of a governing entity must be grounded in the real-world entity it represents, not in a system record.
*Source: §22*

**LEBOSS-GEA-6**
A conformant system MUST ensure that governing entity authority is independently verifiable — it must not rest solely on assertions made by the implementing system or its service providers.
*Source: §22*

---

## Audit Resolution Requirements Rules

**LEBOSS-AUD-1**
Audit records MUST contain sufficient detail to determine what specific resources were accessed or affected, what operation was performed, and the outcome of that operation. A record that documents only the occurrence of an event without resource-level and operation-level specificity does not satisfy this requirement.
*Source: §23*

**LEBOSS-AUD-2**
Audit records MUST be sufficiently granular to allow determination of whether the access described was within the scope defined by the applicable Access Grant. An audit record that cannot be evaluated against the grant that authorized the action does not satisfy this standard.
*Source: §23*

**LEBOSS-AUD-3**
A conformant system MUST NOT produce audit records that aggregate, summarize, or omit resource-level and operation-level detail in a manner that prevents verification of whether individual governed actions were within authorized scope.
*Source: §23*

**LEBOSS-AUD-4**
Audit records MUST support reconstruction of governed actions from the audit record alone, without reliance on system state, service provider cooperation, or information not present in the audit record itself.
*Source: §23*

**LEBOSS-AUD-5**
A conformant system MUST NOT produce audit records that are interpretable only with knowledge of internal system state, internal nomenclature, or conventions unavailable to an independent evaluator. Audit records must carry sufficient context to be self-interpreting with respect to the governed action they document.
*Source: §23*

**LEBOSS-AUD-6**
A conformant system MUST NOT satisfy audit recording requirements by producing records that document the occurrence of governed events while omitting the detail required to evaluate whether those events were authorized. Recording that an event occurred is not equivalent to recording what that event was.
*Source: §23*

---

## Delegation Chain Lifetime Rules

**LEBOSS-DCL-1**
A delegation chain MUST remain independently verifiable for its entire active lifetime. Verifiability requires that the chain can be traced to a valid root governing entity grant through evidence that does not rely on assertions made by the implementing system or its service providers.
*Source: §24*

**LEBOSS-DCL-2**
A conformant system MUST NOT maintain active delegation grants whose authority chain cannot be independently validated. A delegation chain that has become unverifiable — whether through loss of supporting audit evidence or any other cause — MUST be treated as having no valid authority.
*Source: §24*

**LEBOSS-DCL-3**
The audit evidence supporting each step in a delegation chain MUST persist for at least as long as the delegation remains active. A delegation chain that outlives the verifiable record of its origin does not satisfy this standard.
*Source: §24*

**LEBOSS-DCL-4**
A conformant system MUST NOT allow a delegation chain to remain active after the supporting audit records establishing the root governing entity grant have become unavailable or irrecoverable.
*Source: §24*

**LEBOSS-DCL-5**
Loss of verifiability in any link of a delegation chain MUST propagate as a validity failure to all grants in that chain. A delegation chain is only as verifiable as its least-verified link.
*Source: §24*

**LEBOSS-DCL-6**
A conformant system MUST NOT substitute its own assertions, internal state, or configuration as evidence of delegation authority when independent audit evidence is unavailable. System trust is not a substitute for independently verifiable evidence.
*Source: §24*

---

## Gaps Identified

The following requirements were identified as implied by the standard but not yet specified with sufficient precision to be enumerable as rules. Status reflects the current state of the specification through proposal 0.0.28.

**GAP-1: Access Grant Format** — *Resolved in 0.0.3 and 0.0.4; normative standing formalized in 0.0.24*
The standard requires that access grants specify scope, operations, duration, and purpose (LEBOSS-ACC-2). The Access Grant object (`standards/objects/access-grant.md`) defines the required fields. The Access Grant Protocol (`standards/leboss-access-grant-protocol.md`) defines issuance, validation, revocation, and expiration behavioral rules (LEBOSS-AGP-1 through AGP-17). These rules are incorporated as normative requirements under LEBOSS-PROT-1.

**GAP-2: Audit Trail Format** — *Resolved in 0.0.3 and 0.0.6; normative standing formalized in 0.0.24*
The standard requires auditable records (LEBOSS-SEC-3, LEBOSS-SVC-3). The Audit Record object (`standards/objects/audit-record.md`) defines the required fields. The Audit Record Collection Protocol (`standards/leboss-audit-protocol.md`) defines capture, correlation, retention, and integrity behavioral rules (LEBOSS-ACP-1 through ACP-24). These rules are incorporated as normative requirements under LEBOSS-PROT-1.

**GAP-3: Portability Format** — *Portability behavioral requirements resolved; canonical encoding deferred*
The standard requires machine-readable export (LEBOSS-OWN-3, LEBOSS-SVC-1). The Data Portability Protocol (`standards/leboss-data-portability-protocol.md`) defines export authority, scope, completeness, and neutrality behavioral rules (LEBOSS-DPP-1 through DPP-28). Proposal 0.0.16 added standard-level requirements for export completeness, relationship preservation, reconstructability, format independence, and manifests (LEBOSS-PORT-1 through PORT-6). DPP behavioral rules are incorporated as normative requirements under LEBOSS-PROT-1. A specific canonical encoding format remains deferred to a future proposal.

**GAP-4: External Integration Authorization Protocol** — *Resolved in 0.0.3 and 0.0.5; normative standing formalized in 0.0.24*
LEBOSS-ACC-5 requires explicit authorization for external integrations. The Integration Descriptor object (`standards/objects/integration-descriptor.md`) defines what must be recorded. The Integration Descriptor Protocol (`standards/leboss-integration-protocol.md`) defines the full integration lifecycle and behavioral rules (LEBOSS-IDP-1 through IDP-26). These rules are incorporated as normative requirements under LEBOSS-PROT-1.

**GAP-5: Succession and Ownership Transfer** — *Open*
LEBOSS-CONT-1 through CONT-3 require succession support but no protocol exists for executing an ownership transfer. Deferred to a future proposal.

---

*LEBOSS Normative Rule Register — pre-v0.1.0 draft, updated through proposal/0.0.28. The standard governs in all cases of conflict.*
