# LEBOSS Normative Rule Register
## Local Entrepreneur Business Operating System Standards

**Status:** Draft
**Target Release:** v0.1.0
**Updated Through:** proposal/0.0.15
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

## Summary Counts

| Group | Rules | MUST | MUST NOT | MAY | SHOULD |
|-------|-------|------|----------|-----|--------|
| Ownership (OWN) | 8 | 5 | 3 | 1 | — |
| Access (ACC) | 5 | 3 | 1 | 2 | — |
| Architectural (ARCH) | 11 | 9 | 2 | — | — |
| Security (SEC) | 5 | 4 | 1 | 1 | — |
| Continuity (CONT) | 4 | 4 | 1 | — | — |
| Service Provider (SVC)              | 7  | 5  | 2  | — | — |
| Specification Boundary (SPEC)       | 4  | 2  | 2  | 1 | — |
| Enforcement Responsibility (ENF)    | 4  | 2  | 3  | — | — |
| Audit as System of Record (REC)     | 4  | 2  | 2  | — | — |
| **Total**                           | **52** | **36** | **17** | **5** | **—** |

---

## Gaps Identified

The following requirements were identified as implied by the standard but not yet specified with sufficient precision to be enumerable as rules. Status reflects the current state of the specification through proposal 0.0.12.

**GAP-1: Access Grant Format** — *Resolved in 0.0.3 and 0.0.4*
The standard requires that access grants specify scope, operations, duration, and purpose (LEBOSS-ACC-2). The Access Grant object (`standards/objects/access-grant.md`) defines the required fields. The Access Grant Protocol (`standards/leboss-access-grant-protocol.md`) defines issuance, validation, revocation, and expiration behavioral rules (LEBOSS-AGP-1 through AGP-17).

**GAP-2: Audit Trail Format** — *Resolved in 0.0.3 and 0.0.6*
The standard requires auditable records (LEBOSS-SEC-3, LEBOSS-SVC-3). The Audit Record object (`standards/objects/audit-record.md`) defines the required fields. The Audit Record Collection Protocol (`standards/leboss-audit-protocol.md`) defines capture, correlation, retention, and integrity behavioral rules (LEBOSS-ACP-1 through ACP-24).

**GAP-3: Portability Format** — *Partially resolved in 0.0.7*
The standard requires machine-readable export (LEBOSS-OWN-3, LEBOSS-SVC-1). The Data Portability Protocol (`standards/leboss-data-portability-protocol.md`) defines export authority, scope, completeness, and neutrality behavioral rules (LEBOSS-DPP-1 through DPP-28). A specific LEBOSS Portability Format (canonical encoding) is deferred to a future proposal.

**GAP-4: External Integration Authorization Protocol** — *Resolved in 0.0.3 and 0.0.5*
LEBOSS-ACC-5 requires explicit authorization for external integrations. The Integration Descriptor object (`standards/objects/integration-descriptor.md`) defines what must be recorded. The Integration Descriptor Protocol (`standards/leboss-integration-protocol.md`) defines the full integration lifecycle and behavioral rules (LEBOSS-IDP-1 through IDP-26).

**GAP-5: Succession and Ownership Transfer** — *Open*
LEBOSS-CONT-1 through CONT-3 require succession support but no protocol exists for executing an ownership transfer. Deferred to a future proposal.

---

*LEBOSS Normative Rule Register — pre-v0.1.0 draft, updated through proposal/0.0.12. The standard governs in all cases of conflict.*
