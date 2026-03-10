---
theme: seriph
background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)'
class: 'text-center'
highlighter: shiki
lineNumbers: false
info: |
  ## LEBOSS — Data Sovereignty for Local Business
  An open architecture model for business data governance.
  https://leboss.status26.com
css: unocss
drawings:
  persist: false
wakeLock: 'build'
---

# **LEBOSS**

### Local Entrepreneur Business Operating System Standards

<div class="pt-6 text-xl text-gray-200">
  Restoring data ownership to local businesses.
</div>

<div class="pt-4 text-sm text-gray-400 max-w-lg mx-auto">
  An open architecture model for business data governance — defining who owns what, who can access what, and who controls the data environment a business runs on.
</div>

<div class="pt-8">
  <span @click="$slidev.nav.next" class="px-4 py-2 rounded-lg cursor-pointer bg-white bg-opacity-20 hover:bg-opacity-30 transition-all duration-200">
    Begin <carbon:arrow-right class="inline ml-2"/>
  </span>
</div>

---

# The Problem

<div class="mt-4 text-gray-300 text-base">
  Local businesses generate the data that runs their companies.
</div>

<div class="grid grid-cols-2 gap-6 mt-6">

<div class="space-y-3">
  <div class="flex items-center gap-3 bg-white bg-opacity-5 rounded-lg p-3">
    <div class="w-2 h-2 bg-blue-400 rounded-full flex-shrink-0"></div>
    <span class="text-sm">Customer records</span>
  </div>
  <div class="flex items-center gap-3 bg-white bg-opacity-5 rounded-lg p-3">
    <div class="w-2 h-2 bg-purple-400 rounded-full flex-shrink-0"></div>
    <span class="text-sm">Sales history</span>
  </div>
  <div class="flex items-center gap-3 bg-white bg-opacity-5 rounded-lg p-3">
    <div class="w-2 h-2 bg-green-400 rounded-full flex-shrink-0"></div>
    <span class="text-sm">Marketing analytics</span>
  </div>
  <div class="flex items-center gap-3 bg-white bg-opacity-5 rounded-lg p-3">
    <div class="w-2 h-2 bg-yellow-400 rounded-full flex-shrink-0"></div>
    <span class="text-sm">Operational workflows</span>
  </div>
</div>

<div class="space-y-4">
  <div class="bg-red-900 bg-opacity-30 border border-red-700 rounded-lg p-4 text-sm text-gray-300">
    In many modern SaaS systems, this data lives inside <strong class="text-white">vendor-controlled platforms</strong> — not systems the business owns or controls.
  </div>
  <div class="bg-red-900 bg-opacity-30 border border-red-700 rounded-lg p-4 text-sm text-gray-300">
    Businesses often <strong class="text-white">cannot move their data environments</strong> easily. Switching a platform means negotiating exports, losing history, or starting over.
  </div>
</div>

</div>

---
layout: center
class: text-center
---

# Traditional SaaS Architecture

<div class="mt-4 max-w-3xl mx-auto">

<div class="text-sm text-gray-400 mb-6">In many modern SaaS systems, the platform controls the operational data environment.</div>

<div class="flex items-start justify-center gap-16">

<div class="flex flex-col items-center gap-0">
  <div class="bg-white bg-opacity-10 rounded-xl px-8 py-4 text-center w-44">
    <div class="text-xs text-gray-400 mb-1">You</div>
    <div class="font-semibold">Business</div>
  </div>
  <div class="text-gray-500 text-lg leading-tight">↓</div>
  <div class="bg-red-900 bg-opacity-40 border border-red-600 rounded-xl px-8 py-4 text-center w-44">
    <div class="text-xs text-red-400 mb-1">Vendor controls</div>
    <div class="font-semibold text-red-300">Platform</div>
  </div>
  <div class="text-gray-500 text-lg leading-tight">↓</div>
  <div class="bg-red-900 bg-opacity-40 border border-red-600 rounded-xl px-8 py-4 text-center w-44">
    <div class="text-xs text-red-400 mb-1">Vendor holds</div>
    <div class="font-semibold text-red-300">Data</div>
  </div>
</div>

<div class="space-y-3 text-sm text-gray-400 text-left max-w-xs mt-2">
  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <p>Businesses interact with the platform, but the platform governs the data structure, storage, and migration capabilities.</p>
  </div>
  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <p>Even when exports exist, the operational system itself is difficult to move — configurations, integrations, and history rarely transfer.</p>
  </div>
  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-yellow-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <p>This is a design choice. It is not a technical inevitability.</p>
  </div>
</div>

</div>

</div>

---
layout: center
class: text-center
---

# The LEBOSS Model

<div class="mt-4 max-w-3xl mx-auto">

<div class="text-sm text-gray-400 mb-6">LEBOSS inverts the relationship. The business owns the data environment. Platforms serve it.</div>

<div class="flex items-start justify-center gap-16">

<div class="flex flex-col items-center gap-0">
  <div class="bg-white bg-opacity-10 rounded-xl px-8 py-4 text-center w-52">
    <div class="text-xs text-gray-400 mb-1">Root of all governance</div>
    <div class="font-semibold">Business</div>
  </div>
  <div class="text-gray-400 text-xs leading-tight py-0.5">↓ owns</div>
  <div class="bg-green-900 bg-opacity-40 border-2 border-green-500 rounded-xl px-8 py-5 text-center w-52">
    <div class="text-xs text-green-400 mb-1">Belongs to the business</div>
    <div class="font-bold text-green-300">Data Environment</div>
  </div>
  <div class="text-blue-400 text-xs leading-tight py-0.5">↑ serves</div>
  <div class="bg-blue-900 bg-opacity-40 border border-blue-500 rounded-xl px-8 py-4 text-center w-52">
    <div class="text-xs text-blue-400 mb-1">Operate on the environment</div>
    <div class="font-semibold text-blue-300">Platforms</div>
  </div>
</div>

<div class="space-y-3 text-sm text-gray-400 text-left max-w-xs mt-2">
  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <p>In LEBOSS, the business owns the operational data environment — not the platform that stores it.</p>
  </div>
  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <p>Platforms provide infrastructure, integrations, and automation that operate on top of that environment.</p>
  </div>
  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-gray-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <p>Service providers do not own the business's operational data. They are stewards, not owners.</p>
  </div>
</div>

</div>

</div>

---

# How LEBOSS Works

<div class="grid grid-cols-2 gap-8 mt-4">

<div class="flex flex-col items-center gap-0">
  <div class="bg-blue-900 bg-opacity-40 border border-blue-600 rounded-lg px-6 py-2 text-sm font-semibold text-blue-300 w-52 text-center">Governing Entity</div>
  <div class="text-gray-500 text-xs py-0.5">↓ owns</div>
  <div class="bg-purple-900 bg-opacity-40 border border-purple-600 rounded-lg px-6 py-2 text-sm font-semibold text-purple-300 w-52 text-center">Resources</div>
  <div class="text-gray-500 text-xs py-0.5">↓ access controlled by</div>
  <div class="bg-green-900 bg-opacity-40 border border-green-600 rounded-lg px-6 py-2 text-sm font-semibold text-green-300 w-52 text-center">Access Grants</div>
  <div class="text-gray-500 text-xs py-0.5">↓ authorize</div>
  <div class="bg-yellow-900 bg-opacity-40 border border-yellow-600 rounded-lg px-6 py-2 text-sm font-semibold text-yellow-300 w-52 text-center">Integrations</div>
  <div class="text-gray-500 text-xs py-0.5">↓ operate on Resources, recorded in</div>
  <div class="bg-red-900 bg-opacity-40 border border-red-600 rounded-lg px-6 py-2 text-sm font-semibold text-red-300 w-52 text-center">Audit Records</div>
  <div class="text-gray-500 text-xs py-0.5">↓ enable</div>
  <div class="bg-indigo-900 bg-opacity-40 border border-indigo-600 rounded-lg px-6 py-2 text-sm font-semibold text-indigo-300 w-52 text-center">Data Portability</div>
</div>

<div class="space-y-4 text-sm mt-1">
  <div class="text-gray-400 text-xs mb-3">This governance loop ensures:</div>

  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <div>
      <strong class="text-blue-300">Business ownership</strong>
      <p class="text-gray-400 text-xs mt-0.5">The governing entity is the root of all access decisions. No data operation is authorized without their explicit grant.</p>
    </div>
  </div>

  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <div>
      <strong class="text-green-300">Transparent access control</strong>
      <p class="text-gray-400 text-xs mt-0.5">Every party that touches business data holds an explicit, scoped, revocable Access Grant.</p>
    </div>
  </div>

  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <div>
      <strong class="text-red-300">Auditability</strong>
      <p class="text-gray-400 text-xs mt-0.5">Every governed action produces an immutable Audit Record the business can inspect at any time.</p>
    </div>
  </div>

  <div class="flex items-start gap-3">
    <div class="w-2 h-2 bg-indigo-400 rounded-full mt-1.5 flex-shrink-0"></div>
    <div>
      <strong class="text-indigo-300">Portability of the operational environment</strong>
      <p class="text-gray-400 text-xs mt-0.5">The complete environment — data, grants, integrations, audit history — is exportable at any time.</p>
    </div>
  </div>

</div>

</div>

---

# The Governance Model

<div class="mt-4 text-sm text-gray-400 mb-6">Six elements that together ensure a business owner retains control over their operational data.</div>

<div class="grid grid-cols-3 gap-4">

<div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-lg p-4">
  <div class="text-blue-300 font-semibold text-sm mb-2">Governing Entity</div>
  <p class="text-xs text-gray-400">The business owner. The root of all access decisions. All governance flows from here.</p>
</div>

<div class="bg-purple-900 bg-opacity-30 border border-purple-700 rounded-lg p-4">
  <div class="text-purple-300 font-semibold text-sm mb-2">Resources</div>
  <p class="text-xs text-gray-400">Identifiable units of business data — customer records, configurations, workflows — that are owned and governed.</p>
</div>

<div class="bg-green-900 bg-opacity-30 border border-green-700 rounded-lg p-4">
  <div class="text-green-300 font-semibold text-sm mb-2">Access Grants</div>
  <p class="text-xs text-gray-400">Explicit, scoped authorization issued by the governing entity to every party that touches business data. Revocable at any time.</p>
</div>

<div class="bg-yellow-900 bg-opacity-30 border border-yellow-700 rounded-lg p-4">
  <div class="text-yellow-300 font-semibold text-sm mb-2">Integrations</div>
  <p class="text-xs text-gray-400">Third-party connections. Each integration must have a declared descriptor of what data it accesses and in which direction.</p>
</div>

<div class="bg-red-900 bg-opacity-30 border border-red-700 rounded-lg p-4">
  <div class="text-red-300 font-semibold text-sm mb-2">Audit Records</div>
  <p class="text-xs text-gray-400">An immutable log of every governed action. The governing entity can read the full audit trail at any time.</p>
</div>

<div class="bg-indigo-900 bg-opacity-30 border border-indigo-700 rounded-lg p-4">
  <div class="text-indigo-300 font-semibold text-sm mb-2">Data Portability</div>
  <p class="text-xs text-gray-400">A normative requirement — not a product feature. Any governing entity may request a complete export of their data environment at any time.</p>
</div>

</div>

---
layout: center
class: text-center
---

# The Operational Flow

<div class="mt-6 max-w-3xl mx-auto">

<div class="flex items-center justify-center gap-2 flex-wrap">
  <div class="bg-blue-700 rounded-lg px-4 py-3 text-sm font-semibold">Actor</div>
  <div class="text-gray-500 text-xl">→</div>
  <div class="bg-purple-700 rounded-lg px-4 py-3 text-sm font-semibold">Operation</div>
  <div class="text-gray-500 text-xl">→</div>
  <div class="bg-yellow-700 rounded-lg px-4 py-3 text-sm font-semibold">Resource</div>
  <div class="text-gray-500 text-xl">→</div>
  <div class="bg-green-700 rounded-lg px-4 py-3 text-sm font-semibold">Access Grant</div>
  <div class="text-gray-500 text-xl">→</div>
  <div class="bg-orange-700 rounded-lg px-4 py-3 text-sm font-semibold">Integration</div>
  <div class="text-gray-500 text-xl">→</div>
  <div class="bg-red-700 rounded-lg px-4 py-3 text-sm font-semibold">Audit Record</div>
</div>

<div class="mt-8 bg-white bg-opacity-5 rounded-lg p-5 text-sm text-gray-300 text-left max-w-2xl mx-auto">
  All operations in a compliant LEBOSS environment must pass through this governance flow. Every actor, every data operation, every integration — each one produces an auditable record tied back to the governing entity's explicit authorization.
</div>

<div class="mt-4 grid grid-cols-3 gap-3 text-xs text-gray-500 max-w-2xl mx-auto text-left">
  <div>An <strong class="text-gray-300">actor</strong> can be a person, service, or integration.</div>
  <div>The <strong class="text-gray-300">access grant</strong> defines what the actor is authorized to do on which resource.</div>
  <div>The <strong class="text-gray-300">audit record</strong> captures the full event — actor, resource, grant, outcome.</div>
</div>

</div>

---
layout: two-cols
---

# The Reference Model

<div class="text-xs text-yellow-300 mb-4 bg-yellow-900 bg-opacity-30 border border-yellow-700 rounded px-3 py-2">
  Reference architecture — illustrative names. Implementations may use different terminology.
</div>

<div class="space-y-3 text-sm">

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-blue-500 flex items-center justify-center text-xs font-bold flex-shrink-0">0</div>
  <div>
    <span class="font-semibold">Universe</span>
    <span class="text-gray-400"> — the governing entity. Root owner of all data and resources.</span>
  </div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-purple-500 flex items-center justify-center text-xs font-bold flex-shrink-0">1</div>
  <div>
    <span class="font-semibold">Galaxy</span>
    <span class="text-gray-400"> — an individual brand or business line under the Universe.</span>
  </div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-yellow-500 flex items-center justify-center text-xs font-bold flex-shrink-0">2</div>
  <div>
    <span class="font-semibold">Star</span>
    <span class="text-gray-400"> — customer-facing interface. Websites, apps, portals.</span>
  </div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-green-500 flex items-center justify-center text-xs font-bold flex-shrink-0">3</div>
  <div>
    <span class="font-semibold">Planet</span>
    <span class="text-gray-400"> — backend service powering a Star. Holds primary operational data.</span>
  </div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-indigo-500 flex items-center justify-center text-xs font-bold flex-shrink-0">4</div>
  <div>
    <span class="font-semibold">Moon</span>
    <span class="text-gray-400"> — company-owned internal capability. Natural satellite.</span>
  </div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-red-500 flex items-center justify-center text-xs font-bold flex-shrink-0">5</div>
  <div>
    <span class="font-semibold">Satellite</span>
    <span class="text-gray-400"> — third-party integration. Artificial satellite.</span>
  </div>
</div>

</div>

::right::

<div class="pl-8 mt-12 space-y-4 text-xs text-gray-400">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-200 mb-2">These names are illustrative.</p>
  <p>The LEBOSS reference model uses a spatial hierarchy to communicate ownership relationships. Implementations are not required to use these names internally.</p>
  <p class="mt-3">What matters is that the ownership hierarchy, data flow direction, and access governance requirements are present in the system — regardless of what the implementation calls them.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-3 mt-4">
  <p class="text-blue-300 text-xs">Universe → Galaxy → Star ↔ Planet → Moon / Satellite</p>
  <p class="mt-1 text-gray-500">Governing entity → brand → interface ↔ service → internal / external</p>
</div>

</div>

---

# Five Foundation Principles

<div class="grid grid-cols-1 gap-3 mt-4">

<div class="flex items-start gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="text-xl font-bold text-blue-400 min-w-8 text-center">1</div>
  <div>
    <span class="font-semibold">Clarity</span>
    <span class="text-gray-300 text-sm"> — Every element in a LEBOSS-governed system has a defined role and place. There is no ambiguity about what owns what.</span>
  </div>
</div>

<div class="flex items-start gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="text-xl font-bold text-purple-400 min-w-8 text-center">2</div>
  <div>
    <span class="font-semibold">Modularity</span>
    <span class="text-gray-300 text-sm"> — Capabilities are interchangeable. Switching one service provider does not require migrating everything else.</span>
  </div>
</div>

<div class="flex items-start gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="text-xl font-bold text-green-400 min-w-8 text-center">3</div>
  <div>
    <span class="font-semibold">Security</span>
    <span class="text-gray-300 text-sm"> — Data is separated by entity, access follows least privilege, and every governed action is auditable.</span>
  </div>
</div>

<div class="flex items-start gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="text-xl font-bold text-yellow-400 min-w-8 text-center">4</div>
  <div>
    <span class="font-semibold">Legacy & Continuity</span>
    <span class="text-gray-300 text-sm"> — Systems survive ownership transitions. When a business changes hands, the data environment transfers with it.</span>
  </div>
</div>

<div class="flex items-start gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="text-xl font-bold text-red-400 min-w-8 text-center">5</div>
  <div>
    <span class="font-semibold">Extensibility</span>
    <span class="text-gray-300 text-sm"> — New capabilities attach without disrupting existing ones. Growth does not require architectural rebuilds.</span>
  </div>
</div>

</div>

---
layout: two-cols
---

# Why This Matters

## For Businesses

<div class="space-y-4 mt-4 text-sm">

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Long-term control of operational data</strong>
    <p class="text-gray-400 mt-1">Your customer records, transaction history, and workflows remain yours — not held as leverage by a vendor.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Ability to change service providers</strong>
    <p class="text-gray-400 mt-1">A complete, portable export of your operational environment is a normative requirement — not a negotiating point.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Protection from platform lock-in</strong>
    <p class="text-gray-400 mt-1">Modular architecture means replacing one tool doesn't require replacing the entire stack.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Continuity over time</strong>
    <p class="text-gray-400 mt-1">Systems survive ownership changes, platform pivots, and vendor failures.</p>
  </div>
</div>

</div>

::right::

## For Developers

<div class="space-y-4 mt-4 pl-6 text-sm">

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">A clear governance model</strong>
    <p class="text-gray-400 mt-1">40 normative rules across six protocol groups — a precise implementation target with no ambiguity.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Modular system design</strong>
    <p class="text-gray-400 mt-1">Each service has a defined role, data boundary, and access surface. Systems are composable by design.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Predictable integration patterns</strong>
    <p class="text-gray-400 mt-1">Every third-party integration follows the same descriptor and access grant lifecycle. No one-off contract negotiation for data access.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Standardized operational data environments</strong>
    <p class="text-gray-400 mt-1">The Resource Model defines identifiable, namespaced, portable data units — enabling consistent tooling across implementations.</p>
  </div>
</div>

</div>

---
layout: center
class: text-center
---

# Learn More

<div class="grid grid-cols-2 gap-6 mt-8 max-w-2xl mx-auto text-left">

<div class="bg-white bg-opacity-10 rounded-xl p-5">
  <h3 class="font-semibold text-blue-300 mb-2">Architecture Deck</h3>
  <p class="text-sm text-gray-300 mb-4">The reference model in depth — governance objects, operational flow, data portability protocol, and the full normative architecture.</p>
  <code class="text-xs text-gray-400">presentations/slidev/architecture.md</code>
</div>

<div class="bg-white bg-opacity-10 rounded-xl p-5">
  <h3 class="font-semibold text-purple-300 mb-2">Governance Deck</h3>
  <p class="text-sm text-gray-300 mb-4">How the standard evolves — proposal lifecycle, versioning model, committee roles, conformance requirements, and how to contribute.</p>
  <code class="text-xs text-gray-400">presentations/slidev/governance.md</code>
</div>

</div>

<div class="mt-8 text-sm text-gray-400">
  Full specification: <strong class="text-white">github.com/jwogrady/leboss</strong>
</div>

---
layout: end
---

# LEBOSS

**Local Entrepreneur Business Operating System Standards**

<div class="mt-6 max-w-2xl mx-auto text-gray-200 leading-relaxed">
  LEBOSS defines how local businesses can retain ownership of the data that powers their companies.
</div>

<div class="mt-4 max-w-2xl mx-auto text-gray-400 text-sm leading-relaxed">
  Platforms can innovate freely — building better tools, better infrastructure, better interfaces — without taking ownership of the business's operational data environment.
</div>

<div class="mt-8 text-sm text-gray-500">
  Open standard · Open contribution · Open governance
  <br/>
  github.com/jwogrady/leboss · leboss.status26.com
</div>
