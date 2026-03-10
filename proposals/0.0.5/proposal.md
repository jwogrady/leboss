# LEBOSS Proposal 0.0.5

**Status:** Proposal
**Branch:** proposal/0.0.5
**Date:** 2026-03-09
**Builds on:** proposal/0.0.4

---

## Summary

This proposal introduces the **Integration Descriptor Protocol** — the lifecycle and behavioral rules that govern how external integrations operate within a LEBOSS-compliant environment.

Version `0.0.3` defined the Integration Descriptor as a structured governance object recording the authorization of an external integration. Version `0.0.4` defined the Access Grant Protocol, which governs how authorization records are issued and enforced. This proposal bridges the two: it defines how integrations use authorizations, how their operational lifecycle is managed, and how the governing entity maintains control over every active integration.

The goal is to make integrations **governed actors** rather than static registry entries. An Integration Descriptor that exists but carries no lifecycle rules provides no reliable boundary. With this protocol, the state of every integration is explicitly managed, immediately enforceable, and fully auditable.

This proposal does not define transport mechanisms or API specifications for integration connectivity. It defines lifecycle states, state transition rules, authorization linkage, and required system behaviors.

---

## Motivation

The `0.0.3` Integration Descriptor object answers: *what must be recorded about an authorized integration?* It does not answer:

- When is an integration allowed to begin operating?
- What must a system verify before allowing an integration to access data?
- How does the governing entity immediately stop an integration mid-operation?
- When an integration's Access Grant is revoked, what happens to the integration?
- What is the difference between suspending and permanently deactivating an integration?

Without defined answers, a system can hold valid Integration Descriptor objects while integrations operate outside any behavioral constraint. The Integration Descriptor Protocol closes this gap.

There is also a direct dependency on the Access Grant Protocol: integrations must operate under valid Access Grants (LEBOSS-OBJ-ID requirements), and those grants are now governed by the lifecycle rules in `0.0.4`. The Integration Descriptor Protocol must align with and reference those rules, making the two protocols mutually reinforcing.

---

## Specification Changes

| Document | Change |
|----------|--------|
| `standards/leboss-integration-protocol.md` | New — full lifecycle and behavioral protocol |
| `standards/leboss-standard-0.0.2.md` | Updated — new §13 references the protocol |
| `glossary/terms.md` | Updated — three new terms |

---

## Rationale

### Why a separate protocol from the Access Grant Protocol?

Access Grants govern authorization for any data-accessing party — service providers, internal systems, delegates, and integrations alike. The Integration Descriptor Protocol is specific to external integrations, which carry the highest data sovereignty risk in the LEBOSS reference model. Integrations have unique concerns: they connect to external systems outside the governing entity's control, they may transmit data outbound, and their suspension must be immediately enforceable even if the external provider is unaware.

Combining these into a single document would obscure this distinction. Keeping them separate allows each to be precise.

### Why five lifecycle states?

`registered` and `authorized` are distinct because registration (the record existing) does not confer authorization (the permission to receive data). A common failure mode in integration governance is treating registration as implicit authorization. This protocol makes authorization a separate, explicit step.

`suspended` and `deactivated` are distinct because suspension is reversible — a governing entity may suspend an integration pending investigation and reactivate it — while deactivation is permanent. Conflating these into a single "inactive" state loses important governance meaning.

---

## Backward Compatibility

No existing normative rules are modified. No existing document sections are removed or rewritten.

The Integration Descriptor object definition in `standards/objects/integration-descriptor.md` gains behavioral context from this protocol but is not modified structurally.

---

## Implementation Considerations

The protocol specifies required behavioral properties. It does not specify:

- How integrations authenticate to the governed system
- API shape or connector mechanism for external platforms
- How suspension signals are communicated to external providers
- Storage or indexing of integration state

These are implementation decisions. The requirement is that the behavioral outcome — immediate suspension effect, full audit coverage, validated authorization before every data access — is achieved, not that it is achieved through a specific mechanism.

---

## Deferred to 0.0.6 and Beyond

- Audit Record Collection Protocol (how records are gathered, queried, and exported)
- Grant transport and exchange mechanisms
- Portability format specification (GAP-3)
- Succession and Ownership Transfer Protocol (GAP-5)
- Integration connectivity and API specifications

---

## Feedback Requested

**1. Lifecycle state granularity**
Are five states (`registered`, `authorized`, `active`, `suspended`, `deactivated`) the right model? Should `authorized` and `active` be collapsed, or is the distinction valuable?

**2. Suspension reversibility**
This proposal defines suspension as reversible. Are there cases where a suspension should become permanent automatically (e.g., after a defined period with no governing entity action)?

**3. Grant revocation cascade**
When an Access Grant that covers an integration is revoked, this protocol requires the integration to be suspended. Should the cascade be immediate suspension or immediate deactivation?

**4. Outbound data flows**
Should the protocol include specific rules for outbound data flows (data leaving the governed environment through a Satellite), or is the existing scope check in the Access Grant Protocol sufficient?
