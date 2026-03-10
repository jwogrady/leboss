# LEBOSS Conformance

**Status:** Draft
**Version:** 0.0.11
**Applies to:** LEBOSS Standard pre-v0.1.0 draft and later

---

## 1. Purpose

This document defines the minimum requirements for systems claiming compatibility with the LEBOSS standard.

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

Audit records **MUST** include:

- a timestamp
- the identity of the actor that performed the operation
- the resource or resources affected
- the operation type

Audit records **MUST NOT** be modifiable or deletable by actors other than the governing entity acting under documented retention policy.

### 3.5 Data Portability

A conformant system **MUST** support data portability, allowing the governing entity to:

- export all primary operational data in a machine-readable format
- export the complete governance history, including access grants and audit records
- perform this export without requiring assistance or permission from any service provider

The portability mechanism **MUST** be available at any time, not only upon termination of a service relationship.

### 3.6 Audit History Access

A conformant system **MUST** maintain a verifiable audit history accessible to the governing entity.

The governing entity **MUST** be able to query the audit history to determine what operations were performed, by which actors, and at what times — for any period within the system's retention window.

Service providers **MUST NOT** be able to suppress, modify, or selectively withhold audit records from the governing entity.

---

## 4. Non-Conformance Conditions

A system **MUST NOT** be described as LEBOSS-compliant if any of the following conditions exist:

1. **Unauthorized access** — integrations or actors can read, write, or modify governed resources without a corresponding active access grant.

2. **Audit bypass** — operations affecting governed resources are not recorded in the audit log, whether by design, configuration, or exemption.

3. **Incomplete exports** — the data portability mechanism omits governance records (access grants, audit history) from the exported data set.

4. **Export restriction** — the governing entity cannot retrieve their operational data without service provider involvement, approval, or a paid service tier.

5. **Data retention after exit** — a service provider retains primary operational data after the governing entity has terminated the service relationship and requested deletion.

6. **Secondary use without consent** — primary operational data is used for purposes beyond those covered by active access grants without explicit governing entity consent.

---

## 5. Implementation Freedom

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
