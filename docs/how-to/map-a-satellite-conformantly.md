# How to Map a Third-Party Integration (Satellite) to LEBOSS Conformance

A Satellite is the element at greatest data-sovereignty risk in the LEBOSS
Reference Model. Every connection to a third-party platform — a payment
processor, a marketing tool, a review platform — is a Satellite. Under LEBOSS,
no data may flow to a Satellite without explicit authorization, and every data
operation through a Satellite must be logged.
*(See [`standards/leboss-standard.md` §5.2, Element 5](../../standards/leboss-standard.md),
and the access rule LEBOSS-ACC-5.)*

This guide gives you the steps to add a Satellite to a LEBOSS system without
triggering a non-conformance condition. It assumes you have already placed the
integration as a Satellite — if not, work through the
[tutorial](../tutorials/model-your-first-business.md) first.

> The full object definitions and lifecycle state machine live in
> [`standards/leboss-integration-protocol.md`](../../standards/leboss-integration-protocol.md)
> (LEBOSS-IDP-1 through IDP-26) and
> [`standards/objects/integration-descriptor.md`](../../standards/objects/integration-descriptor.md).
> This guide points into them; it does not restate them.

---

## Step 1 — Create an Integration Descriptor before any data flows

An Integration Descriptor must exist before any external integration receives
data. Registration is **not** authorization — creating the descriptor does not
permit data flow.
*(See [`standards/leboss-standard.md` §13](../../standards/leboss-standard.md);
LEBOSS-ACC-5.)*

The descriptor moves through five lifecycle states:

```
registered → authorized → active → suspended → deactivated
```

At registration, capture:

- the external platform being integrated,
- the data categories that will flow,
- the direction of flow (inbound, outbound, or bidirectional),
- the business purpose.

Your system must enforce that **no data flows** to or from the integration while
its descriptor is in `registered` state.

---

## Step 2 — Obtain and link an explicit Access Grant

The descriptor transitions to `authorized` only when a valid Access Grant,
issued by the governing entity, is linked to it.
*(See [`standards/leboss-standard.md` §13](../../standards/leboss-standard.md);
LEBOSS-ACC-5.)*

The Access Grant must specify:

- the subject (the integration being granted access),
- the scope (which resources and which operations are permitted),
- the granting authority (the governing entity or its delegate).

*(See [`standards/conformance.md` §3.3](../../standards/conformance.md);
LEBOSS-ACC-1, LEBOSS-ACC-2.)*

The governing entity — the Universe — must issue or authorize this grant. A
service provider cannot self-grant access to primary operational data
(LEBOSS-ACC-1). For the issuance and validation mechanics, see
[`standards/leboss-access-grant-protocol.md`](../../standards/leboss-access-grant-protocol.md)
(LEBOSS-AGP-1 through AGP-17).

---

## Step 3 — Validate each data operation before it executes

Once the integration is `active`, every data operation through it must pass a
five-step validation before execution.
*(See [`standards/leboss-standard.md` §13](../../standards/leboss-standard.md).)*

1. The Integration Descriptor exists and is in `active` state.
2. A valid, linked Access Grant exists and has not expired.
3. The Access Grant has not been revoked.
4. The operation is within the grant's scope.
5. The resource being operated on is covered by the grant.

If any check fails, the operation must be denied — and the denial must itself be
recorded as an Audit Record.

---

## Step 4 — Log every lifecycle event and data operation

All data flows in and out through Satellites must be logged and auditable.
*(See [`standards/leboss-standard.md` §5.2, Element 5](../../standards/leboss-standard.md);
LEBOSS-ARCH-11.)*

Every lifecycle event — registration, authorization, activation, each data
operation, suspension, deactivation — must produce an Audit Record that includes
the `integration_id` and, for data operations, the `grant_id`.
*(See [`standards/leboss-standard.md` §13 and §14](../../standards/leboss-standard.md).)*

Each Audit Record must include a timestamp, the actor identity, the resource(s)
affected, and the operation type.
*(See [`standards/conformance.md` §3.4](../../standards/conformance.md).)* The
capture, correlation, retention (36-month minimum), and integrity requirements
are specified in
[`standards/leboss-audit-protocol.md`](../../standards/leboss-audit-protocol.md)
(LEBOSS-ACP-1 through ACP-24).

---

## Step 5 — Implement the revocation, suspension, and deactivation cascade

- If the linked Access Grant is **revoked**, the integration must be
  **immediately suspended** — no separate suspension command is required.
  Revocation cascades automatically.
  *(See [`standards/leboss-standard.md` §13](../../standards/leboss-standard.md);
  LEBOSS-REV-1.)*
- **Suspension** is immediate and **reversible**: a new, valid grant can
  reauthorize the integration.
- **Deactivation** is immediate and **permanent**: a deactivated integration
  cannot be reactivated. Reconnection requires a new descriptor and a new grant.

The cascade — grant revocation triggering integration suspension — must itself
produce its own Audit Records, linked by shared identifier references.
*(See [`standards/leboss-standard.md` §14](../../standards/leboss-standard.md).)*

---

## Non-conformance conditions to watch for

Before claiming conformance, verify the integration triggers none of these.
*(See [`standards/conformance.md` §4](../../standards/conformance.md).)*

- **#1 Unauthorized access** — data reaches the integration before the
  descriptor is authorized and the grant is active.
- **#2 Audit bypass** — any data operation through the integration is not logged.
- **#20 Protocol-only compliance** — the register-level rule for ACC-5 is
  satisfied but the behavioral requirements in the Integration Descriptor
  Protocol (LEBOSS-IDP-1 through IDP-26) are not.
- **#25 Deferred revocation enforcement** — a revoked grant keeps permitting
  data flow because of cached, stale, or asynchronous state.

---

## References

- Integration lifecycle in the base standard —
  [`standards/leboss-standard.md` §5.2 (Element 5), §13, §14](../../standards/leboss-standard.md)
- Integration Descriptor Protocol (LEBOSS-IDP-1 through IDP-26) —
  [`standards/leboss-integration-protocol.md`](../../standards/leboss-integration-protocol.md)
- Integration Descriptor object —
  [`standards/objects/integration-descriptor.md`](../../standards/objects/integration-descriptor.md)
- Access Grant Protocol (LEBOSS-AGP-1 through AGP-17) —
  [`standards/leboss-access-grant-protocol.md`](../../standards/leboss-access-grant-protocol.md)
- ACC and ARCH rule groups —
  [`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md)
- Conformance checks (§3.3) and conditions (§4 items 1, 2, 20, 25) —
  [`standards/conformance.md`](../../standards/conformance.md)
- Quick lookup of rule groups and conditions —
  [Normative structure reference](../reference/normative-structure.md)
