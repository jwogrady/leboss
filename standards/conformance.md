# LEBOSS Conformance

**Status:** Draft
**Updated Through:** proposal/0.0.28
**Applies to:** LEBOSS Standard pre-v0.1.0 draft and later

---

## 1. Purpose

This document defines the minimum requirements for systems claiming compatibility with the LEBOSS standard.

### 1.0 Conformance Tiers *(Informative)*

LEBOSS defines two conformance tiers:

**LEBOSS-aligned** — The structural conformance claim. A system that preserves the LEBOSS ownership hierarchy, data boundaries, dependency rules, and access control relationships defined in the Reference Model (§5 of the base standard), regardless of the internal naming used. LEBOSS-aligned asserts that the architecture is organized consistently with the LEBOSS model.

**LEBOSS-compliant** — The normative conformance claim. A system that satisfies all MUST-level requirements defined in Section 3 of this document. LEBOSS-compliant asserts full behavioral conformance with all protocols, governance object rules, and data ownership requirements.

All LEBOSS-compliant systems are also LEBOSS-aligned. LEBOSS-aligned systems are not required to be LEBOSS-compliant.

The term "LEBOSS-conformant" is not a defined LEBOSS conformance term and **MUST NOT** be used as a conformance claim.

A system that satisfies all requirements in Section 3 **MAY** be described as **LEBOSS-compliant**. A system that fails any requirement in Section 4 **MUST NOT** be described as LEBOSS-compliant.

### 1.1 Normative Language

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** in this document are to be interpreted as described in [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119):

- **MUST** — an absolute requirement
- **MUST NOT** — an absolute prohibition
- **SHOULD** — recommended; deviation requires documented justification
- **SHOULD NOT** — not recommended; deviation requires documented justification
- **MAY** — optional; neither required nor prohibited

Only requirements using these terms are normative. Explanatory text and examples are informative.

---

## 2. Conformance Scope

A LEBOSS-compliant system must implement the following components.

### 2.1 Core Governance Objects

| Object | Defined in |
|--------|-----------|
| Resources | [leboss-resource-model.md](leboss-resource-model.md) |
| Access Grants | [objects/access-grant.md](objects/access-grant.md) |
| Integration Descriptors | [objects/integration-descriptor.md](objects/integration-descriptor.md) |
| Audit Records | [objects/audit-record.md](objects/audit-record.md) |

### 2.2 Operational Protocols

| Protocol | Defined in |
|----------|-----------|
| Audit Record Collection Protocol | [leboss-audit-protocol.md](leboss-audit-protocol.md) |
| Data Portability Protocol | [leboss-data-portability-protocol.md](leboss-data-portability-protocol.md) |

### 2.3 System Model

| Component | Defined in |
|-----------|-----------|
| Resource Namespace Model | [leboss-resource-model.md](leboss-resource-model.md) |
| Governing Entity ownership boundary | [leboss-standard.md §5](leboss-standard.md#5-the-leboss-reference-model) |

---

## 3. Minimum Conformance Requirements

### 3.1 Governing Entity

A conformant system **MUST** define a governing entity that holds ownership over the operational resources of the system.

The governing entity **MUST** be a uniquely identifiable root owner — a person, family, or legal entity — to whom all data sovereignty rights belong.

### 3.2 Resource Model

A conformant system **MUST** implement a resource model capable of:

- uniquely identifying each governed resource
- enumerating the complete set of resources associated with a governing entity
- associating each resource with exactly one governing entity

Resources **MUST NOT** be owned by service providers, integrations, or infrastructure operators.

### 3.3 Access Grants

A conformant system **MUST** require an explicit, scoped access grant before any integration or actor may perform operations on governed resources.

Access grants **MUST** specify:

- the subject (the actor being granted access)
- the scope (which resources and operations are permitted)
- the granting authority (the governing entity or its delegate)

Operations that do not correspond to an active access grant **MUST NOT** be permitted.

### 3.4 Audit Records

A conformant system **MUST** record an audit event for every operation that affects governed resources.

The set of Audit Records for a governed environment constitutes the **authoritative record** of governed actions within that system. Audit Records are not supplementary — they are foundational to system integrity.

Audit records **MUST** include:

- a timestamp
- the identity of the actor that performed the operation
- the resource or resources affected
- the operation type

Audit records **MUST NOT** be modifiable or deletable by actors other than the governing entity acting under documented retention policy.

A conformant system **MUST NOT** represent the state of a governed resource in a manner that is irreconcilable with the Audit Record history for that resource (LEBOSS-REC-2).

### 3.5 Data Portability

A conformant system **MUST** support data portability, allowing the governing entity to:

- export all primary operational data in a machine-readable format
- export the complete governance history, including access grants and audit records
- perform this export without requiring assistance or permission from any service provider

The portability mechanism **MUST** be available at any time, not only upon termination of a service relationship.

A conformant system **MUST** produce exports that are complete, relationship-preserving, reconstructable, and format-independent. Specifically:

- Exports **MUST** include all governed resource categories — primary operational data, governance objects, and audit records — without omission (LEBOSS-PORT-1, LEBOSS-PORT-2).
- Exports **MUST** preserve the structural relationships between resources, governance objects, and Audit Records so that those relationships are recoverable from the export alone (LEBOSS-PORT-3).
- Exports **MUST** be sufficient to reconstruct the governed environment's operational state in an independent system without reliance on the exporting system or its service providers (LEBOSS-PORT-4).
- Exports **MUST** use documented, non-proprietary formats with documentation sufficient for independent implementation (LEBOSS-PORT-5).
- Exports **MUST** include a manifest identifying resource categories, time range, and record counts (LEBOSS-PORT-6).

Export completeness **MUST** be evaluated against the functional scope of primary operational data as defined in LEBOSS-OWN-9. A system **MUST NOT** satisfy the completeness requirement by applying a narrow definition of primary operational data that excludes data materially required for continuity, accountability, or reconstruction of the governed environment (LEBOSS-OWN-10).

### 3.6 Audit History Access

A conformant system **MUST** maintain a verifiable audit history accessible to the governing entity.

The governing entity **MUST** be able to query the audit history to determine what operations were performed, by which actors, and at what times — for any period within the system's retention window.

Service providers **MUST NOT** be able to suppress, modify, or selectively withhold audit records from the governing entity.

### 3.7 Operational Enforcement

A conformant system **MUST** enforce normative requirements in operation.

Documentation of compliance, policy declarations, and stated intent do not constitute enforcement. A governed action that proceeds without enforcement of applicable normative requirements is a conformance violation, regardless of whether the failure was intentional.

Operational enforcement is required across all governed action categories: data access, grant validation, grant revocation, audit record creation, and data export.

### 3.8 Cross-System Resource Identity and Mapping

A conformant system **MUST** ensure that governed resources carry stable, portable identity sufficient to support cross-system migration. Specifically:

- Every governed resource **MUST** have a stable identity within its environment that does not depend on system-internal state absent from an export (LEBOSS-MAP-1).
- Resource identity **MUST** persist through export and import without alteration — the identity used in governance objects **MUST** match the identity carried in the export (LEBOSS-MAP-2).
- Exports **MUST** include sufficient identity information for each resource to enable a receiving system to uniquely identify and map that resource independently (LEBOSS-MAP-3).
- A receiving system importing a LEBOSS export **MUST** be able to map each imported resource to an internal equivalent without requiring access to the source system (LEBOSS-MAP-4).
- Structural relationships between resources **MUST** remain resolvable after import (LEBOSS-MAP-5).
- Resource identity and mapping **MUST NOT** depend on proprietary mechanisms, vendor-controlled systems, or undocumented processes (LEBOSS-MAP-6).

### 3.9 Delegation and Authority Chains

A conformant system **MUST** enforce structural constraints on delegated access authority. Specifically:

- Delegated authority **MUST NOT** exceed the scope, operations, or duration of the grant from which it was delegated (LEBOSS-DEL-1).
- Every delegated grant **MUST** reference the originating grant that authorized the delegation (LEBOSS-DEL-2).
- Delegation chains **MUST** be fully traceable from any point to the root governing entity grant (LEBOSS-DEL-3).
- Revocation of a grant **MUST** propagate to all dependent delegated grants (LEBOSS-DEL-4).
- A conformant system **MUST NOT** permit delegation chains that introduce ambiguity in access authority or that cannot be fully audited (LEBOSS-DEL-5).
- Delegation **MUST NOT** create implicit or inherited access outside explicit grant scope (LEBOSS-DEL-6).

### 3.10 Conformance Verification

A conformant system **MUST** satisfy the conditions under which its compliance claim can be independently verified. Specifically:

- A conformant system **MUST** satisfy all applicable normative rules. Partial satisfaction of normative rules **MUST NOT** be represented as full compliance (LEBOSS-VER-1).
- Compliance claims **MUST** be supportable through observable system behavior and audit records. Self-declaration without supporting evidence **MUST NOT** constitute a valid compliance claim (LEBOSS-VER-2).
- A system **MUST NOT** claim LEBOSS compliance if any non-conformance condition in §4 of this document is present (LEBOSS-VER-3).
- A system **MUST** provide sufficient visibility into its governed operations to allow an independent party to verify conformance without relying solely on system-reported assertions (LEBOSS-VER-4).
- Where conformance levels are defined, those levels **MUST** be clearly bounded and non-ambiguous. A system **MUST NOT** represent partial satisfaction of a conformance level as meeting that level (LEBOSS-VER-5).
- Verification **MUST NOT** be satisfied by documentation, policy declaration, or stated intent alone. Conformance requires observable evidence of enforcement in governed operations (LEBOSS-VER-6).

---

## 4. Non-Conformance Conditions

A system **MUST NOT** be described as LEBOSS-compliant if any of the following conditions exist:

1. **Unauthorized access** — integrations or actors can read, write, or modify governed resources without a corresponding active access grant.

2. **Audit bypass** — operations affecting governed resources are not recorded in the audit log, whether by design, configuration, or exemption.

3. **Incomplete exports** — the data portability mechanism omits governance records (access grants, audit history) from the exported data set.

4. **Export restriction** — the governing entity cannot retrieve their operational data without service provider involvement, approval, or a paid service tier.

5. **Data retention after exit** — a service provider retains primary operational data after the governing entity has terminated the service relationship and requested deletion.

6. **Secondary use without consent** — primary operational data is used for purposes beyond those covered by active access grants without explicit governing entity consent.

7. **Rule redefinition** — the system redefines, overrides, or selectively applies normative LEBOSS requirements in a manner inconsistent with the published standard while claiming LEBOSS alignment or compliance (LEBOSS-SPEC-3).

8. **Unenforced requirements** — normative requirements governing data access, grant validation, grant revocation, audit record creation, or data export are satisfied by documentation, policy declaration, or stated intent only, without operational enforcement (LEBOSS-ENF-1, LEBOSS-ENF-2).

9. **Irreconcilable state** — the system represents the state of a governed resource in a manner that cannot be reconciled with the Audit Record history for that resource (LEBOSS-REC-2).

10. **Non-reconstructable export** — the data portability mechanism produces exports that are insufficient to reconstruct the governed environment's operational state in an independent system without reliance on the exporting system or its service providers (LEBOSS-PORT-4).

11. **Proprietary format dependency** — exports require proprietary tools, vendor-controlled systems, or undocumented formats to access, parse, or interpret, making them inaccessible to independent implementation (LEBOSS-PORT-5).

12. **Identity-breaking import** — the system fails to map imported resources to internal equivalents, or the import process alters resource identities such that governance objects referencing those resources become unresolvable (LEBOSS-MAP-4).

13. **Proprietary identity dependency** — resource identity or cross-system mapping depends on proprietary mechanisms, vendor-controlled systems, or undocumented processes, preventing independent migration without source system access (LEBOSS-MAP-6).

14. **Unbounded delegation** — the system permits a delegated grant to be issued with scope, operations, or duration exceeding those of the delegating grant, or permits delegation chains to extend beyond the bounds of the root governing entity grant (LEBOSS-DEL-1).

15. **Untraceable authority chain** — the system permits delegation chains that cannot be traced to a valid root governing entity grant, or that introduce ambiguity in access authority, or that do not propagate revocation to all dependent grants (LEBOSS-DEL-3, LEBOSS-DEL-4, LEBOSS-DEL-5).

16. **False compliance claim** — the system claims LEBOSS compliance while any non-conformance condition in this section is present, or while any applicable normative rule is unsatisfied (LEBOSS-VER-1, LEBOSS-VER-3).

17. **Unverifiable conformance** — the system does not provide sufficient visibility into its governed operations to allow an independent party to verify conformance, or represents partial satisfaction of normative rules as full compliance (LEBOSS-VER-2, LEBOSS-VER-4, LEBOSS-VER-5, LEBOSS-VER-6).

18. **Functionally incomplete export** — the system applies a definition of primary operational data narrow enough to exclude data materially required for continuity, accountability, or reconstruction of the governed environment, producing exports that satisfy structural completeness requirements while omitting business-critical operational content (LEBOSS-OWN-10, LEBOSS-PORT-1).

19. **Ungoverned infrastructure access** — any entity with the ability to access or control systems containing primary operational data is not treated as a service provider, is not disclosed to the governing entity, or is not subject to the service provider obligations and access grant requirements of this standard (LEBOSS-SVC-8, LEBOSS-SVC-9).

20. **Protocol-only compliance** — the system satisfies register-level normative rules while failing to satisfy behavioral requirements defined in incorporated LEBOSS protocol documents (LEBOSS-AGP-1 through AGP-17, LEBOSS-IDP-1 through IDP-26, LEBOSS-ACP-1 through ACP-24, LEBOSS-DPP-1 through DPP-28), or treats protocol-level MUST and MUST NOT requirements as non-binding guidance rather than normative obligations (LEBOSS-PROT-1, LEBOSS-PROT-2, LEBOSS-PROT-3).

21. **Opaque actor identity** — the system exports governance objects — including Audit Records, Access Grants, or Integration Descriptors — in which actor identity references are not interpretable in a receiving system, or produces an export in which actor accountability cannot be determined without access to the originating system's identity infrastructure or internal state (LEBOSS-ACTOR-2, LEBOSS-ACTOR-4).

22. **Platform-dependent ownership** — the system defines or controls governing entity authority in a manner that makes it dependent on service provider accounts, platform-controlled identifiers, or system-generated constructs that do not represent the real-world entity they purport to govern; or permits a service provider to unilaterally modify, reassign, or revoke governing entity status without the authorization of the party the governing entity represents (LEBOSS-GEA-2, LEBOSS-GEA-3, LEBOSS-GEA-5).

23. **Insufficient audit resolution** — the system produces audit records that satisfy recording requirements but omit the resource-level or operation-level detail required to verify whether governed actions were within authorized scope, or produces an audit corpus that an independent party cannot use to evaluate governed action legality without access to system state, internal nomenclature, or service provider cooperation (LEBOSS-AUD-3, LEBOSS-AUD-5, LEBOSS-AUD-6).

24. **Unverifiable delegation chain lifetime** — the system maintains active delegation grants whose authority chain cannot be independently validated due to loss or expiration of supporting audit evidence, or treats system assertions as sufficient substitute for independently verifiable delegation evidence when that evidence is unavailable (LEBOSS-DCL-2, LEBOSS-DCL-4, LEBOSS-DCL-6).

---

## 5. Implementation Freedom

The boundary between what LEBOSS specifies normatively and what it defers to implementing systems is defined in [leboss-standard.md §1.1 and §1.2](leboss-standard.md). The normative rules governing this boundary are LEBOSS-SPEC-1 through SPEC-4.

LEBOSS defines governance rules, not implementation technologies. Conformant systems **MAY** use any combination of:

- database technology (relational, document, graph, time-series, or other)
- programming language or runtime environment
- infrastructure platform (on-premise, cloud-hosted, hybrid, or self-hosted)
- API style (REST, GraphQL, RPC, event-driven, or other)

The specification governs **architecture and data governance** — the structural relationships between entities, the ownership of data, and the obligations of actors. It does not prescribe how these structures are implemented in software.

Two systems that implement the same governance requirements using entirely different technology stacks are equally conformant.

---

## 6. Future Certification

The requirements defined in this document represent the **minimum conformance baseline** for LEBOSS 0.x drafts.

Future versions of the standard **MAY** introduce:

- **Formal compliance profiles** — tiered conformance levels (e.g., Core, Extended, Certified) with defined feature sets at each tier
- **Certification procedures** — processes by which implementations can be evaluated against the standard by independent parties
- **Interoperability tests** — defined test cases and reference implementations for validating cross-system data portability and governance handoff

All future certification mechanisms will be built on the requirements defined in Sections 3 and 4 of this document. Systems that satisfy those requirements today will be well-positioned for certification when those processes become available.

---

## References

| Document | Role |
|----------|------|
| [leboss-standard.md](leboss-standard.md) | Base standard — reference model, data ownership doctrine, service provider responsibilities |
| [leboss-normative-rules.md](leboss-normative-rules.md) | Flat normative rule register |
| [leboss-resource-model.md](leboss-resource-model.md) | Resource Model |
| [objects/access-grant.md](objects/access-grant.md) | Access Grant object definition |
| [objects/integration-descriptor.md](objects/integration-descriptor.md) | Integration Descriptor object definition |
| [objects/audit-record.md](objects/audit-record.md) | Audit Record object definition |
| [leboss-access-grant-protocol.md](leboss-access-grant-protocol.md) | Access Grant Protocol |
| [leboss-integration-protocol.md](leboss-integration-protocol.md) | Integration Descriptor Protocol |
| [leboss-audit-protocol.md](leboss-audit-protocol.md) | Audit Record Collection Protocol |
| [leboss-data-portability-protocol.md](leboss-data-portability-protocol.md) | Data Portability Protocol |
