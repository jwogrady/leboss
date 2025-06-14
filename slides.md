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

**LEBOSS (Local Entrepreneur Business Operating Standards)** is a universal framework for organizing, securing, and scaling local businesses.

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

<div class="grid grid-cols-1 gap-6 mt-8">

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

<div class="grid grid-cols-1 gap-6 mt-8">

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

<div class="mt-12 text-center">
  <div class="inline-block px-6 py-3 bg-gradient-to-r from-blue-500 to-purple-600 rounded-lg">
    <strong>These principles form the foundation of the LEBOSS Cosmic Elements</strong>
  </div>
</div>

---
layout: section
---

# The LEBOSS Cosmic Elements

Six interconnected components that organize your entire business ecosystem

---
layout: two-cols
---

# **1. Universe**

<div class="space-y-4">

**Definition:**
<p class="text-gray-300">The foundational business entity—this could be a person, a family, or a registered company.</p>

**Role:**
<p class="text-gray-300">Owns all other elements (brands, data, assets, permissions).</p>

**Example:**
<p class="text-blue-400 font-semibold">"The Patel Family Enterprises," "Smith & Sons LLC"</p>

</div>

::right::

<div class="pl-8 space-y-4">

**Key Details:**

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

# **2. Galaxy**

<div class="space-y-4">

**Definition:**
<p class="text-gray-300">Each individual brand, business, or venture owned by the Universe.</p>

**Role:**
<p class="text-gray-300">Organizes and separates different business lines, brands, or operating companies.</p>

**Example:**
<p class="text-blue-400 font-semibold">"Smith Plumbing," "Smith Electrical," and "Smith HVAC" as Galaxies under one Universe</p>

</div>

::right::

<div class="pl-8 space-y-4">

**Key Details:**

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

# **3. Star**

<div class="space-y-4">

**Definition:**
<p class="text-gray-300">The interfaces where customers or stakeholders interact with your business.</p>

**Role:**
<p class="text-gray-300">Connects the outside world to your organization—this is where value is delivered and relationships are managed.</p>

**Example:**
<p class="text-blue-400 font-semibold">Websites, customer portals, mobile apps, kiosks, or booking systems</p>

</div>

::right::

<div class="pl-8 space-y-4">

**Key Details:**

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

# **4. Planet**

<div class="space-y-4">

**Definition:**
<p class="text-gray-300">The core APIs, data services, or backend systems that power each Star.</p>

**Role:**
<p class="text-gray-300">Provides the technical functionality that Stars rely on—like appointment scheduling, order management, or customer databases.</p>

**Example:**
<p class="text-blue-400 font-semibold">Booking API, product inventory service, user authentication backend</p>

</div>

::right::

<div class="pl-8 space-y-4">

**Key Details:**

<div class="space-y-3 text-sm">
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

# **5. Moon**

<div class="space-y-4">

**Definition:**
<p class="text-gray-300">Modular business capabilities or internal workflows—each "Moon" is a feature, process, or operational tool.</p>

**Role:**
<p class="text-gray-300">Adds functionality to the system, supporting sales, service, billing, HR, analytics, and more.</p>

**Example:**
<div class="text-blue-400 font-semibold space-y-1">
  <p>• "Apex" (sales/lead management)</p>
  <p>• "Epic" (service delivery & fulfillment)</p>
  <p>• "Aware" (accounting & billing)</p>
</div>

</div>

::right::

<div class="pl-8 space-y-4">

**Key Details:**

<div class="space-y-3 text-sm">
  <div class="flex items-start gap-2">
    <div class="w-2 h-2 bg-indigo-400 rounded-full mt-2 flex-shrink-0"></div>
    <p>Moons can be enabled, configured, or upgraded independently</p>
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

# **6. Satellite**

<div class="space-y-4">

**Definition:**
<p class="text-gray-300">Connections to third-party platforms and external services.</p>

**Role:**
<p class="text-gray-300">Brings outside data in, or pushes your data out—keeping all your profiles and tools in sync.</p>

**Example:**
<p class="text-blue-400 font-semibold">Integrations with Facebook Ads, Google Business, QuickBooks, Yelp, Stripe, Zapier, etc.</p>

</div>

::right::

<div class="pl-8 space-y-4">

**Key Details:**

<div class="space-y-3 text-sm">
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

<div class="overflow-hidden rounded-lg shadow-lg">

| Cosmic Element | What It Represents | Example |
|:---:|:---|:---|
| 🌌 **Universe** | Root owner (family/business) | Smith & Sons LLC |
| 🌠 **Galaxy** | Brand/business under Universe | Smith Plumbing, Smith HVAC |  
| ⭐ **Star** | Customer/stakeholder interface | smithplumbing.com, booking app |
| 🪐 **Planet** | Core API/service powering a Star | Appointment API, order DB |
| 🌙 **Moon** | Feature module/operational tool | Sales, Service, Billing, Analytics |
| 🛰️ **Satellite** | Third-party integration | Google Places, Facebook, QuickBooks |

</div>

<div class="mt-8 text-center">
  <div class="inline-block px-8 py-4 bg-gradient-to-r from-blue-600 to-purple-700 rounded-xl">
    <p class="text-lg font-semibold">Each element has a clear purpose and works together to create a cohesive business ecosystem</p>
  </div>
</div>

---
layout: center
class: text-center
---

# **LEBOSS Framework Benefits**

<div class="space-y-6 mt-12">

<div class="text-xl font-semibold text-blue-400">
✨ **Clear Organization** — Every part of your business has its place
</div>

<div class="text-xl font-semibold text-purple-400">
🔒 **Enhanced Security** — Data protection and access control built-in
</div>

<div class="text-xl font-semibold text-green-400">
📈 **Scalable Growth** — Add capabilities without disrupting operations
</div>

<div class="text-xl font-semibold text-yellow-400">
🔄 **Future-Proof Design** — Adapt and evolve without chaos or lock-in
</div>

</div>

<div class="mt-12 text-2xl font-bold">
**LEBOSS gives every part of your business a clear place, supports security and growth, and enables you to adapt and evolve—without chaos or lock-in.**
</div>

---
layout: end
---

# Thank You

**Questions & Discussion**

<div class="mt-8 text-center opacity-75">
LEBOSS Framework - Organizing Business Excellence
</div>