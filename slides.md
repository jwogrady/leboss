---
# Professional business theme
theme: seriph
# Clean background for business presentation
background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)'
# Center text for better presentation
class: 'text-center'
# Syntax highlighting
highlighter: shiki
# Line numbers in code blocks
lineNumbers: false
# Presentation metadata
info: |
  ## LEBOSS Core Principles
  A comprehensive framework for organizing, securing, and scaling local businesses.
# Use UnoCSS for styling
css: unocss
# Persist drawings
drawings:
  persist: false
# Wake lock for presentations
wakeLock: "build"
---

# **LEBOSS Core Principles**

**LEBOSS (Local Entrepreneur Business Operating System Standards)** is a universal framework for organizing, securing, and scaling local businesses.

<div class="pt-8">
  <span @click="$slidev.nav.next" class="px-4 py-2 rounded-lg cursor-pointer bg-white bg-opacity-20 hover:bg-opacity-30 transition-all duration-200">
    Begin Presentation <carbon:arrow-right class="inline ml-2"/>
  </span>
</div>

<div class="abs-br m-6 flex gap-2">
  <button @click="$slidev.nav.openInEditor()" title="Open in Editor" class="text-xl icon-btn opacity-50 !border-none !hover:text-white">
    <carbon:edit />
  </button>
</div>

---

# **Core Foundation Principles**

LEBOSS is built on five foundational principles that ensure business success:

<div class="grid grid-cols-1 gap-5 mt-8">

<div class="flex items-start gap-4">
  <div class="text-2xl font-bold text-blue-400 min-w-8">1.</div>
  <div>
    <h3 class="text-xl font-semibold mb-2">Clarity</h3>
    <p class="text-gray-300">Every part of the business—people, brands, workflows, and data—has a clearly defined role and place.</p>
  </div>
</div>

<div class="flex items-start gap-4">
  <div class="text-2xl font-bold text-blue-400 min-w-8">2.</div>
  <div>
    <h3 class="text-xl font-semibold mb-2">Modularity</h3>
    <p class="text-gray-300">Business operations and features are organized as interchangeable modules, so you can adapt and evolve as your needs change.</p>
  </div>
</div>

<div class="flex items-start gap-4">
  <div class="text-2xl font-bold text-blue-400 min-w-8">3.</div>
  <div>
    <h3 class="text-xl font-semibold mb-2">Security</h3>
    <p class="text-gray-300">Data is always separated by business entity, access follows least-privilege, and all actions are auditable.</p>
  </div>
</div>

</div>

---

# **Core Foundation Principles** (continued)

<div class="grid grid-cols-1 gap-5 mt-8">

<div class="flex items-start gap-4">
  <div class="text-2xl font-bold text-blue-400 min-w-8">4.</div>
  <div>
    <h3 class="text-xl font-semibold mb-2">Legacy & Continuity</h3>
    <p class="text-gray-300">Systems are designed for long-term resilience, easy ownership transitions, and succession planning.</p>
  </div>
</div>

<div class="flex items-start gap-4">
  <div class="text-2xl font-bold text-blue-400 min-w-8">5.</div>
  <div>
    <h3 class="text-xl font-semibold mb-2">Extensibility</h3>
    <p class="text-gray-300">New capabilities, workflows, and integrations can be added without disrupting existing business operations.</p>
  </div>
</div>

</div>

<div class="mt-10 text-center">
  <div class="inline-block px-6 py-3 bg-gradient-to-r from-blue-500 to-purple-600 rounded-lg">
    <strong>These principles form the foundation of the LEBOSS Cosmic Elements</strong>
  </div>
</div>

---
layout: section
---

# The LEBOSS Cosmic Elements

Six interconnected components (0-5) that organize your entire business ecosystem

---
layout: two-cols
---

# **0. Universe**

<div class="space-y-4">

<strong>Definition:</strong>
<p class="text-gray-300">The foundational business entity—this could be a person, a family, or a registered company.</p>

<strong>Role:</strong>
<p class="text-gray-300">Owns all other elements (brands, data, assets, permissions).</p>

<strong>Example:</strong>
<p class="text-blue-400 font-semibold">"The Patel Family Enterprises," "Smith & Sons LLC"</p>

</div>

::right::

<div class="pl-8 space-y-4">

<strong>Key Details:</strong>

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Controls overall system settings, legal info, and succession</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Manages ownership, succession, and high-level governance</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Can span multiple brands, DBAs, or legal ventures</p>
  </div>
</div>

</div>

---
layout: two-cols
---

# **1. Galaxy**

<div class="space-y-4">

<strong>Definition:</strong>
<p class="text-gray-300">Each individual brand, business, or venture owned by the Universe.</p>

<strong>Role:</strong>
<p class="text-gray-300">Organizes and separates different business lines, brands, or operating companies.</p>

<strong>Example:</strong>
<p class="text-blue-400 font-semibold">"Smith Plumbing," "Smith Electrical," and "Smith HVAC" as Galaxies under one Universe</p>

</div>

::right::

<div class="pl-8 space-y-4">

<strong>Key Details:</strong>

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-purple-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Has its own branding, assets, teams, and operational settings</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-purple-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Allows you to group related business entities for easier management and reporting</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-purple-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Enables clear distinction between ventures for legal, financial, and marketing purposes</p>
  </div>
</div>

</div>

---
layout: two-cols
---

# **2. Star**

<div class="space-y-4">

<strong>Definition:</strong>
<p class="text-gray-300">The customer experience—the interfaces where customers or stakeholders interact with your business, usually via web, mobile, or GUI interfaces.</p>

<strong>Role:</strong>
<p class="text-gray-300">Connects the outside world to your organization—this is where value is delivered and relationships are managed. The Star is what customers see and interact with.</p>

<strong>Example:</strong>
<p class="text-blue-400 font-semibold">Websites, customer portals, mobile apps, kiosks, or booking systems</p>

</div>

::right::

<div class="pl-8 space-y-4">

<strong>Key Details:</strong>

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-yellow-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Each Star is tailored to its target audience or purpose (public website vs. internal portal)</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-yellow-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Can support different branding, languages, and workflows per Galaxy or Universe</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-yellow-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Serves as the point of entry for customers, partners, and sometimes staff</p>
  </div>
</div>

</div>

---
layout: two-cols
---

# **3. Planet**

<div class="space-y-4">

<strong>Definition:</strong>
<p class="text-gray-300">The core APIs, data services, or backend systems that react to and orbit each Star.</p>

<strong>Role:</strong>
<p class="text-gray-300">Responds to and supports the technical functionality that Stars require—like appointment scheduling, order management, or customer databases. The Planet depends on the Star for life, but without a Planet, no one sees the Star.</p>

<strong>Example:</strong>
<p class="text-blue-400 font-semibold">Booking API, product inventory service, user authentication backend</p>

</div>

::right::

<div class="pl-8 space-y-4">

<strong>Key Details:</strong>

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-green-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>The Planet depends on the Star for life, but without a Planet, no one sees the Star</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-green-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Can be reused across multiple Stars or Galaxies</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-green-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Isolated so updates or changes don't break customer-facing interfaces</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-green-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>May be internal (private to your business) or external (partner APIs)</p>
  </div>
</div>

</div>

---
layout: two-cols
---

# **4. Moon**

<div class="space-y-4">

<strong>Definition:</strong>
<p class="text-gray-300">A natural satellite—modular business capabilities or internal workflows that orbit another body. Each "Moon" is a company-owned resource, like an internal API.</p>

<strong>Role:</strong>
<p class="text-gray-300">Adds functionality to the system, supporting sales, service, billing, HR, analytics, and more. As a natural satellite, Moons are company-owned resources that orbit Planets or Stars.</p>

<strong>Example:</strong>
<div class="text-blue-400 font-semibold space-y-1">
  <p>• "Apex" (sales/lead management)</p>
  <p>• "Epic" (service delivery & fulfillment)</p>
  <p>• "Aware" (accounting & billing)</p>
</div>

</div>

::right::

<div class="pl-8 space-y-4">

<strong>Key Details:</strong>

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-indigo-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Moons are natural satellites—company-owned resources (like internal APIs)</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-indigo-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Can be enabled, configured, or upgraded independently</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-indigo-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Access can be restricted by role, team, or business unit</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-indigo-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Moons may connect to Planets for data or workflows</p>
  </div>
</div>

</div>

---
layout: two-cols
---

# **5. Satellite**

<div class="space-y-4">

<strong>Definition:</strong>
<p class="text-gray-300">An artificial satellite—connections to third-party platforms and external services. Like a Moon, it orbits another body, but unlike a Moon, it's a managed resource outside the company.</p>

<strong>Role:</strong>
<p class="text-gray-300">Brings outside data in, or pushes your data out—keeping all your profiles and tools in sync. As an artificial satellite, these are managed resources outside the company that orbit your business ecosystem.</p>

<strong>Example:</strong>
<p class="text-blue-400 font-semibold">Integrations with Facebook Ads, Google Business, QuickBooks, Yelp, Stripe, Zapier, etc.</p>

</div>

::right::

<div class="pl-8 space-y-4">

<strong>Key Details:</strong>

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Satellites are artificial satellites—managed resources outside the company</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Each Satellite is focused on one external platform or data source</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Satellites can be enabled or disabled as needed for compliance or strategy</p>
  </div>
  
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-red-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>They ensure all external touchpoints and listings stay consistent with your business data</p>
  </div>
</div>

</div>

---

# **LEBOSS Elements Summary**

<div class="overflow-hidden rounded-lg shadow-lg mt-4">

| Cosmic Element | What It Represents | Example |
|:---:|:---|:---|
| 🌐 **Universe** | Root owner (family/business) | Smith & Sons LLC |
| 🌌 **Galaxy** | Brand/business under Universe | Smith Plumbing, Smith HVAC |
| ⭐ **Star** | Customer experience (web, mobile, GUI interfaces) | smithplumbing.com, booking app |
| 🪐 **Planet** | Core API/service that reacts to and orbits a Star | Appointment API, order DB |
| 🌙 **Moon** | Natural satellite—company-owned resource (like internal API) | Sales, Service, Billing, Analytics |
| 🛰️ **Satellite** | Artificial satellite—managed resource outside company | Google Places, Facebook, QuickBooks |

</div>

<div class="mt-6 text-center">
  <div class="inline-block px-6 py-3 bg-gradient-to-r from-blue-600 to-purple-700 rounded-lg">
    <p class="text-sm font-semibold">Each element has a clear purpose and works together to create a cohesive business ecosystem</p>
  </div>
</div>

---
layout: center
class: text-center
---

# **LEBOSS Framework Benefits**

<div class="space-y-5 mt-10">

<div class="text-xl font-semibold text-blue-400">
✨ <strong>Clear Organization</strong> — Every part of your business has its place
</div>

<div class="text-xl font-semibold text-purple-400">
🔒 <strong>Enhanced Security</strong> — Data protection and access control built-in
</div>

<div class="text-xl font-semibold text-green-400">
📈 <strong>Scalable Growth</strong> — Add capabilities without disrupting operations
</div>

<div class="text-xl font-semibold text-yellow-400">
🔄 <strong>Future-Proof Design</strong> — Adapt and evolve without chaos or lock-in
</div>

</div>

<div class="mt-10 text-xl font-bold">
LEBOSS gives every part of your business a clear place, supports security and growth, and enables you to adapt and evolve—without chaos or lock-in.
</div>

---
layout: end
---

# Thank You

<strong>Questions & Discussion</strong>

<div class="mt-8 text-center opacity-75">
LEBOSS Framework - Organizing Business Excellence
</div>