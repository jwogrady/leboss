# How to Check Your System Against the LEBOSS Rules

This guide gives you a repeatable procedure for evaluating whether a system
qualifies for a LEBOSS conformance claim. It tells you which sections to check
and in what order. It does not explain *why* each rule exists — for that, see
[Why the orbital model](../explanation/why-the-orbital-model.md) and
[`docs/PHILOSOPHY.md`](../PHILOSOPHY.md). It does not restate the requirements
themselves — the authoritative text is in
[`standards/conformance.md`](../../standards/conformance.md) and
[`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md).

**Prerequisites:** familiarity with the six elements (see the
[tutorial](../tutorials/model-your-first-business.md) if you need it) and access
to the conformance document and the rule register.

> Conformance under v0.1.0-rc is **self-declared**. No formal third-party
> certification program exists in this version.
> *(See [`standards/conformance.md` §6](../../standards/conformance.md).)*

---

## Step 1 — Pick the tier you are evaluating for

Decide this before you start. LEBOSS defines exactly two conformance tiers.
*(See [`standards/conformance.md` §1.0](../../standards/conformance.md) and
[`glossary/terms.md`](../../glossary/terms.md).)*

- **LEBOSS-aligned** — the *structural* claim. The system preserves the
  ownership hierarchy, data boundaries, dependency rules, and access-control
  relationships of the Reference Model. Internal naming is irrelevant.
- **LEBOSS-compliant** — the *normative* claim. The system satisfies every
  MUST-level requirement in `standards/conformance.md` §3 and exhibits none of
  the non-conformance conditions in §4. Every LEBOSS-compliant system is also
  LEBOSS-aligned.

The term **"LEBOSS-conformant" is not a defined conformance claim** and must not
be used.
*(See [`standards/conformance.md` §1.0](../../standards/conformance.md) and
[`glossary/terms.md`](../../glossary/terms.md).)*

If you only need to assert that your architecture is organized the LEBOSS way,
aim for LEBOSS-aligned and run Step 2. If you intend to claim full behavioral
conformance, you must clear Step 2, Step 3, *and* Step 4.

---

## Step 2 — LEBOSS-aligned: the structural checks

Open [`standards/leboss-standard.md` §8.1–§8.4](../../standards/leboss-standard.md)
and confirm each of the following holds.

1. **Structural alignment (§8.1)** — the architecture reflects the ownership
   hierarchy and data boundaries of §5. Each governed environment maps to
   exactly one governing entity.
2. **Brand-boundary enforcement (§8.1)** — data belonging to one brand entity
   cannot reach another without an explicit cross-entity access grant.
3. **Data-ownership alignment (§8.2)** — primary operational data is owned by
   the governing entity, not by a service provider.
4. **Service-provider alignment (§8.3)** — service providers operate under
   explicit, scoped access grants.
5. **Security alignment (§8.4)** — external integration boundaries are
   explicitly authorized and audited.

If all five hold, you may claim **LEBOSS-aligned**. Internal naming does not
matter; the relationships do.
*(See [`standards/leboss-standard.md` §5.4](../../standards/leboss-standard.md).)*

---

## Step 3 — LEBOSS-compliant: the minimum requirements

Open [`standards/conformance.md` §3](../../standards/conformance.md) and work
through each subsection in order. Each maps to a MUST in the standard.

- **§3.1 Governing entity** — is there a uniquely identifiable root owner that
  holds ownership over the system's operational resources?
- **§3.2 Resource model** — does the system uniquely identify every governed
  resource, enumerate the complete set per governing entity, and associate each
  resource with exactly one governing entity? Are resources owned only by the
  governing entity — never by service providers, integrations, or
  infrastructure operators?
- **§3.3 Access grants** — does every integration or actor require an explicit,
  scoped access grant before operating on governed resources? Are operations
  with no active grant structurally impossible?
- **§3.4 Audit records** — is an audit record created for every operation
  affecting governed resources, including timestamp, actor identity, affected
  resource(s), and operation type? Are records protected from modification or
  deletion by anyone other than the governing entity under documented retention
  policy?
- **§3.5 Data portability** — can the governing entity export all primary
  operational data and the complete governance history at any time, without
  service-provider assistance, in complete, relationship-preserving,
  reconstructable, format-independent exports with a manifest?
- **§3.6 Audit history access** — can the governing entity query audit history
  independently, without service-provider cooperation?
- **§3.7 Operational enforcement** — are requirements enforced in operation, not
  merely documented in policy?
- **§3.8 Cross-system identity** — do governed resources carry stable, portable
  identity that survives export and import unaltered?
- **§3.9 Delegation** — does the delegation model enforce scope limits, full
  chain traceability to the root grant, and cascade revocation?
- **§3.10 Conformance verification** — is the conformance claim supportable
  through observable system behavior and audit records, verifiable by an
  independent party without relying on the system's own assertions alone?

Any item answered "no" or "partially" means the system does **not** yet qualify
for the LEBOSS-compliant claim.

---

## Step 4 — Rule out the 25 non-conformance conditions

A system that satisfies §3 **must still not** be described as LEBOSS-compliant
if any of the 25 conditions in
[`standards/conformance.md` §4](../../standards/conformance.md) is present. Scan
the full list. The conditions most commonly triggered in early implementations
are:

- **#1 Unauthorized access** — an integration or actor can touch governed
  resources without an active grant.
- **#2 Audit bypass** — some operation is not logged, by design or
  configuration.
- **#4 Export restriction** — the governing entity needs service-provider
  approval or a paid tier to export its own data.
- **#8 Unenforced requirements** — conformance rests on documentation or policy
  rather than operational enforcement.
- **#25 Deferred revocation enforcement** — a revoked grant keeps authorizing
  access because of caching or asynchronous state
  (LEBOSS-REV-1, LEBOSS-REV-3, LEBOSS-REV-5).

These five are starting points, not a shortcut. Read all 25 before declaring
compliance. The [normative-structure reference](../reference/normative-structure.md)
gives the full index of conditions with their governing rule IDs.

---

## Step 5 — Declare conformance

Conformance is self-declared.
*(See [`standards/conformance.md` §6](../../standards/conformance.md).)*

To register an implementation, open
[`IMPLEMENTATIONS.md`](../../IMPLEMENTATIONS.md) and add a row to the table:

- the project name,
- the LEBOSS version you target (for example, `v0.1.0`),
- the conformance level (in development, LEBOSS-aligned, or LEBOSS-compliant),
- a link or short description.

Open a pull request against `master`. Once it is merged, the implementation is
registered. The registry is currently empty — yours may be the first entry.

Whatever you declare, the claim must be supportable through observable system
behavior and audit records, not documentation alone
(LEBOSS-VER-2, LEBOSS-VER-4, LEBOSS-VER-6).

---

## References

- Conformance tiers, §3 requirements, §4 conditions —
  [`standards/conformance.md`](../../standards/conformance.md)
- The 115-rule register —
  [`standards/leboss-normative-rules.md`](../../standards/leboss-normative-rules.md)
- Structural alignment checks (§8.1–§8.4) —
  [`standards/leboss-standard.md`](../../standards/leboss-standard.md)
- Terminology, including tier definitions —
  [`glossary/terms.md`](../../glossary/terms.md)
- Quick lookup of rule groups and conditions —
  [Normative structure reference](../reference/normative-structure.md)
- Implementations registry —
  [`IMPLEMENTATIONS.md`](../../IMPLEMENTATIONS.md)
