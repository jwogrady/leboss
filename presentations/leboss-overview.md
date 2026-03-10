# LEBOSS Presentations — Archive Reference

This file is an archive reference stub. The canonical presentation system is in the subdirectories of this folder.

## Canonical Presentation System

| Deck | Path | Audience |
|------|------|----------|
| Overview | [`presentations/overview/slides.md`](overview/slides.md) | Business owners, solution providers, developers evaluating LEBOSS |
| Architecture | [`presentations/architecture/slides.md`](architecture/slides.md) | Developers, platform architects, technical implementers |
| Governance | [`presentations/governance/slides.md`](governance/slides.md) | Contributors, maintainers, committee members |

## Slidev Environment

The shared Slidev build environment is at [`presentations/slidev/`](slidev/).

To run a deck locally:

```bash
cd presentations/slidev
npm install
npm run dev                 # overview deck
npm run build               # build overview for Netlify
npm run build:architecture  # build architecture deck
npm run build:governance    # build governance deck
```

## Original Presentation Archive

The original LEBOSS slide deck — the seed from which the formal standard was derived — is preserved at [`presentation/slides.md`](../presentation/slides.md) (singular directory). It is not modified by this proposal. Do not edit it; it is a primary source document.

The canonical specification lives in [`standards/leboss-standard.md`](../standards/leboss-standard.md).
