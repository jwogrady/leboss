# LEBOSS Specification Status

**Current Version:** v0.1.0-rc
**Updated Through:** proposal/0.0.29
**Status:** Release candidate for first Committee Vote (v0.1.0)

---

## Specification Stability

The architecture, governance object model, and operational protocols are **structurally complete** as of proposal/0.0.29.

The standard covers the full governance layer: ownership, access control, delegation, enforcement, audit, portability, identity, and revocation timing. All boundary gaps identified in the 0.0.21 stress test have been resolved through proposals 0.0.22–0.0.29.

- **115 normative rules** across **19 rule groups**
- **25 non-conformance conditions** defined in `standards/conformance.md`
- **MUST:** 72 · **MUST NOT:** 46 · **MAY:** 5

Implementations may begin development against this version. The v0.1.0-rc is open for community review. The v0.1.0 milestone will mark the first Committee Vote candidate.

---

## What the Standard Covers

LEBOSS defines the governance layer for local business data systems:

- **Ownership** — who owns the data; governing entity authority and obligations
- **Access Control** — how access is granted, scoped, and enforced
- **Delegation** — how authority is delegated and what constraints apply
- **Enforcement** — when and how normative rules must be enforced
- **Audit** — what governed actions must be recorded and at what resolution
- **Portability** — how the complete operational data environment must be exportable
- **Identity** — actor identity portability and governing entity authenticity
- **Revocation Timing** — when revocation takes effect and what enforcement must reflect

What the standard does not cover: runtime environments, infrastructure platforms, API designs, specific software architectures, or implementation patterns. These are outside the scope of the governance standard by design.

---

## Proposal History

The specification evolved through the following proposals, each merged to `master`:

| Proposal | Content |
|----------|---------|
| [0.0.1](proposals/0.0.1/proposal.md) | Initial doctrine and reference architecture |
| [0.0.2](proposals/0.0.2/proposal.md) | Normative rule register and formalization pass |
| [0.0.3](proposals/0.0.3/proposal.md) | Governance object model |
| [0.0.4](proposals/0.0.4/proposal.md) | Access Grant Protocol |
| [0.0.5](proposals/0.0.5/proposal.md) | Integration Descriptor Protocol |
| [0.0.6](proposals/0.0.6/proposal.md) | Audit Record Collection Protocol |
| [0.0.7](proposals/0.0.7/proposal.md) | Data Portability Protocol |
| [0.0.8](proposals/0.0.8/proposal.md) | Resource Model |
| [0.0.9](proposals/0.0.9/proposal.md) | Specification stabilization |
| [0.0.10](proposals/0.0.10/proposal.md) | Repository normalization and publishing preparation |
| [0.0.11](proposals/0.0.11/proposal.md) | Canonical multi-deck presentation system |
| [0.0.12](proposals/0.0.12/proposal.md) | Terminology stabilization — conformance tiers, missing glossary entries, element name alignment |
| [0.0.13](proposals/0.0.13/proposal.md) | Specification and implementation boundary |
| [0.0.14](proposals/0.0.14/proposal.md) | Enforcement responsibility |
| [0.0.15](proposals/0.0.15/proposal.md) | Audit as system of record |
| [0.0.16](proposals/0.0.16/proposal.md) | Data portability format requirements |
| [0.0.17](proposals/0.0.17/proposal.md) | Cross-system resource identity and mapping |
| [0.0.18](proposals/0.0.18/proposal.md) | Delegation and authority chain constraints |
| [0.0.19](proposals/0.0.19/proposal.md) | Conformance verification |
| [0.0.20](proposals/0.0.20/proposal.md) | Structural normalization |
| [0.0.21](proposals/0.0.21/proposal.md) | Boundary stress test — identified remaining enforcement gaps |
| [0.0.22](proposals/0.0.22/proposal.md) | Primary operational data boundary (OWN-9, OWN-10) |
| [0.0.23](proposals/0.0.23/proposal.md) | Service provider boundary (SVC-8, SVC-9) |
| [0.0.24](proposals/0.0.24/proposal.md) | Protocol normativity alignment (PROT-1 through PROT-5) |
| [0.0.25](proposals/0.0.25/proposal.md) | Actor identity portability (ACTOR-1 through ACTOR-6) |
| [0.0.26](proposals/0.0.26/proposal.md) | Governing entity authenticity (GEA-1 through GEA-6) |
| [0.0.27](proposals/0.0.27/proposal.md) | Audit resolution requirements (AUD-1 through AUD-6) |
| [0.0.28](proposals/0.0.28/proposal.md) | Delegation chain lifetime integrity (DCL-1 through DCL-6) |
| [0.0.29](proposals/0.0.29/proposal.md) | Revocation enforcement timing (REV-1 through REV-6) |

Proposal documents are preserved in [`proposals/`](proposals/) and serve as the permanent change log of the specification.

---

## Repository Structure

| Directory | Content |
|-----------|---------|
| [`standards/`](standards/) | Normative specification — the authoritative source of all requirements |
| [`governance/`](governance/) | Governance model — proposal lifecycle, committee roles |
| [`glossary/`](glossary/) | Canonical terminology definitions |
| [`proposals/`](proposals/) | Proposal history — change log for all versions |
| [`presentations/`](presentations/) | Active presentation system — three-deck Slidev portal |
| [`presentations/archive/`](presentations/archive/) | Archived original slide deck — historical source material |

---

## Normative Language Policy

Normative keywords follow [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119) conventions:

| Keyword | Meaning |
|---------|---------|
| **MUST** | Absolute requirement |
| **MUST NOT** | Absolute prohibition |
| **SHOULD** | Recommended; deviation requires justification |
| **SHOULD NOT** | Not recommended; deviation requires justification |
| **MAY** | Optional |

Normative statements appear **only** within the `standards/` documents. The glossary, governance documents, and presentations are informative.

---

## Release Model

LEBOSS uses semantic versioning with LEBOSS-specific meaning:

| Position | Label | Meaning |
|----------|-------|---------|
| `Z` (rightmost) | Draft | Working document open for contribution |
| `Y` (middle) | Committee Vote | Accepted by committee, open for member ratification |
| `X` (leftmost) | Published | Ratified by members — the active canonical standard |

All changes to the standard go through the proposal process defined in [`governance/governance.md`](governance/governance.md).

---

## Participation

The standard is open for community contribution. See [CONTRIBUTING.md](CONTRIBUTING.md) to open a proposal, file an issue, or nominate yourself for the committee.
