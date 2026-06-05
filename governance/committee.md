# LEBOSS Committee Structure

**Status:** v0.1.0-rc
**Updated Through:** proposal/0.0.29

---

## Purpose

The LEBOSS Committee exists to steward the standard — not to own it. Its members are accountable to the community of business owners, developers, and service providers who adopt and contribute to LEBOSS.

The committee must remain small enough to move decisively and open enough to represent the interests of those it serves. It must never become a barrier to contribution or a mechanism for private control.

As of proposal/0.0.29, the standard is structurally complete. The committee's primary work is now the maintenance and evolution of a comprehensive governance specification — reviewing proposals, ensuring coherence across 115 normative rules and 19 rule groups, and stewarding the path toward the first Committee Vote candidate (v0.1.0).

---

## Roles

### Maintainers

Maintainers hold administrative authority over the repository and final responsibility for the standard's integrity.

**Responsibilities:**
- Merge approved pull requests
- Close Proposals that do not meet submission requirements
- Hold tie-breaking authority in Committee votes
- Ensure that the governance process is followed
- Facilitate the transition from Proposal to Draft to Published

**Obligations:**
- Maintainers must disclose any commercial interests that could create a conflict of interest in standard decisions
- Maintainers may not block a Proposal solely on the basis of commercial interest without written justification reviewed by other Maintainers
- Maintainers serve renewable terms of one year

**How Maintainers Are Appointed:**
- Initial Maintainers are the founders of this repository
- Subsequent Maintainers are nominated by existing Maintainers and approved by a supermajority (two-thirds) of the current Committee

---

### Committee Members

Committee Members are the technical and philosophical heart of the standard. They review Proposals, participate in discussions, vote on Drafts, and shape the direction of LEBOSS.

**Responsibilities:**
- Review Proposals within 14 days of submission
- Participate in Draft discussions
- Vote on Proposals eligible for Publication
- Contribute expertise on specific technical or organizational domains

**Obligations:**
- Committee Members must disclose conflicts of interest
- A Committee Member who does not participate in three consecutive votes without written notice is considered inactive and may be removed by Maintainer decision
- Committee Members serve renewable terms of one year

**How Committee Members Are Appointed:**
- Any Contributor with a record of substantive engagement with the standard may be nominated for committee membership
- Nominations may be made by any existing Committee Member or Maintainer
- Appointment requires simple majority approval from the existing Committee

---

### Contributors

Contributors are everyone who engages with the standard in good faith — by filing pull requests, opening issues, participating in discussions, or adopting and critiquing the standard in practice.

Contributors do not have voting authority, but their input shapes the standard. Every substantive comment in a proposal discussion is part of the record.

**How to Become a Contributor:**
- Open a pull request, issue, or discussion on this repository
- No application required. No approval required. Participation is contribution.

---

## Conflict of Interest Policy

Anyone serving in a committee role must disclose:

- Employment by, or ownership interest in, a company that provides services to local businesses under SaaS or cloud infrastructure models
- Any financial relationship with a company whose products or practices are directly addressed by the standard

Disclosure does not disqualify. Undisclosed conflict of interest may result in removal from the committee.

---

## Community Participation

The committee actively seeks engagement from:

- **Local business owners** — The primary beneficiaries of this standard. Their experience of vendor relationships and data access problems is the most important input the committee can receive.
- **Independent developers** — Builders who construct systems for local businesses and who experience the practical constraints of the current industry model.
- **Service providers** — Companies who provide software and managed services to local businesses and who wish to demonstrate alignment with LEBOSS principles.

The committee will hold public discussion periods for all Drafts and will seek to recruit committee members who represent these communities.

---

## Current Committee

The initial committee is constituted by the founding Maintainer (the bootstrap
permitted under *How Maintainers Are Appointed*). Until human Committee Members are
nominated, the review seats are filled by **designated AI reviewer personas** —
structured review lenses, each accountable to the Maintainer, that examine every
Proposal and Draft from a distinct perspective and record their assessment in the
pull request.

| Role | Name | Affiliation |
|------|------|-------------|
| Maintainer (Chair) | jwogrady | Status26 |

**Maintainer conflict-of-interest disclosure:** the Maintainer is affiliated with
Status26, which provides software and services to local businesses — a relationship
directly addressed by this standard (see *Conflict of Interest Policy* above).
Disclosure does not disqualify; it is recorded here so committee decisions can be
read with it in view.

### Review seats (AI reviewer personas)

| Seat | Review lens | Primary rule groups |
|------|-------------|---------------------|
| Owner Advocate | Protects the business owner's (Universe's) sovereignty and the right to leave | OWN, PORT |
| Implementer Advocate | Tests whether requirements are buildable and verifiable in real systems | SVC, VER, ARCH |
| Security & Audit Reviewer | Examines authorization, enforcement, and the audit system of record | SEC, ENF, REC, AUD |
| Continuity & Portability Reviewer | Examines export completeness, identity portability, and revocation timing | CONT, ACTOR, REV, DCL |
| Conformance Editor | Guards register/standard coherence, rule numbering, and conformance traceability | SPEC, MAP, PROT, DEL, GEA |
| Adversarial Reviewer | Stress-tests for gaps and contradictions (continuing the 0.0.21 stress-test practice) | all |

### How the persona committee works

- For each Proposal or Draft, each review seat produces a written assessment in the
  pull request: **approve**, **request changes**, or **reject**, with rationale tied
  to its lens and the affected rule groups.
- These assessments are advisory but part of the public record (see *Transparency*).
  The human Maintainer is accountable for every decision and holds final merge and
  tie-breaking authority, exactly as defined in *Roles → Maintainers*.
- The voting thresholds and minimum periods in
  [governance/governance.md](governance.md) continue to apply. Persona review
  operationalizes committee review; it does not replace the member-ratification step,
  which remains a human process as members are seated.
- This persona arrangement is an **interim bootstrap**. Human Committee Members are
  actively sought (see *Community Participation* and [CONTRIBUTING.md](../CONTRIBUTING.md));
  as they are seated, they take up the review seats above. Any change to this
  arrangement follows the amendment process in
  [governance/governance.md](governance.md).

---

*Committee structure for the LEBOSS Standard — Open for amendment through the standard Proposal process.*
