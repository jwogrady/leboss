# LEBOSS Proposal 0.0.10

**Status:** Proposal
**Branch:** proposal/0.0.10
**Date:** 2026-03-09
**Builds on:** proposal/0.0.9

---

## Summary

This proposal performs **repository normalization and publishing preparation** in advance of the `0.1.0` implementable draft release.

No new specification content is introduced. All changes are structural: versioned filenames become canonical stable names, internal cross-references are updated to match, the README is brought current, and the repository structure is clarified for external readers arriving at the project for the first time.

---

## Motivation

The specification was developed incrementally — each version adding content under a new filename. This was correct for a drafting phase but leaves the repository in a state that is unfriendly to implementers:

**Versioned specification filenames.** Files named `leboss-standard-0.0.2.md` and `leboss-normative-rules-0.0.2.md` carry version numbers that will change on every publication cycle. An implementer who links to or imports from a specific filename will find that link broken at the next release. Canonical filenames (`leboss-standard.md`, `leboss-normative-rules.md`) remain stable while version metadata lives where it belongs — inside the document header and in git tags.

**Stale README.** The README still describes the repository as it existed at version 0.0.1, including a repository structure diagram that does not reflect the specifications, protocols, glossary, and governance documents added across nine subsequent proposals.

**Inconsistent presentation directory state.** The repository has both a `presentations/` directory (archive reference) and a `presentation/` directory (live Netlify app). The Netlify build configuration (`netlify.toml`) requires `presentation/` to remain as-is — it is the build root. The `presentations/slides.md` archive reference is renamed to `presentations/leboss-overview.md` to clarify its purpose.

---

## Specification Changes

| Change | Detail |
|--------|--------|
| `standards/leboss-standard-0.0.2.md` → `standards/leboss-standard.md` | Canonical filename; version in header updated to 0.0.9 |
| `standards/leboss-normative-rules-0.0.2.md` → `standards/leboss-normative-rules.md` | Canonical filename; version in header updated to 0.0.9 |
| `presentations/slides.md` → `presentations/leboss-overview.md` | Clarified archive reference name |
| `README.md` | Fully updated to reflect current specification state |
| All cross-references to versioned filenames | Updated to canonical filenames |

---

## Rationale

### Why stable canonical filenames?

A standard is a living document. `leboss-standard.md` is always the current standard. The version number is metadata, not an identifier — it belongs in the document header and in git tags, not in the filename. This mirrors the practice of established open standards (RFC documents are numbered by series entry, not by content version; W3C specs use stable `/TR/name/` paths).

### Why not rename `presentation/`?

The `presentation/` directory is the Netlify build root configured in `netlify.toml`. Renaming it would break the public deployment at `https://leboss.status26.com/`. It is left entirely unchanged. The `presentations/` directory is a separate archive reference path and is not affected by the Netlify constraint.

### Why update the README?

The README is the first document an external reader encounters. It currently describes a repository from nine proposals ago. A README that does not match the actual repository damages credibility before a reader has read a single specification line.

---

## Backward Compatibility

All content is preserved. Git history retains the full record of which content appeared under which filename. The `leboss-standard-0.0.1.md` historical artifact is preserved in `standards/` as it was the first published version; it is not renamed.

Implementations that have linked directly to versioned filenames in this repository will need to update those links to the canonical names.

---

## Implementation Considerations

None. This is a repository hygiene release. No behavioral rules change and no specification content changes.

---

## Release Tagging

Upon merging proposals 0.0.1 through 0.0.10 into `master`, the repository is ready for `v0.1.0` tagging. This tag marks the first Committee Vote candidate — a complete, self-consistent, implementable specification draft.

GAP-5 (Succession and Ownership Transfer Protocol) remains the single open identified gap and is formally deferred beyond 0.1.0.
