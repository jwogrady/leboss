# Proposal 0.0.14 — Enforcement Responsibility

**Status:** Proposal
**Branch:** proposal/0.0.14-enforcement-responsibility
**Date:** 2026-03-21
**Builds on:** proposal/0.0.13

---

## Summary

The LEBOSS standard contains 40 normative rules describing what must be true of
governed systems. No rule currently states that those requirements must be enforced
in operation. A system can document every obligation, publish policies aligned with
every requirement, and still permit governed actions to occur without enforcement —
and under the current standard, no rule makes that a conformance failure.

This proposal closes that gap. It establishes operational enforcement as a required
property of LEBOSS-compliant systems, defines "governed action" and "operational
enforcement" as formal terms, and explicitly states that enforcement failure —
regardless of intent — is a conformance violation. It also affirms that the standard
does not prescribe how enforcement is achieved.

No protocol is expanded. No mechanism is introduced.

---

## Motivation

The current standard defines obligations precisely. What it does not say is that those
obligations must be upheld when governed actions occur. The gap is real: a system can:

- Publish documentation stating that access grants are required
- Have an architectural diagram showing grant validation
- Pass a paper review of its stated policies
- And still allow data access without grant validation in operation

Under the current standard, no rule makes this a conformance failure. The rules
describe the target state; none requires that the target state be maintained when it
matters — at runtime.

The correction is narrow: normative rules must be enforced in operation, not just
described. This is expressed in one new conformance section (§8.6), one new minimum
conformance requirement (conformance.md §3.7), one new non-conformance condition, and
four new normative rules (ENF-1 through ENF-4).

---

## Specification Changes

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-standard.md` | Add §8.6 Operational Enforcement; update §8.5 | Normative — conformance criteria |
| `standards/leboss-normative-rules.md` | Add ENF rule group; update Summary Counts | Normative rules |
| `standards/conformance.md` | Add §3.7; add non-conformance condition 7 | Normative — conformance requirements |
| `glossary/terms.md` | Add "Governed Action"; add "Operational Enforcement" | Definitional |

### `standards/leboss-standard.md`

**§8.5 Non-Conformance** — fifth bullet added: satisfying normative requirements
through documentation or stated intent without operational enforcement.

**§8.6 Operational Enforcement** (new) — three numbered alignment criteria:
- Item 15: normative requirements are enforced in operation; documentation is not enforcement
- Item 16: governed actions are subject to rule enforcement at the time they occur
- Item 17: enforcement failure is a conformance failure regardless of intent

### `standards/leboss-normative-rules.md`

Four new rules in ENF group:

- **LEBOSS-ENF-1** — Normative requirements MUST be enforced in operation;
  documentation MUST NOT be treated as satisfying normative requirements.
- **LEBOSS-ENF-2** — Governed actions MUST be subject to rule enforcement at the
  time they occur.
- **LEBOSS-ENF-3** — Systems permitting governed actions without enforcement MUST NOT
  claim LEBOSS alignment or compliance.
- **LEBOSS-ENF-4** — The standard MUST NOT prescribe a specific enforcement
  architecture, mechanism, or technology.

Summary Counts: 40 → 44 rules.

### `standards/conformance.md`

**§3.7 Operational Enforcement** (new) — minimum conformance requirement: normative
requirements must be enforced in operation; documentation and policy do not constitute
enforcement; operational enforcement is required across all governed action categories.

**§4 condition 7** (new) — Unenforced requirements: normative requirements satisfied
by documentation, policy, or stated intent only, without operational enforcement.

### `glossary/terms.md`

- **Governed Action** — An operation subject to normative requirements; must be
  enforced at the time it occurs.
- **Operational Enforcement** — The property by which normative requirements are
  enforced at the time governed actions occur; a conformance requirement; standard
  does not prescribe the means of enforcement.

---

## Impact Assessment

| Existing Element | Impact |
|-----------------|--------|
| All existing MUST/MUST NOT rules (OWN through SVC) | Unchanged |
| Conformance tiers (aligned / compliant) | Unchanged |
| All governance object definitions | Unchanged |
| All protocols (AGP, IDP, ACP, DPP) | Unchanged |
| Resource Model | Unchanged |

---

## Backward Compatibility

This proposal adds no new behavioral requirements beyond stating that existing
requirements must be enforced in operation. Systems that were genuinely conformant
under the previous standard — meaning their normative obligations were actually upheld
at runtime — are fully conformant after this proposal is applied.

Systems that satisfied requirements through documentation only were not conformant
under the intent of the standard. This proposal makes that non-conformance explicit.

---

*Proposal 0.0.14 — Community contribution. Open for committee review.*
