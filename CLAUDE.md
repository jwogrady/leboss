# CLAUDE.md — Repository Context for AI Assistants

## What This Repository Is

This is the **LEBOSS** (Local Entrepreneur Business Operating System Standards) repository.

It serves two purposes:

1. **An open standards body** — formal specification documents defining how local business data systems should be organized, who owns the data, and what obligations service providers carry.

2. **A published presentation portal** — a multi-deck Slidev system under `presentations/slidev/`, deployed to **https://leboss.status26.com/** via Netlify. The Overview deck is the landing page; Architecture and Governance decks are at `/architecture/` and `/governance/`.

## Repository Structure

```
/
├── charter/mission.md                   # Philosophical foundation and mission
├── standards/                           # The specification (multiple documents — see below)
│   ├── leboss-standard.md               # Authoritative spec (primary artifact)
│   ├── leboss-normative-rules.md        # Flat rule register (LEBOSS-{GROUP}-{n})
│   ├── conformance.md                   # Non-conformance conditions
│   └── leboss-*-protocol.md / *-model.md / *-objects.md  # Operational protocols
├── proposals/0.0.1/ … 0.0.29/          # Proposal history (one dir per draft)
├── glossary/terms.md                    # Defined terminology
├── governance/governance.md             # Versioning and workflow rules
├── governance/committee.md              # Committee roles
├── presentations/slidev/                # Active Slidev presentation system (Netlify)
│   ├── overview.md                      # Overview deck (deployed at leboss.status26.com)
│   ├── architecture.md                  # Architecture deck (/architecture/)
│   ├── governance.md                    # Governance deck (/governance/)
│   ├── components/cosmic/               # Vue components for the orbital diagrams
│   ├── _redirects                       # Netlify SPA fallbacks per deck
│   └── package.json                     # Slidev build environment
├── presentations/archive/               # Original deck — read-only historical artifact
├── netlify.toml                         # Netlify build config (base: presentations/slidev)
├── STATUS.md / RELEASES.md              # Spec status, rule counts, release notes
├── IMPLEMENTATIONS.md                   # Known implementations
├── CONTRIBUTING.md                      # How to contribute (PR shape + commit convention)
└── README.md                            # Standards repository overview
```

## Build & Development Commands

The only build target is the Slidev presentation portal. All commands run from `presentations/slidev/` and require **Node 22** (`.nvmrc` pins `22`; `package.json` engines: `>=22 <23`). There is no test suite, linter, or build step for the standards documents themselves — they are plain Markdown.

```bash
cd presentations/slidev
npm install                 # first-time setup

npm run dev                 # serve the Overview deck with hot reload
npm run dev:architecture    # serve the Architecture deck
npm run dev:governance      # serve the Governance deck

npm run build:all           # full production build → dist/ (what Netlify runs)
npm run export              # export Overview deck to PDF
```

`build:all` builds each deck to its own subpath (`dist/`, `dist/architecture/`, `dist/governance/`) using Slidev's `--base` flag and copies `_redirects` into `dist/`. The Architecture and Governance decks **must** be built with their `--base` paths or asset URLs break — use the existing scripts rather than calling `slidev build` directly. Netlify deploys via `npm run build:all` (see `netlify.toml`).

## Standards Documents & Rule Numbering

`standards/leboss-standard.md` is authoritative. When it conflicts with any other document (including the rule register), the standard governs. The spec is split into focused documents — the main standard plus operational protocols (access grant, audit, data portability, integration), the resource model, and governance objects.

Every normative requirement is also extracted into `standards/leboss-normative-rules.md` as a flat register. Rules are identified `LEBOSS-{GROUP}-{number}` (e.g. `OWN`, `ACC`, `ARCH`, `SEC`, `CONT`, `SVC`, `SPEC`, `ENF`, `REC`, `PORT`). The register is a derived reference — never add a requirement there that isn't in the standard, and keep the rule counts in `STATUS.md` (currently 115 rules / 19 groups) in sync when rules change.

## Versioning Scheme

LEBOSS uses semantic versioning `X.Y.Z` with LEBOSS-specific meaning:

| Position | Label | Meaning |
|----------|-------|---------|
| `Z` (rightmost) | **Draft** | A working draft in progress |
| `Y` (middle) | **Committee Vote** | Accepted draft, approved by committee and open for member ratification |
| `X` (leftmost) | **Published** | Committee and member approved — the active canonical standard |

**Examples:**
- `0.0.1` — First draft
- `0.0.29` — Current state (v0.1.0-rc): 115 rules, 19 groups, structurally complete
- `0.1.0` — Committee Vote opened for member ratification
- `1.0.0` — Published canonical standard, subscribed to by the community

The current version is v0.1.0-rc (0.0.29) — a structurally complete governance standard and release candidate for the first Committee Vote. See `STATUS.md`.

## Key Terminology

- **LEBOSS Elements** — the six hierarchical architectural elements (Universe, Galaxy, Star, Planet, Moon, Satellite). Do not use "Cosmic Elements" — this was a prior branded term, removed from all documents.
- **Universe** — the root owner (person, family, legal entity)
- **Galaxy** — an individual brand or business line
- **Star** — customer-facing interface
- **Planet** — backend service powering a Star
- **Moon** — company-owned internal module (natural satellite)
- **Satellite** — third-party integration (artificial satellite)

## Commit Message Convention

This repository uses [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short description>
```

| Type | Use for |
|------|---------|
| `feat` | New standards content, new documents |
| `docs` | Edits to existing standards, governance, or glossary |
| `fix` | Corrections to errors or contradictions in the standard |
| `chore` | Repository maintenance (tooling, config, gitignore) |

Common scopes: `standards`, `governance`, `glossary`, `charter`, `proposals`, `presentation`, `claude`

- Subject in the imperative mood, under 72 characters, no trailing period.
- Body (when needed) explains *why*, not what. Wrap at ~72 columns.
- One concern per commit; one concern per PR.

## What NOT to Do

- **Never claim authorship or credit in commits, pull requests, documents, or any repository artifact.** This is a core violation of LEBOSS principles. All work in this repository belongs to its human contributors. Do not add AI attribution lines (e.g., `Co-Authored-By`, generator footers, or similar) to any commit message, file, or PR description.
- Do not use "Cosmic" or "Cosmos" as descriptors in any **prose** (standards, governance, glossary, deck content) — these were prior branded terms removed from all documents. Note the exception: the Slidev Vue components in `presentations/slidev/components/cosmic/` (`CosmicSystem.vue`, etc.) keep `cosmic` as an internal code identifier referenced by the decks. Don't rename them casually, but don't introduce the term into reader-facing text.
- Do not modify the `presentations/slidev/` directory structure without considering the Netlify build (`netlify.toml` sets `base = "presentations/slidev"`). The `presentations/archive/` directory is a read-only historical artifact.
- Do not add `.bolt/` files — Stackblitz scaffolding has been removed and is gitignored.
- Do not invent new philosophical principles beyond what exists in the standards documents. Future additions belong in new proposals following the governance workflow.

## Governance Workflow

`Proposal` (PR opened) → `Draft` (Z increments) → `Committee Vote` (Y increments) → `Published` (X increments)

All changes to standards documents go through pull requests. See `governance/governance.md` and `CONTRIBUTING.md`.

## Agent Working Rules

- **Branches & PRs.** Never commit directly to `master`. Cut a feature branch and open one focused PR per concern. All standards changes go through the governance PR workflow above; `CONTRIBUTING.md` defines the required PR shape (Summary, Motivation, Specification Changes, Impact Assessment, Backward Compatibility).
- **Destructive actions need confirmation.** Deleting files, force-pushing or resetting history, removing dependencies, or editing `netlify.toml` / build config — confirm with a human first. Treat `proposals/` and `presentations/archive/` as append-only history.
- **GitHub boundary.** Read GitHub state (issues, PRs, CI) freely. Do not open, close, or comment on issues/PRs, create tags or releases, or edit workflows unless explicitly instructed.
- **Scope discipline.** Do only what was asked. No opportunistic refactors, no invented commands or integrations. When a fact can't be verified from the repo, mark it `TODO` rather than guessing — especially in normative spec text, where an unverified claim becomes a false requirement.
