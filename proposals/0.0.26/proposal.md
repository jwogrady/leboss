# Proposal 0.0.26 — Governing Entity Authenticity

**Status:** Draft
**Target Version:** 0.0.26
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`

---

## Summary

This proposal closes a foundational gap in the LEBOSS ownership model: the standard defines what a governing entity *is* — a person, family, or registered legal entity — but does not establish what conditions make that entity authentic, independently controlled, or genuinely authoritative. Without these conditions, a platform can fabricate a governing entity record, make ownership authority conditional on a service relationship, or structurally comply with LEBOSS while retaining ultimate control over the governing entity itself.

The fix is minimal: a new rule group, `GEA`, establishes that governing entity authority must be independent, non-platform-dependent, persistent across migrations, and not reducible to system-generated constructs. Six rules (GEA-1 through GEA-6) define what authenticity requires without defining verification mechanisms, legal frameworks, or identity systems. A new non-conformance condition (condition 22) makes platform-dependent ownership a detectable conformance failure.

---

## Motivation

The LEBOSS standard builds its entire governance model on the governing entity as the root of all authority:

- Access Grants are issued by the governing entity (LEBOSS-ACC-1, ACC-3)
- Audit records are available to the governing entity (LEBOSS-SVC-4)
- Data portability rights belong to the governing entity (LEBOSS-OWN-3)
- The delegation chain traces to the governing entity grant (LEBOSS-DEL-3)
- Conformance verification is conducted on behalf of the governing entity (LEBOSS-VER-4)

Every one of these requirements collapses if the governing entity itself can be fabricated, reassigned, or controlled by a service provider.

**The exploitable conditions:**

1. A platform creates a "governing entity" record for a business owner as part of onboarding. The business owner believes they own their environment. The platform controls the account that represents the governing entity — if the relationship terminates, the governing entity record may be deactivated or reassigned.

2. A system stores the governing entity as a row in a database identified by a platform-assigned UUID. That identifier has no existence outside the platform. When the business migrates, the governing entity identity cannot be carried forward — it must be re-created from scratch, severing the chain of ownership.

3. A service provider, acting as system administrator, modifies the governing entity record — changing scope, reassigning it to a subsidiary entity, or suspending it — without the business owner's authorization.

None of these scenarios is detectable as a conformance failure under the current standard. The standard requires that a governing entity exist; it does not require that the governing entity be real, independent, or under the control of the party it purports to represent.

---

## Specification Changes

### 1. `standards/leboss-normative-rules.md` — Add GEA group and update counts

**New rule group: GEA — Governing Entity Authenticity Rules** (6 rules)

- **LEBOSS-GEA-1** (MUST): A governing entity must represent independent authority that exists outside the implementing system. A governing entity that can only be created, defined, or validated by the implementing system or by a service provider does not constitute a valid governing entity under this standard.
- **LEBOSS-GEA-2** (MUST NOT): A conformant system must not permit a service provider to unilaterally create, modify, reassign, or revoke governing entity authority without the authorization of the party the governing entity represents.
- **LEBOSS-GEA-3** (MUST NOT): A governing entity's authority must not be dependent on identifiers, accounts, or credentials that are exclusively controlled by a service provider or platform. Ownership authority that ceases to exist upon termination of a service relationship does not satisfy this standard.
- **LEBOSS-GEA-4** (MUST): A governing entity's authority must remain valid and transferable across system migrations. A change in implementing system, service provider, or infrastructure does not extinguish governing entity authority.
- **LEBOSS-GEA-5** (MUST NOT): A conformant system must not treat system-generated identifiers alone as sufficient basis for governing entity authority. The authority of a governing entity must be grounded in the real-world entity it represents, not in a system record.
- **LEBOSS-GEA-6** (MUST): A conformant system must ensure that governing entity authority is independently verifiable — it must not rest solely on assertions made by the implementing system or its service providers.

**Summary counts updated:** 91 → 97 rules. MUST: 60 → 63. MUST NOT: 34 → 37. MAY: 5 (unchanged).

**Gaps section header updated:** proposal/0.0.25 → proposal/0.0.26.

**Header and footer updated:** proposal/0.0.25 → proposal/0.0.26.

### 2. `standards/leboss-standard.md` — Add §22 Governing Entity Authenticity

New section establishes the governing entity authenticity doctrine:

- The gap: the governing entity is defined by what it is, not by what conditions make it authentic
- The risk: platform fabrication, conditional authority, and migration-severed ownership chains
- The distinction between a governing entity and a system record representing one
- Independence requirement: authority must exist outside the implementing system
- Persistence requirement: authority must survive system changes and service relationship termination
- Cross-reference to GEA-1 through GEA-6

**ToC updated:** §22 entry added.

**Version stamps updated:** proposal/0.0.25 → proposal/0.0.26 throughout.

### 3. `standards/conformance.md` — Add condition 22

**Condition 22 — Platform-dependent ownership:** the system defines or controls governing entity authority in a manner that makes it dependent on service provider accounts, platform-controlled identifiers, or system-generated constructs that do not represent the real-world entity they purport to govern; or permits a service provider to unilaterally modify, reassign, or revoke governing entity status without the authorization of the party the governing entity represents (LEBOSS-GEA-2, LEBOSS-GEA-3, LEBOSS-GEA-5).

**Header updated:** proposal/0.0.25 → proposal/0.0.26.

---

## Impact Assessment

| Document | Change | Nature |
|----------|--------|--------|
| `standards/leboss-normative-rules.md` | Add GEA group (6 rules); update summary counts; update header/footer | Normative addition |
| `standards/leboss-standard.md` | Add §22; update ToC; update version stamps | Normative addition |
| `standards/conformance.md` | Add condition 22; update header | Normative addition |

**Rule count:** 91 → 97
**MUST count:** 60 → 63 (GEA-1, GEA-4, GEA-6 add 3 MUSTs)
**MUST NOT count:** 34 → 37 (GEA-2, GEA-3, GEA-5 add 3 MUST NOTs)
**MAY count:** 5 (unchanged)

---

## What This Proposal Does Not Define

This proposal governs the authenticity and independence of governing entity authority. It does not define:

- Identity verification methods (KYC, document verification, or similar)
- Authentication systems or mechanisms
- Legal frameworks, jurisdictions, or regulatory contexts
- Identity providers, credential systems, or directory services
- Implementation-specific ownership models or technical controls

The standard governs **what must be true about governing entity authority** — that it is independent, non-platform-dependent, persistent, and not reducible to system records. How that is achieved is implementation-defined.

---

## Relationship to Existing Rules

| Existing Rule | Relationship |
|---------------|-------------|
| LEBOSS-OWN-1 | OWN-1 states that primary operational data is owned by the governing entity. GEA rules ensure the governing entity itself is authentic — without GEA, OWN-1 can be satisfied by a fabricated entity. |
| LEBOSS-ARCH-2 | Each data environment must be associated with exactly one governing entity. GEA rules ensure that association reflects real authority, not platform assignment. |
| LEBOSS-DEL-3 | The delegation chain must trace to the root governing entity grant. GEA rules ensure the root is genuine — without GEA, a fabricated governing entity can anchor a delegation chain. |
| LEBOSS-ACTOR-1 through ACTOR-6 | ACTOR rules govern actor identity portability in governance objects. GEA rules govern the authenticity of the governing entity — both are necessary for a complete ownership model. |
| LEBOSS-MAP-1 through MAP-6 | MAP rules govern resource identity portability. GEA rules govern governing entity authority persistence — complementary, non-overlapping. |
| LEBOSS-CONT-2, CONT-3 | Continuity rules require data accessibility through ownership transitions. GEA-4 reinforces this for the governing entity itself: authority must persist across migrations. |

---

## Backward Compatibility

Systems where the governing entity is genuinely controlled by the business owner and where that authority is independent of platform accounts are unaffected. Systems where:

- The governing entity is a platform-managed record that can be modified by the service provider
- Ownership authority is conditional on maintaining a service relationship
- The governing entity identity is exclusively a platform-assigned construct

may now be required to restructure the governing entity model to ensure that authority rests with the represented entity rather than the platform.

This is intentional. The prior state allowed a platform to satisfy every LEBOSS ownership rule while retaining structural control over the governing entity that all of those rules depend on.

---

## Sequence Context

- 0.0.21 — Stress test; identified multiple foundational gaps
- 0.0.22 — Closed primary operational data boundary (OWN-9, OWN-10)
- 0.0.23 — Closed service provider boundary (SVC-8, SVC-9)
- 0.0.24 — Aligned protocol requirements with normative rule register (PROT-1 through PROT-5)
- 0.0.25 — Established actor identity portability requirements (ACTOR-1 through ACTOR-6)
- 0.0.26 — Establishes governing entity authenticity requirements (GEA-1 through GEA-6)

---

*Proposal 0.0.26 — Open for committee review.*
