# LEBOSS Glossary of Terms

**Version:** 0.0.8
**Status:** Proposal
**Date:** 2026-03-09

---

> This glossary defines the key terms used in the LEBOSS standard. When a term used in this glossary appears in another LEBOSS document, it carries the meaning defined here unless explicitly stated otherwise.

---

## Access Grant

A discrete, explicitly issued authorization from a governing entity (or their designated delegate) that permits a specific party to perform specific operations on specific data within a LEBOSS-compliant system.

An Access Grant is a governance object with defined required fields: a unique identifier, the issuing entity, the subject, a defined scope, permitted operations, purpose, issuance timestamp, expiry conditions, and an explicit revocability flag.

Access Grants are revocable at any time by the governing entity. Systems must validate an Access Grant before allowing data access, and must reject access where no valid grant exists.

See also: *Governance Object*, *Least Privilege*, *Governing Entity*

Full object definition: [`standards/objects/access-grant.md`](../standards/objects/access-grant.md)

---

## Artificial Satellite

See: *Satellite (Element 5)*

---

## Audit Correlation

The practice of linking Audit Records to the governance objects and events that produced them — specifically, referencing the `grant_id` of the Access Grant and the `integration_id` of the Integration Descriptor involved in a governed action.

Correlation enables reconstruction of the full governance history for any event: who acted, under what authorization, through what channel, and in what causal sequence. In cascade events (such as a grant revocation triggering an integration suspension), correlation ensures both Audit Records carry shared identifiers, making the causal chain explicit.

See also: *Audit Record*, *Audit Event*, *Access Grant*, *Integration Descriptor*

Full protocol: [`standards/leboss-audit-protocol.md`](../standards/leboss-audit-protocol.md)

---

## Audit Event

A governed action that a LEBOSS-compliant system must capture as an Audit Record at the moment it occurs. Audit events include all data operations (read, write, transform, export), all Access Grant lifecycle transitions (issuance, revocation, expiration), and all Integration Descriptor lifecycle transitions (registration, authorization, activation, suspension, deactivation).

An audit event that occurs but is not captured as a record is a compliance violation. The completeness of audit event capture — not merely the existence of an audit record mechanism — is a normative requirement.

See also: *Audit Record*, *Audit Correlation*, *Audit Trail*

Full protocol: [`standards/leboss-audit-protocol.md`](../standards/leboss-audit-protocol.md)

---

## Audit Record

A structured governance object recording a single governed event within a LEBOSS-compliant system. Required fields include a unique event identifier, timestamp, actor identifier, action type, resource identifier, and outcome.

Audit Records are immutable — they must not be modified after creation. They must be retained for a minimum of 36 months and must be available to the governing entity upon request.

See also: *Governance Object*, *Audit Trail*

Full object definition: [`standards/objects/audit-record.md`](../standards/objects/audit-record.md)

---

## Audit Retention

The requirement that Audit Records be preserved for a minimum defined period following the event they document. Under LEBOSS, Audit Records must be retained for a minimum of 36 months from the event timestamp, or for the duration of any active dispute, whichever is longer.

Retention is a storage-layer requirement, not an application-layer configuration. A system that deletes Audit Records before the retention period expires — for any reason including contract termination, storage cost, or system migration — is non-compliant. Upon service termination, Audit Records must be transferred to the governing entity or retained per the governing entity's explicit instruction.

See also: *Audit Record*, *Audit Event*

Full protocol: [`standards/leboss-audit-protocol.md`](../standards/leboss-audit-protocol.md)

---

## Audit Trail

The complete set of Audit Records for a governed environment. A complete, tamper-evident record of all operations performed on data within a LEBOSS-compliant system, including who performed the operation, what operation was performed, what data was affected, and when the operation occurred.

The Audit Trail is the mechanism by which data ownership is made verifiable rather than merely asserted.

---

## Clarity (Principle 1)

The first of LEBOSS's five Foundation Principles. Clarity requires that every part of a business system — including people, brands, workflows, data, and integrations — has a clearly defined role and place within the LEBOSS hierarchy, with no ambiguity about ownership, accountability, or access scope.

---

## Compliance

Alignment with the normative requirements of the LEBOSS standard. A system that meets all structural, organizational, and data ownership requirements of the applicable published version of the standard may be described as LEBOSS-compliant.

Formal compliance criteria are to be defined in a subsequent version of the standard.

---

## Continuity

See: *Legacy and Continuity (Principle 4)*

---

## Committee Vote

The third state in the LEBOSS governance lifecycle. A Committee Vote is a Draft that the committee has formally accepted and opened for member ratification. A ratification period of no less than 14 days is held, during which active members vote. A successful vote advances the standard to Published. An unsuccessful vote returns the document to Draft.

In the LEBOSS version numbering scheme, the `Y` (middle) position increments when a Draft advances to Committee Vote status.

See: [governance/governance.md](../governance/governance.md)

---

## Contributor

Any individual or organization that participates in the LEBOSS community by submitting pull requests, filing issues, engaging in proposal discussions, or adopting and implementing the standard.

Contributors do not hold voting authority on the committee but their participation shapes the standard.

---

## LEBOSS Elements

The six hierarchical architectural elements defined by the LEBOSS standard: Universe (0), Galaxy (1), Star (2), Planet (3), Moon (4), and Satellite (5). Together, the LEBOSS Elements form a complete vocabulary for describing the structure of a local business's digital ecosystem.

---

## Data Fiduciary

A party who holds and manages data on behalf of another party, under an obligation to act in the interests of the data's rightful owner. In the LEBOSS model, service providers who access primary operational data are expected to act as data fiduciaries.

---

## Data Portability

The practical ability of a governing entity to obtain their complete operational data environment — including primary operational data, configuration state, integration records, and audit records — in a machine-readable, independently usable form, through a mechanism within their direct control.

Data portability is a normative requirement of LEBOSS-compliant systems, not an optional feature. A system that holds a governing entity's data but makes it difficult, incomplete, or format-locked to export does not satisfy this requirement regardless of any contractual portability claim.

See also: *Operational Data Export*, *Environment Migration*, *Primary Operational Data*

Full protocol: [`standards/leboss-data-portability-protocol.md`](../standards/leboss-data-portability-protocol.md)

---

## Data Residency

The physical location — including the legal jurisdiction — where data is stored and processed. LEBOSS requires that Universe owners be informed of data residency and retain the right to enforce residency requirements where legally or operationally necessary.

---

## Data Sovereignty

The practical control a business owner exercises over their operational data, determined not only by legal right but by architectural reality — specifically, by the topology of the systems that store, process, and grant access to that data.

LEBOSS treats data sovereignty as the core problem the standard is designed to solve.

---

## Draft

The second state in the LEBOSS governance lifecycle. A Draft is a Proposal that has been accepted for formal committee review. The committee assigns a Draft to a milestone and opens a discussion period of no less than 14 days. A Draft may advance to Committee Vote or be returned to Proposal status.

In the LEBOSS version numbering scheme, the `Z` (rightmost) position represents the draft iteration count.

See: [governance/governance.md](../governance/governance.md)

---

## Derived Data

Data generated by processing or analyzing primary operational data. Examples include aggregated analytics, behavioral models, and performance metrics derived from business operations.

Under LEBOSS, service providers may collect limited derived data (such as operational telemetry) under disclosed and consented conditions, but may not use derived data to benefit third parties or to build products sold to others without explicit authorization from the Universe owner.

---

## Environment Migration

The process of moving a governing entity's complete operational data environment from one LEBOSS-compliant system to another. A successful migration results in the receiving system being capable of operating the governed environment with equivalent functionality, using data exported from the originating system.

Environment migration is a SHOULD-level capability under the Data Portability Protocol. The protocol does not define import mechanisms or receiving-system compatibility requirements — those are deferred to a future proposal. What the current standard requires is that exports be produced in a form that makes migration technically feasible: machine-readable, documented formats accompanied by a complete manifest.

See also: *Operational Data Export*, *Data Portability*

---

## Extensibility (Principle 5)

The fifth of LEBOSS's five Foundation Principles. Extensibility requires that LEBOSS-compliant systems allow new capabilities, workflows, and integrations to be added without disrupting existing operations. No capability should be entangled with others in a way that makes its removal or replacement destructive.

---

## Galaxy (Element 1)

The second element of the LEBOSS Architecture. A Galaxy represents an individual brand, business line, or operating company owned by a Universe. A single Universe may contain multiple Galaxies, each with its own branding, teams, operational settings, and data boundary.

Example: Smith Plumbing is a Galaxy within the Smith & Sons LLC Universe.

---

## Governance Object

A structured data primitive defined by the LEBOSS standard that gives operational form to a normative rule. Governance objects define required fields and normative properties without prescribing implementation format or storage mechanism.

The three governance objects defined in LEBOSS 0.0.3 are: Access Grant, Integration Descriptor, and Audit Record.

See also: *Access Grant*, *Integration Descriptor*, *Audit Record*

---

## Governing Committee

See: *Committee* (defined in [governance/committee.md](../governance/committee.md))

---

## Governing Entity

The root owner of a LEBOSS-compliant system: the person, family, or registered legal entity that owns the business enterprise and holds ultimate authority over all data access decisions. In the LEBOSS Reference Model, the Governing Entity corresponds to the Universe (Element 0).

The term "Governing Entity" is used in implementation-neutral contexts where the spatial metaphor name (Universe) is not appropriate.

See also: *Universe (Element 0)*

---

## Integration Descriptor

A governance object that records the authorization of an external integration (Satellite equivalent) to receive data from a LEBOSS-compliant system. An Integration Descriptor must exist before any external integration may receive primary operational data.

Required fields include a unique integration identifier, the provider name, the authorizing entity, the authorization timestamp, the authorization level (governing entity or brand entity), granted permissions, and data flow descriptions.

See also: *Governance Object*, *Satellite (Element 5)*

Full object definition: [`standards/objects/integration-descriptor.md`](../standards/objects/integration-descriptor.md)

---

## Integration Deactivation

The permanent, irreversible termination of an external integration's authorization within a LEBOSS-compliant system. A deactivated integration must not receive or transmit primary operational data. Deactivation takes effect immediately and cannot be reversed — if the governing entity later wishes to reconnect the same external platform, a new Integration Descriptor with a new integration identifier must be created.

Upon deactivation, the linked Access Grant must be revoked if not already revoked. The Integration Descriptor itself must be retained for audit purposes.

Contrast with: *Integration Suspension*

See also: *Integration Descriptor*, *Integration Lifecycle*

---

## Integration Lifecycle

The defined set of states an external integration passes through during its operational lifetime within a LEBOSS-compliant system: `registered`, `authorized`, `active`, `suspended`, and `deactivated`. State transitions are governed by the Integration Descriptor Protocol.

Registration records the integration but does not confer authorization. Authorization requires a valid, linked Access Grant. An active integration must pass a five-step operational validation before each data operation. Suspension is immediate and reversible; deactivation is immediate and permanent.

See also: *Integration Descriptor*, *Integration Suspension*, *Integration Deactivation*, *Grant Lifecycle*

Full protocol: [`standards/leboss-integration-protocol.md`](../standards/leboss-integration-protocol.md)

---

## Integration Suspension

The immediate, reversible halting of an external integration's data access by the governing entity. A suspended integration must not receive or transmit primary operational data. Suspension takes effect at the moment it is issued and may not be deferred.

Suspension is reversible — the governing entity may reactivate a suspended integration after confirming that the linked Access Grant remains valid. If the linked Access Grant is revoked while the integration is suspended, a new grant must be issued before reactivation.

Contrast with: *Integration Deactivation*

See also: *Integration Lifecycle*, *Integration Descriptor*

---

## Grant Lifecycle

The defined set of states an Access Grant passes through during its operational lifetime: `requested`, `issued`, `active`, `revoked`, and `expired`. State transitions are governed by the Access Grant Protocol.

A grant confers no authorization until it is `active`. A `revoked` grant permanently loses its authorization and cannot be reactivated. An `expired` grant has automatically transitioned out of active status upon satisfaction of its `expires_at` condition.

See also: *Access Grant*, *Grant Revocation*, *Grant Validation*

---

## Grant Revocation

The immediate, permanent invalidation of an Access Grant by the governing entity. Revocation takes effect at the moment it is issued and must be reflected in all system components without delay. A revoked grant cannot be reactivated — new access requires a new grant.

Revocation is a core enforcement mechanism for the governing entity's right to control data access. It must be technically supported in any LEBOSS-compliant system, not merely contractually promised.

See also: *Access Grant*, *Grant Lifecycle*

---

## Grant Validation

The required sequence of checks a LEBOSS-compliant system must perform before authorizing any data access under an Access Grant. The seven steps are: grant existence, issuer authority, subject match, expiration check, revocation check, scope check, and operation check.

A failure at any step must result in access denial. Access denial must generate an Audit Record.

See also: *Access Grant*, *Grant Lifecycle*

---

## Infrastructure Topology

The physical and logical arrangement of systems — including where data is stored, where it is processed, who can access it, and under what conditions — that determines the practical distribution of data ownership power.

LEBOSS treats infrastructure topology as a first-class concern of data governance.

---

## Least Privilege

The information security principle that a party should have access only to the data and capabilities they need to perform their authorized function — no more. In LEBOSS, least privilege applies not only to internal system design but to all vendor and service provider relationships.

---

## Legacy and Continuity (Principle 4)

The fourth of LEBOSS's five Foundation Principles. This principle requires that LEBOSS-compliant systems be designed for long-term resilience, transparent ownership transitions, and deliberate succession planning — acknowledging that local businesses often outlast any particular software platform, service agreement, or individual owner.

---

## Maintainer

A member of the LEBOSS governing body who holds administrative authority over the repository and final responsibility for the integrity of the standard. See [governance/committee.md](../governance/committee.md) for full role definition.

---

## Modularity (Principle 2)

The second of LEBOSS's five Foundation Principles. Modularity requires that business operations and capabilities be organized as interchangeable components that can be adopted, replaced, or removed independently without requiring reconstruction of the broader system.

---

## Moon (Element 4)

The fifth element of the LEBOSS Architecture. A Moon is a natural satellite: a company-owned, company-operated internal capability that orbits a Planet or Star within the LEBOSS hierarchy. Moons provide specialized functional modules — such as sales management, service delivery, or accounting — that are owned and controlled by the business.

Implementations are not required to use the name "Moon" or to name specific modules in any particular way. The defining characteristic is company ownership and operational control, which distinguishes Moons from Satellites.

Contrast with: *Satellite (Element 5)*

---

## Natural Satellite

See: *Moon (Element 4)*

---

## Operational Data Export

A governed operation in which a LEBOSS-compliant system produces a complete, manifest-accompanied package of the governing entity's operational data environment. The export package MUST include primary operational data, configuration state, integration records, audit records, and associated governance objects.

An Operational Data Export is initiated exclusively by the governing entity or a party holding an explicit Access Grant with `export` permission. All export events — request, authority verification, generation start, generation completion, and delivery — must produce Audit Records under the Audit Record Collection Protocol.

See also: *Data Portability*, *Environment Migration*, *Audit Record*, *Access Grant*

Full protocol: [`standards/leboss-data-portability-protocol.md`](../standards/leboss-data-portability-protocol.md)

---

## Planet (Element 3)

The fourth element of the LEBOSS Architecture. A Planet is the backend service that powers a Star. It provides the business logic, data persistence, and operational functionality that makes a customer experience meaningful. A Planet must serve at least one Star; without a Star, it has no purpose in the hierarchy.

Example: A booking API that powers a plumbing company's customer scheduling portal.

---

## Primary Operational Data

The core operational records generated by a business in the course of its activities, including customer records, transaction history, appointments and scheduling records, communications, inventory, and employee records. Primary operational data is owned by the Universe and subject to the full data ownership doctrine of the LEBOSS standard.

Contrast with: *Derived Data*

---

## Proposal

The first of three standard states in the LEBOSS governance model. A Proposal is a pull request against the LEBOSS repository that introduces or modifies content in the standards documents. Any contributor may open a Proposal.

See: [governance/governance.md](../governance/governance.md)

---

## Published

The third and final standard state in the LEBOSS governance model. A Published standard is an approved version of the LEBOSS specification, assigned a version number, and treated as immutable. Changes to a Published standard require a new version proceeding through the full governance workflow.

---

## Reference Model

The LEBOSS Reference Model is the six-element conceptual architecture defined in Section 5 of the LEBOSS standard, using the spatial naming convention: Universe (0), Galaxy (1), Star (2), Planet (3), Moon (4), Satellite (5).

The Reference Model is an illustrative framework, not a required naming convention. Implementations MAY use any internal terminology while still claiming LEBOSS alignment, provided they preserve the underlying ownership hierarchy, data boundaries, dependency rules, and access control relationships defined in the standard.

See also: *LEBOSS Elements*

---

## Resource

An identifiable operational asset within a LEBOSS-governed environment that is owned by a governing entity, can be the target of a governed operation, can be referenced by an Access Grant or Audit Record, and exists within a defined namespace.

Resources are not system constructs — they represent real operational assets the business generates and relies upon. A dataset of customer records, a workflow definition, a configuration artifact, and a service endpoint are all resources in the LEBOSS sense if they are operational assets within the governed environment and may be the target of a governed operation.

See also: *Resource Identifier*, *Resource Type*, *Resource Namespace*, *Primary Operational Data*

Full model: [`standards/leboss-resource-model.md`](../standards/leboss-resource-model.md)

---

## Resource Identifier

The stable, unique label by which a resource is referenced within governance objects, audit records, and export manifests. A resource identifier must be unique within its namespace, stable for the lifetime of the resource, consistent across export and import operations, and human-interpretable in context.

Resource identifiers appear in Access Grant `scope` fields, Audit Record `resource_identifier` fields, Integration Descriptor `data_flows` entries, and Data Portability export manifests. An identifier that cannot be correlated to a resource without access to proprietary internal state is non-compliant.

See also: *Resource*, *Resource Namespace*

Full model: [`standards/leboss-resource-model.md`](../standards/leboss-resource-model.md)

---

## Resource Namespace

The bounded scope within which resource identifiers are unique and meaningful. A namespace must include at minimum the governing entity identifier and, where applicable, the brand entity identifier. Every resource identifier must be qualified by a namespace — a bare identifier without namespace context cannot be resolved unambiguously across environments.

Namespace qualification must be consistent across all governance objects within a governed environment: an Access Grant scope, an Audit Record resource identifier, and an export manifest entry referring to the same resource must use the same namespace-qualified identifier.

See also: *Resource*, *Resource Identifier*

Full model: [`standards/leboss-resource-model.md`](../standards/leboss-resource-model.md)

---

## Resource Type

A classification of an operational asset by its functional role within a LEBOSS-governed environment. Every resource must be assigned a type. The five required type categories are: `data_collection` (structured sets of primary operational records), `configuration` (settings and structural definitions), `governance_object` (formal LEBOSS governance artifacts), `service_endpoint` (addressable interfaces for data flows), and `workflow` (defined sequences of operations or business logic).

Type classification determines which governance rules apply to a resource, how it maps to data categories in Access Grant scopes and Integration Descriptor flow definitions, and how it appears in export manifest categories.

See also: *Resource*, *Primary Operational Data*

Full model: [`standards/leboss-resource-model.md`](../standards/leboss-resource-model.md)

---

## Satellite (Element 5)

The sixth element of the LEBOSS Architecture. A Satellite is an artificial satellite: a connection to a third-party platform or external service operated outside the business's direct control. Satellites represent the boundary of greatest data sovereignty risk, as they are points at which primary operational data may flow to external systems.

Every Satellite must be explicitly authorized at the Galaxy or Universe level before receiving any data, and all data flows through Satellites must be logged and auditable.

Example: A Google Business Profile integration; a QuickBooks sync; a Facebook Ads connection.

Contrast with: *Moon (Element 4)*

---

## Security (Principle 3)

The third of LEBOSS's five Foundation Principles. Security requires that data be separated by business entity, that access follow the principle of least privilege, and that all data operations be auditable. In LEBOSS, security is a structural property of the architecture — not a feature added to an insecure foundation.

---

## Service Provider

Any individual or organization that builds, manages, or operates systems on behalf of a local business under the LEBOSS framework. Service providers are stewards of business data, not owners. They must operate within explicitly granted access, maintain audit records, and facilitate data portability upon exit.

---

## Star (Element 2)

The third element of the LEBOSS Architecture. A Star is the customer experience: the interface through which the outside world interacts with a business. Stars include websites, mobile applications, booking portals, customer kiosks, and any other interface through which customers, partners, or stakeholders make contact with the business.

A Star cannot function without a Planet to support it. Without a Star, a Planet serves no one.

---

## Steward

A party who holds and manages data or a system on behalf of its rightful owner, bound by an obligation to act in the owner's interest. Under LEBOSS, all service providers are stewards. Being a steward does not confer ownership.

---

## Subprocessor

A third-party service used by a service provider that has access to primary operational data. Subprocessors must be disclosed to the Universe owner and are subject to the same LEBOSS obligations as the primary service provider.

---

## Succession Planning

The deliberate architectural design of a system to support the transfer of ownership — of data, credentials, contracts, and operational control — from one person or entity to another. LEBOSS's Legacy and Continuity principle requires that all compliant systems support succession planning.

---

## Universe (Element 0)

The first and foundational element of the LEBOSS Architecture. The Universe is the root owner: the person, family, or registered legal entity that owns the entire business enterprise and everything within it. The Universe is the ultimate authority over all data access decisions in the LEBOSS hierarchy.

A Universe is not a software construct. It is a legal and organizational reality that LEBOSS-compliant systems must reflect and respect.

---

*LEBOSS Glossary of Terms — Open for community contribution through the standard Proposal process.*
