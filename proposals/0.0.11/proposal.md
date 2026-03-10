# LEBOSS Proposal 0.0.11

**Status:** Proposal
**Branch:** proposal/0.0.11
**Date:** 2026-03-09
**Builds on:** proposal/0.0.10

---

## Summary

This proposal introduces a **canonical multi-deck Slidev presentation system** for the LEBOSS repository. It reorganizes the existing presentation layer into a structured set of purpose-built decks, each targeting a distinct audience and subject area, while preserving the original presentation as an archive artifact.

This proposal does not change the specification. All normative content remains in `standards/`. The presentation system is a documentation and explanation layer derived from the specification.

---

## Motivation

The LEBOSS repository now contains a complete, stabilized specification at 0.0.9 and a normalized repository structure from 0.0.10. The specification is technically complete but not yet accessible: the only explanation of LEBOSS is a single slide deck in `presentation/` (singular) that was created before the formal standard existed. That deck served its purpose as the seed of the project, but it mixes audiences, lacks governance coverage entirely, and does not reflect the specification as it now stands.

The repository needs a coherent explanation layer that:

1. Explains the data sovereignty rationale to business owners without requiring technical background
2. Explains the reference model and governance objects to developers and architects
3. Explains the proposal and committee process to contributors and implementers

A single deck cannot serve all three audiences well. The existing deck attempts to do so and falls short on all three counts.

Additionally, the Netlify deployment at `https://leboss.status26.com/` currently serves content that predates the formal standard. The presentation system introduced in this proposal replaces that content with a specification-aligned overview deck as the primary public presentation.

---

## Specification Changes

| Document | Change |
|----------|--------|
| `presentations/slidev/package.json` | New — Slidev build environment for the presentation system |
| `presentations/overview/slides.md` | New — Overview deck: data sovereignty rationale, principles, architecture introduction |
| `presentations/architecture/slides.md` | New — Architecture deck: reference model, governance objects, operational flow |
| `presentations/governance/slides.md` | New — Governance deck: proposal lifecycle, versioning, committee, conformance |
| `netlify.toml` | Updated — build root changed from `presentation/` to `presentations/slidev/` |
| `README.md` | Updated — Presentation System section added |

The original `presentation/` directory (singular) is preserved as an archive artifact. Its content is not modified.

---

## Rationale

### Why a multi-deck system?

Audience separation improves clarity. A business owner evaluating LEBOSS does not need to understand access grant lifecycle validation before understanding why data ownership matters. A developer implementing LEBOSS conformance does not need a long explanation of why local businesses deserve data sovereignty before seeing the reference model. The decks are linked so readers can navigate to deeper material when ready.

### Why preserve `presentation/` (singular)?

The original slide deck is the historical origin of the LEBOSS concept — the first articulation of the six-element topology and five foundation principles before any formal specification existed. Removing it would erase a primary source document. It is retained as an archive artifact and marked as such.

### Why update the Netlify build root?

The `presentation/` deck serves pre-specification content. The public site at `https://leboss.status26.com/` should serve the current specification-aligned overview. Updating `netlify.toml` to build from `presentations/slidev/` (which builds the overview deck) achieves this without breaking any other part of the repository.

### Why does the overview deck deploy rather than one of the others?

The overview audience is the broadest. Business owners, solution providers, and developers unfamiliar with LEBOSS all benefit from starting at the same place — the data sovereignty rationale — before branching to architecture or governance depth. The overview deck serves as the public entry point.

---

## Backward Compatibility

The specification itself is unchanged. No normative rules are added, modified, or removed.

The `presentation/` directory (singular) is preserved with its existing content. Any external links to `https://leboss.status26.com/` that targeted the original deck will now reach the overview deck instead — this is the intended upgrade.

Implementations conformant with 0.0.10 are fully conformant with 0.0.11.

---

## Implementation Considerations

The Slidev environment in `presentations/slidev/` builds the overview deck for Netlify deployment. Architecture and governance decks are available in the repository for local presentation use and future separate deployment. Build commands for all three decks are defined in `presentations/slidev/package.json`.

---

## Feedback Requested

**1. Separate deployments for architecture and governance decks**
Should the architecture and governance decks be deployed to separate Netlify sites or subdirectories of the primary site in a future proposal?

**2. Deck navigation**
The current navigation model uses repository links between decks. A future proposal could define a navigation sidebar or top-bar linking all three decks if they are co-deployed.

**3. Additional decks**
Are there other audience segments or subject areas that warrant dedicated decks? Candidates: implementation guide, compliance checklist, committee handbook.
