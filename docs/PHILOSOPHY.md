# The LEBOSS Philosophy

**Status:** v0.1.0-rc
**Updated Through:** proposal/0.0.29

This document explains *why* LEBOSS exists and what it stands for. It is doctrine,
not specification. Every principle stated here is tethered to the charter
([`charter/mission.md`](../charter/mission.md)) and to a specific section of the
standard ([`standards/leboss-standard.md`](../standards/leboss-standard.md)). It
invents nothing new. Where a claim is an aspiration rather than a present fact, it
is marked plainly as one.

For the project overview and quickstart, see [`README.md`](../README.md). For the
normative rules themselves, see
[`standards/leboss-normative-rules.md`](../standards/leboss-normative-rules.md).

---

## The Problem LEBOSS Refuses to Accept

When a local business adopts modern software, something easy to miss happens
beneath the excitement of new capability: the data the business generates — its
customers, its history, its revenue, its relationships — quietly moves into
infrastructure owned by someone else. The business owner holds a login. They do
not hold their data.

This is not a flaw in any one product. It is a structural outcome of how the
software industry built its business model. Data locked inside a vendor's platform
raises the cost of leaving, and high switching costs are durable revenue. In that
framing, low portability is a feature, not a bug.

The standard names this directly: the current industry model concentrates data
ownership inside provider infrastructure as a mechanism of market control
(`standards/leboss-standard.md` §2).

LEBOSS refuses to accept this as the natural or permanent state of things. It
proposes that data ownership can be made real — not by hoping vendors behave
better, not by adding a clause to a terms-of-service agreement, but by making
ownership *architectural*, built into the structure of the system itself. That is
the problem this project was written to solve.

---

## The Doctrine

The charter ([`charter/mission.md`](../charter/mission.md)) states five beliefs.
They are not aspirational decoration. Each corresponds to something concrete in the
specification.

**1. The owner of a business owns its data.** *(charter/mission.md, "What We
Believe")*

This is the foundational claim. The standard translates it into a normative
requirement: primary operational data generated within a LEBOSS-compliant system is
owned by the governing entity — the Universe — to which it belongs
(`standards/leboss-standard.md` §6.1). Ownership is not an attitude a vendor is
asked to hold. It is a property the system must structurally express, enforced
through the ten Ownership (OWN) rules and underpinned by the Access Grant model.

**2. This principle must be made technically enforceable, not merely contractually
promised.** *(charter/mission.md, "What We Believe")*

The standard's §3.5 — "Ownership Must Be Technically Enforceable" — states this
without equivocation: good intentions are insufficient, because a vendor who agrees
in contract to treat business data responsibly while controlling all infrastructure
can violate that agreement with little consequence. The architectural response is
the Access Grant: no service provider may access primary operational data without
an explicitly scoped, revocable grant issued by the governing entity
(`standards/leboss-standard.md` §6.3).

**3. The local business sector has been systematically underserved by an industry
that built its revenue model on data extraction dressed as convenience.**
*(charter/mission.md, "What We Believe")*

The standard's problem statement names the mechanism: switching costs are high
because migration costs are high because portability is low — by design
(`standards/leboss-standard.md` §2). The response is the data portability
requirement: a compliant system must be able to export all primary operational
data, governance objects, and audit records in a documented, non-proprietary
format, complete enough to reconstruct the governed environment in an independent
system without reliance on the exporting system or its vendors
(`standards/leboss-standard.md` §6.4).

**4. Developers have the skill, the tools, and the ethical responsibility to build
systems that honor the people who use them.** *(charter/mission.md, "What We
Believe")*

This principle lives in the standard's definition of a service provider: the
governing criterion for provider obligations is the ability to access or control
primary operational data — not the label applied to the relationship. An
infrastructure provider is a service provider. A subcontractor with incidental
access is a service provider. The standard requires disclosure, scoped access,
audit records, and exit portability from all of them
(`standards/leboss-standard.md` §7.0). It holds builders accountable by capability,
not by self-description.

**5. A standard — shared, open, freely adoptable — is the most durable mechanism
for changing how an industry behaves.** *(charter/mission.md, "What We Believe")*

The charter explains why a standard and not a product: LEBOSS is not a product, not
a certification body, and not a trade association — it is a standard, published
openly, maintained by a community, and freely available for adoption,
implementation, critique, and improvement (`charter/mission.md`, "What LEBOSS Is").
The license is CC BY 4.0 ([`LICENSE`](../LICENSE)). The governance workflow —
Proposal → Draft → Committee Vote → Published — is fully specified and open to any
contributor (see [`CONTRIBUTING.md`](../CONTRIBUTING.md)).

---

## The Five Foundation Principles

The standard defines five foundation principles that a compliant system must embody
(`standards/leboss-standard.md` §4). They are not value statements; they are
normative design constraints, and each one closes a specific pathway by which
ownership can be violated.

**Clarity** closes the ambiguity pathway. Ambiguity about who owns a record, who
authorized an integration, or which entity a dataset belongs to is the condition
under which data appropriation occurs. Every part of the system must have a clearly
defined role and place (`standards/leboss-standard.md` §4).

**Modularity** closes the lock-in pathway. Components must be organized so that any
individual provider or capability is replaceable without reconstructing the whole.
Modularity is the structural guarantee of freedom of choice — the technical
expression of the owner's right to leave (`standards/leboss-standard.md` §4).

**Security** closes the unauthorized-access pathway. Data must be separated by
business entity, access must follow least privilege, and all data operations must
be auditable. Security in LEBOSS is a structural property of the architecture, not
a bolt-on. This is the principle behind the five Access (ACC) rules, the five
Security (SEC) rules, and the audit-record system (the four Audit-as-System-of-Record,
REC, rules) (`standards/leboss-standard.md` §4).

**Legacy and Continuity** closes the succession pathway. Data must remain accessible
and portable through ownership transitions. A system that binds data to a specific
person, role, or service agreement in a way that makes it inaccessible when that
relationship ends has effectively expropriated it. This principle is embodied in the
four Continuity (CONT) rules and the portability requirements of §6.4
(`standards/leboss-standard.md` §4).

**Extensibility** closes the entrenchment pathway. A system in which adding a new
capability requires entangling it with everything else makes each new addition a new
dependency, and each new dependency a new switching cost
(`standards/leboss-standard.md` §4).

Together, these five principles mean that if a system is structured correctly, data
sovereignty does not depend on any vendor's good behavior. It is a property of the
architecture.

---

## Why the Reference Model Embodies the Philosophy

The six LEBOSS Elements — Universe, Galaxy, Star, Planet, Moon, Satellite — are not
a naming scheme. They are a governance topology. The hierarchy expresses who owns
what, and in what direction authority flows (`standards/leboss-standard.md` §5).

```
Universe → Galaxy → Star ↔ Planet → (Moon | Satellite)
```

The **Universe** is the root owner: the person, family, or registered legal entity
that built the business. It is not a software construct but a legal and
organizational reality that compliant systems must reflect. Every other element
exists in relationship to the Universe, under its authority, subject to its
governance decisions (`standards/leboss-standard.md` §5.2).

The **Galaxy** is a distinct brand or business line within that Universe — its own
data boundary and team structure, but owned by and accountable to the Universe.
Multiple Galaxies under one Universe are explicitly supported, and data separation
between them is a compliance requirement (`standards/leboss-standard.md` §5.2).

The **Star** and **Planet** define the customer-facing and backend layers, with an
explicit dependency rule: a backend (Planet) must serve at least one interface
(Star), and an interface must be supported by at least one backend. Neither can
exist without the other (`standards/leboss-standard.md` §5.4). This is not
aesthetics — it is the rule that prevents backends from becoming orphaned data
stores controlled by providers the business has nominally stopped using.

The **Moon** is a natural satellite: a company-owned, company-operated internal
capability within a Galaxy's data boundary, under the business's direct control. A
Moon is what internal modularity looks like — separable, replaceable, entirely owned
(`standards/leboss-standard.md` §5.2).

The **Satellite** is where the philosophy comes under the most pressure. Satellites
are artificial satellites: connections to third-party platforms — payment
processors, marketing platforms, accounting software, business listing services —
operated outside the business's direct control. The standard names them as the point
of greatest data sovereignty risk (`standards/leboss-standard.md` §5.2). The response
is not to prohibit them but to bound them: every Satellite requires explicit
authorization, every data flow through a Satellite must be logged and auditable, and
a Satellite must never become a path through which primary operational data leaves
the business's control without authorization.

The hierarchy is the philosophy made concrete. Ownership flows from the Universe
outward. Authority is explicit and traceable at every level. The boundary where
control ends — the Satellite — is the boundary the standard watches most carefully.

---

## The Right to Leave and the Right to Audit

Two owner rights are load-bearing for everything above.

**The right to leave** is a normative requirement, not a vendor option. The standard
holds that a system that cannot return data to the owner is a system that has
appropriated it (`standards/leboss-standard.md` §6.4). Export must be complete enough
to reconstruct the governed environment elsewhere, in a documented, non-proprietary
format, without dependence on the original vendor.

**The right to audit** is built in: the audit corpus, not internal system state, is
the canonical record (`standards/leboss-standard.md` §8). An owner who cannot inspect
their own audit trail does not own their system in any meaningful sense. LEBOSS
treats irreconcilable state — a discrepancy between what the audit record says and
what the system actually did — as itself a non-conformance condition.

---

## Why a Standard, Not a Product

A product can be acquired, pivoted, or shut down. A standard published under CC BY
4.0, maintained through a transparent proposal process, and carrying a documented
change history of twenty-nine proposals cannot be unmade by any single actor. The
durability is structural (`charter/mission.md`, "What We Believe").

So is the neutrality. LEBOSS explicitly does not prescribe runtime environments, API
designs, infrastructure choices, or software architectures (`charter/mission.md`,
"What LEBOSS Is"; `standards/leboss-standard.md` §1). Any implementation stack can
conform. No vendor is advantaged by the specification itself.

---

## Our Relationship to Other Movements

The charter places LEBOSS in a lineage (`charter/mission.md`, "Our Relationship to
Other Movements"). The free software movement established that the tool need not be
owned by the company that distributes it. The open source movement established that
open development produces more trustworthy software. LEBOSS applies a parallel
insight to data: the data generated by doing work belongs to the person doing the
work, not to the tool that facilitated it.

This is not a claim for public data. It is a claim for private property —
specifically, for the property rights of a local business owner over the digital
record of their own operation.

The AI era makes this more urgent, not less. When AI-powered services use a
business's operational data to train models the vendor monetizes elsewhere, the
business owner has supplied free input to a competitor's product. LEBOSS does not
prohibit AI applications. Applying the standard's prohibition on secondary use, it
requires that when AI systems use primary operational data they do so under explicit
authorization, with disclosed purpose, and with the understanding that the owner's
data is not a free input to a model the vendor will monetize elsewhere
(`standards/leboss-standard.md` §7.6; `charter/mission.md`, "A Note on the AI Era").

---

## What Is Aspiration (Marked Clearly)

The following are genuine aspirations of the project, not current facts. They belong
in any honest statement of the doctrine, stated as aspiration:

- **Community ratification.** The standard is a release candidate (v0.1.0-rc) for its
  first Committee Vote. The committee is not yet appointed, and no vote has been
  called.
- **Adoption.** No implementations have been registered. The `IMPLEMENTATIONS.md`
  table is empty.
- **Formal certification.** Conformance is currently self-declared. No third-party
  certification program exists in this version.
- **Industry change.** The conviction that a shared standard is the most durable
  mechanism for changing industry behavior is exactly that — a conviction, not a
  demonstrated outcome.

The conviction is legitimate. The traction is not yet there. Both are true at once.

---

## Where to Go Next

- [`README.md`](../README.md) — project overview, quickstart, and positioning
- [`standards/leboss-standard.md`](../standards/leboss-standard.md) — the
  authoritative specification
- [`standards/leboss-normative-rules.md`](../standards/leboss-normative-rules.md) —
  the flat 115-rule register
- [`charter/mission.md`](../charter/mission.md) — the charter this doctrine draws from
- [`CONTRIBUTING.md`](../CONTRIBUTING.md) — how to propose changes and join the
  forming committee

---

*The LEBOSS Philosophy — open for community review and amendment through the standard
Proposal process.*
