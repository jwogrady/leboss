# LEBOSS Proposal 0.0.2

**Status:** Proposal
**Branch:** proposal/0.0.2
**Date:** 2026-03-09
**Builds on:** proposal/0.0.1

---

## Summary

This proposal advances LEBOSS from a conceptually strong framework into a more credible, reviewable, and contributor-ready technical standard.

Version `0.0.2` is a **formalization release**. It does not introduce new architecture. It refines, tightens, and strengthens what `0.0.1` established.

---

## What This Proposal Contains

| Document | Change |
|----------|--------|
| `standards/leboss-standard.md` | Updated specification: versioned, clarified, branding-neutral |
| `standards/leboss-normative-rules.md` | Extracted normative rule register |
| `glossary/terms.md` | Updated Moon definition, added Reference Model and Governing Entity terms |
| `proposals/0.0.2/proposal.md` | This document |

---

## Motivation

`0.0.1` succeeded at establishing doctrine, architecture, and governance direction. It left several structural weaknesses that reduce credibility and reviewability:

1. **Branded module names in normative text.** The names Apex, Epic, and Aware appear in the normative standard as if they are required. They are reference implementation names, not normative requirements, and their presence in the specification contradicts the standard's own implementation-neutrality.

2. **Foundation Principles lack normative force.** Section 4 states the five principles as descriptions but never uses MUST/MUST NOT language. A reader cannot tell which are aspirational and which are requirements.

3. **Section 8 is marketing copy inside a specification.** "Framework Benefits" describes business value, not normative behavior. It does not belong in a standards document and weakens the document's authority.

4. **The reference model lacks a naming disclaimer.** Nothing in `0.0.1` states that implementations are not required to name their components Universe, Galaxy, Star, etc. This omission risks being read as a mandatory naming convention, which contradicts LEBOSS's implementation-neutral intent.

5. **Conformance (Section 9) is a placeholder.** It acknowledges that conformance criteria will be defined later but provides no interim guidance meaningful to implementers.

6. **No normative rule register exists.** Requirements are distributed across narrative prose. Extracting a flat, enumerable rule set would significantly improve reviewability and implementer guidance.

---

## Scope

**In scope for 0.0.2:**
- Version bump from 0.0.1 to 0.0.2
- Remove branded module names from normative text; relocate to non-normative implementation note
- Add implementation neutrality disclaimer to reference model section
- Add MUST/MUST NOT language to Foundation Principles
- Remove Section 8 (Framework Benefits) from normative document; content preserved in README
- Strengthen Section 9 (Conformance) with interim LEBOSS-aligned criteria
- Create normative rule register (`standards/leboss-normative-rules.md`)
- Glossary updates: Moon definition, new terms

**Explicitly deferred to 0.0.3 and beyond:**
- Formal conformance certification process
- Technical API or interface specifications
- Ownership transfer and succession protocols
- Satellite-specific compliance rules
- Normative AI/ML requirements
- Reference architecture diagrams

---

## Gaps Acknowledged

The following gaps from `0.0.1` are carried forward and remain open:

1. **Formal Conformance Criteria** — Section 9 is strengthened in this version but a full certification process is not yet defined.
2. **Reference Architecture Diagrams** — Still blocked pending diagram toolchain decision.
3. **Ownership Transfer Protocol** — Still deferred.
4. **Satellite Compliance Rules** — Still deferred.
5. **API and Interface Specifications** — Still deferred.
6. **AI and Machine Learning Provisions** — Still deferred.

---

## Future Work: What 0.0.3 Will Address

- Satellite-specific compliance rules (the highest data sovereignty risk element remains underspecified)
- Ownership transfer protocol (baseline succession workflow)
- Diagram toolchain decision and first reference architecture diagram

Items not addressed by `0.0.3` will be tracked for the `0.1.0` Committee Vote milestone.

---

## Feedback Requested

**1. Reference model naming**
Is the naming disclaimer in Section 5 clear enough? Can an implementer build a fully LEBOSS-aligned system without using the spatial metaphor at all?

**2. Foundation Principles as requirements**
The 0.0.2 draft adds MUST language to the Foundation Principles. Does this make them feel appropriately normative, or does it constrain implementations in ways that aren't justified?

**3. Normative rule register**
Is the rule register in `standards/leboss-normative-rules.md` useful as a standalone reference? Is the grouping appropriate?

**4. Conformance criteria**
Does the updated Section 9 give implementers enough guidance to assess whether their system is LEBOSS-aligned? What's still missing?

---

## How to Engage

- Comment on the open pull request
- Open issues labeled with the section number (e.g., `standard-5`, `rules-LEBOSS-12`)
- Submit pull requests proposing changes following the shape in [CONTRIBUTING.md](../../CONTRIBUTING.md)
