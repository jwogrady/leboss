# Proposal 0.0.21 — Boundary Stress Test

**Status:** Analysis Only
**Target Version:** 0.0.21 (pending)
**Scope:** `standards/leboss-standard.md`, `standards/leboss-normative-rules.md`, `standards/conformance.md`
**Nature:** Adversarial review — no standard changes proposed

---

## Summary

This document attempts to break LEBOSS using edge cases, adversarial interpretations, and structurally valid but intent-violating system behaviors. It tests whether a system can appear compliant with the written rules while violating the governance guarantees the standard is designed to enforce.

The standard was evaluated across eight attack surfaces spanning all thirteen rule groups (OWN, ACC, ARCH, SEC, CONT, SVC, SPEC, ENF, REC, PORT, MAP, DEL, VER). Seven scenarios were constructed that expose genuine weaknesses. One scenario attempted to find a break and failed, confirming robustness in that area.

**Verdict:** The standard is architecturally sound but has exploitable gaps in five areas: audit record granularity, governing entity identity authentication, actor identity portability, subprocessor boundary definition, and revocation enforcement timing in distributed systems.

---

## Scenarios

---

### Scenario 1: The Precisely Incomplete Export

#### Attack Description

A system implements the Data Portability Protocol fully and honestly — except that it defines "primary operational data" narrowly. It exports: customer records, transaction history, and appointment data. It excludes: communications between the business and its customers (email threads, SMS logs stored in the platform), internal workflow configuration, and staff operational notes. The export manifest accurately reflects what was included. Record counts match. The manifest is machine-readable. The format is documented.

The system claims full PORT compliance.

#### Why It Appears Compliant

- PORT-1: All categories included in the *system's defined scope* are present ✓
- PORT-2: No categories were omitted "without authorization" — the system's definition excluded those categories from scope ✓
- PORT-5: Format is documented and non-proprietary ✓
- PORT-6: Manifest is complete for exported categories ✓

The definition of primary operational data in §6.1 is prefaced with "includes but is not limited to" — making the list explicitly non-exhaustive and leaving the boundary of the term open to implementation interpretation.

#### Where It Breaks

§6.1 defines primary operational data illustratively, not normatively. The list includes "communications between the business and its customers" but that inclusion is informative, not a MUST. PORT-1 through PORT-6 require complete export of primary operational data — but do not themselves define what primary operational data is. The definition lives upstream in §6.1, which uses non-normative language for its examples.

**Gap:** No rule states a closed, exhaustive definition of what constitutes primary operational data. LEBOSS-OWN-1 says it "MUST be owned by the governing entity" but doesn't enumerate what it is. A system can selectively narrow the definition and produce a technically compliant but substantively incomplete export.

#### Impact

The governing entity receives a partial export, believes it is complete (the manifest says so), migrates to a new system, and discovers that years of customer communications and operational configuration are gone. The data was left behind, retained by the provider, potentially qualifying as secondary use without consent — but the export compliance claim was not technically false.

#### Recommended Fix

Add a normative definition of primary operational data that enumerates categories as MUST-level inclusions (not illustrative examples), or add a rule requiring the system to prove exhaustiveness through the manifest — e.g., the governing entity must explicitly authorize any exclusion from the defined type taxonomy in the Resource Model.

---

### Scenario 2: The Audit Record That Proves Nothing

#### Attack Description

A system generates an Audit Record for every governed action. Every record is timestamped, tamper-evident, retained for 36+ months, and available to the governing entity on request. Structurally, the records satisfy every defined requirement.

However, the records capture only coarse-grained metadata: `{ event: "data_access", actor: "provider_A", resource: "customer_records", operation: "read", timestamp: "..." }`. The records do not capture which specific customer records were accessed, how many, which fields were read, or whether the access pattern is consistent with the stated grant purpose ("read access to customer records for billing reconciliation").

A provider with this grant reads the entire customer database, including non-billing fields (notes, preferences, communication history). The audit records are technically complete. Nothing is missing. The records are consistent with the grant scope ("customer_records, read"). Resource state is reconcilable with audit history (REC-2).

The governing entity cannot tell, from audit records alone, whether the provider accessed 3 billing-relevant records or 50,000 customer profiles.

#### Why It Appears Compliant

- SEC-3: "All data operations MUST be auditable" — the operation IS recorded ✓
- SVC-3: "Complete audit records of all data access and transformations" — a record exists for each access event ✓
- SVC-4: "Available to the governing entity upon request" ✓
- REC-1: Records constitute the authoritative record ✓
- REC-2: State is reconcilable with audit history ✓

No rule in the register specifies the minimum granularity of what an audit record must capture about the data accessed within a scope — only that the access event occurred, the actor, the resource, and the operation type.

#### Where It Breaks

VER-4: "A system MUST provide sufficient visibility into its governed operations to allow an independent party to verify conformance without relying solely on system-reported assertions."

Verifying whether access was within grant scope requires knowing *what* was accessed, not just *that* access occurred. The Audit Record object spec (objects/audit-record.md) defines required fields, but those fields record the grant that authorized the access — not the data pattern of the access itself. A grant for "customer_records, read" authorizes reads; it does not constrain which records or fields within that category.

**Gap:** The audit record granularity requirement is not normatively defined at the register level. VER-4 requires sufficient visibility, but "sufficient" is not defined in terms of data access granularity. A system can satisfy every audit rule while producing records that cannot support independent verification of scope compliance.

#### Impact

A provider can access far more data than their grant purpose requires, and neither the governing entity nor an independent auditor can detect the overage. The audit record proves the access was authorized (grant_id is present) but cannot prove it was within purpose scope. This is precisely the data extraction pattern LEBOSS is designed to prevent — done through a compliant audit implementation.

#### Recommended Fix

Add a rule requiring audit records for data access operations to capture scope-granular evidence — e.g., record count accessed, resource sub-category, or a reference to which portion of the grant scope was exercised. Alternatively, require that the Access Grant specify purpose-constraining conditions that must be evaluable from audit records (tying ACC-2's "stated purpose" field to an enforceable, auditable constraint).

---

### Scenario 3: The Governing Entity That Isn't

#### Attack Description

A multi-tenant SaaS platform claims LEBOSS compliance. It creates a "governing entity" record for each business that signs up — a UUID, linked to the customer's account. Each data environment has exactly one governing entity (the account UUID). Each brand entity belongs to exactly one governing entity. The hierarchy is preserved. The structural requirements are met.

However: the platform operator controls account UUIDs. The platform can:
- Reassign an account UUID to a different business if the original customer stops paying
- Merge two accounts, transferring data environments from one governing entity to another
- "Archive" a governing entity and its data on contract termination (prior to a deletion request)

In each case, the action is performed by the platform operator, not by the business owner. The governing entity identifier exists, is unique, and is the root of the ownership hierarchy — but the *operator* controls who holds that identifier, not the *business owner*.

#### Why It Appears Compliant

- ARCH-2: "Each data environment MUST be associated with exactly one governing entity" ✓
- ARCH-3: "A brand entity MUST belong to exactly one governing entity" ✓
- Conformance.md §3.1: "The governing entity MUST be a uniquely identifiable root owner" — the UUID is unique ✓
- OWN-1: "All primary operational data MUST be owned by the governing entity" — it is, formally ✓

The standard defines what the governing entity structure must look like and what rights it holds. It does not define what makes a governing entity *authentic* — what proves the identifier is actually controlled by the person or entity who owns the business, rather than by the platform on their behalf.

#### Where It Breaks

The standard treats the governing entity as a given — a person, family, or legal entity. It defines obligations that flow from governing entity status (ownership, export rights, grant authority) but does not define how governing entity identity is established, authenticated, or protected from platform-level manipulation.

**Gap:** No rule addresses governing entity identity authenticity. A platform can implement LEBOSS governance structures while retaining the actual power to reassign, merge, or terminate governing entity identities — making the governing entity a platform-controlled construct rather than an independent business owner. The standard's entire ownership model rests on the governing entity being authentic, but that foundation is unspecified.

#### Impact

The formal owner of record is a UUID the platform controls. The business owner holds legal title to the business but has no structural guarantee that the "governing entity" in the LEBOSS system cannot be taken away, transferred, or deleted by the platform operator. Data portability rights exist on paper — but the platform can revoke the governing entity record before the export is initiated.

#### Recommended Fix

Add a requirement that governing entity identity must be established and controlled by the business owner, not the platform operator. The governing entity's identity must be independently verifiable and must not depend on platform-controlled mechanisms. This may require a governance object for governing entity identity — separate from the access grant framework.

---

### Scenario 4: The Delegation Chain That Legally Expires Into Ambiguity

#### Attack Description

A governing entity issues a root Access Grant to Service Provider A (duration: indefinite, revocable). Provider A delegates to Integration B (grant references Provider A's grant — DEL-2 satisfied). Integration B delegates to Subprocessor C (references B's grant). The chain is 3 levels: GE → A → B → C. All DEL rules are satisfied — traceability to root is possible, scope doesn't expand, revocation propagation is implemented.

Four years later: Provider A's original grant audit record has been deleted under the system's documented 36-month retention policy. The grant object itself still exists in the system. The delegation chain from A → B → C is still traceable. But the Audit Record proving the governing entity *issued* the root grant — the evidence of how Provider A's authority was originally established — is gone.

An independent auditor attempting to verify the chain's legitimacy can trace: C → B → A → [grant object for GE's root grant]. The grant object says the GE issued it. But the Audit Record confirming that grant issuance event has been deleted.

#### Why It Appears Compliant

- DEL-2: Every delegated grant references its originating grant ✓
- DEL-3: The chain is traceable to the root governing entity grant (the grant *object* exists) ✓
- DEL-4: Revocation propagation is implemented ✓
- DEL-5: No ambiguity in access authority per system assertions ✓
- Audit retention: 36-month minimum was satisfied; deletion was authorized under documented retention policy ✓

The standard requires the chain to be "traceable to the root governing entity grant" — not that the audit evidence proving that root grant's legitimacy is preserved indefinitely.

#### Where It Breaks

DEL-3 requires traceability to "a valid root governing entity grant." The grant object exists — but is it *valid* without the audit record of its issuance? The standard doesn't define what makes a grant "valid" in the absence of its creation audit record. VER-4 requires visibility sufficient for independent verification — but if the root grant's audit record is gone, independent verification of the chain's legitimacy depends solely on the grant object in the system, which is a system-reported assertion (the thing VER-2 says must not constitute a sole compliance claim).

**Gap:** The interaction between DEL-3 (root grant traceability), REC-1 (audit records as authoritative record), and audit retention policy creates a window where delegation chain validity can outlive the evidence that established it. The standard specifies minimum retention for audit records but doesn't establish a preservation requirement for governance-critical events (root grant issuance) that are needed for indefinite chain verification.

#### Impact

A long-lived delegation chain loses its independently verifiable foundation after 36 months. The chain continues to authorize access. The system claims compliance. An auditor cannot independently confirm the chain's origin — they must trust the system's own data, which VER-2 prohibits treating as a valid compliance claim.

#### Recommended Fix

Add a rule that the Audit Records for root governing entity grant issuance events MUST be retained for the lifetime of any delegation chain that depends on them — not subject to the standard retention window. Alternatively, add a requirement that the governing entity must periodically reaffirm root grants (creating fresh audit evidence).

---

### Scenario 5: The Migration That Loses Its Governance History

#### Attack Description

A governing entity exports their LEBOSS environment and imports it into a new system. The export is complete — all resources, all Access Grants, all Audit Records. All resource identifiers are stable and persist through the export/import (MAP-1, MAP-2 satisfied). The receiving system can map each resource to an internal equivalent (MAP-4). Structural relationships between resources are resolvable (MAP-5).

However: the Access Grants and Audit Records reference actor identifiers — subjects of grants, actors in audit records — that are provider-internal UUIDs from the source system. These actor UUIDs are:
- `grant: { subject: "actor:a7f3c9d1" }` — a service provider's integration credential
- `audit_record: { actor: "actor:b2e8f044" }` — the identity of the staff member who performed a governed action

The export does not include an actor registry or actor identity manifest. These are not "resources" in the LEBOSS Resource Model type taxonomy (`data_collection`, `configuration`, `governance_object`, `service_endpoint`, `workflow`). They are actors — external to the governed environment.

The receiving system imports successfully. All governance objects are present. All resource relationships resolve. But the governance history references actors that cannot be resolved in the destination — no one can determine who held what access or who performed what governed actions.

#### Why It Appears Compliant

- PORT-1: All primary operational data, governance objects, and audit records included ✓
- PORT-3: Structural relationships between *resources* and governance objects preserved ✓
- MAP-2: Resource identity persists through export and import ✓
- MAP-3: Sufficient identity information for each *resource* to enable mapping ✓
- MAP-4: Receiving system can map each *resource* to an internal equivalent ✓
- MAP-5: Structural relationships between *resources* remain resolvable ✓

Every MAP and PORT rule is scoped to *resources* — not to actors, subjects, or external principals referenced in governance objects.

#### Where It Breaks

The standard defines a thorough framework for resource identity portability but leaves actor identity entirely unaddressed. Actors are the subjects of Access Grants and the identities recorded in Audit Records — the two governance objects that give LEBOSS its accountability guarantees. After migration, governance records exist but their human-interpretable meaning is lost: every "who" is an opaque UUID from the old system.

**Gap:** No rule requires exports to include an actor identity registry, or requires that actor identifiers in governance objects be resolvable after import. The Resource Model's type taxonomy does not include actors as a governed type. This creates a systematic governance portability failure that satisfies every written rule.

#### Impact

After migration, the governing entity holds a complete copy of all their data — but cannot use the governance history for compliance verification, legal discovery, or access auditing. They cannot tell which staff member accessed customer records before the migration, or whether a former provider's delegated grants were revoked. The audit trail exists but is interpretable only by the source system.

#### Recommended Fix

Extend the Resource Model type taxonomy to include an actor identity type, or add a MAP rule requiring that actor identifiers referenced in governance objects be resolvable in the export — either as actor records included in the export or as externally resolvable, non-proprietary identifiers (e.g., email addresses, standard OAuth identifiers, or other portable identity formats).

---

### Scenario 6: The Disclosed But Uncontrolled Subprocessor Chain

#### Attack Description

Service Provider A is LEBOSS-compliant. They disclose three subprocessors to the governing entity: B (analytics), C (backup), D (email delivery). All three are disclosed and contractually bound to LEBOSS requirements (SVC-5, SVC-6 satisfied).

Provider B runs on cloud infrastructure from Provider E. Provider E hosts B's servers, which store primary operational data. Provider E is not disclosed by Provider A — Provider A's position is that E is "infrastructure," not a "subprocessor," because E doesn't process the data purposefully (they just store it). Provider E is also not disclosed by Provider B, because B says E's LEBOSS compliance is B's responsibility (covered by SVC-6's chain of obligation).

Provider E has never been granted an Access Grant by the governing entity (ACC-1). Provider E's staff can access the physical servers containing primary operational data for maintenance, incident response, and support operations.

#### Why It Appears Compliant

- SVC-5: Provider A disclosed all third-party services that "have access to primary operational data" — but A claims E doesn't have purposeful access, only storage access ✓ (contested)
- SVC-6: The disclosed subprocessors are contractually bound ✓
- ACC-1: "No service provider MAY access primary operational data without an explicit, scoped access grant" — A argues E is infrastructure, not a service provider ✓ (contested)

The standard does not define "service provider" in a way that clearly draws the line between a data processor (deliberate access) and an infrastructure operator (incidental or administrative access). Neither SVC-5 nor ACC-1 defines what threshold of access triggers the disclosure and grant requirements.

#### Where It Breaks

The entire LEBOSS access control framework depends on "service provider" being a term with a clear, normative boundary. ACC-1 prohibits any service provider from accessing primary operational data without an explicit grant — but if "service provider" doesn't include infrastructure operators, then any SaaS provider can outsource physical data access to an undisclosed party without violating any rule.

**Gap:** "Service provider" is used 20+ times in normative rules but is never defined in the standard or glossary with sufficient precision to determine whether infrastructure operators, cloud providers, or maintenance personnel constitute service providers under LEBOSS. This gap allows the most common real-world vector for unauthorized data access — cloud provider staff — to fall outside the access grant framework entirely.

#### Impact

A governing entity believes their data is controlled by one disclosed provider with three disclosed subprocessors. In reality, employees of an undisclosed cloud infrastructure company have administrative access to their data. This is precisely the scenario §2 ("The Problem We Are Naming") describes — but it exists in a technically compliant system.

#### Recommended Fix

Add a definition of "service provider" to the glossary that encompasses any party with technical access to primary operational data, regardless of whether that access is purposeful or incidental. Add a rule clarifying that infrastructure operators who store or process primary operational data are subject to the same disclosure and grant requirements as application-level service providers.

---

### Scenario 7: The Revocation That Takes Effect Eventually

#### Attack Description

A governing entity revokes a service provider's Access Grant. The system immediately:
- Marks the grant as `revoked` in the grant store
- Creates an Audit Record of the revocation event
- Triggers revocation propagation to all dependent delegated grants (DEL-4)

However, the system's access validation layer uses a distributed cache with a 10-minute TTL. For the next 10 minutes, every service instance that has a cached copy of the grant validation result continues to allow access. The cache is not purged on revocation — it expires naturally.

The system's design rationale: cache invalidation is an "implementation detail" not prescribed by LEBOSS. The grant *is* revoked. The revocation event *is* recorded. The system *did* propagate revocation to dependent grants. What happens in the validation layer's cache is "enforcement architecture" outside the standard's scope (LEBOSS-ENF-4).

#### Why It Appears Compliant

- ACC-3: "Access Grants are revocable at any time by the governing entity" — the grant is revoked ✓
- ENF-4: "The LEBOSS standard MUST NOT prescribe a specific enforcement architecture, mechanism, or technology" — the cache implementation is not prescribed ✓
- DEL-4: Revocation propagated to dependent grants ✓
- Audit records created ✓

ACC-3 says grants "are revocable" — it specifies the governing entity's right to revoke, not the timing of revocation's effect on running operations. ENF-4 explicitly prohibits the standard from prescribing enforcement mechanisms. The Access Grant Protocol (§12) states revocation "MUST take effect immediately" — but this requirement is in the protocol specification (leboss-access-grant-protocol.md, LEBOSS-AGP rules), not in the normative rules register.

#### Where It Breaks

There is a gap between where the "immediate revocation" requirement lives and where conformance is evaluated. The normative rules register contains ACC-3 (grants are revocable) and ENF-2 (governed actions must be subject to rule enforcement at time of occurrence) — but does not contain the immediacy requirement from the Access Grant Protocol.

ENF-2 requires enforcement "at the time they occur." For the 10 minutes after revocation, governed actions occur — data is accessed — and the grant is revoked. Whether ENF-2 is violated depends on whether "enforcement at time of occurrence" means "the rule was enforced as of the time of evaluation" (the cached result was valid when cached) or "the rule must reflect current grant state at the time of each access."

**Gap:** The standard creates a principal-protocol architecture where behavioral requirements (like revocation immediacy) live in protocol documents, but conformance is evaluated against the normative rules register. Protocol rules (AGP-1 through AGP-17) are not in the register. A system that fails protocol requirements may not fail any register-level rule. The relationship between register-level conformance and protocol-level behavioral requirements is not resolved.

#### Impact

A revoked provider continues to access primary operational data for 10 minutes after revocation. This window is sufficient for data extraction. The governing entity revoked the grant, observed a revocation Audit Record, and believes access stopped — it did not.

#### Recommended Fix

Either: (1) add a normative rule (register-level) requiring that revocation takes effect at the moment of the next access attempt, and that no caching mechanism may defer this; or (2) explicitly declare that protocol-level rules carry the same normative weight as register-level rules for conformance purposes, and update conformance.md to reference the protocol rule sets.

---

### Attempted Break (Failed)

**Target:** REC-2 (irreconcilable state). Attempted to construct a scenario where a system could represent resource state inconsistent with audit history while satisfying the letter of REC-2.

**Why it failed:** REC-2 is a direct bidirectional constraint — resource state MUST be reconcilable with Audit Record history. There is no escape hatch: any resource state change that doesn't have a corresponding audit record violates REC-2, and any audit record that describes a state change that isn't reflected in resource state also violates REC-2. The rule is tight enough that satisfying it in letter while violating it in spirit is not possible without also violating REC-1 (authoritative record) or REC-3 (foundational integrity). **This rule group is robust.**

---

## Findings

The following weaknesses were confirmed through adversarial scenario construction:

1. **Primary operational data boundary is not normatively closed.** §6.1 defines it with "includes but is not limited to" — making PORT-1 through PORT-6 dependent on a definition that systems can narrow without technically violating any rule.

2. **Audit record granularity is undefined.** No rule specifies what level of detail an access event audit record must capture. Records can satisfy all structural requirements while being too coarse to support meaningful scope compliance verification (VER-4 violated in spirit).

3. **Governing entity identity authentication is unspecified.** The standard assumes the governing entity is a real business owner but does not define what makes a governing entity identity authentic or platform-independent. A platform-controlled governing entity construct can satisfy all structural rules while holding no real governance power.

4. **Actor identity is not a governed portability concern.** The MAP and PORT rules govern resource identity portability thoroughly but say nothing about actors referenced in governance objects. Post-migration audit records are present but unresolvable — the governance history is present but interpretable only by the source system.

5. **"Service provider" is undefined.** The most-used normative term in the standard has no definition precise enough to determine whether infrastructure operators (cloud storage providers, CDN operators, maintenance contractors) are subject to the access grant and disclosure requirements.

6. **Revocation immediacy is a protocol requirement, not a register rule.** The normative rules register does not contain the requirement that revocation takes immediate effect. This requirement lives in the Access Grant Protocol — which is referenced by the standard but whose rules (LEBOSS-AGP-*) are not in the normative register and are not directly referenced in conformance.md.

7. **Delegation chain audit evidence has no lifetime requirement.** DEL-3 requires traceability to a valid root grant, but audit records evidencing that root grant's issuance can be deleted under the standard 36-month retention policy, severing independent verifiability of chain origin.

---

## Recommendations

Minimal set of changes to address confirmed weaknesses (scope and implementation remain for future proposals):

| # | Finding | Minimal Fix |
|---|---------|-------------|
| 1 | Primary operational data boundary open | Enumerate data categories normatively (MUST include) in §6.1 or Resource Model; or require governing entity to explicitly authorize any exclusion from the defined type taxonomy |
| 2 | Audit record granularity undefined | Add a rule specifying minimum granularity for data access audit records sufficient to support scope verification (e.g., record count, resource sub-identifier, or operated fields) |
| 3 | Governing entity identity unspecified | Add a conformance requirement that governing entity identity must be independently verifiable and not platform-controlled; add glossary definition with normative identity requirements |
| 4 | Actor identity not portable | Extend MAP rules to require actor identifiers in governance objects to be resolvable after import, or add actor identity as a governed portability type in the Resource Model taxonomy |
| 5 | "Service provider" undefined | Add a normative glossary definition for "service provider" that includes any party with technical access to primary operational data, regardless of access intent |
| 6 | Revocation immediacy not in register | Add a normative rule (ACC or ENF group) requiring that revocation takes effect at the next access evaluation with no caching deferral permitted; or declare protocol rules register-level for conformance |
| 7 | Delegation audit record lifetime | Add a rule requiring that audit records for root governing entity grant issuance events are preserved for the lifetime of any delegation chain that depends on them |

---

## Validation

- [x] No changes made to the standard
- [x] No changes made to the normative rule register
- [x] No changes made to conformance.md or glossary/terms.md
- [x] All scenarios grounded in real rule interactions with specific rule citations
- [x] No implementation assumptions introduced — all findings describe structural gaps in the specification, not implementation failures
- [x] One scenario failed to find a break (REC group) — confirming the test was not designed to always find weaknesses
- [x] Recommendations are minimal — each identifies the type of fix needed, not the specific rule text

---

*Proposal 0.0.21 — Boundary stress test analysis. Analysis only — open for committee review.*
