# Proposal 0.0.29 — Revocation Enforcement Timing

**Status:** Draft
**Target Version:** 0.0.29
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`

---

## Summary

This proposal closes an access-control enforcement gap identified in the 0.0.21 boundary stress test (Scenario 7: "The Cached Authorization Window"): a system can record a revocation, satisfy all audit requirements, and satisfy all DEL propagation requirements — while continuing to authorize governed actions using stale or cached grant state.

The prior standard requires that grants be revocable (ACC-3), that access not exceed grant scope (ACC-4), and that enforcement occur at the time governed actions take place (ENF-2). None of these rules specify what authorization state must be consulted at evaluation time. A system that evaluates access against a local cache, a propagation queue, or a previously computed authorization decision satisfies all existing rules while honoring neither the revocation nor the governing entity's intent.

The fix is a new rule group, `REV`, with six rules (REV-1 through REV-6) that close the gap between revocation as a recorded event and revocation as an enforced state. The core principle: revocation is not complete until it is reflected in enforcement. A new non-conformance condition (condition 25) makes deferred revocation enforcement a disqualifying conformance failure.

---

## Motivation

The LEBOSS access control model treats revocation as a first-class governing entity action. ACC-3 makes grants revocable at any time. DEL-4 requires revocation to propagate to all dependent delegated grants. ENF-1 and ENF-2 require normative requirements to be enforced in operation at the time governed actions occur.

None of these requirements address the authorization evaluation path — specifically, what state is consulted when a system decides whether to permit or deny a governed action. In most system architectures, that evaluation does not query authoritative grant state directly. It queries a cache, a local token validation result, a session state, or a previously issued authorization token. These intermediary representations may not reflect a revocation that occurred moments ago.

**The exploitable condition:** Consider the sequence:

1. Governing entity revokes Grant A — the revocation is recorded and audited.
2. DEL-4 propagation is triggered — dependent grants are marked revoked.
3. Integration C evaluates whether it may perform a data operation.
4. The system checks a cached authorization state that predates the revocation.
5. The cache is still valid (by system definition). Access is permitted.
6. All audit requirements are satisfied: the access is logged. The revocation was logged. Everything is recorded.

Under the prior standard, this is a conformance-satisfying sequence. The revocation happened. It was recorded. Enforcement happened. It just used the wrong state.

This is not an edge case. Caching authorization state is standard practice across API security, session management, and distributed system design. Without an explicit requirement that enforcement must use current authoritative grant state, any system with an authorization cache is structurally capable of this failure.

---

## Specification Changes

### 1. `standards/leboss-normative-rules.md` — Add REV group and update header, counts, and Gaps

**New rule group: REV — Revocation Enforcement Timing Rules** (6 rules)

- **LEBOSS-REV-1** (MUST NOT): A revoked grant MUST NOT authorize any governed action after the point of revocation. Revocation is effective at the moment it occurs — no governed action may be authorized under a revoked grant for any reason.
- **LEBOSS-REV-2** (MUST): A conformant system MUST evaluate grant state using authoritative, current grant state at the time of access evaluation. Enforcement based on authorization state that does not reflect the current state of the grant does not satisfy this standard.
- **LEBOSS-REV-3** (MUST NOT): A conformant system MUST NOT authorize a governed action based on stale, cached, or previously recorded authorization state when the current authoritative state of the grant is revoked.
- **LEBOSS-REV-4** (MUST): Revocation MUST be effective at the moment of enforcement. A governing entity who revokes a grant must be able to rely on that revocation preventing access at the time of the next governed action evaluation.
- **LEBOSS-REV-5** (MUST NOT): A conformant system MUST NOT permit any design, configuration, or operational mode in which a revoked grant continues to authorize governed actions, regardless of whether the cause is caching, propagation delay, or asynchronous state management.
- **LEBOSS-REV-6** (MUST): The authoritative revocation state of a grant MUST be the sole determinant of whether that grant may authorize access. Any authorization path that bypasses, ignores, or defers consultation of authoritative grant state does not satisfy this standard.

**Summary counts updated:** 109 → 115 rules. MUST: 69 → 72. MUST NOT: 43 → 46. MAY: 5 (unchanged).

**Gaps section updated:** through proposal 0.0.29.

**Header updated:** proposal/0.0.28 → proposal/0.0.29.

### 2. `standards/leboss-standard.md` — Add §25 Revocation Enforcement Timing

New section establishes the revocation enforcement doctrine:

- The distinction between revocation as a recorded event and revocation as an enforced state
- The specific failure mode: cached or stale authorization state used at evaluation time
- What this section does NOT define (no caching strategies, no system designs, no time durations)
- Key behavioral requirements citing REV-1 through REV-6

**ToC updated:** `25. [Revocation Enforcement Timing](#25-revocation-enforcement-timing)` added.

**Version stamps updated:** proposal/0.0.28 → proposal/0.0.29 throughout.

### 3. `standards/conformance.md` — Add condition 25

**Condition 25 — Deferred revocation enforcement:** the system allows governed actions to proceed under a revoked grant due to cached, stale, or asynchronous grant state, or permits any design or operational mode in which revocation does not take effect at the time of access evaluation (LEBOSS-REV-1, LEBOSS-REV-3, LEBOSS-REV-5).

**Header updated:** proposal/0.0.28 → proposal/0.0.29.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-normative-rules.md` | Add REV group (6 rules); update summary counts; update Gaps section | Normative addition — closes deferred revocation loophole |
| `standards/leboss-standard.md` | Add §25; update ToC; update version stamps | Normative addition |
| `standards/conformance.md` | Add condition 25; update header | Normative addition |

**Rule count:** 109 → 115
**MUST count:** 69 → 72 (REV-2, REV-4, REV-6 add 3 MUSTs)
**MUST NOT count:** 43 → 46 (REV-1, REV-3, REV-5 add 3 MUST NOTs)
**MAY count:** 5 (unchanged)

---

## Relationship to Existing Rules

**REV and ACC-3:** ACC-3 states that access grants are revocable at any time by the governing entity. ACC-3 establishes the right; REV establishes what that right requires of enforcement. Revocability without timely enforcement is a right that exists on paper and not in practice.

**REV and ACC-4:** ACC-4 requires service providers to operate only within the scope of explicitly granted access. A service provider operating under a cached authorization for a revoked grant is exceeding their actual scope, even if they are within the cached scope. REV makes this violation explicit and closes the evaluation-path gap that ACC-4 leaves open.

**REV and ENF-2:** ENF-2 requires that governed actions be subject to rule enforcement at the time they occur. REV-2 and REV-6 extend this: enforcement at the time of occurrence must use authoritative current state, not previously computed state. ENF-2 requires that enforcement happen; REV requires that it happen against the right input.

**REV and DEL-4:** DEL-4 requires revocation to propagate to all dependent delegated grants. Propagation is a record-level operation. REV-4 and REV-5 require that enforcement reflect the result of that propagation at evaluation time. Propagation that has not yet been reflected in enforcement does not satisfy the standard.

**REV and IDP-9 (protocol):** The Integration Descriptor Protocol (IDP-9, incorporated under PROT-1) requires that an integration be immediately suspended upon revocation of its linked Access Grant. REV-1 and REV-4 extend this at the standard level: immediate effectiveness is not just a protocol-level behavioral requirement — it is a normative register-level obligation.

---

## What This Proposal Does Not Define

This proposal does not define:

- Caching strategies or permitted cache lifetimes
- Distributed system designs or synchronization mechanisms
- Infrastructure or architectural patterns for achieving timely revocation
- Time durations of any kind
- How a system detects or responds to authorization state staleness

The standard governs what must be true at the moment of access evaluation: that the grant state consulted is authoritative and current. How a system achieves this is an implementation concern.

---

## Backward Compatibility

Systems that evaluate access against authoritative grant state at evaluation time are unaffected. Systems that use cached, pre-computed, or asynchronously propagated authorization state may now be required to ensure that the state consulted at evaluation time reflects current authoritative revocation status.

This is intentional. The prior state allowed a system to satisfy revocability (ACC-3) and propagation (DEL-4) requirements while structural caching decisions meant revocation was never fully enforced.

---

## Sequence Context

- 0.0.21 — Stress test; Scenario 7 identified the cached authorization enforcement gap
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closed service provider boundary (SVC-8, SVC-9)
- 0.0.24 — Aligned protocol requirements with normative rule register (PROT-1 through PROT-5)
- 0.0.25 — Established actor identity portability requirements (ACTOR-1 through ACTOR-6)
- 0.0.26 — Established governing entity authenticity requirements (GEA-1 through GEA-6)
- 0.0.27 — Defined audit resolution floor (AUD-1 through AUD-6)
- 0.0.28 — Bound delegation authority to verifiable evidence lifetime (DCL-1 through DCL-6)
- 0.0.29 — Closes deferred revocation enforcement gap (REV-1 through REV-6)

---

*Proposal 0.0.29 — Open for committee review.*
