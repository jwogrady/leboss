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
routerMode: 'history'
defaults:
  scrollable: true
---

<div class="absolute top-4 right-6 text-sm opacity-70 flex gap-4">
  <a href="/" class="hover:opacity-100 transition-opacity">Overview</a>
  <a href="/architecture/" class="hover:opacity-100 transition-opacity">Architecture</a>
  <a href="/governance/" class="hover:opacity-100 transition-opacity">Governance</a>
</div>

# **LEBOSS**

### Local Entrepreneur Business Operating System Standards

<div class="pt-6 text-xl text-gray-200">
  Restoring operational data ownership to local businesses.
</div>

<div class="pt-8">
  <span @click="$slidev.nav.next" class="px-4 py-2 rounded-lg cursor-pointer bg-white bg-opacity-20 hover:bg-opacity-30 transition-all duration-200">
    Begin <carbon:arrow-right class="inline ml-2"/>
  </span>
</div>

---
layout: center
class: text-center
---

# The Digital Business Reality

<div class="mt-6 max-w-xl mx-auto text-left space-y-3">

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="w-2 h-2 bg-blue-400 rounded-full flex-shrink-0"></div>
  <span class="text-sm">Customer relationships</span>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="w-2 h-2 bg-purple-400 rounded-full flex-shrink-0"></div>
  <span class="text-sm">Marketing performance</span>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="w-2 h-2 bg-green-400 rounded-full flex-shrink-0"></div>
  <span class="text-sm">Service workflows</span>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg p-4">
  <div class="w-2 h-2 bg-yellow-400 rounded-full flex-shrink-0"></div>
  <span class="text-sm">Operational history</span>
</div>

</div>

<div class="mt-8 text-base text-gray-300 max-w-lg mx-auto">
  This data becomes the <strong class="text-white">operational memory of the business</strong> — the record of everything it has built.
</div>

---
layout: center
class: text-center
---

# Where That Data Lives

<div class="mt-6 max-w-2xl mx-auto">

<div class="text-sm text-gray-400 mb-8">In most modern SaaS systems:</div>

<div class="flex flex-col items-center gap-0">
  <div class="w-28 h-28 rounded-full bg-white bg-opacity-10 flex flex-col items-center justify-center text-center">
    <div class="text-xs text-gray-400 leading-tight">You</div>
    <div class="font-semibold text-sm">Business</div>
  </div>
  <div class="text-gray-500 text-lg py-1">↓</div>
  <div class="w-28 h-28 rounded-full bg-red-900 bg-opacity-40 border-2 border-red-600 flex flex-col items-center justify-center text-center px-2">
    <div class="text-xs text-red-400 leading-tight">Vendor controls</div>
    <div class="font-semibold text-sm text-red-300">Platform</div>
  </div>
  <div class="text-gray-500 text-lg py-1">↓</div>
  <div class="w-28 h-28 rounded-full bg-red-900 bg-opacity-40 border-2 border-red-600 flex flex-col items-center justify-center text-center px-2">
    <div class="text-xs text-red-400 leading-tight">Vendor holds</div>
    <div class="font-semibold text-sm text-red-300">Data</div>
  </div>
</div>

<div class="mt-8 text-sm text-gray-400 max-w-md mx-auto">
  Most operational data environments exist inside <strong class="text-white">vendor-controlled systems</strong> — not systems the business owns.
</div>

</div>

---
layout: center
class: text-center
---

# The Hidden Consequence

<div class="mt-6 max-w-2xl mx-auto space-y-5">

<div class="bg-red-900 bg-opacity-30 border border-red-700 rounded-xl p-5 text-left">
  <div class="text-red-300 font-semibold mb-2">The platform controls the environment</div>
  <p class="text-sm text-gray-300">Data structure, storage format, integration access, and migration capabilities are all governed by the platform — not by the business.</p>
</div>

<div class="bg-red-900 bg-opacity-30 border border-red-700 rounded-xl p-5 text-left">
  <div class="text-red-300 font-semibold mb-2">Changing providers becomes difficult</div>
  <p class="text-sm text-gray-300">Exports are often partial. Configurations, integration history, and audit trails rarely transfer. Starting over means losing the operational record.</p>
</div>

<div class="bg-yellow-900 bg-opacity-30 border border-yellow-700 rounded-xl p-5 text-left">
  <div class="text-yellow-300 font-semibold mb-2">The operational memory of the business becomes platform-dependent</div>
  <p class="text-sm text-gray-300">The business continues to generate data, but control over that data — and the cost of leaving — grows over time.</p>
</div>

</div>

---
layout: center
class: text-center
---

# The Key Question

<div class="mt-10 max-w-2xl mx-auto">

<div class="text-2xl font-semibold text-white mb-10">
  Who should own the operational data environment of a business?
</div>

<div class="grid grid-cols-2 gap-6">

<div class="bg-green-900 bg-opacity-30 border-2 border-green-500 rounded-xl p-6">
  <div class="text-3xl mb-3">🏢</div>
  <div class="font-semibold text-green-300 mb-2">The business</div>
  <div class="text-sm text-gray-400">that creates the data, serves the customers, and depends on it to operate</div>
</div>

<div class="bg-white bg-opacity-5 border border-gray-600 rounded-xl p-6">
  <div class="text-3xl mb-3">🏭</div>
  <div class="font-semibold text-gray-400 mb-2">The platform</div>
  <div class="text-sm text-gray-500">that provides the software and stores the data on the business's behalf</div>
</div>

</div>

<div class="mt-8 text-sm text-gray-400">
  LEBOSS has a clear answer.
</div>

</div>

---
layout: center
class: text-center
---

# The LEBOSS Idea

<div class="mt-4 max-w-3xl mx-auto">

<div class="grid grid-cols-2 gap-8 text-left">

<div class="space-y-4">
  <div class="text-sm font-semibold text-red-400 mb-3">Traditional SaaS</div>
  <div class="flex flex-col items-center gap-0">
    <div class="w-20 h-20 rounded-full bg-white bg-opacity-10 flex items-center justify-center text-sm font-semibold">Business</div>
    <div class="text-gray-500 text-sm py-0.5">↓</div>
    <div class="w-20 h-20 rounded-full bg-red-900 bg-opacity-40 border-2 border-red-600 flex flex-col items-center justify-center text-xs text-center text-red-300 px-1"><span class="font-semibold">Platform</span><span>owns</span></div>
    <div class="text-gray-500 text-sm py-0.5">↓</div>
    <div class="w-20 h-20 rounded-full bg-red-900 bg-opacity-40 border-2 border-red-600 flex items-center justify-center text-sm font-semibold text-red-300">Data</div>
  </div>
  <div class="text-xs text-gray-500 mt-2 text-center">Control flows down — away from the business.</div>
</div>

<div class="space-y-4">
  <div class="text-sm font-semibold text-green-400 mb-3">LEBOSS</div>
  <div class="flex flex-col items-center gap-0">
    <div class="w-20 h-20 rounded-full bg-white bg-opacity-10 flex items-center justify-center text-sm font-semibold">Business</div>
    <div class="text-gray-400 text-xs py-0.5">↓ owns</div>
    <div class="w-24 h-24 rounded-full bg-green-900 bg-opacity-40 border-2 border-green-500 flex items-center justify-center text-xs text-center text-green-300 font-semibold px-2">Data Environment</div>
    <div class="text-blue-400 text-xs py-0.5">↑ serves</div>
    <div class="w-20 h-20 rounded-full bg-blue-900 bg-opacity-40 border border-blue-500 flex items-center justify-center text-xs text-center text-blue-300 px-2">Platform Services</div>
  </div>
  <div class="text-xs text-gray-500 mt-2 text-center">The business owns the environment. Platforms operate on top of it.</div>
</div>

</div>

<div class="mt-8 text-sm text-gray-400">
  LEBOSS makes this inversion <strong class="text-blue-300">architectural</strong> — built into the structure of systems, not just written into contracts.
</div>

</div>

---
layout: center
class: text-center
---

# The Governance Problem

<div class="mt-8 max-w-xl mx-auto space-y-5">

<div class="bg-white bg-opacity-5 rounded-xl p-5 text-left">
  <div class="text-gray-200 font-semibold mb-2">Ownership requires enforceable governance</div>
  <p class="text-sm text-gray-400">Declaring that a business owns its data is not enough. Without defined rules for access, integrations, and portability, operational control drifts toward the platform layer.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-xl p-5 text-left">
  <div class="text-gray-200 font-semibold mb-2">Without governance, the architecture reverts</div>
  <p class="text-sm text-gray-400">Platforms accumulate access. Integrations acquire data without declared scope. Audit trails disappear. Portability shrinks. The LEBOSS model requires structural rules to hold.</p>
</div>

<div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-xl p-5 text-left">
  <div class="text-blue-300 font-semibold mb-2">LEBOSS defines a governance model for operational data environments</div>
  <p class="text-sm text-gray-300">A formal set of objects, protocols, and rules that keep the business in control — regardless of which platforms it uses.</p>
</div>

</div>

---

# How LEBOSS Works

<div class="grid grid-cols-2 gap-6 mt-2">

<div class="flex justify-center items-center">
<CosmicSystem
  center-label="Governing Entity"
  center-sub="Business Owner"
  :center-size="72"
  :width="300"
  :height="300"
  :starfield="false"
  :show-connectors="true"
  :orbits="[
    {
      radius: 108,
      nodes: [
        { label: 'Resources', size: 52, color: 'rgba(147,51,234,0.35)', borderColor: 'rgba(192,132,252,0.8)' },
        { label: 'Access Grants', size: 52, color: 'rgba(34,197,94,0.35)', borderColor: 'rgba(74,222,128,0.8)' },
        { label: 'Integrations', size: 52, color: 'rgba(234,179,8,0.35)', borderColor: 'rgba(250,204,21,0.8)' },
        { label: 'Audit Records', size: 52, color: 'rgba(239,68,68,0.35)', borderColor: 'rgba(248,113,113,0.8)' },
        { label: 'Data Portability', size: 52, color: 'rgba(99,102,241,0.35)', borderColor: 'rgba(129,140,248,0.8)' }
      ]
    }
  ]"
/>
</div>

<div class="space-y-4 text-sm mt-2">

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Business ownership</strong>
    <p class="text-xs text-gray-400 mt-0.5">The governing entity is the source of all authorization. No data operation proceeds without an explicit grant.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Transparent access control</strong>
    <p class="text-xs text-gray-400 mt-0.5">Every party touching business data holds an explicit, scoped, revocable Access Grant.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-red-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-red-300">Auditability</strong>
    <p class="text-xs text-gray-400 mt-0.5">Every governed action produces an immutable Audit Record the business can read at any time.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-indigo-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-indigo-300">Portability</strong>
    <p class="text-xs text-gray-400 mt-0.5">The complete environment — data, grants, integrations, audit history — is exportable on demand.</p>
  </div>
</div>

</div>

</div>

---
layout: two-cols
---

# Reference Architecture

<div class="text-xs text-yellow-300 mb-5 bg-yellow-900 bg-opacity-30 border border-yellow-700 rounded px-3 py-2">
  Illustrative names — implementations may use different terminology.
</div>

<div class="space-y-3 text-sm">

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-blue-500 flex items-center justify-center text-xs font-bold flex-shrink-0">0</div>
  <div><span class="font-semibold">Universe</span><span class="text-gray-400"> — governing entity. Root owner.</span></div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-purple-500 flex items-center justify-center text-xs font-bold flex-shrink-0">1</div>
  <div><span class="font-semibold">Galaxy</span><span class="text-gray-400"> — brand or business line.</span></div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-yellow-500 flex items-center justify-center text-xs font-bold flex-shrink-0">2</div>
  <div><span class="font-semibold">Star</span><span class="text-gray-400"> — customer-facing interface.</span></div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-green-500 flex items-center justify-center text-xs font-bold flex-shrink-0">3</div>
  <div><span class="font-semibold">Planet</span><span class="text-gray-400"> — backend service. Holds primary operational data.</span></div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-indigo-500 flex items-center justify-center text-xs font-bold flex-shrink-0">4</div>
  <div><span class="font-semibold">Moon</span><span class="text-gray-400"> — company-owned internal capability.</span></div>
</div>

<div class="flex items-center gap-3">
  <div class="w-8 h-8 rounded-full bg-red-500 flex items-center justify-center text-xs font-bold flex-shrink-0">5</div>
  <div><span class="font-semibold">Satellite</span><span class="text-gray-400"> — third-party integration.</span></div>
</div>

</div>

::right::

<div class="pl-8 mt-14 space-y-4 text-sm text-gray-400">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p>These terms describe system <strong class="text-gray-200">relationships</strong> — who owns what, what serves what, and where data sovereignty risk concentrates.</p>
  <p class="mt-3">Implementations are not required to use these names. What matters is that the hierarchy and governance obligations they define are present in the system.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-3 text-xs">
  <p class="text-blue-300">Universe → Galaxy → Star ↔ Planet</p>
  <p class="mt-1 text-gray-500">governing entity → brand → interface ↔ service</p>
  <p class="mt-2 text-blue-300">Moon (internal) · Satellite (third-party)</p>
  <p class="mt-1 text-gray-500">owned capability · external integration</p>
</div>

</div>

---

# Five Foundation Principles

<div class="grid grid-cols-1 gap-3 mt-4">

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg px-5 py-3">
  <div class="text-lg font-bold text-blue-400 w-6 text-center flex-shrink-0">1</div>
  <div><span class="font-semibold">Clarity</span><span class="text-gray-400 text-sm"> — every element has a defined role and place. No ambiguity about what owns what.</span></div>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg px-5 py-3">
  <div class="text-lg font-bold text-purple-400 w-6 text-center flex-shrink-0">2</div>
  <div><span class="font-semibold">Modularity</span><span class="text-gray-400 text-sm"> — capabilities are interchangeable. Replacing one provider does not cascade through the system.</span></div>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg px-5 py-3">
  <div class="text-lg font-bold text-green-400 w-6 text-center flex-shrink-0">3</div>
  <div><span class="font-semibold">Security</span><span class="text-gray-400 text-sm"> — data separated by entity, least-privilege access, all governed actions auditable.</span></div>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg px-5 py-3">
  <div class="text-lg font-bold text-yellow-400 w-6 text-center flex-shrink-0">4</div>
  <div><span class="font-semibold">Legacy & Continuity</span><span class="text-gray-400 text-sm"> — systems survive ownership transitions. Business data transfers with the business.</span></div>
</div>

<div class="flex items-center gap-4 bg-white bg-opacity-5 rounded-lg px-5 py-3">
  <div class="text-lg font-bold text-red-400 w-6 text-center flex-shrink-0">5</div>
  <div><span class="font-semibold">Extensibility</span><span class="text-gray-400 text-sm"> — new capabilities attach without disrupting existing ones. Growth does not require rebuilds.</span></div>
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
    <p class="text-gray-400 text-xs mt-1">Customer records, workflows, and history belong to the business — not held as platform leverage.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Ability to change service providers</strong>
    <p class="text-gray-400 text-xs mt-1">A complete portable export of the operational environment is a normative requirement — not a negotiating point.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Protection from platform lock-in</strong>
    <p class="text-gray-400 text-xs mt-1">Modular architecture means replacing one tool does not require replacing everything.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-green-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-green-300">Durable business systems</strong>
    <p class="text-gray-400 text-xs mt-1">Systems designed under LEBOSS survive ownership changes, vendor pivots, and platform failures.</p>
  </div>
</div>

</div>

::right::

## For Developers

<div class="space-y-4 mt-4 pl-6 text-sm">

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Clear governance model</strong>
    <p class="text-gray-400 text-xs mt-1">A comprehensive set of normative rules across multiple protocol groups — a precise implementation target.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Predictable integration patterns</strong>
    <p class="text-gray-400 text-xs mt-1">Every third-party integration follows the same descriptor and access grant lifecycle.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Modular system architecture</strong>
    <p class="text-gray-400 text-xs mt-1">Each service has a defined role, data boundary, and access surface. Systems are composable by design.</p>
  </div>
</div>

<div class="flex items-start gap-3">
  <div class="w-2 h-2 bg-blue-400 rounded-full mt-1.5 flex-shrink-0"></div>
  <div>
    <strong class="text-blue-300">Portable data environments</strong>
    <p class="text-gray-400 text-xs mt-1">The Resource Model defines identifiable, namespaced, portable data units — consistent across implementations.</p>
  </div>
</div>

</div>

---
layout: center
class: text-center
---

# Explore the LEBOSS Standard

<div class="mt-6 max-w-2xl mx-auto text-sm text-gray-400">
  The standard is organized into three presentation decks. Choose your starting point.
</div>

<div class="grid grid-cols-2 gap-6 mt-8 max-w-2xl mx-auto text-left">

<div class="bg-blue-900 bg-opacity-30 border border-blue-700 rounded-xl p-5">
  <h3 class="font-semibold text-blue-300 mb-1">Architecture</h3>
  <p class="text-xs text-gray-400 mb-4">Reference model, governance objects, operational flow. For developers and system architects.</p>
  <a href="/architecture/" class="inline-block px-5 py-2 bg-blue-600 hover:bg-blue-500 rounded-lg text-sm font-medium text-white transition-colors">
    Architecture Deep Dive →
  </a>
</div>

<div class="bg-purple-900 bg-opacity-30 border border-purple-700 rounded-xl p-5">
  <h3 class="font-semibold text-purple-300 mb-1">Governance</h3>
  <p class="text-xs text-gray-400 mb-4">Proposal lifecycle, versioning model, committee roles. For contributors and implementers.</p>
  <a href="/governance/" class="inline-block px-5 py-2 bg-purple-600 hover:bg-purple-500 rounded-lg text-sm font-medium text-white transition-colors">
    Governance Model →
  </a>
</div>

</div>

<div class="mt-8 text-sm text-gray-500">
  Full specification: <strong class="text-gray-300">github.com/jwogrady/leboss</strong>
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
  Platforms can innovate freely — building better tools, better infrastructure, better interfaces — without owning the business's operational environment.
</div>

<div class="mt-8 text-sm text-gray-500">
  Open standard · Open contribution · Open governance
  <br/>
  github.com/jwogrady/leboss · leboss.status26.com
</div>
