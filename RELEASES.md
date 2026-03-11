# LEBOSS Releases

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
- `0.0.11` — eleventh working draft; current pre-v0.1.0 draft
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

| Version | Tag | Proposal | Content |
|---------|-----|----------|---------|
| 0.0.1 | `v0.0.1` *(pending)* | [proposals/0.0.1](proposals/0.0.1/proposal.md) | Initial doctrine and reference architecture |
| 0.0.2 | `v0.0.2` *(pending)* | [proposals/0.0.2](proposals/0.0.2/proposal.md) | Normative rule register and conformance requirements |
| 0.0.3 | `v0.0.3` *(pending)* | [proposals/0.0.3](proposals/0.0.3/proposal.md) | Governance object model (Access Grant, Integration Descriptor, Audit Record) |
| 0.0.4 | `v0.0.4` *(pending)* | [proposals/0.0.4](proposals/0.0.4/proposal.md) | Access Grant Protocol |
| 0.0.5 | `v0.0.5` *(pending)* | [proposals/0.0.5](proposals/0.0.5/proposal.md) | Integration Descriptor Protocol |
| 0.0.6 | `v0.0.6` *(pending)* | [proposals/0.0.6](proposals/0.0.6/proposal.md) | Audit Record Collection Protocol |
| 0.0.7 | `v0.0.7` *(pending)* | [proposals/0.0.7](proposals/0.0.7/proposal.md) | Data Portability Protocol |
| 0.0.8 | `v0.0.8` *(pending)* | [proposals/0.0.8](proposals/0.0.8/proposal.md) | Resource Model |
| 0.0.9 | `v0.0.9` *(pending)* | [proposals/0.0.9](proposals/0.0.9/proposal.md) | Specification Stabilization |
| 0.0.10 | `v0.0.10` *(pending)* | [proposals/0.0.10](proposals/0.0.10/proposal.md) | Repository Normalization |
| 0.0.11 | `v0.0.11` *(pending)* | [proposals/0.0.11](proposals/0.0.11/proposal.md) | Canonical multi-deck presentation system |

### Upcoming

| Version | Status | Description |
|---------|--------|-------------|
| **0.1.0** | Preparing | First Committee Vote candidate — implementable draft release |

---

## Tagging Convention

Tags are applied to commits on the `master` branch after proposals are merged:

```
git tag -a v0.1.0 -m "LEBOSS 0.1.0 — first implementable draft release"
git push origin v0.1.0
```

Each tag marks the state of the specification at that version. The full specification at any past version is recoverable by checking out the corresponding tag.

---

## Open Gap

**GAP-5: Succession and Ownership Transfer Protocol** — The standard requires succession support (LEBOSS-CONT-1 through CONT-3) but no protocol yet defines how ownership transfer is executed. This is the one remaining identified gap and is formally deferred beyond `0.1.0`.

---

*For governance process details, see [governance/governance.md](governance/governance.md).*
