# LEBOSS Presentations — Index

This directory contains the LEBOSS multi-deck presentation system. Each topic deck is organized under its own subdirectory for discoverability.

## Deck Directory

| Deck | Source | Audience |
|------|--------|----------|
| [Overview](overview/README.md) | [`slidev/overview.md`](slidev/overview.md) | Business owners, solution providers, developers evaluating LEBOSS |
| [Architecture](architecture/README.md) | [`slidev/architecture.md`](slidev/architecture.md) | Developers, platform architects, technical implementers |
| [Governance](governance/README.md) | [`slidev/governance.md`](slidev/governance.md) | Contributors, maintainers, committee members |

## Slidev Build Environment

All deck sources live in [`slidev/`](slidev/) alongside the shared `package.json` and installed dependencies. This layout ensures Slidev theme resolution works correctly during both local development and Netlify deployment.

## Running Locally

```bash
cd slidev
npm install

npm run dev                  # overview deck (default) — http://localhost:3030
npm run build                # build overview for Netlify → dist/
npm run build:architecture   # build architecture deck → dist/architecture/
npm run build:governance     # build governance deck → dist/governance/
```

## Netlify Deployment

The overview deck is deployed to **https://leboss.status26.com/** via Netlify.

`netlify.toml` configures:
- `base = "presentations/slidev"` — build runs from this directory
- `command = "npm run build"` — builds the overview deck
- `publish = "presentations/slidev/dist"` — Netlify serves from here

## Original Presentation Archive

The original LEBOSS slide deck — the historical source from which the formal standard was derived — is preserved at [`../presentation/slides.md`](../presentation/slides.md) (singular directory). It is not part of the current presentation system and is not modified by this proposal.
