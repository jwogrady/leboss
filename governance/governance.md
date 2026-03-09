# LEBOSS Governance Model

**Version:** 0.0.1
**Status:** Proposal
**Date:** 2026-03-09

---

## Overview

LEBOSS is an open standard. Its evolution must be open, deliberate, and accountable. This document defines the workflow by which changes to the LEBOSS standard are proposed, reviewed, debated, and adopted.

The governance model is intentionally lightweight. Standards bodies fail not from too little process but too much. Our goal is to keep the committee small enough to be decisive and the process open enough to be trustworthy.

---

## The Standard States

Every version of the LEBOSS standard exists in one of three states.

### Proposal

A **Proposal** is a pull request against the `main` branch of this repository that introduces or modifies content in the `/standards/` directory.

Anyone may open a Proposal. A Proposal represents an idea in its earliest formal state — worthy of committee attention but not yet accepted for review.

A Proposal becomes a Draft when:
- At least one Committee Member reviews it and marks it as ready for consideration
- No existing published standard explicitly contradicts it without the Proposal addressing the contradiction

A Proposal that is rejected is closed with a written explanation from the Committee Member who closes it.

### Draft

A **Draft** is a Proposal that has been accepted for formal committee review.

The committee assigns a Draft to a milestone and opens a discussion period of no less than 14 days, during which any contributor may comment.

A Draft becomes a Published standard when:
- A simple majority of active Committee Members approve it
- No Maintainer has filed a blocking objection with written justification

A Draft may be returned to Proposal status if material objections require significant rework.

### Published

A **Published** standard is an approved version of the LEBOSS specification.

Published standards are assigned a version number following semantic versioning conventions:

- **Major version** (1.0.0, 2.0.0): Breaking changes to the architectural model or data ownership doctrine
- **Minor version** (0.1.0, 0.2.0): Additions to the standard that are backward-compatible
- **Patch version** (0.0.1, 0.0.2): Corrections, clarifications, and editorial fixes

Once Published, a standard version is immutable. Changes to a Published standard require a new version proceeding through the Proposal → Draft → Published workflow.

---

## Proposal Requirements

A valid Proposal must include:

1. **Summary** — A plain-language description of what the Proposal changes and why
2. **Motivation** — The problem the Proposal addresses, including why the current standard is insufficient
3. **Specification Changes** — The exact changes to the standard document, expressed as a diff
4. **Impact Assessment** — Which existing elements of the standard are affected
5. **Backward Compatibility** — Whether the change is breaking, and if so, why the break is justified

Proposals that do not include these elements may be closed by a Maintainer with a request to resubmit.

---

## Version Numbering

LEBOSS versions follow the pattern `X.Y.Z`, where each position has a specific meaning tied to the governance lifecycle — not to the nature of the change.

| Position | Label | Meaning | Transitions When |
|----------|-------|---------|-----------------|
| `Z` (rightmost) | **Draft** | A working draft in active development | A new draft iteration is created |
| `Y` (middle) | **Committee Review** | An accepted draft approved by the committee and open for member vote | The committee accepts a draft for formal vote |
| `X` (leftmost) | **Published** | The active canonical standard, approved by committee and ratified by members | Members ratify and the standard is published |

**Example progression:**

```
0.0.1  →  First working draft
0.0.2  →  Revised draft following community feedback
0.1.0  →  Committee accepts; open for member vote
1.0.0  →  Members ratify; canonical standard published
```

The current standard is version `0.0.1` — a working draft open for community contribution and pull requests. No version has yet reached committee review.

---

## Amendment Process

Any element of a Published standard — including this governance document — may be amended through the standard Proposal process.

Amendments to the governance model require approval from all active Maintainers, not merely a committee majority.

---

## Conflict Resolution

When Committee Members disagree on a Proposal, the following process applies:

1. A discussion period of no less than 7 days is held in the pull request
2. If no consensus emerges, a vote is called among active Committee Members
3. Simple majority governs, with Maintainers holding tie-breaking authority
4. The rationale for the decision is recorded in the pull request and archived

---

## Transparency

All governance decisions — approvals, rejections, and discussions — are conducted publicly in this repository. No decisions are made in private channels. The record of how this standard evolved must be as open as the standard itself.

---

*Governance model for the LEBOSS Standard — Open for community review and amendment through the standard Proposal process.*
