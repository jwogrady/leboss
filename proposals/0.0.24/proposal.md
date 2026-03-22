# Proposal 0.0.24 — Protocol Normativity Alignment

**Status:** Draft
**Target Version:** 0.0.24
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`

---

## Summary

This proposal closes a structural gap identified in the 0.0.21 boundary stress test: behavioral requirements defined in LEBOSS protocol documents had no formal normative standing within the rule register. A system could satisfy all 80 register-level rules while violating protocol behavioral requirements (LEBOSS-AGP-*, LEBOSS-ACP-*, LEBOSS-IDP-*, LEBOSS-DPP-*) and not be detectable as non-conformant through rule register evaluation alone.

The fix is minimal: a new rule group, `PROT`, establishes that protocol documents are normative extensions of the standard, not informative supplements. Five rules (PROT-1 through PROT-5) formally incorporate the four protocol documents into the normative framework by reference, making their MUST and MUST NOT requirements binding without re-listing each rule in the register. A new non-conformance condition (condition 20) makes protocol-only compliance a detectable conformance failure.

---

## Motivation

The LEBOSS standard defines behavioral requirements across two artifact types:

1. **The normative rule register** (`leboss-normative-rules.md`) — flat, enumerable rules used as the primary conformance checklist
2. **Protocol documents** — detailed behavioral specifications defining what systems must do when executing access grant lifecycle events, audit record capture, integration state transitions, and data export operations

The protocol documents contain ~75 normative requirements (LEBOSS-AGP-1 through AGP-17, LEBOSS-IDP-1 through IDP-26, LEBOSS-ACP-1 through ACP-24, LEBOSS-DPP-1 through DPP-28). These requirements are expressed with the same MUST/MUST NOT language as register rules — but the register did not formally incorporate them. The Gaps section of the register acknowledged the protocols existed, but treated them as supplementary resolutions rather than normative extensions.

**The exploitable condition:** A conformance evaluator relying solely on the rule register could find a system compliant while that system deferred audit record creation, cached revocation status, or misrepresented partial exports as complete — all of which are protocol violations but have no direct representation in the register.

---

## Specification Changes

### 1. `standards/leboss-normative-rules.md` — Add PROT group and update Gaps

**New rule group: PROT — Protocol Normativity Rules** (5 rules)

- **LEBOSS-PROT-1** (MUST): Formally incorporates the four protocol documents into the normative framework by reference, listing each document and its rule range. A compliant system must satisfy all incorporated protocol rules.
- **LEBOSS-PROT-2** (MUST NOT): Protocol-level MUST/MUST NOT requirements must not be treated as non-binding guidance. They carry the same normative weight as register rules.
- **LEBOSS-PROT-3** (MUST NOT): Conformance evaluation must not be performed against the register alone while ignoring incorporated protocol documents.
- **LEBOSS-PROT-4** (MUST NOT): Incorporated protocol documents must not introduce enforceable requirements disconnected from the standard's governance framework.
- **LEBOSS-PROT-5** (MUST): Incorporation under PROT-1 makes a protocol rule normatively binding without requiring separate listing in the register.

**Summary counts updated:** 80 → 85 rules. MUST: 55 → 57. MUST NOT: 28 → 31. MAY: 5 (unchanged).

**Gaps section updated:** GAP-1 through GAP-4 updated to note normative standing formalized in 0.0.24 under LEBOSS-PROT-1. GAP-3 updated to reflect DPP behavioral requirements fully incorporated (canonical encoding format remains deferred).

**Header updated:** proposal/0.0.23 → proposal/0.0.24.

### 2. `standards/leboss-standard.md` — Add §20 Protocol Normativity Framework

New section establishes the two-tier normative structure:

- **Tier 1**: The rule register — flat enumerable rules
- **Tier 2**: Incorporated protocol documents — normative extensions operationalizing Tier 1 rules

Section includes the incorporation table listing all four protocol documents and their rule ranges, key behavioral requirements (citing PROT-1 through PROT-5), and cross-reference to the rule register.

**ToC updated:** Entries for §17–§20 added (§17–§19 were present but not listed in the original ToC).

**Version stamps updated:** proposal/0.0.23 → proposal/0.0.24 throughout.

### 3. `standards/conformance.md` — Add condition 20

**Condition 20 — Protocol-only compliance:** the system satisfies register-level normative rules while failing to satisfy behavioral requirements defined in incorporated LEBOSS protocol documents, or treats protocol-level MUST and MUST NOT requirements as non-binding guidance rather than normative obligations (LEBOSS-PROT-1, LEBOSS-PROT-2, LEBOSS-PROT-3).

**Header updated:** proposal/0.0.23 → proposal/0.0.24.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-normative-rules.md` | Add PROT group (5 rules); update summary counts; update Gaps section | Normative addition — formalizes protocol incorporation |
| `standards/leboss-standard.md` | Add §20; update ToC; update version stamps | Normative addition |
| `standards/conformance.md` | Add condition 20; update header | Normative addition |

**Rule count:** 80 → 85
**MUST count:** 55 → 57 (PROT-1, PROT-5 add 2 MUSTs)
**MUST NOT count:** 28 → 31 (PROT-2, PROT-3, PROT-4 add 3 MUST NOTs)
**MAY count:** 5 (unchanged)

---

## No New Behavioral Requirements

This proposal introduces no new behavioral requirements. The protocol rules it incorporates (AGP-1 through AGP-17, IDP-1 through IDP-26, ACP-1 through ACP-24, DPP-1 through DPP-28) existed prior to this proposal. PROT-1 through PROT-5 govern the normative standing of those existing rules — they do not define new obligations for governed systems, only for the standard itself and for conformance evaluation.

---

## Downstream Effect of PROT Group

The five PROT rules extend the reach of conformance evaluation to the full set of protocol behavioral requirements without requiring those requirements to be re-listed. A conformance evaluator who previously could ignore protocol documents while checking the register is now in violation of PROT-3 if they do so. Non-conformance condition 20 makes this a disqualifying condition for a LEBOSS-compliant claim.

---

## Backward Compatibility

Systems already satisfying protocol behavioral requirements are unaffected. Systems that treated protocol documents as informative rather than normative may now be required to:
- Satisfy the full set of access grant lifecycle rules (AGP-1 through AGP-17)
- Satisfy the full set of audit capture, retention, and integrity rules (ACP-1 through ACP-24)
- Satisfy the full set of integration lifecycle rules (IDP-1 through IDP-26)
- Satisfy the full set of export authority, completeness, and neutrality rules (DPP-1 through DPP-28)

This is intentional. The prior state allowed a system to claim compliance based on register evaluation while silently omitting protocol enforcement.

---

## Sequence Context

- 0.0.21 — Stress test; identified protocol normativity gap
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closed service provider boundary (SVC-8, SVC-9)
- 0.0.24 — Aligns protocol requirements with normative rule register (PROT-1 through PROT-5)

---

*Proposal 0.0.24 — Open for committee review.*
