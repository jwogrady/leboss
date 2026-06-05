# Why an Orbital Reference Model — and Why Ownership Must Be Architectural

This page explains the reasoning behind the LEBOSS Reference Model: why there is
a model at all, why it is a hierarchy, why these six elements, and why ownership
is treated as a structural matter rather than a contractual one. It is for
readers who already understand *what* LEBOSS does and want to understand *why* it
is shaped the way it is.

It does not restate the rules — it references them by code — and it defers the
deeper philosophical argument (that the owner of a business owns its data) to
[`docs/PHILOSOPHY.md`](../PHILOSOPHY.md) and
[`charter/mission.md`](../../charter/mission.md).

---

## The problem that required a model at all

LEBOSS could have been written as a list of rules without a model. "Service
providers must not retain data. Access must be scoped. Integrations must be
logged." Each rule would be correct and independently defensible.

The trouble with that approach is the same trouble that makes local-business
data governance hard in the first place: the relationship between the parts is
invisible. A rule that says "access must be scoped" does not tell you *scoped to
what*, *scoped by whom*, or *scoped within which boundary*. Without a vocabulary
for the entities involved and the relationships between them, every rule is
interpretable by whoever finds it most convenient. A service provider can agree
to "scope access" without anyone agreeing on what the scope covers. An auditor
can confirm that access grants exist without being able to judge whether they
are consistent with the ownership structure of the business.

The Reference Model exists so that the rules attach to something. It gives every
rule a subject and a boundary.
*(See [`standards/leboss-standard.md` §5](../../standards/leboss-standard.md).)*

---

## Why a hierarchy, not a flat list of components

The Reference Model defines a strict hierarchy:
`Universe → Galaxy → Star ↔ Planet → (Moon | Satellite)`. Not a network, not a
set of cooperating peers — a tree rooted at the governing entity.

This is a deliberate choice with a specific consequence: ownership is
unambiguous at every point in the tree.

In a flat arrangement — where an owner, several brands, multiple websites, and a
set of integrations all sit at the same level — any claim of ownership requires a
declaration. Someone has to *say* who owns what, and that declaration can change
or be disputed. In a hierarchy rooted at the Universe, ownership is positional.
Every element below the Universe is owned by, or operates within the authorized
boundary of, the element above it. There is no separate "who owns this?"
question — the answer is encoded in the position.
*(See [`standards/leboss-standard.md` §5.2–§5.3](../../standards/leboss-standard.md).)*

The hierarchy is also what makes the data-boundary rules enforceable. Because
each Galaxy has its own distinct boundary, the rule "data belonging to one brand
entity must not be reachable from another without an explicit cross-entity
access grant" is checkable: you know which boundary you are crossing because the
hierarchy defines it (LEBOSS-ARCH-3).

---

## Why six elements, and why these six

The six elements capture the meaningful ownership and responsibility
distinctions in a local-business digital ecosystem — no more, no fewer.

Consider what has to be distinguished:

- **Ultimate authority** (Universe) from **operational control of one brand**
  (Galaxy). One person can own several brands; their authority over each is not
  diminished by the others, but the operational data for each should be cleanly
  bounded.
- **The interface the world sees** (Star) from **the engine behind it** (Planet).
  This separation is what makes a provider replaceable. If a Star and its Planet
  were fused into one inseparable unit, the business could not change the backend
  without losing the customer experience, nor change the frontend without
  rebuilding the backend. Separating them structurally enforces modularity.
  *(See Principle 2, Modularity, in
  [`standards/leboss-standard.md` §4](../../standards/leboss-standard.md).)*
- **Internal capabilities the business owns** (Moon) from **external connections
  the business authorizes** (Satellite). This is the sovereignty boundary. A
  Moon sits inside the business's control; a Satellite sits outside it. The
  distinction decides what governance applies: a Moon needs no explicit
  cross-boundary authorization because the business is using its own resource; a
  Satellite needs explicit authorization precisely because data is leaving the
  business's operational boundary (LEBOSS-ACC-5).

Six elements because there are six meaningful ownership and governance
distinctions — not because an orbital metaphor needs six bodies.

---

## Why the spatial metaphor, and its limits

The names Universe, Galaxy, Star, Planet, Moon, and Satellite are explicitly
called out as illustrative, not prescriptive.
*(See [`standards/leboss-standard.md` §5.1](../../standards/leboss-standard.md).)*

The metaphor earns its place because it communicates hierarchy and scale
intuitively. A Universe contains galaxies; galaxies contain systems; systems
have natural and artificial satellites. A reader meets the model and immediately
has a spatial intuition for the containment relationships.

Its limits matter just as much. The metaphor suggests physical laws — orbits,
gravity, fixed motion — and the model implies none of them. A Moon does not
"orbit" a Planet in any functional sense; it is an internal capability that
operates within a boundary, not a body bound by gravity.

More importantly, implementations are free to use any internal names. A system
that calls its governing entity "Owner," its brand entity "Workspace," and its
external integrations "Connectors" can claim LEBOSS-aligned, provided the
underlying ownership relationships, data boundaries, and dependency rules are
preserved. Use the spatial names when talking *about* the model; use whatever
names make sense inside your implementation.

---

## Why ownership must be architectural, not contractual

This is the core claim of LEBOSS, and it is worth stating precisely.

A *contractual* ownership claim says: we agree, in a document, that the business
owner owns their data; the service provider acknowledges it; both parties sign.
The weakness is not that contracts are unenforceable — often they are
enforceable. The weakness is that a contract does not change who has the
*operational capacity* to access, modify, delete, or withhold the data. A
provider who has agreed on paper that the data belongs to the client, and who
also controls all the infrastructure, has agreed to something they retain the
technical ability to violate.

An *architectural* ownership claim says: the system is structured so that the
governing entity holds authority by position in the hierarchy, not by agreement.
Service providers operate within explicitly scoped grants. Those grants are
revocable, and revocation takes effect at the point of enforcement — not at some
agreed future moment, not after a transition period. Data portability is a
function of the system, available at any time, not a feature a provider can gate
behind a premium tier or a termination procedure.

The difference is enforcement at the architecture level rather than the contract
level. LEBOSS is explicit that policy declarations and stated intent do not
constitute enforcement.
*(See [`standards/leboss-standard.md` §8.6](../../standards/leboss-standard.md)
and [`standards/conformance.md` §3.7](../../standards/conformance.md);
LEBOSS-ENF-1.)*

This is also why the standard insists that the governing entity's authority be
independent of any platform. A governing entity whose identity is just a platform
account — one a provider controls, can deactivate, and can reassign — is not
really the governing entity. The platform is.
*(See [`standards/leboss-standard.md` §22](../../standards/leboss-standard.md);
LEBOSS-GEA-1 through GEA-6.)*

---

## Why the Satellite carries the most risk

The standard names the Satellite as the element of greatest data-sovereignty
risk.
*(See [`standards/leboss-standard.md` §5.2, Element 5](../../standards/leboss-standard.md).)*

This is not incidental. In practice, local-business data leaves the business's
control most routinely through integrations — the Google Business Profile
connection, the payment processor, the CRM sync, the email-marketing platform.
Each is an authorized data exit. The question is whether the authorization is
explicit, scoped, audited, and revocable — or whether data simply flows because
a developer wired up an integration and no one tracked the scope or the trail.

The Satellite rules (LEBOSS-ACC-5, LEBOSS-ARCH-9 through ARCH-11) require that no
Satellite receives data without explicit authorization at the brand or governing
entity level, and that all flows through Satellites are logged. The Integration
Descriptor Protocol (LEBOSS-IDP-1 through IDP-26) makes this operationally
specific: registration before data flows, authorization before activation,
cascade suspension on grant revocation, and full audit coverage of every
lifecycle event.

The reason for this rigor is that integrations are how the current industry
model accumulates leverage. Platforms gather data by being integrated into every
operational system a business touches. Any single integration may be legitimate
and useful; the aggregate effect is that the business's operational data ends up
distributed across a set of third-party systems, each holding a piece, with no
way for the business to see the whole picture, revoke access efficiently, or
recover what has been shared. LEBOSS treats each Satellite as a boundary to be
explicitly governed, not assumed.

---

## Why the Audit Record is foundational, not supplementary

Most systems treat audit logs as a compliance artifact — generated to satisfy a
requirement, read rarely, stored apart from the "real" system state.

LEBOSS is built on the opposite premise: the Audit Record corpus is the
authoritative account of what has happened in the governed environment. System
state must be reconcilable with the audit record. If the system says a grant is
active but the audit record shows it was revoked, the audit record governs — and
the irreconcilable state is itself a non-conformance condition.
*(See [`standards/leboss-standard.md` §8.7](../../standards/leboss-standard.md);
LEBOSS-REC-2; [`standards/conformance.md` §4 item 9](../../standards/conformance.md).)*

This changes what an audit record must contain. If audit records are
supplementary, they need only note that events occurred. If they are
foundational, they must hold enough detail to reconstruct *what* occurred — which
resources, under which grant, with what outcome, by which actor, in terms that
remain interpretable outside the originating system. That is what the Audit
Resolution rules require: a resolution floor for audit content, not merely an
existence requirement.
*(See [`standards/leboss-standard.md` §23](../../standards/leboss-standard.md);
LEBOSS-AUD-1 through AUD-6.)*

The implication for implementers is significant: you cannot design the system so
that the audit log is *derived from* system state. The audit log must be able to
*reconstruct* system state. The record is primary; the internal representation
is secondary.

---

## What the model deliberately does not decide

Understanding what LEBOSS leaves undefined is as important as understanding what
it specifies. The standard deliberately does not prescribe:

- runtime environment, programming language, or infrastructure platform,
- API design, interface protocols, or serialization formats,
- specific software-architecture patterns,
- database technology.

This is not an oversight; it is the point of the specification boundary. LEBOSS
defines what must be *true* of a governed system, not how those truths are
realized in code and infrastructure.
*(See [`standards/leboss-standard.md` §1.2](../../standards/leboss-standard.md);
LEBOSS-SPEC-1 through SPEC-4; and
[`standards/conformance.md` §5](../../standards/conformance.md).)*

Two systems built on entirely different stacks — one relational, one
document-store; one REST, one event-driven — are equally conformant if both
satisfy the governance requirements. Conformance is stack-independent by design.

That matters for adoption. A standard that mandated a particular implementation
technology would benefit the vendors who built to it and shut out everyone else.
LEBOSS's freedom from implementation prescription is what makes it a standard
rather than a framework.

---

## Further reading

- **The philosophical foundation** — [`docs/PHILOSOPHY.md`](../PHILOSOPHY.md) and
  [`charter/mission.md`](../../charter/mission.md): why the owner of a business
  owns its data, and what that means for system design.
- **The normative expression** —
  [`standards/leboss-standard.md`](../../standards/leboss-standard.md): the full
  specification, including the Reference Model in §5.
- **The rule register** —
  [`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md):
  the 115 rules that give the model operational force.
- **The conformance model** —
  [`standards/conformance.md`](../../standards/conformance.md): what the model
  requires in checkable form.
- **Quick lookup** —
  [Normative structure reference](../reference/normative-structure.md).
