# LEBOSS Presentation System

The LEBOSS presentation system is a multi-deck Slidev portal deployed at **https://leboss.status26.com/**. Each deck targets a distinct audience and subject area. All decks share a single build environment and a common navigation header.

---

## Deck Directory

| Deck | Audience | Deployed URL |
|------|----------|-------------|
| **Overview** | Business owners, solution providers, developers evaluating LEBOSS | https://leboss.status26.com/ |
| **Architecture** | Developers, platform architects, technical implementers | https://leboss.status26.com/architecture/ |
| **Governance** | Contributors, maintainers, committee members | https://leboss.status26.com/governance/ |

The Overview deck is the entry point. It presents the problem, the LEBOSS model, and the governance framework — then links directly to the Architecture and Governance decks via a portal navigation slide.

---

## Deck Sources

All slide sources live in [`slidev/`](slidev/) alongside the shared `package.json` and installed `node_modules`. This layout is required for Slidev theme resolution to work correctly during both local development and Netlify deployment.

| Source | Content |
|--------|---------|
| [`slidev/overview.md`](slidev/overview.md) | 14-slide narrative — problem, LEBOSS model, governance, reference architecture, portal navigation |
| [`slidev/architecture.md`](slidev/architecture.md) | Reference model, governance objects, operational flow |
| [`slidev/governance.md`](slidev/governance.md) | Proposal lifecycle, versioning, committee roles, conformance |

---

## Running Locally

```bash
cd slidev
npm install

npm run dev                  # overview deck (default) — http://localhost:3030
npm run build                # build overview → dist/
npm run build:architecture   # build architecture → dist/architecture/
npm run build:governance     # build governance → dist/governance/
npm run build:all            # build all three decks
```

---

## Netlify Deployment

All three decks are deployed via Netlify. `netlify.toml` configures:

- `base = "presentations/slidev"` — build runs from this directory
- `command = "npm run build:all"` — builds all three decks
- `publish = "presentations/slidev/dist"` — Netlify serves from here

Deployment produces:

```
dist/
  index.html              ← Overview deck (https://leboss.status26.com/)
  architecture/
    index.html            ← Architecture deck (/architecture/)
  governance/
    index.html            ← Governance deck (/governance/)
```

---

## Navigation

Each deck includes a navigation header in the top-right corner of the title slide linking to all three decks. The Overview deck also contains a dedicated portal slide near the end with prominent buttons to the Architecture and Governance decks.

---

## Original Presentation Archive

The original LEBOSS slide deck — the historical source from which the formal standard was derived — is preserved at [`../presentation/slides.md`](../presentation/slides.md) (singular directory). It is not part of the current presentation system and is not modified.
