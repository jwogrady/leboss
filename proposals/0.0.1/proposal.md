# LEBOSS Proposal 0.0.1

**Status:** Proposal
**Branch:** proposal/0.0.1
**Date:** 2026-03-09
**Author:** LEBOSS Founding Contributors

---

## Summary

This proposal introduces the first formal version of the LEBOSS standard. It converts the original LEBOSS presentation materials into a structured, written specification suitable for community review, critique, and adoption.

This proposal represents the transition of LEBOSS from a presentation artifact into an open standard.

---

## What This Proposal Contains

| Document | Purpose |
|----------|---------|
| [standards/leboss-standard-0.0.1.md](../../standards/leboss-standard-0.0.1.md) | The formal specification |
| [charter/mission.md](../../charter/mission.md) | Mission and philosophical foundation |
| [glossary/terms.md](../../glossary/terms.md) | Terminology definitions |
| [governance/governance.md](../../governance/governance.md) | Governance workflow |
| [governance/committee.md](../../governance/committee.md) | Committee structure |

---

## Motivation

The LEBOSS concept originated as a presentation framework describing a service topology for local business data systems. That presentation articulated both an architectural model (the LEBOSS Elements) and an implicit philosophical position (that data belongs to the business owner).

The original presentation was valuable for communicating the concept. It was not adequate for guiding implementation, inviting community contribution, or establishing LEBOSS as a credible open standard.

This proposal converts that original work into a formal specification. Every element of the standard is derived from the original presentation materials and the founding LEBOSS philosophy. No new principles have been introduced.

---

## What Changed from the Original Presentation

The original [slides.md](../../presentation/slides.md) defined:
- Five Foundation Principles (Clarity, Modularity, Security, Legacy & Continuity, Extensibility)
- Six LEBOSS Elements (Universe through Satellite) with definitions and examples

This proposal preserves all of that material and adds:
- A formal data ownership doctrine (Section 6 of the standard)
- Service provider responsibilities (Section 7)
- A governance model for evolving the standard
- A glossary of defined terms
- A charter articulating the philosophical foundation

---

## Scope

This proposal establishes the structure and content of the `0.x.x` version series. During this series, the foundational architecture may change. Breaking changes do not require a major version increment until the standard reaches `1.0.0`.

---

## Gaps Acknowledged

This proposal is intentionally incomplete in certain areas that future proposals should address:

1. **Formal Conformance Criteria** — Section 9 of the standard describes conformance at a high level but does not define testable requirements. A future proposal (0.0.2 or 0.1.0) should define specific, verifiable criteria.

2. **Reference Architecture Diagrams** — The LEBOSS Elements are described in text. Visual diagrams showing compliant topologies (and non-compliant ones) would significantly improve clarity. Currently blocked by the absence of a diagram toolchain in the repository.

3. **Ownership Transfer Protocol** — The Legacy and Continuity principle requires that systems support succession planning, but no protocol for executing an ownership transfer is defined.

4. **Satellite Compliance Rules** — Satellites are identified as the primary data sovereignty risk, but specific rules for what constitutes a compliant Satellite integration are not yet defined.

5. **API and Interface Specifications** — The standard defines what Planets and Moons must do but not how they must expose their capabilities. Interface specifications are a prerequisite for interoperability between compliant implementations.

6. **AI and Machine Learning Provisions** — The charter references the AI era and the specific risks of AI systems trained on business data, but the standard itself does not yet define normative requirements for AI use of primary operational data.

---

## How to Engage

- Comment on this pull request with questions, concerns, or support
- Open issues against specific documents to raise targeted questions
- Submit pull requests proposing changes to specific provisions

The committee reviews all substantive engagement. See [CONTRIBUTING.md](../../CONTRIBUTING.md).
