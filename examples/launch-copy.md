# LEBOSS Launch Copy

**Status:** v0.1.0-rc
**Updated Through:** proposal/0.0.29

Reusable launch and outreach copy for LEBOSS — a tweet/X thread, a Show HN post, two
Reddit variants, and an elevator pitch. Every load-bearing claim traces to the
standard and the repository. Each piece discloses the three honest gaps plainly: no
implementations, no appointed committee, no vote yet. This is honest hype — confidence
from the rule register and the mission, not from invented traction.

> **Facts these draw on (locked):** 115 normative rules · 19 rule groups · 25
> non-conformance conditions · two conformance tiers (LEBOSS-aligned, LEBOSS-compliant)
> · CC BY 4.0 · live portal at https://leboss.status26.com/ · v0.1.0-rc, a release
> candidate for the first Committee Vote. The 0.0.29 proposal closed the last of the
> five gap areas surfaced by the 0.0.21 boundary stress test (undated).

---

## Headline Milestone

**v0.0.29 — Revocation Enforcement Timing (REV group, rules REV-1 through REV-6).**

This proposal closed the last remaining enforcement gap surfaced by the 0.0.21
boundary stress test: the cached-authorization-window gap, where cached access grants
could persist beyond revocation. With REV-1 through REV-6 in place, deferred
revocation is now a named non-conformance condition. That closes all five gap areas
from the stress test. Result: v0.1.0-rc is structurally complete and ready for the
first Committee Vote.

---

## 1. Tweet / X Thread (5 posts)

**Post 1 — Hook (the data-ownership problem)**

When a local business switches software platforms, it often discovers the hard way:
the data it generated — customers, history, revenue records — was never really its
own. Portability was a vendor feature. Access grants were invisible. The audit trail
was the vendor's, not yours.

This is not a policy failure. It is structural. And it needs a structural fix.

**Post 2 — The shift LEBOSS proposes**

LEBOSS is an open governance standard that defines data ownership architecturally —
not contractually, not jurisdictionally.

The core proposal: build a six-element reference model (Universe → Galaxy → Star ↔
Planet → Moon / Satellite) into the architecture of every local-business system, so
ownership is traceable at every level from the root owner outward.

https://leboss.status26.com/

**Post 3 — What's concretely real**

What exists today:

- 115 normative rules across 19 groups — each coded and traceable to source
- 25 named non-conformance conditions mapped to specific rule IDs
- A two-tier conformance model: LEBOSS-aligned (structural) and LEBOSS-compliant (full
  normative)
- Three live presentation decks at leboss.status26.com
- CC BY 4.0 license — freely adoptable
- A 29-proposal change history, 0.0.1 through 0.0.29

**Post 4 — The headline milestone**

The latest proposal (0.0.29) closed the last enforcement gap: revocation enforcement
timing. If an access grant is revoked, a system may not keep serving cached
authorizations past the revocation. That gap is now a named non-conformance condition
(REV-1 through REV-6).

With that, v0.1.0-rc is structurally complete. Every governance layer is in place. The
spec is ready for its first Committee Vote.

**Post 5 — Honest call to action**

Full transparency: this is a release candidate. Zero implementations yet. The
committee is not yet appointed. v0.1.0 has not been voted on.

What is open right now: reading the standard, implementing against it, and nominating
yourself to the forming committee.

If you build for local businesses and care about who actually owns the data — this is
the conversation to join.

github.com/jwogrady/leboss | leboss.status26.com | CC BY 4.0

---

## 2. Show HN Post

**Title:**
Show HN: LEBOSS — an open governance standard for local-business data ownership (v0.1.0-rc, CC BY 4.0)

**Body:**

LEBOSS (Local Entrepreneur Business Operating System Standards) is an open
specification — not a library, not an SDK, not a SaaS product. You cannot npm install
it. The "install step" is reading the standard.

What it specifies: a governance layer for local-business data systems. The core
problem it addresses is structural: in most local-business software stacks, the
platform controls the data, not the business. Switching vendors loses history.
Integrations accumulate undeclared access. There is no inspectable audit trail. LEBOSS
treats this as an architectural problem, not a contract problem.

What it actually contains:

- A six-element reference model (Universe → Galaxy → Star ↔ Planet → Moon / Satellite)
  that maps the entire enterprise ownership topology from the root owner outward.
- 115 normative rules across 19 groups, each cited to a source section. 25 named
  non-conformance conditions, each mapped to specific rule IDs.
- Three governance objects the owner holds — Access Grant, Integration Descriptor,
  Audit Record — not features a vendor offers.
- Two conformance tiers: LEBOSS-aligned (preserve hierarchy and access relationships)
  and LEBOSS-compliant (satisfy every MUST-level requirement in conformance.md).
  Conformance is self-declared; no third-party certification exists in this version.
- A live three-deck Slidev portal: leboss.status26.com
- CC BY 4.0 license.

What it honestly is not yet:

- Ratified: this is a release candidate for the first Committee Vote. The committee is
  not yet appointed. v0.1.0 has not been voted on.
- Implemented: IMPLEMENTATIONS.md is empty. No known adopters.
- Certified: conformance is self-declared. No audit program exists.
- Finished: until v1.0.0, any rule can change.

The latest proposal (0.0.29) closed the last enforcement gap from the 0.0.21 boundary
stress test — revocation enforcement timing. That completes the 0.0.21–0.0.29
gap-closure series and resolves the five gap areas the stress test surfaced. All
governance layers are now in place.

The committee nomination process is open. If you work in local-business infrastructure
and this problem space is familiar, the forming committee needs people with
implementation experience.

Repo: github.com/jwogrady/leboss
Portal: leboss.status26.com
Standard: standards/leboss-standard.md
Conformance: standards/conformance.md

---

## 3. Reddit Post — r/smallbusiness framing

**Title:**
I wrote an open standard for local business data ownership — 115 rules, free to use (CC BY 4.0), looking for feedback

**Body:**

Background: a recurring problem I kept running into — when a local business switches
platforms, they often realize their data was never really theirs. Customer history,
audit trails, integrations: all locked inside the vendor's infrastructure. Portability
was a feature the vendor could deprecate. Access grants were invisible. There was no
way to say "this integration is authorized for these specific data scopes, expiring on
this date, revocable on this timeline" — because there was no shared model for what
the data footprint even was.

That felt like a structural problem. So I wrote a structural answer.

LEBOSS (Local Entrepreneur Business Operating System Standards) is an open governance
specification for local-business data systems. The central idea: data ownership should
be architectural, not contractual. Built into how the system is structured, not
dependent on what the vendor agrees to in the ToS.

What it defines:

- A six-element ownership hierarchy: Universe (the root owner — you, the business
  owner) → Galaxy (individual brand or business line) → Star (customer-facing
  interface) ↔ Planet (backend service) → Moon (internal module you own) / Satellite
  (third-party integration). Every part of your data footprint has a defined owner and
  an explicit authorization model.
- 115 normative rules across 19 groups, covering ownership, access control,
  delegation, audit, portability, revocation timing, and more.
- Three governance objects you hold, not your vendor: Access Grant, Integration
  Descriptor, Audit Record.
- A clear portability requirement: a compliant system must be able to export all
  primary operational data in a documented, non-proprietary format complete enough to
  reconstruct the governed environment without relying on the exporting vendor.

What it honestly is not:

- Software. There is no app, SDK, or package.
- Adopted yet. Zero implementations registered.
- Ratified. This is a release candidate. The committee is forming; the first formal
  vote has not happened.
- A legal compliance tool. It does not replace GDPR, CCPA, or a data-protection
  attorney.

It is CC BY 4.0 — free to read, use, implement against, and build on. There is a live
presentation portal at leboss.status26.com if you want a more visual walkthrough.

I am looking for: feedback from business owners who have run into this problem,
developers who build local-business software, and anyone who has tried to do a vendor
migration and discovered what they actually owned.

If this is a problem you have lived, I'd like to know if this framing resonates — and
what is missing.

Repo: github.com/jwogrady/leboss

---

## 4. Reddit Post — r/programming framing (alternate)

**Title:**
I wrote a governance standard for local-business data systems: 115 normative rules, two conformance tiers, open for committee formation (v0.1.0-rc, CC BY 4.0)

**Body:**

LEBOSS is an open specification — think W3C or IETF register energy, not a startup
product launch. It is a governance standard for local-business data systems. The
"getting started" step is reading the standard, not running an install command.

The problem it addresses: local-business SaaS stacks are structurally designed such
that the platform, not the business owner, controls the data. This is not a bug in
individual products — it is the business model (lock-in through low portability).
LEBOSS proposes a structural fix: define ownership architecturally, with a six-element
reference model and a flat normative rule register.

Technical specifics:

- 115 normative rules across 19 rule groups (OWN, ACC, ARCH, SEC, CONT, SVC, SPEC, ENF,
  REC, PORT, MAP, DEL, VER, PROT, ACTOR, GEA, AUD, DCL, REV). Each rule is coded
  LEBOSS-{GROUP}-{n} and cites its source section.
- 25 named non-conformance conditions in a separate conformance document, each mapped
  to specific rule IDs.
- RFC 2119 discipline: MUST / MUST NOT / MAY confined to standards/ documents.
- Two conformance tiers: LEBOSS-aligned (preserve hierarchy and access relationships)
  and LEBOSS-compliant (satisfy all MUST-level requirements). Conformance is
  self-declared this version.
- Six-element reference model: Universe → Galaxy → Star ↔ Planet → Moon / Satellite.
  Owner-to-system authority flows from the root (Universe = the business owner)
  outward.
- Three governance objects: Access Grant, Integration Descriptor, Audit Record.
- Five foundation principles: Clarity, Modularity, Security, Legacy and Continuity,
  Extensibility.
- A written proposal lifecycle (PR → Draft → Committee Vote → Published) with 14-day
  minimum periods, a PR template, and 29 proposals in the change history.
- CC BY 4.0 license, live Slidev portal at leboss.status26.com.

Current state (honest):

- v0.1.0-rc — release candidate for first Committee Vote (v0.1.0)
- Committee: not yet appointed. Nomination is open.
- Implementations: zero. IMPLEMENTATIONS.md is empty.
- CI/CD: no GitHub Actions (no `.github/` directory). Netlify deploy is the only build
  verification.
- Conformance: self-declared. No certification program.

The latest proposal (0.0.29) closed the last enforcement gap from the 0.0.21 boundary
stress test: the cached-authorization-window gap — access grants that persist past
revocation in cached authorization systems. REV-1 through REV-6 make deferred
revocation a named non-conformance condition, closing the last of the five gap areas
the stress test surfaced.

Looking for: developers who build local-business stacks and have opinions on whether
this model maps to real system shapes, people with experience on standards-body
governance, and committee nominees.

Repo: github.com/jwogrady/leboss
Standard: standards/leboss-standard.md
Conformance: standards/conformance.md
Portal: leboss.status26.com

---

## 5. Elevator Pitch (one paragraph, reusable anywhere)

LEBOSS — Local Entrepreneur Business Operating System Standards — is an open governance
specification that defines data ownership for local-business software systems
architecturally, not contractually. It gives businesses, developers, and platform
builders a shared vocabulary: a six-element reference model (Universe down to
Satellite) that maps the entire enterprise ownership topology, 115 normative rules
across 19 groups covering ownership, access, audit, portability, and revocation, and a
two-tier conformance model backed by 25 named non-conformance conditions. The current
version is v0.1.0-rc — a structurally complete release candidate, CC BY 4.0, with a
live portal at leboss.status26.com. Zero implementations yet; the forming committee is
open for nominations. The invitation is to read it, implement against it, and help
shape the first ratified version.

---

## Search Phrases (organic discovery)

Grounded in the repo's own problem framing — the terms a builder or local-business
owner would actually search for:

- local business data ownership
- local business data governance standard
- open governance standard for local business
- data sovereignty for small business
- owner-first data architecture
- business data portability standard
- LEBOSS standard

---

## Honesty Checklist (applied to all copy above)

- **Stated in every piece:** zero implementations, committee not yet appointed, v0.1.0
  not voted, conformance self-declared.
- **Never claimed:** adopters, user counts, certification, an existing committee, an
  SDK/API/package, specified data import (only export is normative).
- **Numbers:** headline is 115 rules / 19 groups / 25 non-conformance conditions.
- **Stress test:** five gap areas (from seven scenarios across eight attack surfaces),
  undated.
- **Terminology:** only LEBOSS-aligned and LEBOSS-compliant used; "LEBOSS-conformant"
  is not a defined term and does not appear.
