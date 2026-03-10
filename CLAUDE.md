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
├── standards/leboss-standard.md         # Living specification (primary artifact)
├── proposals/0.0.1/ … 0.0.11/          # Proposal history
├── glossary/terms.md                    # Defined terminology
├── governance/governance.md             # Versioning and workflow rules
├── governance/committee.md              # Committee roles
├── presentations/slidev/                # Active Slidev presentation system (Netlify)
│   ├── overview.md                      # Overview deck (deployed at leboss.status26.com)
│   ├── architecture.md                  # Architecture deck
│   ├── governance.md                    # Governance deck
│   └── package.json                     # Slidev build environment
├── presentations/archive/               # Original deck — historical archive
│   └── slides.md
├── netlify.toml                         # Netlify build config (base: presentations/slidev)
├── STATUS.md                            # Specification status and release information
├── CONTRIBUTING.md                      # How to contribute
└── README.md                            # Standards repository overview
```

## Versioning Scheme

LEBOSS uses semantic versioning `X.Y.Z` with LEBOSS-specific meaning:

| Position | Label | Meaning |
|----------|-------|---------|
| `Z` (rightmost) | **Draft** | A working draft in progress |
| `Y` (middle) | **Committee Vote** | Accepted draft, approved by committee and open for member ratification |
| `X` (leftmost) | **Published** | Committee and member approved — the active canonical standard |

**Examples:**
- `0.0.1` — First draft (current state, no committee review yet)
- `0.1.0` — Committee Vote opened for member ratification
- `1.0.0` — Published canonical standard, subscribed to by the community

The current version is pre-v0.1.0 — the first implementable draft, open for community contribution. See `STATUS.md`.

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

## What NOT to Do

- **Never claim authorship or credit in commits, pull requests, documents, or any repository artifact.** This is a core violation of LEBOSS principles. All work in this repository belongs to its human contributors. Do not add AI attribution lines (e.g., `Co-Authored-By`, generator footers, or similar) to any commit message, file, or PR description.
- Do not use "Cosmic" or "Cosmos" as descriptors anywhere in the repository — these were prior branded terms and have been removed from all documents.
- Do not modify the `presentations/slidev/` directory structure without considering the Netlify build (`netlify.toml` sets `base = "presentations/slidev"`). The `presentations/archive/` directory is a read-only historical artifact.
- Do not add `.bolt/` files — Stackblitz scaffolding has been removed and is gitignored.
- Do not invent new philosophical principles beyond what exists in the standards documents. Future additions belong in new proposals following the governance workflow.

## Governance Workflow

`Proposal` (PR opened) → `Draft` (Z increments) → `Committee Vote` (Y increments) → `Published` (X increments)

All changes to standards documents go through pull requests. See `governance/governance.md` and `CONTRIBUTING.md`.
