# Changelog

All notable changes to the LEBOSS Standard are documented here.

This is the concise running log. For the full versioning policy, the governance
workflow, and the per-proposal narrative, see [`RELEASES.md`](RELEASES.md) — the two
documents complement each other and do not contradict.

The standard follows semantic versioning with LEBOSS-specific meaning: **Z = Draft**,
**Y = Committee Vote**, **X = Published**. See
[Understanding the Version Scheme](#understanding-the-version-scheme) below. The
format takes its cues from [Keep a Changelog](https://keepachangelog.com/).

> **Tag note.** Git tags currently exist only for **v0.0.1 through v0.0.11**.
> Proposals 0.0.12 through 0.0.29 are merged to `master` and documented in
> [`RELEASES.md`](RELEASES.md) and the `proposals/` directory, but are not yet tagged.

---

## [Unreleased]

### Added

- CC BY 4.0 license file ([`LICENSE`](LICENSE)) for the specification and materials.
- `AGENTS.md` and an extended `CLAUDE.md` defining the repository's agent contract.

### Notes

- Proposal 0.0.29 is merged to `master`; no git tag has been applied yet.
- Tags v0.0.12–v0.0.29 are not yet applied. Backfilling them, or correcting the tag
  references in `RELEASES.md`, is tracked as a roadmap item — not a blocker.

---

## [v0.1.0-rc] — Release Candidate for the First Committee Vote — unreleased

**Status:** structurally complete; open for community review and committee
consideration. Updated through `proposal/0.0.29` (Revocation Enforcement Timing).

- **115 normative rules** across **19 rule groups**; **25 non-conformance conditions**.
- The architecture, governance object model, and operational protocols are
  structurally complete. The five gap areas surfaced by the 0.0.21 boundary stress
  test have been resolved.
- Not yet voted. The committee is not yet appointed; no vote has been called.
- Not yet implemented. `IMPLEMENTATIONS.md` is empty.
- Conformance is self-declared. No third-party certification program exists in this
  version.

---

## The 0.0.1 → 0.0.29 Journey

The release-candidate version was reached over twenty-nine proposals, preserved one
directory per proposal under `proposals/`. They group into three phases.

### Foundation (0.0.1 – 0.0.12)

Established the standards body, the reference model, the governance objects, and the
protocols. *(Tags exist for v0.0.1 through v0.0.11. Proposal 0.0.12 is merged but
untagged.)*

- **0.0.1** — Initial doctrine and reference architecture
  (Universe → Galaxy → Star ↔ Planet → Moon/Satellite).
- **0.0.2** — Normative rule register: moved from prose to a structured rule register.
- **0.0.3** — Governance object model: Access Grant, Integration Descriptor, Audit
  Record.
- **0.0.4** — Access Grant Protocol.
- **0.0.5** — Integration Descriptor Protocol.
- **0.0.6** — Audit Record Collection Protocol.
- **0.0.7** — Data Portability Protocol.
- **0.0.8** — Resource Model: resource identity and ownership mapping.
- **0.0.9** — Specification stabilization: structure locked.
- **0.0.10** — Repository normalization (file structure, README, deployment).
- **0.0.11** — Canonical multi-deck presentation system
  (Slidev: Overview, Architecture, Governance).
- **0.0.12** — Terminology stabilization: formalized the two-tier conformance model
  (LEBOSS-aligned vs LEBOSS-compliant), resolved undefined terms, aligned element
  names. *(First untagged proposal.)*

### Governance Boundary and Enforcement (0.0.13 – 0.0.20)

Clarified the specification/implementation boundary and enforcement responsibility.
*(Untagged.)*

- **0.0.13** — Specification and implementation boundary: what LEBOSS normatively
  covers (ownership, governance) versus what it defers (infrastructure, APIs,
  databases).
- **0.0.14** — Enforcement responsibility: who enforces each rule.
- **0.0.15** — Audit as system of record: canonical truth lives in the audit trail,
  not in operational state.
- **0.0.16** — Data portability format requirements: export format, manifest
  structure, non-proprietary requirements.
- **0.0.17** — Cross-system resource identity and mapping.
- **0.0.18** — Delegation and authority chain constraints: scope, lifetime,
  propagation of delegated access.
- **0.0.19** — Conformance verification: self-declaration model, non-conformance
  condition mapping.
- **0.0.20** — Structural normalization: eliminated cross-group redundancy, aligned
  rule numbering.

### Stress Test and Gap Closure (0.0.21 – 0.0.29)

Identified and closed the enforcement gaps; the standard moved from structurally
sound to operationally complete. *(Untagged.)*

- **0.0.21** — Boundary stress test. Across eight attack surfaces and seven
  scenarios, the test exposed **five gap areas**: audit record granularity,
  governing-entity authentication, actor identity portability, the subprocessor
  boundary, and revocation enforcement timing. *(Analysis document in
  `proposals/0.0.21/`; undated.)*
- **0.0.22** — Primary operational data clarification: closed the incomplete-export
  gap (OWN-9, OWN-10). *(commit `e9e6d99`)*
- **0.0.23** — Service provider boundary: defined SVC-8, SVC-9; closed the
  subprocessor classification gap. *(commit `3d4b361`)*
- **0.0.24** — Protocol normativity alignment: tightened protocol incorporation
  scope; added PROT-1 through PROT-5. *(commit `0e34d08`)*
- **0.0.25** — Actor identity portability: added ACTOR-1 through ACTOR-6.
  *(commit `6681520`)*
- **0.0.26** — Governing entity authenticity: added GEA-1 through GEA-6.
  *(commit `462f7fb`)*
- **0.0.27** — Audit resolution requirements: added AUD-1 through AUD-6.
  *(commit `dc5d86c`)*
- **0.0.28** — Delegation chain lifetime integrity: added DCL-1 through DCL-6.
  *(commit `f60afa9`)*
- **0.0.29** — Revocation enforcement timing: closed the cached-authorization-window
  gap; added REV-1 through REV-6; made deferred revocation a non-conformance
  condition. *(commit `f1eb992`)*

**Result after 0.0.29:** all governance layers complete — 115 rules in 19 groups, 25
non-conformance conditions — and the five gap areas from the 0.0.21 stress test
resolved. Ready for the first Committee Vote.

---

## Understanding the Version Scheme

LEBOSS uses semantic versioning `X.Y.Z` with LEBOSS-specific meaning:

| Position | Label | Meaning | Examples |
|----------|-------|---------|----------|
| **X** (leftmost) | Published | Ratified by members; immutable canonical standard | 1.0.0 |
| **Y** (middle) | Committee Vote | Accepted by committee; open for member ratification; 14-day minimum vote period | 0.1.0 |
| **Z** (rightmost) | Draft | Working draft in active development; contributions welcome | 0.0.1, 0.0.29 |

**Current state:** v0.1.0-rc / 0.0.29 — a Draft that is release-candidate-quality for
the first Committee Vote.

**What this means for implementers:**

1. **Until v1.0.0, expect change.** All `0.x.x` versions are drafts; rules,
   terminology, and protocol requirements may be revised.
2. **v0.1.0 will be the first Committee Vote.** Once voted on it becomes more stable,
   with a 14-day ratification period. The committee must be appointed before that vote
   can be called.
3. **v1.0.0 is immutable.** Once published, it cannot be modified; future changes
   require a new version.
4. **You can implement against 0.0.29 today.** Conformance is self-declared; you may
   claim LEBOSS-aligned (structural) or LEBOSS-compliant (every MUST in
   [`standards/conformance.md`](standards/conformance.md)). There is no breaking-change
   guarantee until v1.0.0.

---

## How This Differs From RELEASES.md

- [`CHANGELOG.md`](CHANGELOG.md) (this file) — the concise, scannable log of what
  changed, version by version.
- [`RELEASES.md`](RELEASES.md) — the full versioning policy, the governance workflow,
  and the per-proposal history with links.

For governance process details, see [`CONTRIBUTING.md`](CONTRIBUTING.md) and the
[`charter`](charter/mission.md).
