# AGENTS.md — Contract for AI Coding Agents

Tool-agnostic working rules for any AI agent contributing to this repository.
Claude Code users: `CLAUDE.md` is the fuller, authoritative companion to this file;
the two share one behavioral contract and must stay in sync.

## What This Repo Is

**LEBOSS** (Local Entrepreneur Business Operating System Standards) is two things:

1. **An open standards body** — formal Markdown specifications defining how local
   business data systems are organized, who owns the data, and what obligations
   service providers carry. The authoritative document is
   `standards/leboss-standard.md`.
2. **A published presentation portal** — a multi-deck Slidev system under
   `presentations/slidev/`, deployed to https://leboss.status26.com/ via Netlify.

The "code" here is mostly specification prose plus the Slidev/Vue presentation
decks. There is no application runtime and no test suite for the standards.

## Common Commands

The only build target is the Slidev portal. Run from `presentations/slidev/` with
**Node 22** (`.nvmrc` pins it):

```bash
cd presentations/slidev
npm install              # first-time setup
npm run dev              # serve the Overview deck (also dev:architecture, dev:governance)
npm run build:all        # full production build → dist/ (what Netlify runs)
npm run export           # export Overview deck to PDF
```

`build:all` builds each deck to its own subpath using Slidev's `--base` flag and
copies `_redirects` into `dist/`. Use the existing npm scripts — calling
`slidev build` directly without the `--base` paths breaks asset URLs on the
Architecture and Governance decks. The standards Markdown has no build/lint/test
step.

## Core Rules

- **Attribution — humans only.** Credit the human author. Never add AI tool names,
  generator footers, or `Co-Authored-By` lines for AI systems to any commit, file,
  document, changelog, or PR. This is a core LEBOSS principle, not a style choice.
- **Don't invent doctrine.** Do not add new philosophical principles or normative
  requirements that aren't already in the standards. New requirements enter only
  through the proposal/PR workflow.
- **Terminology.** The six architectural elements are Universe, Galaxy, Star,
  Planet, Moon, Satellite. Never use "Cosmic" or "Cosmos" as descriptors in prose.
  (Exception: the internal Vue components in
  `presentations/slidev/components/cosmic/` keep `cosmic` as a code identifier —
  don't propagate the term into reader-facing text.)

## Branch and PR Discipline

- Never commit directly to `master`. Work on a feature branch.
- One concern per PR. All standards changes go through the governance PR workflow:
  `Proposal` (PR) → `Draft` → `Committee Vote` → `Published`.
- `CONTRIBUTING.md` defines the required PR shape (Summary, Motivation,
  Specification Changes, Impact Assessment, Backward Compatibility).

## Code Quality

- Edits to the Slidev decks and Vue components must keep `npm run build:all`
  passing. Don't restructure `presentations/slidev/` without accounting for the
  Netlify build (`netlify.toml` sets `base = "presentations/slidev"`).
- When the rule set changes, keep the flat register
  (`standards/leboss-normative-rules.md`) and the counts in `STATUS.md` in sync
  with `standards/leboss-standard.md`. The standard governs on any conflict.

## Documentation

- Specifications are the product. Match the existing voice, normative phrasing
  (MUST / MUST NOT / MAY), and rule-numbering scheme (`LEBOSS-{GROUP}-{number}`).
- Follow defined glossary terms exactly; don't introduce synonyms for established
  terms.

## Destructive Actions

Confirm with a human before: deleting files, force-pushing or resetting history,
removing dependencies, or editing `netlify.toml` / build config. Treat
`proposals/` and `presentations/archive/` as append-only history. Do not add
`.bolt/` files (Stackblitz scaffolding is removed and gitignored).

## Commits

- [Conventional Commits](https://www.conventionalcommits.org/): `<type>(<scope>): <subject>`.
- Types: `feat` (new content/docs), `docs` (edits to existing docs), `fix`
  (corrections), `chore` (tooling/config). Scopes: `standards`, `governance`,
  `glossary`, `charter`, `proposals`, `presentation`, `claude`.
- Imperative subject, under 72 characters, no trailing period. Body explains *why*.

## GitHub API and Automation

Read GitHub state (issues, PRs, CI status) freely. Do **not** open, close, or
comment on issues or PRs, create tags or releases, or edit workflow files unless a
human explicitly asks.

## Scope Discipline

Do only what was asked. No opportunistic refactors, no invented commands or
integrations. When a fact can't be verified from the repo, mark it `TODO` rather
than guess — an unverified claim in normative spec text becomes a false
requirement.

## Skill Authoring Quick Reference

Not applicable — this repository is a standards body and presentation portal, not
a Spark skills repo.
