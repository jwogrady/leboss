# LEBOSS Proposal 0.0.8

**Status:** Proposal
**Branch:** proposal/0.0.8
**Date:** 2026-03-09
**Builds on:** proposal/0.0.7

---

## Summary

This proposal introduces the **Resource Model** — the definitions and structural rules for the objects that actors operate on within a LEBOSS-governed environment.

Every prior protocol in the LEBOSS specification authorizes or denies operations on something. Access Grants reference a `scope` describing what data an authorized party may access. The Integration Descriptor Protocol validates data flow directions against defined categories. The Audit Record object requires a `resource_identifier` for every governed event. The Data Portability Protocol requires export of a complete operational data environment. Yet the specification has never defined what a resource *is* — its structure, its identity, its ownership relationship, or how it maps to the governance objects that reference it.

This proposal closes that gap. It establishes a consistent model for identifying and classifying governed resources, making the scope fields in existing protocols precise rather than open-ended.

---

## Motivation

The gap in the current specification is most visible in Access Grants. An Access Grant defines `scope` — the data boundary within which the grant is operative — but the specification does not define what constitutes a valid scope value, how scopes are identified, or how a system resolves a scope reference to an actual set of operational data.

Similarly, the Audit Record's `resource_identifier` field is defined as "specific enough to identify the affected data boundary or record" — a functional description rather than a structural one. Without a defined resource model, two compliant systems may produce audit records for the same event with incompatible `resource_identifier` values, making cross-system audit correlation impossible.

The same gap appears in the Data Portability Protocol: export completeness requires that all data within the governed environment be included, but "the governed environment" is not defined in terms of an enumerable set of resources. A vendor could produce an incomplete export and claim it is complete because the completeness criteria are undefined.

The Resource Model addresses all three gaps simultaneously by establishing:

- What an identifiable operational asset is in a LEBOSS context
- How resources are named and distinguished from each other
- How resource ownership is established and preserved
- How existing governance protocols reference resources consistently

---

## Specification Changes

| Document | Change |
|----------|--------|
| `standards/leboss-resource-model.md` | New — full Resource Model specification |
| `standards/leboss-standard.md` | Updated — new §16 references the model |
| `glossary/terms.md` | Updated — four new terms |

---

## Rationale

### Why a model rather than a protocol?

Prior proposals in this series have introduced protocols — behavioral rules governing how systems must act. The Resource Model is structural rather than behavioral: it defines what resources are, how they are identified, and how existing protocols reference them. It is a definitional foundation rather than an operational procedure. A future proposal may introduce a Resource Lifecycle Protocol analogous to the Access Grant Protocol, but the model must precede it.

### Why define resource types without mandating them?

Implementation neutrality is a core principle of LEBOSS. Mandating a fixed taxonomy of resource types would constrain implementations without improving governance outcomes. A customer records dataset in one system may be organized by brand entity in another and by service line in a third. What matters for governance is that the resource is identifiable, owned, and referenceable — not that it conforms to a prescribed classification hierarchy.

The Resource Model defines a required structure for resource identification and a classification framework implementations MUST follow — while leaving specific type values to the implementation.

### Why now — after portability?

Export completeness depends on enumerating the resources to be exported. Establishing the Resource Model after the Data Portability Protocol creates a slight logical dependency, but it also means the Resource Model is motivated by a concrete requirement already in the specification: portability completeness cannot be formally verified without a resource inventory, and a resource inventory requires a defined resource model. Proposal 0.0.8 addresses this dependency retroactively, and the Data Portability Protocol's completeness requirements are understood to be strengthened by this model.

---

## Backward Compatibility

No existing normative rules are modified. No existing document sections are removed or rewritten.

The `scope` field on the Access Grant object, the `resource_identifier` field on the Audit Record object, and the export scope definitions in the Data Portability Protocol gain structural definition from this model but are not changed.

---

## Implementation Considerations

The Resource Model specifies required structural and ownership properties. It does not specify:

- The storage format or index structure for resource registries
- How resource identifiers are generated or assigned
- The specific type taxonomy an implementation must use
- How resources are discovered or enumerated by external systems

These are implementation decisions. The requirement is that resources are identifiable, owned, and referenceable within the governance protocols that reference them.

---

## Deferred to 0.0.9 and Beyond

- Resource Lifecycle Protocol (creation, modification, archival, deletion of resources)
- Resource access history and lineage tracking
- Cross-environment resource mapping (for migration and portability)
- LEBOSS Portability Format specification (includes resource manifest)

---

## Feedback Requested

**1. Resource type extensibility**
Should the specification define a minimum required set of resource types that all compliant systems must support, or should resource types remain fully implementation-defined?

**2. Hierarchical resources**
Should the model address hierarchical resource relationships — for example, a record collection containing individual records, each of which is itself a resource? Or should hierarchical semantics be deferred?

**3. Resource identity stability**
Should the specification require that resource identifiers remain stable across exports and imports — enabling the same resource to be identified consistently across environments — or is namespace-local stability sufficient?

**4. Scope resolution**
Should the model define how an Access Grant's `scope` field is resolved to a set of resources at access time, or is that an implementation concern outside the specification?
