# LEBOSS Proposal 0.0.3

**Status:** Proposal
**Branch:** proposal/0.0.3
**Date:** 2026-03-09
**Builds on:** proposal/0.0.2

---

## Summary

This proposal introduces **governance objects** — the minimal structured primitives required to implement the normative rule register established in 0.0.2.

Version `0.0.3` does not modify the core doctrine, reference model, or existing normative rules. It extends the specification by defining the data structures that give those rules operational form.

The three objects introduced in this release are:

- **Access Grant** — the structured authorization primitive required by LEBOSS-ACC-1 through LEBOSS-ACC-4
- **Integration Descriptor** — the structured record of an authorized external integration required by LEBOSS-ACC-5 and LEBOSS-ARCH-10 through LEBOSS-ARCH-11
- **Audit Record** — the structured event record required by LEBOSS-SEC-3, LEBOSS-SVC-3, and LEBOSS-SVC-4

This proposal **does not define full operational protocols** for any of these objects. Protocol definitions — including how grants are issued, how integrations are authorized end-to-end, and how audit records are collected and verified — are deferred to 0.1.x.

---

## Motivation

The 0.0.2 normative rule register identified five gaps where requirements exist but are not yet precise enough to be implementable:

| Gap | Rule(s) Affected |
|-----|-----------------|
| GAP-1: Access Grant Format | LEBOSS-ACC-1, ACC-2, ACC-3 |
| GAP-2: Audit Trail Format | LEBOSS-SEC-3, SVC-3, SVC-4 |
| GAP-3: Portability Format | LEBOSS-OWN-3, SVC-1 |
| GAP-4: External Integration Authorization | LEBOSS-ACC-5, ARCH-10, ARCH-11 |
| GAP-5: Succession/Ownership Transfer | LEBOSS-CONT-1, CONT-2, CONT-3 |

This proposal addresses GAP-1, GAP-2, and GAP-4 by defining the minimum field structure and normative requirements for each object. GAP-3 (portability format) and GAP-5 (succession protocol) remain deferred.

Without defined object structures, the rule register cannot be implemented consistently. Two different compliant systems could represent access grants in incompatible ways, making interoperability impossible even between systems that follow all the normative rules.

---

## Specification Changes

| Document | Change |
|----------|--------|
| `standards/leboss-governance-objects.md` | New — defines the governance object model and object lifecycle concepts |
| `standards/objects/access-grant.md` | New — Access Grant object definition |
| `standards/objects/integration-descriptor.md` | New — Integration Descriptor object definition |
| `standards/objects/audit-record.md` | New — Audit Record object definition |
| `standards/leboss-standard-0.0.2.md` | Updated — new §11 references governance objects |
| `glossary/terms.md` | Updated — four new terms |

---

## Rationale

### Why define objects before protocols?

Object definitions establish shared vocabulary and field-level requirements without prescribing implementation mechanism. A system can implement compliant Access Grants in a relational database, a document store, or a signed JWT — as long as the required fields and normative properties are present.

Protocols (how grants are issued, transmitted, and verified) require more community review and implementation experience before they can be stabilized. Defining objects first allows implementers to begin building while protocol discussions continue.

### Why these three objects?

These three objects are the minimum set required to make the existing rule register implementable:

- The rule register requires access grants (LEBOSS-ACC-1 through ACC-4) — without a defined structure, "explicit access grant" is unverifiable
- The rule register requires audit records (LEBOSS-SEC-3) — without a defined structure, "auditable" is unverifiable
- The rule register requires integration authorization records (LEBOSS-ACC-5, ARCH-10, ARCH-11) — without a defined structure, "explicitly authorized" is unverifiable

---

## Backward Compatibility

No existing normative rules are modified. No existing document sections are removed or rewritten.

The new `§11 Governance Objects` section in `leboss-standard-0.0.2.md` is additive. The object files in `standards/objects/` are new artifacts. Existing LEBOSS-aligned systems are not retroactively non-compliant.

---

## Implementation Considerations

Implementations are not required to represent governance objects in any particular technical format. The object definitions specify required fields and normative properties. They do not specify:

- Storage format (relational, document, key-value, etc.)
- Serialization format (JSON, XML, binary, etc.)
- Transport protocol
- Signature or verification mechanism

These implementation details will be addressed in future proposals as the community develops practical experience with the objects.

---

## Deferred to 0.0.4 and Beyond

- Access Grant Protocol (issuance, transmission, verification)
- Integration Authorization Workflow (end-to-end authorization flow for Satellites)
- Audit Record Collection and Verification Protocol
- Portability Format specification (GAP-3)
- Succession and Ownership Transfer Protocol (GAP-5)

---

## Feedback Requested

**1. Object field completeness**
Are the defined fields for each object sufficient to implement the normative rules they support? Are any fields missing that would be immediately necessary for a real implementation?

**2. Normative requirements on objects**
Do the MUST/MUST NOT requirements on each object feel appropriately scoped? Are any requirements premature given that protocols are not yet defined?

**3. Governance object model**
Does the governance object model in `leboss-governance-objects.md` provide a useful conceptual frame, or does it add unnecessary abstraction?

**4. Object boundaries**
Should the Access Grant and Integration Descriptor be separate objects, or should integration authorization be modeled as a specialized Access Grant?
