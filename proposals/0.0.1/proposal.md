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

**In scope for 0.0.1:**
- The six LEBOSS Elements and their dependency rules
- The five Foundation Principles
- The Data Ownership Doctrine (principles and obligations, not implementation mechanisms)
- Service Provider Responsibilities
- The governance model and committee structure

**Explicitly deferred to 0.0.2 and beyond:**
- Formal conformance criteria and certification process
- Technical API and interface specifications for compliant implementations
- Ownership transfer and succession protocols
- Satellite-specific compliance rules
- Normative AI/ML requirements for primary operational data

This proposal establishes the doctrine and topology model. Implementation details are future work.

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

## Future Work: What 0.0.2 Will Address

Version `0.0.2` will be the first revision of the working draft. It is expected to address:

- **Conformance criteria** — testable, verifiable requirements for calling a system LEBOSS-aligned
- **Ownership transfer protocol** — a defined process for succession and data handoff
- **Satellite compliance rules** — explicit requirements for what makes a third-party integration compliant

Items not addressed by `0.0.2` will be tracked and moved to `0.0.3` or the `0.1.0` committee review milestone.

---

## Feedback Requested

The committee is specifically seeking community input on the following open questions:

**1. Topology model completeness**
Are the six LEBOSS Elements sufficient to describe all meaningful local business data relationships? Are there common patterns — franchises, cooperatives, multi-location businesses — that the current model fails to represent?

**2. Access Grant granularity**
Section 6.3 defines the required components of an Access Grant. Is this the right level of granularity? Too broad? Too narrow? What would a developer need to implement this in a real system?

**3. "Primary operational data" definition**
Section 6.1 enumerates examples. Is the enumeration complete enough to be useful? Does it create edge cases that should be addressed?

**4. Service provider responsibilities**
Section 7 defines six responsibilities. Are there obligations missing? Are any of the six unenforceable in practice?

**5. Governance model**
Is the Proposal → Draft → Committee Vote → Published workflow appropriate for a community this size? What would make it easier to participate?

---

## How to Engage

- Comment on the open pull request with questions, concerns, or support
- Open issues against specific documents to raise targeted questions — label the issue with the section number (e.g., `standard-6.3`)
- Submit pull requests proposing changes to specific provisions, following the shape described in [CONTRIBUTING.md](../../CONTRIBUTING.md)

The committee reviews all substantive engagement. No contribution is too small.
