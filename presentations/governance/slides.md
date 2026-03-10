---
theme: seriph
background: 'linear-gradient(135deg, #0d1b2a 0%, #1b2838 50%, #2d3561 100%)'
class: 'text-center'
highlighter: shiki
lineNumbers: false
info: |
  ## LEBOSS Governance
  Proposal lifecycle, versioning, committee, and conformance.
  github.com/jwogrady/leboss
css: unocss
drawings:
  persist: false
wakeLock: 'build'
---

# **LEBOSS Governance**

### How the standard evolves

<div class="pt-8 text-gray-400">
  For contributors, maintainers, committee members, and implementers
</div>

<div class="pt-6">
  <span @click="$slidev.nav.next" class="px-4 py-2 rounded-lg cursor-pointer bg-white bg-opacity-10 hover:bg-opacity-20 transition-all duration-200">
    Begin <carbon:arrow-right class="inline ml-2"/>
  </span>
</div>

---
layout: center
class: text-center
---

# Why Governance Matters

<div class="mt-8 max-w-2xl mx-auto text-left space-y-5">

<div class="bg-white bg-opacity-5 rounded-lg p-5">
  <p class="text-gray-300">A standard that cannot be challenged is not a standard — it is a decree. LEBOSS is designed to evolve as implementers discover where it is wrong, incomplete, or silent.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-5">
  <p class="text-gray-300">The governance model exists to make that evolution <strong class="text-white">deterministic</strong> and <strong class="text-white">auditable</strong>. Every change has a proposal, a rationale, and a committee record. The change history is permanent and public.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-5">
  <p class="text-gray-300">Implementers can rely on a specific version of the standard. When the standard changes, they can read exactly why it changed and evaluate whether the change affects their implementation.</p>
</div>

</div>

---

# The Proposal Lifecycle

<div class="mt-8">

<div class="flex items-center gap-0 justify-center">

<div class="flex flex-col items-center">
  <div class="w-32 h-20 bg-blue-700 rounded-l-xl flex items-center justify-center text-center p-2">
    <div>
      <div class="font-bold text-sm">Proposal</div>
      <div class="text-xs text-blue-200 mt-1">PR opened</div>
    </div>
  </div>
</div>

<div class="text-gray-500 text-2xl px-1">→</div>

<div class="flex flex-col items-center">
  <div class="w-32 h-20 bg-purple-700 flex items-center justify-center text-center p-2">
    <div>
      <div class="font-bold text-sm">Draft</div>
      <div class="text-xs text-purple-200 mt-1">Committee review begins</div>
    </div>
  </div>
</div>

<div class="text-gray-500 text-2xl px-1">→</div>

<div class="flex flex-col items-center">
  <div class="w-32 h-20 bg-indigo-700 flex items-center justify-center text-center p-2">
    <div>
      <div class="font-bold text-sm">Committee Vote</div>
      <div class="text-xs text-indigo-200 mt-1">Member ratification</div>
    </div>
  </div>
</div>

<div class="text-gray-500 text-2xl px-1">→</div>

<div class="flex flex-col items-center">
  <div class="w-32 h-20 bg-green-700 rounded-r-xl flex items-center justify-center text-center p-2">
    <div>
      <div class="font-bold text-sm">Published</div>
      <div class="text-xs text-green-200 mt-1">Immutable</div>
    </div>
  </div>
</div>

</div>

<div class="grid grid-cols-4 gap-1 mt-4 text-xs text-gray-400">
  <div class="text-center px-2">Any pull request against the repository introducing or modifying specification content. Z version increments.</div>
  <div class="text-center px-2">A Proposal accepted by the committee for formal review. 14-day minimum discussion period applies.</div>
  <div class="text-center px-2">A Draft advanced for member ratification. Y version increments. 14-day minimum vote period.</div>
  <div class="text-center px-2">A ratified version. X version increments. The document is immutable at this state.</div>
</div>

</div>

---

# Stage 1 — Proposal

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-blue-900 bg-opacity-40 border border-blue-500 rounded-lg p-4">
  <p class="font-semibold text-blue-300 mb-2">What it is</p>
  <p class="text-gray-300">Any pull request against the repository that introduces or modifies specification content. Proposals are open to any contributor.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Proposal PR template</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <strong>Summary</strong> — what changes and why</li>
    <li>• <strong>Motivation</strong> — what the current standard fails to address</li>
    <li>• <strong>Specification Changes</strong> — exact documents and sections</li>
    <li>• <strong>Impact Assessment</strong> — affected elements and provisions</li>
    <li>• <strong>Backward Compatibility</strong> — breaking change or not</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Branch convention</p>
  <code class="text-blue-300">proposal/X.Y.Z</code>
  <p class="text-gray-400 mt-2">where <code>Z</code> is the next draft version number. Branch from <code>master</code>.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Proposal directory</p>
  <p class="text-gray-400">Each proposal creates <code class="text-blue-300">proposals/X.Y.Z/proposal.md</code> — a permanent record of scope, motivation, and rationale. Future implementers rely on this context.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Commit convention</p>
  <code class="text-blue-300 text-xs">type(scope): description</code>
  <p class="text-gray-400 mt-1">Types: feat, docs, fix, chore. Follows Conventional Commits.</p>
</div>

</div>

</div>

---

# Stage 2 — Draft

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-purple-900 bg-opacity-40 border border-purple-500 rounded-lg p-4">
  <p class="font-semibold text-purple-300 mb-2">What it is</p>
  <p class="text-gray-300">A Proposal accepted by the committee for formal review. Acceptance means the committee considers the problem statement valid and the proposal worthy of structured evaluation.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Requirements</p>
  <ul class="text-gray-400 space-y-1">
    <li>• 14-day minimum discussion period</li>
    <li>• Open to community comment during this period</li>
    <li>• Proposal author may revise in response to feedback</li>
    <li>• Committee may request revision before advancing</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">What happens during Draft</p>
  <ul class="text-gray-400 space-y-2">
    <li>• Committee members review specification changes in detail</li>
    <li>• Community raises concerns, asks questions, proposes alternatives</li>
    <li>• Backward compatibility implications are evaluated</li>
    <li>• The committee determines whether to advance to Committee Vote</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Rejection</p>
  <p class="text-gray-400">A proposal may be closed without advancement if the committee determines the problem is out of scope, already addressed, or the proposed solution creates more problems than it resolves. Rejection requires a written rationale.</p>
</div>

</div>

</div>

---

# Stage 3 — Committee Vote

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-indigo-900 bg-opacity-40 border border-indigo-500 rounded-lg p-4">
  <p class="font-semibold text-indigo-300 mb-2">What it is</p>
  <p class="text-gray-300">A Draft advanced for formal member ratification. This is the highest stage of active review before a version is Published.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Requirements</p>
  <ul class="text-gray-400 space-y-1">
    <li>• 14-day minimum vote period</li>
    <li>• All committee members are notified</li>
    <li>• Public announcement of the vote</li>
    <li>• Vote record is documented permanently</li>
  </ul>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">The Y version increment</p>
  <p class="text-gray-400">A proposal advanced to Committee Vote increments the middle version number. <code class="text-blue-300">0.0.x</code> draft series advances to <code class="text-blue-300">0.1.0</code>, then to <code class="text-blue-300">0.2.0</code>, etc. This signals to implementers that the proposal has cleared committee review.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Outcome</p>
  <ul class="text-gray-400 space-y-1">
    <li>• <strong class="text-green-300">Approved</strong> → merges to master, version Published</li>
    <li>• <strong class="text-yellow-300">Returned</strong> → sent back to Draft with required revisions</li>
    <li>• <strong class="text-red-300">Rejected</strong> → closed with documented rationale</li>
  </ul>
</div>

</div>

</div>

---

# Stage 4 — Published

<div class="grid grid-cols-2 gap-8 mt-6">

<div class="space-y-4 text-sm">

<div class="bg-green-900 bg-opacity-40 border border-green-500 rounded-lg p-4">
  <p class="font-semibold text-green-300 mb-2">What it is</p>
  <p class="text-gray-300">A ratified version of the standard. Immutable. The X version increments. A Published version represents the committee's consensus that this version is correct and complete enough for implementation.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Immutability</p>
  <p class="text-gray-400">A Published version is never modified. Errors discovered after publication are addressed in a subsequent proposal. Published versions are permanently archived in the proposals directory.</p>
</div>

</div>

<div class="space-y-4 text-sm">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Implementers can rely on it</p>
  <p class="text-gray-400">A Published version is a stable implementation target. Systems built against a Published version are compliant with that version regardless of subsequent draft changes.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <p class="font-semibold text-gray-300 mb-2">Git tag</p>
  <p class="text-gray-400">Each Published version is tagged on <code class="text-green-300">master</code>:</p>
  <code class="text-xs text-green-300 block mt-2">git tag -a v1.0.0 -m "LEBOSS 1.0.0 — Published"</code>
</div>

</div>

</div>

---

# Versioning Model

<div class="mt-6">

<div class="grid grid-cols-3 gap-4 mb-8">

<div class="bg-blue-900 bg-opacity-40 border border-blue-500 rounded-xl p-5 text-center">
  <div class="text-5xl font-bold text-blue-300 mb-2">Z</div>
  <div class="text-sm font-semibold mb-2">Draft</div>
  <div class="text-xs text-gray-400">Rightmost digit. Increments with each accepted Proposal. Working drafts open to community feedback.</div>
  <div class="mt-3 text-xs text-blue-300 font-mono">0.0.1 → 0.0.2 → 0.0.11</div>
</div>

<div class="bg-purple-900 bg-opacity-40 border border-purple-500 rounded-xl p-5 text-center">
  <div class="text-5xl font-bold text-purple-300 mb-2">Y</div>
  <div class="text-sm font-semibold mb-2">Committee Vote</div>
  <div class="text-xs text-gray-400">Middle digit. Increments when a Draft is advanced to Committee Vote. Signals implementer-viable stability.</div>
  <div class="mt-3 text-xs text-purple-300 font-mono">0.1.0 → 0.2.0</div>
</div>

<div class="bg-green-900 bg-opacity-40 border border-green-500 rounded-xl p-5 text-center">
  <div class="text-5xl font-bold text-green-300 mb-2">X</div>
  <div class="text-sm font-semibold mb-2">Published</div>
  <div class="text-xs text-gray-400">Leftmost digit. Increments on ratification. The immutable, community-subscribed standard.</div>
  <div class="mt-3 text-xs text-green-300 font-mono">1.0.0 → 2.0.0</div>
</div>

</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4 text-sm">
  <strong class="text-gray-300">Current status:</strong>
  <span class="text-gray-400"> LEBOSS is at <code class="text-blue-300">0.0.11</code> — a complete working draft preparing for <code class="text-purple-300">0.1.0</code>, the first Committee Vote candidate. Proposals 0.0.1 through 0.0.11 are open for community review.</span>
</div>

</div>

---

# The Committee

<div class="grid grid-cols-3 gap-5 mt-6 text-sm">

<div class="bg-white bg-opacity-5 rounded-xl p-5">
  <h3 class="font-semibold text-blue-300 mb-3">Maintainers</h3>
  <p class="text-gray-400 mb-3">Maintain the specification repository, enforce governance process, manage the proposal queue.</p>
  <ul class="text-gray-500 space-y-1 text-xs">
    <li>• Merge approved proposals to master</li>
    <li>• Apply version tags on publication</li>
    <li>• Manage the committee nomination process</li>
    <li>• Enforce the Code of Conduct</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-xl p-5">
  <h3 class="font-semibold text-purple-300 mb-3">Members</h3>
  <p class="text-gray-400 mb-3">Review proposals, participate in formal votes, shape the direction of the standard through substantive engagement.</p>
  <ul class="text-gray-500 space-y-1 text-xs">
    <li>• Review Drafts in the 14-day discussion period</li>
    <li>• Vote during Committee Vote stage</li>
    <li>• Disclose conflicts of interest</li>
    <li>• Appointed by existing members on nomination</li>
  </ul>
</div>

<div class="bg-white bg-opacity-5 rounded-xl p-5">
  <h3 class="font-semibold text-green-300 mb-3">Contributors</h3>
  <p class="text-gray-400 mb-3">Open proposals, file issues, participate in discussions. No appointment required. Anyone can contribute.</p>
  <ul class="text-gray-500 space-y-1 text-xs">
    <li>• Open pull requests as proposals</li>
    <li>• Comment on open Drafts</li>
    <li>• Report issues and ambiguities</li>
    <li>• Nominate themselves for membership</li>
  </ul>
</div>

</div>

<div class="mt-5 bg-white bg-opacity-5 rounded-lg p-4 text-sm text-gray-400">
  To nominate yourself for committee membership, open an issue titled <code class="text-blue-300">Committee Nomination: [Your Name]</code>. Include your background, your interest in local business data ownership, and any relevant experience.
</div>

---

# How to Contribute

<div class="grid grid-cols-2 gap-6 mt-6 text-sm">

<div class="space-y-4">

<div class="bg-blue-900 bg-opacity-30 rounded-lg p-4">
  <h3 class="font-semibold text-blue-300 mb-2">Open a proposal (pull request)</h3>
  <ol class="text-gray-400 space-y-1">
    <li>1. Branch from <code class="text-blue-300">master</code> as <code class="text-blue-300">proposal/X.Y.Z</code></li>
    <li>2. Create <code class="text-blue-300">proposals/X.Y.Z/proposal.md</code></li>
    <li>3. Make changes to specification files</li>
    <li>4. Open a pull request targeting <code class="text-blue-300">master</code></li>
  </ol>
</div>

<div class="bg-purple-900 bg-opacity-30 rounded-lg p-4">
  <h3 class="font-semibold text-purple-300 mb-2">Open an issue</h3>
  <p class="text-gray-400">If you have a concern but are not ready to propose specific text. Issues identify gaps, question definitions, report ambiguities. Issues are legitimate contributions, not a lower-priority inbox.</p>
</div>

</div>

<div class="space-y-4">

<div class="bg-green-900 bg-opacity-30 rounded-lg p-4">
  <h3 class="font-semibold text-green-300 mb-2">Participate in discussions</h3>
  <p class="text-gray-400">Every open proposal and draft has a discussion thread. Substantive comments — questions, objections, alternatives — shape committee outcomes. You do not need to be a member to participate.</p>
</div>

<div class="bg-yellow-900 bg-opacity-30 rounded-lg p-4">
  <h3 class="font-semibold text-yellow-300 mb-2">Build and report back</h3>
  <p class="text-gray-400">If you are implementing a LEBOSS-aligned system, document where the standard helped and where it fell short. Practical experience is the primary test of any standard.</p>
</div>

</div>

</div>

---

# Conformance

<div class="grid grid-cols-2 gap-6 mt-6 text-sm">

<div class="space-y-4">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <h3 class="font-semibold text-blue-300 mb-2">What conformance means</h3>
  <p class="text-gray-400">A LEBOSS-conformant system implements all MUST-level requirements in the normative rule register. The register contains 40 rules across 6 groups, corresponding to the governance protocols in the standard.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <h3 class="font-semibold text-purple-300 mb-2">Rule groups</h3>
  <ul class="text-gray-400 space-y-1">
    <li>• <code class="text-blue-300">LEBOSS-AGP</code> — Access Grant Protocol</li>
    <li>• <code class="text-blue-300">LEBOSS-IDP</code> — Integration Descriptor Protocol</li>
    <li>• <code class="text-blue-300">LEBOSS-ACP</code> — Audit Record Collection Protocol</li>
    <li>• <code class="text-blue-300">LEBOSS-DPP</code> — Data Portability Protocol</li>
    <li>• <code class="text-blue-300">LEBOSS-RM</code> — Resource Model</li>
    <li>• <code class="text-blue-300">LEBOSS-GOV</code> — Governance Objects</li>
  </ul>
</div>

</div>

<div class="space-y-4">

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <h3 class="font-semibold text-green-300 mb-2">Self-certification</h3>
  <p class="text-gray-400">LEBOSS does not currently operate a certification body. Conformance is self-declared. The specification provides sufficient normative precision that an independent auditor can verify compliance claims against the rule register.</p>
</div>

<div class="bg-white bg-opacity-5 rounded-lg p-4">
  <h3 class="font-semibold text-yellow-300 mb-2">Conformance criteria</h3>
  <p class="text-gray-400">Formal third-party conformance criteria are on the roadmap. Until established, implementations should document which rules they implement and provide evidence for each MUST-level requirement.</p>
</div>

</div>

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
  <code class="text-xs text-gray-400">presentations/overview/slides.md</code>
</div>

<div class="bg-white bg-opacity-10 rounded-xl p-5">
  <h3 class="font-semibold text-purple-300 mb-2">← Architecture</h3>
  <p class="text-sm text-gray-300 mb-3">Reference model, governance objects, operational flow.</p>
  <code class="text-xs text-gray-400">presentations/architecture/slides.md</code>
</div>

</div>

<div class="mt-8 text-sm text-gray-500">
  Contribute: <strong class="text-gray-300">github.com/jwogrady/leboss</strong>
</div>

---
layout: end
---

# LEBOSS Governance

<div class="mt-4 text-gray-300">
  Proposal lifecycle · Versioning · Committee · Conformance
</div>

<div class="mt-4 text-sm text-gray-500">
  github.com/jwogrady/leboss/blob/master/governance/governance.md
</div>
