# LEBOSS Proposal 0.0.4

**Status:** Proposal
**Branch:** proposal/0.0.4
**Date:** 2026-03-09
**Builds on:** proposal/0.0.3

---

## Summary

This proposal introduces the **Access Grant Protocol** — the lifecycle and interaction rules that make Access Grants operational within a LEBOSS-compliant system.

Version `0.0.3` defined the Access Grant as a structured governance object with required fields and normative properties. That definition answers the question *what must an Access Grant contain*. It does not answer *how Access Grants are created, validated, revoked, or expired*. Those questions are protocol questions, and they are addressed here.

This proposal does not define transport mechanisms, serialization formats, or wire protocols. It defines lifecycle states, state transition rules, and the system behaviors required at each stage. Implementations remain free to realize these behaviors using any technical mechanism.

---

## Motivation

An Access Grant object in storage is not, by itself, a functioning access control mechanism. Without defined rules for:

- when a grant transitions from `issued` to `active`
- what a system must verify before honoring a grant
- how revocation takes effect immediately
- when expiry occurs and what follows

...two LEBOSS-aligned implementations can maintain valid Access Grant objects while behaving incompatibly in practice. One might check expiry on every access attempt; another might cache grants and never re-validate. Both hold valid objects. Neither is interoperable with the other.

The Access Grant Protocol closes this gap by specifying required lifecycle behaviors at the system level, without dictating implementation mechanism.

---

## Specification Changes

| Document | Change |
|----------|--------|
| `standards/leboss-access-grant-protocol.md` | New — full lifecycle and interaction protocol |
| `standards/leboss-standard.md` | Updated — new §12 references the protocol |
| `glossary/terms.md` | Updated — three new terms |

---

## Rationale

### Why lifecycle states?

Without defined states, "revoked" and "expired" are semantically identical to "issued but not yet used." Lifecycle states make the grant's current status machine-readable and verifiable, enabling systems to enforce access control predictably.

### Why validation requirements?

LEBOSS-ACC-4 requires that service providers operate only within granted access. Without a defined validation sequence, "operating within granted access" is not verifiable — a system could skip the scope check, or the expiry check, and still claim compliance.

### Why revocation immediacy?

The governing entity's right to revoke access is a core LEBOSS principle. A revocation that takes effect "eventually" or "at next login" is not revocation — it is a delay of the governing entity's authority. Immediate revocation effect is required by the doctrine, not just by operational convenience.

### Why no transport protocol in this version?

Transport and exchange mechanisms (how grants are issued to requesting parties, how revocation is communicated to distributed systems) require significantly more implementation experience and community review before they can be stabilized. Defining lifecycle behavior first allows implementers to build correct systems now while transport protocols are developed separately.

---

## Backward Compatibility

No existing normative rules are modified. No existing document sections are removed or rewritten.

The Access Grant object definition in `standards/objects/access-grant.md` is not modified. This protocol is additive — it defines how systems must behave with respect to grants, not what grants must contain.

Existing LEBOSS-aligned systems that already implement grant lifecycle behaviors consistent with this protocol are not retroactively non-compliant.

---

## Implementation Considerations

The protocol specifies required system behaviors. It does not specify:

- How grant requests are submitted
- How issued grants are transmitted to grantees
- How revocation events are propagated across distributed system components
- Storage or indexing mechanisms for grant state

These are implementation decisions. A system may implement grant validation as an in-process check against a local database, a remote API call to an authorization service, or a cryptographic verification of a signed token — all are valid, provided the required validation checks are performed and the lifecycle rules are honored.

---

## Deferred to 0.0.5 and Beyond

- Integration Descriptor Protocol (lifecycle and interaction rules for Integration Descriptors)
- Audit Record Collection Protocol (how records are gathered and queried)
- Grant transport and exchange mechanisms
- Portability format specification (GAP-3, still open)
- Succession and Ownership Transfer Protocol (GAP-5, still open)

---

## Feedback Requested

**1. Lifecycle states**
Are five states (`requested`, `issued`, `active`, `revoked`, `expired`) sufficient? Are any states missing or unnecessary?

**2. Validation sequence**
Is the defined validation sequence (§5) complete? Are there checks that should be required but are not listed?

**3. Revocation immediacy**
Is immediate revocation effect achievable in practice for the types of systems LEBOSS is targeting? Are there justified exceptions?

**4. Grant request handling**
Should the `requested` state carry normative requirements on the requesting party, or is it sufficient to define it as a pre-issuance state without additional rules at this version?
