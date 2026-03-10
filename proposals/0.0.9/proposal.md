# LEBOSS Proposal 0.0.9

**Status:** Proposal
**Branch:** proposal/0.0.9
**Date:** 2026-03-09
**Builds on:** proposal/0.0.8

---

## Summary

This proposal is a **specification stabilization release** — a focused editorial and consistency pass across the full LEBOSS specification before advancement to `0.1.0`, the first Committee Vote candidate.

No new architectural primitives are introduced. All changes are terminological, structural, or cross-reference corrections. The goal is to ensure that an implementer reading any document in the specification encounters a single consistent vocabulary, normatively correct language throughout, and accurate references to all companion documents.

---

## Motivation

Proposals 0.0.1 through 0.0.8 built the specification incrementally — each adding a new layer without revisiting earlier documents. This is appropriate for a drafting phase but creates residual inconsistencies that would impede implementation:

**Terminology drift.** The term "governing entity" was introduced in 0.0.2 as the implementation-neutral name for the root owner (Universe). However, the base sections of the standard (§6 and §7) still use "Universe owner" throughout normative requirements. An implementer reading §6.3 and §11–§16 encounters two different terms for the same concept.

**Informal normative language.** Several requirements in §6.3 and §7.1 use lowercase constructions ("access grants are revocable at any time") rather than RFC 2119 language. These requirements are in the normative rule register as MUST-level rules, but the corresponding standard text does not use MUST. This creates a gap between the standard and its own rule register.

**Scope field imprecision.** The Access Grant scope requirement in §6.3 describes scope as "which elements or equivalent structures the grant covers" — using reference model terminology rather than the Resource Model vocabulary introduced in 0.0.8. With the Resource Model now defined, scope references should use "resources or resource categories."

**Duplicate section separators.** Two double `---` sequences exist in the standard (between §10 and §11, and between §11 and §12) as a minor artifact from incremental section additions.

**Stale versioning section.** §10 lists items deferred to future drafts; four of the five original gaps (GAP-1 through GAP-4) have been addressed by proposals 0.0.3 through 0.0.8. The list should reflect the current state.

**Gaps register.** The normative rule register (`leboss-normative-rules.md`) still lists all five gaps as open. Four have been resolved.

---

## Specification Changes

| Document | Change |
|----------|--------|
| `standards/leboss-standard.md` | Terminology alignment, normative language correction, scope field update, duplicate separator removal, deferred items list update |
| `standards/leboss-normative-rules.md` | Gap register updated to reflect resolved gaps |

---

## Rationale

### Why align to "governing entity" rather than "Universe owner"?

"Universe" is a reference model name — it is illustrative, not required. The standard itself established this in §5.1 (0.0.2): "The spatial names are illustrative... Implementations MAY use any internal naming convention." The implementation-neutral term "governing entity" was introduced specifically for contexts where the spatial metaphor is not appropriate. §6 and §7 — which define normative requirements that bind all compliant systems — are exactly such a context.

### Why update the scope field language?

Saying a grant covers "elements or equivalent structures" predates the Resource Model. Now that 0.0.8 has defined resources, resource types, and resource namespaces, the scope requirement should use the vocabulary that actually supports it. This also closes the gap LEBOSS-RM-20 identified: an Access Grant scope must reference "one or more resources, resource type categories, or data categories."

### Why correct the normative language in §6.3?

The requirement "Access grants are revocable at any time by the Universe owner" is listed in the normative rule register as LEBOSS-ACC-3. That rule uses MUST language. The standard text from which it was derived does not. This is not a substantive change — it aligns the standard's own text with its own rule register.

---

## Backward Compatibility

No normative rules are modified in substance. All changes are:
- Substituting "governing entity" for "Universe owner" (same concept, implementation-neutral term)
- Adding MUST language to a requirement already listed as MUST in the rule register
- Replacing "elements or equivalent structures" with "resources or resource categories" (terminology update, not scope change)
- Removing duplicate `---` separators (cosmetic)
- Updating a list of deferred items to reflect resolved gaps (informational)

Implementations conformant with 0.0.8 are fully conformant with 0.0.9.

---

## Implementation Considerations

No implementation changes are required by this proposal. This is an editorial release.

---

## Path to 0.1.0

With stabilization complete, the specification includes:

| Version | Content |
|---------|---------|
| 0.0.1 | Doctrine, reference model, data ownership |
| 0.0.2 | Normative rule register, formalization |
| 0.0.3 | Governance objects (Access Grant, Integration Descriptor, Audit Record) |
| 0.0.4 | Access Grant Protocol |
| 0.0.5 | Integration Descriptor Protocol |
| 0.0.6 | Audit Record Collection Protocol |
| 0.0.7 | Data Portability Protocol |
| 0.0.8 | Resource Model |
| 0.0.9 | Specification Stabilization |

The specification is ready for committee review and advancement to `0.1.0` — the first Committee Vote candidate.

The one remaining identified gap is GAP-5: Succession and Ownership Transfer Protocol. This is significant but not a prerequisite for implementability. It is recommended that `0.1.0` formally defer this item and that its development proceed as a parallel workstream.
