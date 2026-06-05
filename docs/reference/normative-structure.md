# LEBOSS Normative Structure — Quick Reference

A lookup index for the normative structure of the LEBOSS standard
(**v0.1.0-rc**, updated through proposal/0.0.29). It defines and explains
nothing — it points to the files that do. Where this document and the
authoritative spec appear to conflict, the spec governs.

- Authoritative standard:
  [`standards/leboss-standard.md`](../../standards/leboss-standard.md)
- Full rule register (115 rules):
  [`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md)
- Conformance definition:
  [`standards/conformance.md`](../../standards/conformance.md)

---

## 1. Rule group codes

The register organizes **115 normative rules** across **19 groups**. Rules are
identified as `LEBOSS-{GROUP}-{n}`. The MUST / MUST NOT / MAY split is 72 / 46 /
5 *(per [`STATUS.md`](../../STATUS.md))*; the headline figures are 115 rules / 19
groups / 25 non-conformance conditions.

| Code | Group name | Rules | What it governs |
|---|---|---:|---|
| OWN | Ownership | 10 | Who owns primary operational data; derived-data limits |
| ACC | Access | 5 | Access-grant requirements; explicit authorization before access |
| ARCH | Architectural | 11 | Reference Model topology; data-boundary enforcement |
| SEC | Security | 5 | Data separation; least privilege; auditability |
| CONT | Continuity | 4 | Long-term resilience; ownership transition; succession |
| SVC | Service Provider | 9 | Stewardship obligations; subprocessor disclosure; no secondary use |
| SPEC | Specification Boundary | 4 | What LEBOSS does and does not define; no selective override |
| ENF | Enforcement Responsibility | 4 | Operational enforcement; policy alone is insufficient |
| REC | Audit as System of Record | 4 | Audit records as authoritative; no irreconcilable state |
| PORT | Data Portability | 6 | Export completeness; format independence; manifest |
| MAP | Cross-System Resource Identity & Mapping | 6 | Stable portable identity; cross-system resolvability |
| DEL | Delegation & Authority Chain | 6 | Scope limits; chain traceability; cascade revocation |
| VER | Conformance Verification | 6 | Verifiability; observable evidence; no partial-claim misrepresentation |
| PROT | Protocol Normativity | 5 | Incorporated protocol documents carry normative force |
| ACTOR | Actor Identity Portability | 6 | Actor references interpretable outside the originating system |
| GEA | Governing Entity Authenticity | 6 | Governing entity independent of and not controlled by a platform |
| AUD | Audit Resolution | 6 | Informational-detail floor for audit-record content |
| DCL | Delegation Chain Lifetime | 6 | Delegation evidence persists as long as the chain is active |
| REV | Revocation Enforcement Timing | 6 | Revocation effective at the point of enforcement; no cache tolerance |
| **Total** | **19 groups** | **115** | |

Authoritative source:
[`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md).
The full register is the implementer checklist.

> `ACP`, `AGP`, `DPP`, and `IDP` are **protocol-document** rule codes, not
> register group codes. They appear in non-conformance condition #20.
> *(See [`standards/conformance.md` §4 item 20](../../standards/conformance.md).)*

---

## 2. The six LEBOSS Elements

Authoritative source:
[`standards/leboss-standard.md` §5.2](../../standards/leboss-standard.md) and
[`glossary/terms.md`](../../glossary/terms.md). Implementations may use any
internal naming; the spatial names are a communication vocabulary, not a
conformance requirement.
*(See [`standards/leboss-standard.md` §5.1](../../standards/leboss-standard.md).)*

| # | Name | One-line role | Data boundary | Key rules |
|---|---|---|---|---|
| 0 | Universe | Root owner: the person, family, or registered legal entity that owns the enterprise and holds ultimate authority over all data-access decisions | All other elements | OWN-1, OWN-2, ARCH-2 |
| 1 | Galaxy | An individual brand, business line, or operating company owned by a Universe; has its own branding, teams, settings, and data boundary | Stars, Planets, Moons within it | ARCH-3 |
| 2 | Star | The customer-facing interface (website, app, booking portal, kiosk); cannot function without a Planet | User-facing experience | ARCH-4, ARCH-5 |
| 3 | Planet | The backend service powering a Star: business logic, persistence, operational functionality; holds primary operational data; must serve at least one Star | Business logic, data persistence | ARCH-4, ARCH-6, ARCH-7 |
| 4 | Moon | A company-owned, company-operated internal capability within a Galaxy's data boundary (natural-satellite analogy) | Company-owned resources | ARCH-8 |
| 5 | Satellite | A connection to a third-party platform operated outside the business's control; greatest sovereignty risk; must be explicitly authorized and audited | Third-party connection boundary | ACC-5, ARCH-9, ARCH-10, ARCH-11 |

Hierarchy: `Universe → Galaxy → Star ↔ Planet → (Moon | Satellite)`. The Star
and Planet are bidirectionally dependent: each is required for the other to have
purpose.
*(See [`standards/leboss-standard.md` §5.3–§5.4](../../standards/leboss-standard.md).)*

---

## 3. Conformance tiers

Two — and only two — defined conformance terms.
*(See [`standards/conformance.md` §1.0](../../standards/conformance.md) and
[`glossary/terms.md`](../../glossary/terms.md).)*

- **LEBOSS-aligned** — structural conformance. The system preserves the LEBOSS
  ownership hierarchy, data boundaries, dependency rules, and access-control
  relationships of the Reference Model, regardless of internal naming. Does not
  require satisfaction of all MUST-level protocol requirements.
- **LEBOSS-compliant** — normative conformance. The system satisfies all
  MUST-level requirements in `standards/conformance.md` §3 and exhibits none of
  the §4 conditions. Every LEBOSS-compliant system is also LEBOSS-aligned.

**"LEBOSS-conformant"** is not a defined LEBOSS conformance term and must not be
used as a conformance claim.
*(See [`standards/conformance.md` §1.0](../../standards/conformance.md) and
[`glossary/terms.md`](../../glossary/terms.md).)*

---

## 4. Governance objects

Three governance objects underpin LEBOSS-compliant systems.
*(See [`standards/leboss-standard.md` §11](../../standards/leboss-standard.md).)*

| Object | Purpose | Authoritative source |
|---|---|---|
| Access Grant | Records explicit, scoped authorization for a party to access primary operational data | [`standards/objects/access-grant.md`](../../standards/objects/access-grant.md) |
| Integration Descriptor | Records authorization of an external integration (Satellite) to receive data; five-state lifecycle | [`standards/objects/integration-descriptor.md`](../../standards/objects/integration-descriptor.md) |
| Audit Record | Records governed events for auditability; immutable; 36-month minimum retention | [`standards/objects/audit-record.md`](../../standards/objects/audit-record.md) |

---

## 5. Non-conformance conditions (index)

25 conditions. A system exhibiting any of these must not claim LEBOSS-compliant.
Full text:
[`standards/conformance.md` §4](../../standards/conformance.md).

| # | Name | Governing rules |
|---|---|---|
| 1 | Unauthorized access | ACC-1, ACC-4 |
| 2 | Audit bypass | SEC-3, SVC-3 |
| 3 | Incomplete exports | PORT-1, PORT-2 |
| 4 | Export restriction | OWN-3, SVC-1 |
| 5 | Data retention after exit | SVC-1, OWN-8 |
| 6 | Secondary use without consent | SVC-6, OWN-7 |
| 7 | Rule redefinition | SPEC-3 |
| 8 | Unenforced requirements | ENF-1, ENF-2 |
| 9 | Irreconcilable state | REC-2 |
| 10 | Non-reconstructable export | PORT-4 |
| 11 | Proprietary format dependency | PORT-5 |
| 12 | Identity-breaking import | MAP-4 |
| 13 | Proprietary identity dependency | MAP-6 |
| 14 | Unbounded delegation | DEL-1 |
| 15 | Untraceable authority chain | DEL-3, DEL-4, DEL-5 |
| 16 | False compliance claim | VER-1, VER-3 |
| 17 | Unverifiable conformance | VER-2, VER-4, VER-5, VER-6 |
| 18 | Functionally incomplete export | OWN-10, PORT-1 |
| 19 | Ungoverned infrastructure access | SVC-8, SVC-9 |
| 20 | Protocol-only compliance | PROT-1, PROT-2, PROT-3 (+ AGP, IDP, ACP, DPP) |
| 21 | Opaque actor identity | ACTOR-2, ACTOR-4 |
| 22 | Platform-dependent ownership | GEA-2, GEA-3, GEA-5 |
| 23 | Insufficient audit resolution | AUD-3, AUD-5, AUD-6 |
| 24 | Unverifiable delegation chain lifetime | DCL-2, DCL-4, DCL-6 |
| 25 | Deferred revocation enforcement | REV-1, REV-3, REV-5 |

---

## 6. Incorporated protocol documents

Four protocol documents carry normative force equal to the register.
*(See [`standards/leboss-standard.md` §20](../../standards/leboss-standard.md);
LEBOSS-PROT-1.)*

| Document | Rules | What it operationalizes |
|---|---|---|
| [`leboss-access-grant-protocol.md`](../../standards/leboss-access-grant-protocol.md) | AGP-1 – AGP-17 | Grant issuance, validation, immediate revocation, expiration |
| [`leboss-integration-protocol.md`](../../standards/leboss-integration-protocol.md) | IDP-1 – IDP-26 | Integration Descriptor five-state lifecycle; cascade suspension on revocation |
| [`leboss-audit-protocol.md`](../../standards/leboss-audit-protocol.md) | ACP-1 – ACP-24 | Event capture, 36-month retention, immutability, integrity verification |
| [`leboss-data-portability-protocol.md`](../../standards/leboss-data-portability-protocol.md) | DPP-1 – DPP-28 | Export authority, completeness, manifest, format neutrality, export audit |

---

## 7. Versioning scheme

`X.Y.Z` with LEBOSS-specific meaning.
*(See [`STATUS.md`](../../STATUS.md) and
[`governance/governance.md`](../../governance/governance.md).)*

| Position | Label | Meaning |
|---|---|---|
| Z (rightmost) | Draft | Working document open for contribution |
| Y (middle) | Committee Vote | Accepted by committee; open for member ratification |
| X (leftmost) | Published | Ratified by members; active canonical standard |

Current: **v0.1.0-rc** (proposal 0.0.29) — a structurally complete release
candidate for the first Committee Vote. The committee is not yet appointed, so a
vote cannot yet be called. Path to publication:
`0.0.29 / v0.1.0-rc` → `0.1.0` (Committee Vote) → `1.0.0` (Published canonical).

---

## 8. Authoritative file index

| Subject | File |
|---|---|
| Base standard (governing document) | [`standards/leboss-standard.md`](../../standards/leboss-standard.md) |
| Normative rule register (115 rules) | [`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md) |
| Conformance (tiers, §3, §4) | [`standards/conformance.md`](../../standards/conformance.md) |
| Terminology | [`glossary/terms.md`](../../glossary/terms.md) |
| Mission and philosophy | [`charter/mission.md`](../../charter/mission.md) |
| Governance process | [`governance/governance.md`](../../governance/governance.md) |
| Committee roles | [`governance/committee.md`](../../governance/committee.md) |
| Contribution process | [`CONTRIBUTING.md`](../../CONTRIBUTING.md) |
| Version and status | [`STATUS.md`](../../STATUS.md) |
| Implementations registry | [`IMPLEMENTATIONS.md`](../../IMPLEMENTATIONS.md) |
| Access Grant object | [`standards/objects/access-grant.md`](../../standards/objects/access-grant.md) |
| Integration Descriptor object | [`standards/objects/integration-descriptor.md`](../../standards/objects/integration-descriptor.md) |
| Audit Record object | [`standards/objects/audit-record.md`](../../standards/objects/audit-record.md) |
| Resource Model | [`standards/leboss-resource-model.md`](../../standards/leboss-resource-model.md) |
| Access Grant Protocol | [`standards/leboss-access-grant-protocol.md`](../../standards/leboss-access-grant-protocol.md) |
| Integration Descriptor Protocol | [`standards/leboss-integration-protocol.md`](../../standards/leboss-integration-protocol.md) |
| Audit Record Collection Protocol | [`standards/leboss-audit-protocol.md`](../../standards/leboss-audit-protocol.md) |
| Data Portability Protocol | [`standards/leboss-data-portability-protocol.md`](../../standards/leboss-data-portability-protocol.md) |
| Live portal | <https://leboss.status26.com/> |

---

See also: the [tutorial](../tutorials/model-your-first-business.md),
[how to check conformance](../how-to/check-conformance.md),
[how to map a Satellite](../how-to/map-a-satellite-conformantly.md), and
[why the orbital model](../explanation/why-the-orbital-model.md).
