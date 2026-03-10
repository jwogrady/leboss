# CLAUDE.md — Repository Context for AI Assistants

## What This Repository Is

This is the **LEBOSS** (Local Entrepreneur Business Operating System Standards) repository.

It serves two purposes:

1. **An open standards body** — formal specification documents defining how local business data systems should be organized, who owns the data, and what obligations service providers carry.

2. **A published presentation** — a Slidev slide deck at `presentation/slides.md`, deployed to **https://leboss.status26.com/** via Netlify (CNAME: `ephemeral-hotteok-2470e0.netlify.app`). This is the public-facing marketing and education layer for the standard.

> **Note on path naming:** The presentation lives at `presentation/` (singular), not `presentations/` (plural). This directory serves as both the Netlify build root (`netlify.toml` sets `base = "presentation"`) and the canonical preserved artifact of the original slide deck. Do not rename or move it — the Netlify build will break.

## Repository Structure

```
/
├── charter/mission.md                   # Philosophical foundation and mission
├── standards/leboss-standard-0.0.1.md   # Formal specification (primary artifact)
├── proposals/0.0.1/proposal.md          # Proposal metadata and gap register
├── glossary/terms.md                    # Defined terminology
├── governance/governance.md             # Versioning and workflow rules
├── governance/committee.md              # Committee roles
├── presentation/                        # Slidev presentation app (Netlify)
│   ├── slides.md                        # Slide content
│   ├── package.json                     # Slidev build dependencies
│   └── components/                      # Vue components
├── netlify.toml                         # Netlify build config (base: presentation/)
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

The current version is `0.0.1` — a working draft open for community contribution.

## Key Terminology

- **LEBOSS Elements** — the six hierarchical architectural elements (Universe, Galaxy, Star, Planet, Moon, Satellite). Do not use "Cosmic Elements" — this was a prior branded term, removed from all documents including `presentation/slides.md`.
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
- Do not modify the `presentation/` directory structure without considering the Netlify build (`netlify.toml` sets `base = "presentation"`).
- Do not add `.bolt/` files — Stackblitz scaffolding has been removed and is gitignored.
- Do not invent new philosophical principles beyond what exists in the standards documents. Future additions belong in new proposals following the governance workflow.

## Governance Workflow

`Proposal` (PR opened) → `Draft` (Z increments) → `Committee Vote` (Y increments) → `Published` (X increments)

All changes to standards documents go through pull requests. See `governance/governance.md` and `CONTRIBUTING.md`.
