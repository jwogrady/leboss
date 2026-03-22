# LEBOSS Releases

**Updated Through:** proposal/0.0.29

This document describes the versioning policy for the LEBOSS specification and lists all releases.

---

## Versioning Policy

LEBOSS uses semantic versioning in the form `X.Y.Z` with LEBOSS-specific meaning at each position:

| Position | Label | Meaning |
|----------|-------|---------|
| `Z` (rightmost) | **Draft** | A working draft in progress. Open for community contribution and critique. Not stable for implementation. |
| `Y` (middle) | **Committee Vote** | An accepted draft open for member ratification. The specification is stable enough for implementer review. |
| `X` (leftmost) | **Published** | A committee- and member-ratified standard. Immutable. The canonical reference for conformant implementations. |

**Examples:**
- `0.0.29` / `v0.1.0-rc` — structurally complete governance standard; release candidate for first Committee Vote
- `0.1.0` — first Committee Vote candidate; stable for implementer review
- `1.0.0` — first Published standard; ratified and immutable

### Draft Series (0.x.x)

All `0.x.x` versions are evolving drafts. The specification architecture and normative rules may change between drafts as community feedback is incorporated.

Implementers MAY build against a `0.x.x` draft but should expect that specific rules, field names, or protocol requirements may be revised before `1.0.0`. Tracking the `master` branch or a specific tag is recommended for implementation work.

### Committee Vote Series (0.Y.0)

A `0.Y.0` version marks a Committee Vote milestone. At this point:
- The specification is considered complete enough for member ratification
- No new architectural features will be added during the vote period
- The version is stable for implementer evaluation
- A 14-day minimum vote period applies before advancement to Published

### Published Standard (X.0.0)

A `1.0.0` or higher version marks a Published standard:
- The specification is immutable at this version
- Changes require a new version proceeding through the full governance workflow
- Implementations citing a specific published version can rely on it remaining stable

---

## Version History

Specification versions are tracked through:

1. **Git tags** — each release is tagged `vX.Y.Z` on the `master` branch
2. **Proposal directories** — each draft increment has a corresponding `proposals/X.Y.Z/proposal.md` documenting what changed and why

### Draft Releases

#### Foundation Series (0.0.1–0.0.12)

| Version | Tag | Proposal | Content |
|---------|-----|----------|---------|
| 0.0.1 | [`v0.0.1`](https://github.com/jwogrady/leboss/releases/tag/v0.0.1) | [proposals/0.0.1](proposals/0.0.1/proposal.md) | Initial doctrine and reference architecture |
| 0.0.2 | [`v0.0.2`](https://github.com/jwogrady/leboss/releases/tag/v0.0.2) | [proposals/0.0.2](proposals/0.0.2/proposal.md) | Normative rule register and conformance requirements |
| 0.0.3 | [`v0.0.3`](https://github.com/jwogrady/leboss/releases/tag/v0.0.3) | [proposals/0.0.3](proposals/0.0.3/proposal.md) | Governance object model (Access Grant, Integration Descriptor, Audit Record) |
| 0.0.4 | [`v0.0.4`](https://github.com/jwogrady/leboss/releases/tag/v0.0.4) | [proposals/0.0.4](proposals/0.0.4/proposal.md) | Access Grant Protocol |
| 0.0.5 | [`v0.0.5`](https://github.com/jwogrady/leboss/releases/tag/v0.0.5) | [proposals/0.0.5](proposals/0.0.5/proposal.md) | Integration Descriptor Protocol |
| 0.0.6 | [`v0.0.6`](https://github.com/jwogrady/leboss/releases/tag/v0.0.6) | [proposals/0.0.6](proposals/0.0.6/proposal.md) | Audit Record Collection Protocol |
| 0.0.7 | [`v0.0.7`](https://github.com/jwogrady/leboss/releases/tag/v0.0.7) | [proposals/0.0.7](proposals/0.0.7/proposal.md) | Data Portability Protocol |
| 0.0.8 | [`v0.0.8`](https://github.com/jwogrady/leboss/releases/tag/v0.0.8) | [proposals/0.0.8](proposals/0.0.8/proposal.md) | Resource Model |
| 0.0.9 | [`v0.0.9`](https://github.com/jwogrady/leboss/releases/tag/v0.0.9) | [proposals/0.0.9](proposals/0.0.9/proposal.md) | Specification Stabilization |
| 0.0.10 | [`v0.0.10`](https://github.com/jwogrady/leboss/releases/tag/v0.0.10) | [proposals/0.0.10](proposals/0.0.10/proposal.md) | Repository Normalization |
| 0.0.11 | [`v0.0.11`](https://github.com/jwogrady/leboss/releases/tag/v0.0.11) | [proposals/0.0.11](proposals/0.0.11/proposal.md) | Canonical multi-deck presentation system |
| 0.0.12 | [`v0.0.12`](https://github.com/jwogrady/leboss/releases/tag/v0.0.12) | [proposals/0.0.12](proposals/0.0.12/proposal.md) | Terminology stabilization — conformance tiers, missing glossary entries, element name alignment |

#### Governance Boundary and Enforcement Series (0.0.13–0.0.20)

| Version | Proposal | Content |
|---------|----------|---------|
| 0.0.13 | [proposals/0.0.13](proposals/0.0.13/proposal.md) | Specification and implementation boundary |
| 0.0.14 | [proposals/0.0.14](proposals/0.0.14/proposal.md) | Enforcement responsibility |
| 0.0.15 | [proposals/0.0.15](proposals/0.0.15/proposal.md) | Audit as system of record |
| 0.0.16 | [proposals/0.0.16](proposals/0.0.16/proposal.md) | Data portability format requirements |
| 0.0.17 | [proposals/0.0.17](proposals/0.0.17/proposal.md) | Cross-system resource identity and mapping |
| 0.0.18 | [proposals/0.0.18](proposals/0.0.18/proposal.md) | Delegation and authority chain constraints |
| 0.0.19 | [proposals/0.0.19](proposals/0.0.19/proposal.md) | Conformance verification |
| 0.0.20 | [proposals/0.0.20](proposals/0.0.20/proposal.md) | Structural normalization |

#### Stress Test and Gap Closure Series (0.0.21–0.0.29)

| Version | Proposal | Content |
|---------|----------|---------|
| 0.0.21 | [proposals/0.0.21](proposals/0.0.21/proposal.md) | Boundary stress test — identified remaining enforcement gaps |
| 0.0.22 | [proposals/0.0.22](proposals/0.0.22/proposal.md) | Primary operational data boundary (OWN-9, OWN-10) |
| 0.0.23 | [proposals/0.0.23](proposals/0.0.23/proposal.md) | Service provider boundary (SVC-8, SVC-9) |
| 0.0.24 | [proposals/0.0.24](proposals/0.0.24/proposal.md) | Protocol normativity alignment (PROT-1 through PROT-5) |
| 0.0.25 | [proposals/0.0.25](proposals/0.0.25/proposal.md) | Actor identity portability (ACTOR-1 through ACTOR-6) |
| 0.0.26 | [proposals/0.0.26](proposals/0.0.26/proposal.md) | Governing entity authenticity (GEA-1 through GEA-6) |
| 0.0.27 | [proposals/0.0.27](proposals/0.0.27/proposal.md) | Audit resolution requirements (AUD-1 through AUD-6) |
| 0.0.28 | [proposals/0.0.28](proposals/0.0.28/proposal.md) | Delegation chain lifetime integrity (DCL-1 through DCL-6) |
| 0.0.29 | [proposals/0.0.29](proposals/0.0.29/proposal.md) | Revocation enforcement timing (REV-1 through REV-6) |

### Upcoming

| Version | Status | Description |
|---------|--------|-------------|
| **0.1.0** | Release Candidate (v0.1.0-rc) | First Committee Vote candidate — governance standard at release candidate stage, open for committee review and member ratification |

---

## Tagging Convention

Tags are applied to commits on the `master` branch after proposals are merged:

```
git tag -a v0.1.0 -m "LEBOSS 0.1.0 — first Committee Vote candidate"
git push origin v0.1.0
```

Each tag marks the state of the specification at that version. The full specification at any past version is recoverable by checking out the corresponding tag.

---

*For governance process details, see [governance/governance.md](governance/governance.md).*
