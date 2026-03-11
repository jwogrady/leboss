---
theme: seriph
background: 'linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%)'
class: 'text-center'
highlighter: shiki
lineNumbers: false
info: |
  ## LEBOSS Architecture
  Technical reference for the LEBOSS governance model.
  github.com/jwogrady/leboss
css: unocss
drawings:
  persist: false
wakeLock: 'build'
routerMode: 'history'
defaults:
  layout: default
---

<div class="absolute top-4 right-6 text-sm opacity-70 flex gap-4">
  <a href="/" class="hover:opacity-100 transition-opacity">Overview</a>
  <a href="/architecture/" class="hover:opacity-100 transition-opacity">Architecture</a>
  <a href="/governance/" class="hover:opacity-100 transition-opacity">Governance</a>
</div>

# **LEBOSS Architecture**

### Reference model, governance objects, and operational flow

<div class="pt-8 text-gray-400">
  For developers, platform architects, and technical implementers
</div>

<div class="pt-6">
  <span @click="$slidev.nav.next" class="px-4 py-2 rounded-lg cursor-pointer bg-white bg-opacity-10 hover:bg-opacity-20 transition-all duration-200">
    Begin <carbon:arrow-right class="inline ml-2"/>
  </span>
</div>

---

# LEBOSS System Map

<div class="grid grid-cols-1 gap-4 mt-2 text-xs">

<div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-lg p-3">
  <p class="text-blue-300 font-semibold text-sm mb-2">Layer 1 — Ownership</p>
  <div class="flex items-center gap-2 text-gray-300">
    <span class="bg-blue-800 bg-opacity-60 border border-blue-500 rounded px-2 py-1">Governing Entity (Universe)</span>
    <carbon:arrow-right class="text-blue-400 flex-shrink-0"/>
    <span class="bg-blue-800 bg-opacity-60 border border-blue-500 rounded px-2 py-1">Resource Namespace (Galaxy → Star → Planet)</span>
    <carbon:arrow-right class="text-blue-400 flex-shrink-0"/>
    <span class="bg-blue-800 bg-opacity-60 border border-blue-500 rounded px-2 py-1">Resources</span>
  </div>
</div>

<div class="bg-purple-900 bg-opacity-30 border border-purple-700 rounded-lg p-3">
  <p class="text-purple-300 font-semibold text-sm mb-2">Layer 2 — Access and Operation</p>
  <div class="flex items-center gap-2 text-gray-300">
    <span class="bg-purple-800 bg-opacity-60 border border-purple-500 rounded px-2 py-1">Actor (Moon / Satellite)</span>
    <carbon:arrow-right class="text-purple-400 flex-shrink-0"/>
    <span class="bg-purple-800 bg-opacity-60 border border-purple-500 rounded px-2 py-1">Integration Descriptor</span>
    <carbon:arrow-right class="text-purple-400 flex-shrink-0"/>
    <span class="bg-purple-800 bg-opacity-60 border border-purple-500 rounded px-2 py-1">Access Grant</span>
    <carbon:arrow-right class="text-purple-400 flex-shrink-0"/>
    <span class="bg-purple-800 bg-opacity-60 border border-purple-500 rounded px-2 py-1">Resources</span>
  </div>
</div>

<div class="bg-green-900 bg-opacity-30 border border-green-700 rounded-lg p-3">
  <p class="text-green-300 font-semibold text-sm mb-2">Layer 3 — Governance and Continuity</p>
  <div class="flex items-center gap-2 text-gray-300">
    <span class="bg-green-800 bg-opacity-60 border border-green-500 rounded px-2 py-1">Resources</span>
    <carbon:arrow-right class="text-green-400 flex-shrink-0"/>
    <span class="bg-green-800 bg-opacity-60 border border-green-500 rounded px-2 py-1">Audit Records</span>
    <carbon:arrow-right class="text-green-400 flex-shrink-0"/>
    <span class="bg-green-800 bg-opacity-60 border border-green-500 rounded px-2 py-1">Data Portability</span>
    <carbon:arrow-right class="text-green-400 flex-shrink-0"/>
    <span class="bg-green-800 bg-opacity-60 border border-green-500 rounded px-2 py-1">Governing Entity</span>
  </div>
</div>

</div>

<div class="mt-3 text-xs text-gray-400 leading-relaxed">
<strong class="text-gray-300">Resources</strong> are owned by the Universe and namespaced through the hierarchy.
<strong class="text-gray-300">Access Grants</strong> authorize Actors to operate on Resources within defined scope.
<strong class="text-gray-300">Audit Records</strong> create an immutable trail of every operation.
<strong class="text-gray-300">Data Portability</strong> closes the loop — the Governing Entity can always reclaim their data.
</div>

---
layout: center
class: text-center
---

<CosmicDivider title="The Reference Model" subtitle="Six hierarchical elements for structuring a LEBOSS-governed system" />

---
layout: center
class: text-center
---

# LEBOSS Orbital Model

<div class="flex justify-center mt-2">
<CosmicSystem
  center-label="Universe"
  center-sub="Governing Entity"
  :center-size="88"
  :width="500"
  :height="380"
  :starfield="true"
  :orbits="[
    {
      radius: 90,
      nodes: [
        { label: 'Galaxy', sub: 'Brand / Business Line', type: 'galaxy', size: 72 }
      ]
    },
    {
      radius: 155,
      startAngle: 0,
      nodes: [
        { label: 'Star', sub: 'Customer Interface', type: 'star' },
        { label: 'Planet', sub: 'Backend Service', type: 'planet' }
      ]
    },
    {
      radius: 200,
      startAngle: 0.7854,
      nodes: [
        { label: 'Moon', sub: 'Internal Module', type: 'moon' },
        { label: 'Satellite', sub: 'Third-Party', type: 'satellite' },
        { label: 'Moon', sub: 'Internal Module', type: 'moon' },
        { label: 'Satellite', sub: 'Third-Party', type: 'satellite' }
      ]
    }
  ]"
/>
</div>

<div class="text-xs text-gray-500 mt-1">Every element orbits the governing entity — data sovereignty is structural, not contractual.</div>

---
layout: two-cols
---

# **0 — Universe**

<div class="space-y-4 text-sm mt-4">

<div class="bg-blue-900 bg-opacity-40 border border-blue-500 rounded-lg p-4">
  <p class="font-semibold text-blue-300 mb-2">Role</p>
  <p class="text-gray-300">The root governing entity. Owns all data, resources, brands, and permissions in the system. Every other element is owned by or operates under a Universe.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What it represents</p>
  <p class="text-gray-400">A person, a family, a partnership, or a registered legal entity. The natural person or entity that has legal ownership and operational control of the business.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Key properties</p>
  <ul class="text-gray-400 space-y-1">
    <li>• Controls system-wide settings, permissions, and succession</li>
    <li>• Can span multiple brands, DBAs, or legal ventures</li>
    <li>• The ultimate source of all access grants</li>
  </ul>
</div>

</div>

::right::

<div class="pl-6 mt-4 space-y-4">

<div class="text-center">
  <div class="inline-flex w-20 h-20 rounded-full bg-blue-600 items-center justify-center text-3xl font-bold">0</div>
  <p class="mt-2 text-blue-300 font-semibold">Universe</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4 text-sm">
  <p class="text-yellow-300 font-semibold mb-2">Implementation note</p>
  <p class="text-gray-400">The term "Universe" is illustrative. Implementations may use any internal naming convention — organization, tenant, owner, account. The structural requirement is that a root governing entity exists and owns all other resources.</p>
</div>

</div>

---
layout: two-cols
---

# **1 — Galaxy**

<div class="space-y-4 text-sm mt-4">

<div class="bg-purple-900 bg-opacity-40 border border-purple-500 rounded-lg p-4">
  <p class="font-semibold text-purple-300 mb-2">Role</p>
  <p class="text-gray-300">An individual brand or business line owned by the Universe. Separates distinct business entities while maintaining shared governance.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What it represents</p>
  <p class="text-gray-400">A distinct operating brand, DBA, or business venture. Each Galaxy has its own identity, data, and team structure while remaining under the Universe's ownership.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Example</p>
  <p class="text-gray-400">A single owner operating three separate service businesses under one legal entity. Each business is a Galaxy. Shared financial or administrative services may span Galaxies but are governed at the Universe level.</p>
</div>

</div>

::right::

<div class="pl-6 mt-4 space-y-4">

<div class="text-center">
  <div class="inline-flex w-16 h-16 rounded-full bg-blue-600 items-center justify-center text-2xl font-bold mb-1">0</div>
  <div class="text-xs text-gray-500 mb-2">Universe</div>
  <div class="flex gap-2 justify-center">
    <div class="inline-flex w-12 h-12 rounded-full bg-purple-600 items-center justify-center text-lg font-bold">1</div>
    <div class="inline-flex w-12 h-12 rounded-full bg-purple-600 items-center justify-center text-lg font-bold">1</div>
    <div class="inline-flex w-12 h-12 rounded-full bg-purple-600 items-center justify-center text-lg font-bold">1</div>
  </div>
  <p class="mt-2 text-purple-300 font-semibold text-sm">Galaxy × 3</p>
</div>

</div>

---
layout: two-cols
---

# **2 — Star**

<div class="space-y-4 text-sm mt-4">

<div class="bg-yellow-900 bg-opacity-40 border border-yellow-500 rounded-lg p-4">
  <p class="font-semibold text-yellow-300 mb-2">Role</p>
  <p class="text-gray-300">The customer-facing interface. Every interaction a customer has with the business happens through a Star.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What it represents</p>
  <p class="text-gray-400">A website, mobile application, booking portal, customer self-service interface, or any other interface that presents business services to external parties.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Relationship to Planet</p>
  <p class="text-gray-400">A Star and Planet are mutually dependent. A Star without a Planet cannot function — it has no data or business logic. A Planet without a Star has no audience to serve.</p>
</div>

</div>

::right::

<div class="pl-6 mt-4 space-y-4">

<div class="text-center">
  <div class="inline-flex w-12 h-12 rounded-full bg-purple-600 items-center justify-center text-lg font-bold mb-1">1</div>
  <div class="text-xs text-gray-500 mb-2">Galaxy</div>
  <div class="inline-flex w-20 h-20 rounded-full bg-yellow-500 items-center justify-center text-3xl font-bold">2</div>
  <p class="mt-2 text-yellow-300 font-semibold">Star</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4 text-sm">
  <p class="text-yellow-300 font-semibold mb-2">Implementation note</p>
  <p class="text-gray-400">A Star presents the brand experience. Multiple Stars may serve a single Galaxy — for example, a public-facing storefront and a separate staff scheduling portal.</p>
</div>

</div>

---
layout: two-cols
---

# **3 — Planet**

<div class="space-y-4 text-sm mt-4">

<div class="bg-green-900 bg-opacity-40 border border-green-500 rounded-lg p-4">
  <p class="font-semibold text-green-300 mb-2">Role</p>
  <p class="text-gray-300">The backend service powering a Star. The Planet holds primary operational data and provides the business logic that makes a Star meaningful.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What it represents</p>
  <p class="text-gray-400">An API, database, or service layer: appointment scheduling backend, order management system, customer record store, authentication service.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Ownership</p>
  <p class="text-gray-400">May be operated by the business itself or by a compliant service provider. The governing entity retains data ownership regardless of who operates the Planet.</p>
</div>

</div>

::right::

<div class="pl-6 mt-4 space-y-4">

<div class="text-center">
  <div class="inline-flex w-12 h-12 rounded-full bg-yellow-500 items-center justify-center text-lg font-bold mb-1">2</div>
  <div class="text-xs text-gray-500 mb-2">Star</div>
  <div class="inline-flex w-20 h-20 rounded-full bg-green-600 items-center justify-center text-3xl font-bold">3</div>
  <p class="mt-2 text-green-300 font-semibold">Planet</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4 text-sm">
  <p class="text-green-300 font-semibold mb-2">Implementation note</p>
  <p class="text-gray-400">The Planet is the source of truth for its Galaxy's data. A compliant Planet must support export, audit, and access revocation — regardless of the operating provider.</p>
</div>

</div>

---
layout: two-cols
---

# **4 — Moon**
#### Natural Satellite

<div class="space-y-4 text-sm mt-4">

<div class="bg-indigo-900 bg-opacity-40 border border-indigo-500 rounded-lg p-4">
  <p class="font-semibold text-indigo-300 mb-2">Role</p>
  <p class="text-gray-300">A company-owned internal capability or workflow that orbits a Planet or Star. Moons are natural satellites — owned and controlled by the governing entity.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What it represents</p>
  <p class="text-gray-400">Internal modules: sales pipeline, service delivery workflow, billing and accounting engine, internal analytics, HR management system.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Key distinction</p>
  <p class="text-gray-400">Moons are internal. The governing entity owns them outright. They do not require an Integration Descriptor or third-party access grant — they operate under direct ownership authority.</p>
</div>

</div>

::right::

<div class="pl-6 mt-4 space-y-4">

<div class="text-center">
  <div class="inline-flex w-16 h-16 rounded-full bg-green-600 items-center justify-center text-2xl font-bold mb-1">3</div>
  <div class="text-xs text-gray-500 mb-2">Planet</div>
  <div class="inline-flex w-20 h-20 rounded-full bg-indigo-600 items-center justify-center text-3xl font-bold">4</div>
  <p class="mt-2 text-indigo-300 font-semibold">Moon</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4 text-sm">
  <p class="text-indigo-300 font-semibold mb-2">Implementation note</p>
  <p class="text-gray-400">Moons operate inside the trust boundary. No external data flows are required. Examples: an internal invoicing engine, a staff scheduling module, an analytics dashboard.</p>
</div>

</div>

---
layout: two-cols
---

# **5 — Satellite**
#### Artificial Satellite

<div class="space-y-4 text-sm mt-4">

<div class="bg-red-900 bg-opacity-40 border border-red-500 rounded-lg p-4">
  <p class="font-semibold text-red-300 mb-2">Role</p>
  <p class="text-gray-300">A third-party integration. Satellites are artificial — managed resources outside the governing entity's direct control.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What it represents</p>
  <p class="text-gray-400">External platform integrations: advertising platforms, review services, accounting software, payment processors, marketing tools.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-red-300 mb-2">⚠ Data sovereignty risk</p>
  <p class="text-gray-400">Satellites are the point of greatest data sovereignty risk. Every Satellite requires an explicit Access Grant and a filed Integration Descriptor before receiving any business data.</p>
</div>

</div>

::right::

<div class="pl-6 mt-4 space-y-4">

<div class="text-center">
  <div class="inline-flex w-16 h-16 rounded-full bg-green-600 items-center justify-center text-2xl font-bold mb-1">3</div>
  <div class="text-xs text-gray-500 mb-2">Planet</div>
  <div class="inline-flex w-20 h-20 rounded-full bg-red-600 items-center justify-center text-3xl font-bold">5</div>
  <p class="mt-2 text-red-300 font-semibold">Satellite</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4 text-sm">
  <p class="text-red-300 font-semibold mb-2">Implementation note</p>
  <p class="text-gray-400">Satellites operate outside the trust boundary. Before activation, a Satellite must have a filed Integration Descriptor and an active Access Grant scoped to its declared data flows.</p>
</div>

</div>

---

# Reference Model Summary

<div class="overflow-hidden rounded-lg mt-6">

| # | Element | Role | Ownership | Governance Requirement |
|:-:|---------|------|-----------|------------------------|
| 0 | **Universe** | Root governing entity | Self-owned | Source of all access grants |
| 1 | **Galaxy** | Brand or business line | Universe-owned | Inherits Universe governance |
| 2 | **Star** | Customer-facing interface | Galaxy-owned | Served by exactly one Planet |
| 3 | **Planet** | Backend service | Galaxy-owned or managed | Must comply with data ownership doctrine |
| 4 | **Moon** | Internal capability | Universe/Galaxy-owned | No third-party grant required |
| 5 | **Satellite** | Third-party integration | Externally operated | Requires Access Grant + Integration Descriptor |

</div>

<div class="mt-6 bg-yellow-900 bg-opacity-30 border border-yellow-600 rounded-lg p-4 text-sm">
  <strong class="text-yellow-300">Terminology note:</strong>
  <span class="text-gray-300"> These names are illustrative. Implementations MAY use any internal naming convention. The structural relationships they define — ownership hierarchy, data flow direction, and access governance requirements — are normative.</span>
</div>

---
layout: center
class: text-center
---

<CosmicDivider title="Governance Objects" subtitle="The objects that enforce LEBOSS compliance" />

---

# Access Grants

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-blue-900 bg-opacity-40 border border-blue-500 rounded-lg p-4">
  <p class="font-semibold text-blue-300 mb-2">What it is</p>
  <p class="text-gray-300">A formal authorization record that grants a specific party access to specific resources within the governing entity's data environment.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Required fields</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <code class="text-blue-300">grant_id</code> — unique identifier</li>
    <li>• <code class="text-blue-300">governing_entity_id</code> — who is granting access</li>
    <li>• <code class="text-blue-300">grantee_id</code> — who is receiving access</li>
    <li>• <code class="text-blue-300">scope</code> — what resources or resource categories</li>
    <li>• <code class="text-blue-300">purpose</code> — declared purpose of access</li>
    <li>• <code class="text-blue-300">issued_at</code> and <code class="text-blue-300">expires_at</code></li>
    <li>• <code class="text-blue-300">status</code> — active / suspended / revoked</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Normative requirements</p>
  <ul class="text-gray-400 space-y-2">
    <li>• Access Grants MUST be issued only by the governing entity</li>
    <li>• Access Grants MUST be revocable at any time</li>
    <li>• No data access is permitted without a valid, active Access Grant</li>
    <li>• Revocation MUST take effect within a defined maximum latency</li>
    <li>• Every grant issuance, suspension, and revocation MUST produce an Audit Record</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Lifecycle</p>
  <p class="text-gray-400 text-xs">Draft → Active → Suspended → Revoked</p>
  <p class="text-gray-500 text-xs mt-1">A suspended grant may be reactivated. A revoked grant is terminal.</p>
</div>

</div>

</div>

---

# Integration Descriptors

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-purple-900 bg-opacity-40 border border-purple-500 rounded-lg p-4">
  <p class="font-semibold text-purple-300 mb-2">What it is</p>
  <p class="text-gray-300">A machine-readable declaration of everything a third-party integration (Satellite) does. Filed before the integration is activated. Describes data flows, not intentions.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Required fields</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <code class="text-purple-300">descriptor_id</code> — unique identifier</li>
    <li>• <code class="text-purple-300">integration_name</code> — human-readable name</li>
    <li>• <code class="text-purple-300">provider_id</code> — who operates the integration</li>
    <li>• <code class="text-purple-300">data_flows</code> — array of declared data movements</li>
    <li>• <code class="text-purple-300">data_categories</code> — types of data involved</li>
    <li>• <code class="text-purple-300">status</code> — pending / active / suspended / deactivated</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Data flow directions</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <code class="text-green-300">inbound</code> — data flows into the governed environment</li>
    <li>• <code class="text-yellow-300">outbound</code> — data flows out to the third party</li>
    <li>• <code class="text-red-300">bidirectional</code> — data flows both ways</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Normative requirements</p>
  <ul class="text-gray-400 space-y-2">
    <li>• A Satellite MUST NOT transmit data before a descriptor is filed and active</li>
    <li>• Data flows not declared in the descriptor are prohibited</li>
    <li>• The governing entity MUST be able to access all filed descriptors</li>
  </ul>
</div>

</div>

</div>

---

# Audit Records

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-green-900 bg-opacity-40 border border-green-500 rounded-lg p-4">
  <p class="font-semibold text-green-300 mb-2">What it is</p>
  <p class="text-gray-300">An immutable record of every governed action in the system. The governing entity's primary means of verifying that the system is operating as authorized.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Required fields</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <code class="text-green-300">record_id</code> — unique identifier</li>
    <li>• <code class="text-green-300">event_type</code> — what happened</li>
    <li>• <code class="text-green-300">actor_id</code> — who performed the action</li>
    <li>• <code class="text-green-300">resource_identifier</code> — what was affected</li>
    <li>• <code class="text-green-300">grant_id</code> — which grant authorized the action</li>
    <li>• <code class="text-green-300">timestamp</code> — when it occurred</li>
    <li>• <code class="text-green-300">outcome</code> — success / failure / partial</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Normative requirements</p>
  <ul class="text-gray-400 space-y-2">
    <li>• Audit Records MUST be immutable after creation</li>
    <li>• Audit Records MUST be retained for a minimum of 36 months</li>
    <li>• The governing entity MUST be able to read the full audit trail at any time</li>
    <li>• Audit Records MUST be included in any data export</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Required event types</p>
  <p class="text-gray-400 text-xs">Access grant lifecycle events, data read/write/delete, export requests, integration activation/deactivation, policy changes, authentication events</p>
</div>

</div>

</div>

---

# Resources

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-yellow-900 bg-opacity-40 border border-yellow-500 rounded-lg p-4">
  <p class="font-semibold text-yellow-300 mb-2">What it is</p>
  <p class="text-gray-300">An identifiable unit of data or system capability that can be owned, governed, and referenced in Access Grants, Integration Descriptors, and Audit Records.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Resource types</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <code class="text-yellow-300">data_collection</code> — a set of operational records</li>
    <li>• <code class="text-yellow-300">configuration</code> — system or service settings</li>
    <li>• <code class="text-yellow-300">governance_object</code> — grants, descriptors, audit records</li>
    <li>• <code class="text-yellow-300">service_endpoint</code> — an API or service interface</li>
    <li>• <code class="text-yellow-300">workflow</code> — an automated process or pipeline</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Resource identity</p>
  <ul class="text-gray-400 space-y-2">
    <li>• Each resource has a stable, unique identifier within its namespace</li>
    <li>• Identifiers remain consistent across exports and imports</li>
    <li>• Resources belong to a namespace that includes the governing entity ID</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Why it matters</p>
  <p class="text-gray-400">The Resource Model gives precision to Access Grant scope, Audit Record references, and Data Portability completeness requirements. Without a defined resource model, compliance claims are unverifiable.</p>
</div>

</div>

</div>

---

# Data Portability

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-red-900 bg-opacity-40 border border-red-500 rounded-lg p-4">
  <p class="font-semibold text-red-300 mb-2">What it is</p>
  <p class="text-gray-300">The governing entity's right to receive a complete, machine-readable export of their operational data environment — at any time, without dependency on the service provider's cooperation.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Required export categories</p>
  <ul class="text-gray-400 space-y-1">
    <li>• Primary operational data</li>
    <li>• Configuration and system state</li>
    <li>• Integration records (descriptors, grants)</li>
    <li>• Full audit record history</li>
    <li>• All governance objects</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Normative requirements</p>
  <ul class="text-gray-400 space-y-2">
    <li>• Service providers MUST provide self-service export capability</li>
    <li>• Export MUST be available during contract termination</li>
    <li>• Export MUST include a manifest of all exported resources</li>
    <li>• Export format MUST be machine-readable and require no proprietary tools</li>
    <li>• Export completeness is verifiable via the resource manifest</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Who can initiate</p>
  <p class="text-gray-400">Only the governing entity. No third party may initiate a full environment export on behalf of the governing entity without explicit, scoped Access Grant authorization.</p>
</div>

</div>

</div>

---
layout: center
class: text-center
---

# Operational Flow

<div class="mt-8 max-w-3xl mx-auto">

<div class="flex items-center justify-center gap-2 mb-4">
  <div class="flex flex-col items-center gap-1">
    <div class="w-16 h-16 rounded-full bg-blue-600 flex items-center justify-center text-xs font-semibold text-center leading-tight px-1">Actor</div>
  </div>
  <div class="text-gray-500 text-lg">→</div>
  <div class="flex flex-col items-center gap-1">
    <div class="w-16 h-16 rounded-full bg-purple-600 flex items-center justify-center text-xs font-semibold text-center leading-tight px-1">Oper&shy;ation</div>
  </div>
  <div class="text-gray-500 text-lg">→</div>
  <div class="flex flex-col items-center gap-1">
    <div class="w-16 h-16 rounded-full bg-yellow-600 flex items-center justify-center text-xs font-semibold text-center leading-tight px-1">Resource</div>
  </div>
  <div class="text-gray-500 text-lg">→</div>
  <div class="flex flex-col items-center gap-1">
    <div class="w-16 h-16 rounded-full bg-green-600 flex items-center justify-center text-xs font-semibold text-center leading-tight px-1">Access Grant</div>
  </div>
  <div class="text-gray-500 text-lg">→</div>
  <div class="flex flex-col items-center gap-1">
    <div class="w-16 h-16 rounded-full bg-red-600 flex items-center justify-center text-xs font-semibold text-center leading-tight px-1">Audit Record</div>
  </div>
</div>

<div class="grid grid-cols-5 gap-2 text-xs text-gray-400 mt-2">
  <div class="text-center">Any party attempting to access or modify business data</div>
  <div class="text-center">The data operation being performed (read, write, delete, export)</div>
  <div class="text-center">The specific resource being accessed, as defined by the Resource Model</div>
  <div class="text-center">The valid, active grant that authorizes this actor's access to this resource</div>
  <div class="text-center">An immutable record capturing all five preceding elements</div>
</div>

</div>

<div class="mt-8 bg-white bg-opacity-5 rounded-lg p-4 text-sm text-gray-300 max-w-2xl mx-auto">
  An operation that cannot produce a valid Access Grant for the resource it is attempting to access is unauthorized. An unauthorized operation MUST be rejected and MUST generate an Audit Record noting the rejection.
</div>

---
layout: center
class: text-center
---

# Continue

<div class="grid grid-cols-2 gap-6 mt-8 max-w-2xl mx-auto text-left">

<div class="bg-white bg-opacity-10 rounded-xl p-5">
  <h3 class="font-semibold text-blue-300 mb-2">← Overview</h3>
  <p class="text-sm text-gray-300 mb-3">Data sovereignty rationale, five principles, who LEBOSS is for.</p>
  <code class="text-xs text-gray-400">presentations/slidev/overview.md</code>
</div>

<div class="bg-white bg-opacity-10 rounded-xl p-5">
  <h3 class="font-semibold text-purple-300 mb-2">Governance →</h3>
  <p class="text-sm text-gray-300 mb-3">Proposal lifecycle, versioning, committee, conformance.</p>
  <code class="text-xs text-gray-400">presentations/slidev/governance.md</code>
</div>

</div>

<div class="mt-8 text-sm text-gray-500">
  Specification: <strong class="text-gray-300">github.com/jwogrady/leboss</strong>
</div>

---
layout: end
---

# LEBOSS Architecture

<div class="mt-4 text-gray-300">
  Reference model · Governance objects · Operational flow
</div>

<div class="mt-4 text-sm text-gray-500">
  github.com/jwogrady/leboss/tree/master/standards
</div>
