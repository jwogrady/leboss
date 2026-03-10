# LEBOSS Proposal 0.0.6

**Status:** Proposal
**Branch:** proposal/0.0.6
**Date:** 2026-03-09
**Builds on:** proposal/0.0.5

---

## Summary

This proposal introduces the **Audit Record Collection Protocol** — the behavioral rules ensuring that required audit records are reliably produced, correlated, retained, and protected within a LEBOSS-compliant system.

Version `0.0.3` defined the Audit Record as a governance object with required fields and an immutability requirement. Versions `0.0.4` and `0.0.5` required specific audit events across the Access Grant and Integration Descriptor lifecycles. What no prior version has defined is the *system behavior* that guarantees those records are actually captured, linked to the governance events that produced them, retained for the required period, and kept tamper-evident.

This proposal closes that gap. It completes the operational governance layer introduced across 0.0.4 and 0.0.5 and makes LEBOSS's audit coverage enforceable rather than merely required.

---

## Motivation

The Audit Record object (0.0.3) defines what a record must contain. The Access Grant Protocol (0.0.4) and Integration Descriptor Protocol (0.0.5) each specify *which* events must produce records. But neither the object definition nor the protocol references answer:

- Which system component is responsible for capturing a record?
- What happens if a required record is not captured?
- How are records linked to the governance events and objects that produced them?
- How is the minimum retention period enforced at the system level?
- How does a governing entity verify that audit records have not been altered?

Without defined answers, a system may satisfy the letter of each protocol rule while providing no reliable audit coverage in practice. Records that are required but not guaranteed are not audit records — they are assertions.

There is also a practical dependency chain: the Access Grant Protocol and Integration Descriptor Protocol each generate audit requirements that are currently uncoordinated. When a grant is revoked and an integration is suspended as a cascade, two separate protocols each require audit records, but no rule currently ensures they are produced in a consistent, correlated form. This proposal introduces the correlation rules that make distributed audit coverage coherent.

---

## Specification Changes

| Document | Change |
|----------|--------|
| `standards/leboss-audit-protocol.md` | New — full behavioral protocol for audit event capture, correlation, retention, and integrity |
| `standards/leboss-standard-0.0.2.md` | Updated — new §14 references the protocol |
| `glossary/terms.md` | Updated — three new terms |

---

## Rationale

### Why a separate protocol from the Audit Record object definition?

The Audit Record object defines structure — what fields a record must contain and what rules govern its creation. A protocol defines system behavior — what events trigger record creation, how records are linked, how they are protected, and how compliance is verified. These are distinct concerns that belong in distinct documents.

Combining behavioral rules into the object definition would blur the boundary between what data a record must contain and how the system must behave to produce and protect it. The object definition should remain stable; the protocol can evolve as system behavioral requirements mature.

### Why define correlation requirements?

LEBOSS governance actions do not occur in isolation. A grant revocation may cascade into integration suspension, which produces multiple audit events across two protocols. A governed data operation involves an actor, a grant, and potentially an integration — all of which must be identifiable from the audit record. Without correlation requirements, audit records become isolated entries with no mechanism to reconstruct the sequence of governance decisions that produced them.

Correlation is not a reporting convenience — it is a governance requirement. The governing entity's ability to reconstruct what happened, under what authority, and through what channel depends on audit records that reference each other and the objects that produced them.

---

## Backward Compatibility

No existing normative rules are modified. No existing document sections are removed or rewritten.

The Audit Record object definition in `standards/objects/audit-record.md` gains behavioral context from this protocol but is not modified structurally.

---

## Implementation Considerations

The protocol specifies required behavioral properties. It does not specify:

- The storage format or database schema for audit records
- The delivery mechanism for audit records to the governing entity
- Cryptographic algorithm choices for integrity verification
- Log aggregation or SIEM integration patterns

These are implementation decisions. The requirement is that the behavioral outcome — complete capture of required events, reliable correlation, enforced retention, and detectable tampering — is achieved, not that it is achieved through a specific mechanism.

---

## Deferred to 0.0.7 and Beyond

- Audit record export format specification (portability-compliant format)
- Audit record query API requirements
- Cross-environment audit record aggregation
- Succession and Ownership Transfer Protocol (GAP-5)
- Grant transport and exchange mechanisms (GAP-1)

---

## Feedback Requested

**1. Capture responsibility**
Should the protocol define which system component (e.g., the governing system, the service provider, the integration layer) is responsible for capturing each event type — or should capture responsibility remain implementation-defined?

**2. Failed capture handling**
If a required audit record cannot be captured (e.g., storage failure), should the protocol require that the underlying operation be denied, or only that the failure be recorded through a separate mechanism?

**3. Correlation granularity**
Should the protocol define mandatory correlation fields beyond `grant_id` and `integration_id` — for example, session identifiers or request chain identifiers?

**4. Governing entity access**
Should the protocol specify response time requirements for governing entity access to audit records, or is "available upon request" (as currently defined in LEBOSS-OBJ-AR-5) sufficient?
