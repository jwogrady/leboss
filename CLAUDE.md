# CLAUDE.md — Repository Context for AI Assistants

## What This Repository Is

This is the **LEBOSS** (Local Entrepreneur Business Operating System Standards) repository.

It serves two purposes:

1. **An open standards body** — formal specification documents defining how local business data systems should be organized, who owns the data, and what obligations service providers carry.

2. **A published presentation** — a Slidev slide deck at `presentation/slides.md`, deployed to **https://leboss.status26.com/** via Netlify (CNAME: `ephemeral-hotteok-2470e0.netlify.app`). This is the public-facing marketing and education layer for the standard.

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
| `Y` (middle) | **Committee Review** | Accepted draft, approved by committee and ready for member vote |
| `X` (leftmost) | **Published** | Committee and member approved — the active canonical standard |

**Examples:**
- `0.0.1` — First draft (current state, no committee review yet)
- `0.1.0` — Committee has accepted and opened for member vote
- `1.0.0` — Published canonical standard, subscribed to by the community

The current version is `0.0.1` — a working draft open for community contribution.

## Key Terminology

- **LEBOSS Elements** — the six hierarchical architectural elements (Universe, Galaxy, Star, Planet, Moon, Satellite). Do not use "Cosmic Elements" — this was a prior branded term removed from standards documents. It still appears in `presentation/slides.md` and is pending update there.
- **Universe** — the root owner (person, family, legal entity)
- **Galaxy** — an individual brand or business line
- **Star** — customer-facing interface
- **Planet** — backend service powering a Star
- **Moon** — company-owned internal module (natural satellite)
- **Satellite** — third-party integration (artificial satellite)

## What NOT to Do

- **Never claim authorship or credit in commits, pull requests, documents, or any repository artifact.** This is a core violation of LEBOSS principles. All work in this repository belongs to its human contributors. Do not add AI attribution lines (e.g., `Co-Authored-By`, generator footers, or similar) to any commit message, file, or PR description.
- Do not use "Cosmic" or "Cosmos" as descriptors in standards documents — these are under review as potentially branded terms. They remain in `presentation/slides.md` pending a separate update to the presentation.
- Do not modify the `presentation/` directory structure without considering the Netlify build (`netlify.toml` sets `base = "presentation"`).
- Do not add `.bolt/` files — Stackblitz scaffolding has been removed and is gitignored.
- Do not invent new philosophical principles beyond what exists in the standards documents. Future additions belong in new proposals following the governance workflow.

## Governance Workflow

`Proposal` (PR opened) → `Draft` (Z increments) → `Committee Review` (Y increments) → `Published` (X increments)

All changes to standards documents go through pull requests. See `governance/governance.md` and `CONTRIBUTING.md`.
