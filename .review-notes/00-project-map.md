# LEBOSS Repository Project Map

**Prepared:** June 4, 2026  
**Status:** v0.1.0-rc (Release Candidate)  
**Branch:** `docs/agent-contract-files` (merged to master with CLAUDE.md and AGENTS.md)

---

## 1. Overview: What LEBOSS Is

LEBOSS (Local Entrepreneur Business Operating System Standards) is a **dual-purpose repository**:

1. **An open standards body** — formal Markdown specification documents defining the governance layer for local business data systems. The authoritative artifact is `standards/leboss-standard.md`.

2. **A published presentation portal** — a three-deck Slidev system under `presentations/slidev/` deployed to https://leboss.status26.com/ via Netlify.

**Critical distinction:** This is NOT a typical software project. There is no application runtime, no test suite, no runtime build step for the standards themselves. The "application" is the Slidev presentation portal (Netlify deployment). The standards are living Markdown documents, versioned and governed through a formal proposal/committee-vote lifecycle.

---

## 2. Repository Map

### 2.1 Top-Level Structure

```
/home/jwogrady/leboss/
├── standards/                    # Normative specification (3,559 LOC)
├── proposals/0.0.1 … 0.0.29/     # Change log — 29 proposal directories
├── governance/                   # Governance model and committee roles
├── glossary/                     # Canonical terminology (797 LOC)
├── charter/                      # Philosophical foundation (101 LOC)
├── presentations/                # Presentation system and archive
│   ├── slidev/                   # Active Slidev portal (Netlify target)
│   ├── overview/                 # Presentation content sources
│   ├── architecture/             # Presentation content sources
│   ├── governance/               # Presentation content sources
│   └── archive/                  # Historical first deck (read-only)
├── .review-notes/                # Multi-agent review artifacts
├── .claude/                      # Agent config directory (gitignored)
├── CLAUDE.md                     # Agent contract for Claude Code (134 LOC)
├── AGENTS.md                     # Tool-agnostic agent contract (109 LOC)
├── CONTRIBUTING.md               # PR shape and contribution workflow (195 LOC)
├── RELEASES.md                   # Release notes and changelog (121 LOC)
├── STATUS.md                     # Spec status, rule counts, proposal history (125 LOC)
├── IMPLEMENTATIONS.md            # Known implementations (48 LOC)
├── README.md                     # Standards repository overview (179 LOC)
├── .gitignore                    # Excludes: dist, node_modules, .env, .bolt, .claude
├── .nvmrc                        # Node.js version: 22
└── netlify.toml                  # Netlify build config
```

### 2.2 Standards Directory (3,559 LOC total)

| File | LOC | Purpose |
|------|-----|---------|
| `leboss-standard.md` | 959 | **Authoritative specification** — complete governance standard with 25 sections covering ownership, access control, delegation, enforcement, audit, portability, identity, revocation |
| `leboss-normative-rules.md` | 635 | **Rule register** — flat enumerable list of all 115 normative rules in `LEBOSS-{GROUP}-{n}` format |
| `conformance.md` | 288 | **Conformance criteria** — two tiers (LEBOSS-aligned, LEBOSS-compliant), 25 non-conformance conditions |
| `leboss-integration-protocol.md` | 253 | **Operational protocol** — how integrations are described and registered |
| `leboss-access-grant-protocol.md` | 240 | **Operational protocol** — access grant object schema and lifecycle |
| `leboss-data-portability-protocol.md` | 210 | **Operational protocol** — export format and portability requirements |
| `leboss-resource-model.md` | 194 | **Resource namespace model** — resource identification and enumeration |
| `leboss-audit-protocol.md` | 197 | **Operational protocol** — audit record collection and resolution |
| `leboss-governance-objects.md` | 105 | **Object definitions** — governance object types |
| `leboss-standard-0.0.1.md` | 478 | **Historical version** — preserved for reference |
| **objects/** | 328 | **Governance object schemas** (3 files: access-grant.md, audit-record.md, integration-descriptor.md) |

**Key properties:**
- **Normative statements appear ONLY in `standards/` documents** — governance/ and glossary/ are informative.
- **Semantic versioning with LEBOSS-specific meaning:** Z = draft, Y = committee vote, X = published.
- **Current version:** v0.1.0-rc (0.0.29) — structurally complete, 115 rules across 19 groups.
- **Authority hierarchy:** When a conflict exists between any two documents, `leboss-standard.md` governs.

### 2.3 Proposals Directory (29 directories)

29 proposals (0.0.1 through 0.0.29) preserved as the permanent change log. Each directory contains a `proposal.md` describing the change. Evolution timeline:

- **0.0.1–0.0.21:** Core architecture, governance objects, protocols, specification stabilization
- **0.0.22–0.0.29:** Boundary stress tests and gap closure (primary operational data, service provider, protocol normativity, actor identity, entity authenticity, audit resolution, delegation chain lifetime, revocation timing)

**Status.md** provides a full proposal-by-proposal table mapping each proposal to its content.

### 2.4 Presentations Directory (1,842 LOC)

**Active Slidev system at `/home/jwogrady/leboss/presentations/slidev/`**

| File/Dir | LOC | Purpose |
|----------|-----|---------|
| `overview.md` | 541 | Landing deck — high-level narrative of LEBOSS |
| `architecture.md` | 764 | Reference model visual deck — the six elements |
| `governance.md` | 537 | Governance lifecycle and proposal process |
| `components/cosmic/` | 561 | Vue components for orbital diagrams (11 .vue files) |
| `package.json` | 21 | Slidev config; Node 22 engine constraint |
| `style.css` | 1 | Global styles |
| `_redirects` | 4 | Netlify SPA fallbacks for /architecture/ and /governance/ |
| `presentations/archive/` | — | Historical first deck (read-only) |

**Build scripts (from package.json):**
```
npm run dev                     # serve Overview deck (hot reload)
npm run dev:architecture       # serve Architecture deck
npm run dev:governance         # serve Governance deck
npm run build:all              # full production build → dist/ (Netlify target)
npm run export                 # export Overview deck to PDF
```

**Critical build note:** Each deck is built with a custom `--base` path (Overview: `/`, Architecture: `/architecture/`, Governance: `/governance/`). The `build:all` script chains these together and copies `_redirects` to the output. **Do not call `slidev build` directly** — asset URLs will break on subpath decks.

**Vue components (cosmic/ directory):**
- `CosmicSystem.vue` (273 LOC) — main orbital diagram renderer
- `GalaxyNode.vue`, `StarNode.vue`, `PlanetNode.vue`, `MoonNode.vue`, `SatelliteNode.vue` (28–30 LOC each) — element renderers
- `UniverseNode.vue` (30 LOC) — root owner node
- `OrbitRing.vue` (22 LOC), `CosmicNode.vue` (42 LOC), `CosmicDivider.vue` (52 LOC), `cosmicLayouts.js` — layout and styling utilities

**Netlify deployment:**
- **Build context:** `presentations/slidev/`
- **Build command:** `npm run build:all`
- **Publish directory:** `dist/`
- **Node version:** 22 (enforced via `netlify.toml`)
- **Deploy preview:** same build command

### 2.5 Governance & Glossary

| File | LOC | Purpose |
|------|-----|---------|
| `governance/governance.md` | 128 | Proposal lifecycle, versioning rules, committee vote process |
| `governance/committee.md` | 111 | Committee roles (Proposer, Shepherd, Advocate, Chair) |
| `glossary/terms.md` | 797 | Canonical terminology — six architectural elements (Universe, Galaxy, Star, Planet, Moon, Satellite), key concepts |
| `charter/mission.md` | 101 | Philosophical foundation — why local business data ownership matters |

---

## 3. Standards Corpus Summary

**Scope:** LEBOSS defines the governance layer for local business data systems.

**115 normative rules** across **19 rule groups:**

| Group | Count | Category |
|-------|-------|----------|
| OWN | 10 | Ownership Rules |
| ACC | 6 | Access Rules |
| ARCH | 6 | Architectural Rules |
| SEC | 8 | Security Rules |
| CONT | 6 | Continuity Rules |
| SVC | 9 | Service Provider Rules |
| SPEC | 5 | Specification Boundary Rules |
| ENF | 6 | Enforcement Responsibility Rules |
| REC | 6 | Audit as System of Record Rules |
| PORT | 6 | Data Portability Requirements Rules |
| MAP | 6 | Cross-System Resource Identity & Mapping Rules |
| DEL | 6 | Delegation & Authority Chain Rules |
| VER | 6 | Conformance Verification Rules |
| PROT | 5 | Protocol Normativity Rules |
| ACTOR | 6 | Actor Identity Portability Rules |
| GEA | 6 | Governing Entity Authenticity Rules |
| AUD | 6 | Audit Resolution Requirements Rules |
| DCL | 6 | Delegation Chain Lifetime Rules |
| REV | 6 | Revocation Enforcement Timing Rules |

**Normative requirements breakdown (from STATUS.md):**
- MUST: 72
- MUST NOT: 46
- MAY: 5
- **Non-conformance conditions:** 25 (defined in `conformance.md`)

**What the standard covers:**
- Ownership — who owns the data; governing entity authority and obligations
- Access Control — how access is granted, scoped, and enforced
- Delegation — authority chains and constraints
- Enforcement — when and how normative rules must be enforced
- Audit — what governed actions must be recorded and at what resolution
- Portability — how the complete operational data environment must be exportable
- Identity — actor identity portability and governing entity authenticity
- Revocation Timing — when revocation takes effect and what enforcement must reflect

**What the standard does NOT cover:** runtime environments, infrastructure platforms, API designs, specific software architectures, implementation patterns.

**Authority:** `leboss-standard.md` is authoritative. All other documents are derived or informative.

---

## 4. Agent Contract Files (New on This Branch)

**Branch:** `docs/agent-contract-files`  
**Diff from master:** +159 lines, –9 lines across 2 files

### 4.1 CLAUDE.md (134 LOC, expanded from 59)

Purpose: Fuller, Claude Code-specific agent contract. Covers:
- Repository dual nature (standards + Slidev)
- Directory structure and purpose mapping
- Build/dev commands (Node 22, Slidev)
- Standards documents and rule numbering
- Versioning scheme (Z/Y/X meaning)
- Key terminology (six elements)
- Commit message convention (Conventional Commits)
- Critical prohibitions: never add AI attribution, don't invent doctrine, don't use "Cosmic" in prose
- Governance workflow
- Agent working rules (branches, PRs, destructive actions, GitHub boundary, scope discipline)

### 4.2 AGENTS.md (109 LOC, new file)

Purpose: Tool-agnostic agent contract for any AI coding agent. Streamlined version of CLAUDE.md; covers same core rules but in shorter, platform-neutral form:
- Core rules (attribution, terminology, don't invent doctrine)
- Branch and PR discipline
- Code quality expectations (build:all must pass, sync rule register with standard)
- Documentation (specifications are the product)
- Destructive action confirmation
- Commits (Conventional Commits convention)
- GitHub API boundaries
- Scope discipline

**Both files enforce the same human-authored behavioral contract.** AGENTS.md is tool-agnostic; CLAUDE.md is Claude Code-specific and fuller. They must stay in sync.

---

## 5. Tech Stack & Tooling

### 5.1 Runtime & Package Management

- **Node.js version:** 22 (enforced by `.nvmrc` and `package.json` engines)
- **Package manager:** npm (v10+ implied by Node 22)
- **Runtime environment:** Netlify (deployments only; no local runtime)

### 5.2 Presentation Build

- **Slidev:** @slidev/cli 0.49.29
- **Theme:** @slidev/theme-seriph 0.25.0
- **Vue framework:** implicit via Slidev (v3)

### 5.3 Deployment

- **Platform:** Netlify
- **Build trigger:** push to master
- **Build command:** `npm run build:all` (from presentations/slidev/)
- **Publish directory:** `dist/`
- **URL:** https://leboss.status26.com/
- **SPA routing:** _redirects with fallback rules for /architecture/ and /governance/

### 5.4 Absence of Common Tooling

- **No test suite** — standards have no runtime to test
- **No linting** — no ESLint, Prettier, Stylelint, markdownlint config
- **No CI/CD workflows** — no `.github/workflows/` directory
- **No package lock (gitignored)** — `package-lock.json` in presentations/slidev/ is not committed
- **No Docker** — no containers or containerization
- **No static analysis** — no SonarQube, CodeClimate, etc.

---

## 6. Config Files & Build Infrastructure

### 6.1 .nvmrc
```
22
```
Enforces Node 22 across all tools and environments.

### 6.2 package.json (presentations/slidev/)

```json
{
  "private": true,
  "scripts": {
    "dev": "slidev overview.md",
    "dev:architecture": "slidev architecture.md",
    "dev:governance": "slidev governance.md",
    "build": "slidev build overview.md --out dist",
    "build:architecture": "slidev build architecture.md --out dist/architecture --base /architecture/",
    "build:governance": "slidev build governance.md --out dist/governance --base /governance/",
    "build:all": "npm run build && npm run build:architecture && npm run build:governance && cp _redirects dist/_redirects",
    "export": "slidev export overview.md"
  },
  "engines": {
    "node": ">=22 <23"
  },
  "dependencies": {
    "@slidev/cli": "0.49.29",
    "@slidev/theme-seriph": "0.25.0"
  }
}
```

**Key contract:** Each deck builds with its own `--base` path. `build:all` chains them and copies `_redirects`.

### 6.3 netlify.toml

```toml
[build]
  base    = "presentations/slidev"
  command = "npm run build:all"
  publish = "dist"

[build.environment]
  NODE_VERSION = "22"

[context.deploy-preview]
  command = "npm run build:all"
```

Defines build context, command, publish directory, and Node version for Netlify.

### 6.4 presentations/slidev/_redirects

```
/architecture/*  /architecture/index.html  200
/governance/*  /governance/index.html  200
/*  /index.html  200
```

Netlify SPA routing rules. Ensures each deck's subpath routes correctly and falls back to index.html.

### 6.5 .gitignore

```
dist
node_modules
.env
.bolt
.claude
```

- `dist/` — build output (never committed)
- `node_modules/` — dependencies (never committed)
- `.env` — secrets (never committed)
- `.bolt/` — Stackblitz scaffolding (removed, kept in gitignore for safety)
- `.claude/` — Agent config and local settings (never committed)

### 6.6 .claude/settings.local.json

Local Claude Code configuration (gitignored). Contents not inspected; typically contains user preferences or test config.

---

## 7. Notable Absences

1. **No test suite** — standards are not executable; no runtime tests possible
2. **No linting or formatting** — no ESLint, Prettier, Stylelint, markdownlint
3. **No CI/CD workflows** — no GitHub Actions or other CI configuration
4. **No code review bot** — no automated checks (builds, lints, security scans)
5. **No versioning tags** — proposal history lives in `proposals/` directory; git tags not in use (inferred from no tag output)
6. **No Docker** — local development doesn't require containers
7. **No security scanning** — no Dependabot, SNYK, or similar
8. **No API documentation generation** — standard is hand-authored prose
9. **No changelog generator** — releases tracked manually in `RELEASES.md`
10. **No build-time schema validation** — governance objects are documented but not schema-validated

---

## 8. Line Count Summary

### 8.1 Standards Corpus (3,559 LOC total)

- `leboss-standard.md`: 959 LOC (authoritative)
- `leboss-normative-rules.md`: 635 LOC
- `leboss-standard-0.0.1.md`: 478 LOC (historical)
- `conformance.md`: 288 LOC
- `leboss-integration-protocol.md`: 253 LOC
- `leboss-access-grant-protocol.md`: 240 LOC
- `leboss-data-portability-protocol.md`: 210 LOC
- `leboss-resource-model.md`: 194 LOC
- `leboss-audit-protocol.md`: 197 LOC
- `leboss-governance-objects.md`: 105 LOC
- `objects/` (3 files): 328 LOC

### 8.2 Presentation System (1,842 LOC + 561 LOC Vue)

- `overview.md`: 541 LOC
- `architecture.md`: 764 LOC
- `governance.md`: 537 LOC
- `components/cosmic/` (11 Vue files): 561 LOC

### 8.3 Repository Documentation (911 LOC)

- `STATUS.md`: 125 LOC
- `CONTRIBUTING.md`: 195 LOC
- `README.md`: 179 LOC
- `RELEASES.md`: 121 LOC
- `CLAUDE.md`: 134 LOC
- `AGENTS.md`: 109 LOC
- `IMPLEMENTATIONS.md`: 48 LOC

### 8.4 Governance & Glossary (1,137 LOC)

- `glossary/terms.md`: 797 LOC
- `governance/governance.md`: 128 LOC
- `governance/committee.md`: 111 LOC
- `charter/mission.md`: 101 LOC

**Total repository prose:** ~7,500 LOC (excluding proposals/, archive/, build artifacts)

---

## 9. Notes to Next Agents

### 9.1 Documentation Review Focus

This is a **standards document repository**, not a software product. Review agents should:

1. **Verify RFC 2119 compliance:** Check that all normative keywords (MUST/MUST NOT/SHOULD/MAY) appear only in `standards/` documents, not in informative sections.
2. **Check rule register sync:** Every rule in `leboss-normative-rules.md` must derive directly from `leboss-standard.md`. When the standard changes, keep the register and `STATUS.md` rule counts in sync.
3. **Validate terminology consistency:** The six elements are Universe, Galaxy, Star, Planet, Moon, Satellite. Never use "Cosmic" or "Cosmos" in prose (internal Vue component names are exempt). Check `glossary/terms.md` for authoritative definitions and ensure no synonyms are introduced.
4. **Authority hierarchy:** When conflict exists between documents, `leboss-standard.md` governs. All other specs are derived.

### 9.2 Presentation Build Review Focus

1. **Slidev script integrity:** Verify `npm run build:all` chains all three decks correctly. Each deck must build with its own `--base` path or subpath routing breaks.
2. **_redirects correctness:** Netlify SPA fallback rules in `presentations/slidev/_redirects` must match the deck structure. Test that `/architecture/anything` and `/governance/anything` route correctly.
3. **Node 22 enforcement:** `.nvmrc` and `package.json` engines must both specify Node 22. Netlify's `netlify.toml` also sets `NODE_VERSION = "22"`. All three must align.
4. **Vue component usage:** The `components/cosmic/` Vue components render the orbital diagrams. Review them for accessibility, performance, and correctness. The `cosmicLayouts.js` file defines element positioning — verify it matches the six-element hierarchy.
5. **No ad-hoc changes to Slidev structure:** The `presentations/slidev/` directory structure is load-bearing for Netlify's build (see `netlify.toml` `base = "presentations/slidev"`). Restructuring requires Netlify reconfiguration.

### 9.3 Governance & Contribution Process

1. **Proposal lifecycle:** All changes to standards go through the formal proposal process defined in `governance/governance.md`. A proposal is:
   - Opened as a PR to a feature branch
   - Labeled as Draft (Z increment to version)
   - Merged and numbered in the proposals/ directory
   - Advanced to Committee Vote (Y increment) and then Published (X increment) through subsequent PRs

2. **Version tracking:** Current version is v0.1.0-rc (0.0.29). The next Committee Vote will be v0.1.0. First Published version will be v1.0.0. Version numbering follows this strictly.

3. **Commit convention:** All commits use Conventional Commits (`<type>(<scope>): <subject>`). Common types: `feat`, `docs`, `fix`, `chore`. Common scopes: `standards`, `governance`, `glossary`, `charter`, `proposals`, `presentation`, `claude`. No AI attribution in commits.

### 9.4 Security & Data Sensitivity

1. **No secrets in repo:** `.env` is gitignored. Verify no API keys, credentials, or private data are committed.
2. **No Stackblitz scaffolding:** `.bolt/` files are gitignored and should not be added. This was removed as a development environment.
3. **Agent config is local:** `.claude/` is gitignored. Settings are local and do not affect the repository artifact.

### 9.5 What NOT to Do

1. **Never add AI attribution.** CLAUDE.md § "What NOT to Do" explicitly forbids crediting Claude, Anthropic, or any AI system in commits, files, or PRs. This is a core LEBOSS principle (data ownership belongs to humans).
2. **Never invent doctrine.** Do not add new normative requirements, principles, or philosophical content beyond what's already in the standards. New doctrine goes through the proposal process.
3. **Never rename internal code identifiers casually.** The Vue components use `cosmic/` as an internal namespace (not reader-facing). Renaming them without understanding the build is disruptive.
4. **Never commit to master directly.** Always work on a feature branch and open a PR. This ensures the governance workflow is respected.
5. **Never modify `netlify.toml` without confirmation.** It's load-bearing for the deployment.

### 9.6 Review Scope by Specialty

- **Documentation Agent:** Focus on conformance of standards to the RFC 2119 normative language standard, glossary consistency, and prose clarity. Verify the rule register is a faithful, complete extraction from `leboss-standard.md`.
- **Architecture Agent:** Verify the Reference Model (§5 of standard) is complete and consistent with the Slidev architecture deck. Check that all six elements are correctly defined and related.
- **Code Quality Agent:** Review the Vue components in `presentations/slidev/components/cosmic/` for performance, accessibility, and correctness. Verify the Slidev markdown decks are well-structured and accessible.
- **Security Agent:** Verify no secrets are committed. Check that build outputs are gitignored. Validate that dependency versions are pinned (Slidev 0.49.29, seriph theme 0.25.0).
- **Product Readiness Agent:** Verify the Netlify deployment is correctly configured and that the landing page (https://leboss.status26.com/) renders all three decks correctly. Check that the proposal process is documented and followed.
- **Testing Agent:** Note that there is no test suite. Standards are not executable. The only testable component is the Slidev build (`npm run build:all` must succeed). Verification happens through manual visual inspection of the deployed site.

---

## 10. Git & Version Control

### 10.1 Current State

- **Current branch:** `docs/agent-contract-files` (just merged to master)
- **Last commit:** `1f40207` — Merge pull request #38 (presentation alignment)
- **HEAD:** Both `docs/agent-contract-files` and `master` point to the same commit

### 10.2 Recent Activity

```
1f40207  Merge PR #38: docs/presentation-alignment (73d45eb)
73d45eb  docs: normalize all presentations to v0.1.0-rc (one-pass alignment)
2afc1f8  Merge PR #37: docs/presentation-alignment (e8e4503)
e8e4503  docs(presentation): align overview deck with v0.1.0-rc rule count
057293c  Merge PR #36: review/0.1.0-rc-comprehensive-audit
```

Recent PRs have been focused on aligning presentation decks with the v0.1.0-rc specification status.

### 10.3 Proposal Preservation

All 29 proposals (0.0.1 through 0.0.29) are preserved in the `proposals/` directory as permanent, append-only history. This is the change log. Do not modify or delete proposal directories.

---

## 11. Deployment & Infrastructure

### 11.1 Netlify Deployment

- **Site URL:** https://leboss.status26.com/
- **Deploy trigger:** push to `master`
- **Build context:** presentations/slidev/
- **Build command:** npm run build:all
- **Publish directory:** dist/
- **Branch deploys:** deploy previews available for feature branches

### 11.2 Domain & DNS

- Netlify-hosted domain (leboss.status26.com) configured via Netlify admin panel
- No custom DNS or infrastructure config in the repository

### 11.3 CDN & Caching

- Netlify CDN handles all caching (default Netlify behavior)
- `_redirects` file controls SPA routing (Netlify feature)

---

## 12. Summary for the Review Team

LEBOSS is a **living standards specification** with a **published presentation portal**. The repository is NOT a traditional software project:

- **No runtime to execute or test**
- **No CI/CD pipelines or automated checks**
- **No package.json at repository root** (only in presentations/slidev/)
- **Specifications are the product** — Markdown documents governed by a formal proposal/committee-vote lifecycle
- **Presentation system is secondary** — Slidev decks communicate the standard, not execute it

Reviewers must adjust their expectations accordingly:

1. **Standards review** looks like governance + RFC compliance + terminology consistency
2. **Presentation review** is visual + accessibility + structural validation
3. **Build review** is single-command verification (npm run build:all)
4. **Deployment review** is Netlify config + SPA routing + DNS

The dual-nature (standards body + presentation portal) is explicit and intentional. Keep both in focus: the standard defines the what; the presentation communicates the why and how.

