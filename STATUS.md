# LEBOSS Specification Status

**Current Version:** pre-v0.1.0 (Draft)
**Updated Through:** proposal/0.0.12
**Next Milestone:** v0.1.0 — first Committee Vote candidate

---

## Specification Stability

The architecture, governance object model, and operational protocols are considered **draft-stable** as of proposal/0.0.11.

The v0.1.0 release represents the first implementable draft of the standard. Implementations may begin development against this version with the understanding that subsequent proposals may refine — but are not expected to break — the core governance model.

The following areas remain explicitly deferred to future proposals:

- Formal compliance certification procedures and profiles
- Ownership transfer and succession protocols
- Satellite-specific compliance rules
- Normative requirements for AI and machine learning use of primary operational data
- A canonical LEBOSS Portability Format (specific encoding specification)
- Technical API and interface specifications for compliant Planet implementations

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
