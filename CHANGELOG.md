# Changelog

All notable changes to this project are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses [Semantic Versioning](https://semver.org/).

## [1.2.0] - 2026-11-07

### Changed
- Session rhythm. The tutor no longer asks a question after every small chunk. Each block is now: one pretest guess, one full explanation (up to 300 words), a short check of 1 or 2 questions, then feedback.
- "I don't know" now gets an explanation and a twin task instead of a chain of hints. The hint ladder applies only after a wrong or partial attempt and has at most two rungs.
- Turn limit of 120 words now applies to every turn except the block explanation.
- Updated the sample session and the research notes to match.

## [1.1.1] - 2026-11-06

### Fixed
- Study notes no longer contain LaTeX. Notion showed `$\approx$` and `\text{}` as raw symbols. The skill now writes plain text and Unicode (→, ≈, ≤, ×) and checks for `$` and backslashes before sending.

## [1.1.0] - 2026-11-06

### Added
- Study notes: a concise Markdown note for Notion that covers the whole topic, with key ideas, shaky spots from the session, self-test questions, a "Your turn" section, and a recall-based review schedule. Offered at the wrap-up or on request, and available in notes-only mode for your own material.
- `references/study-notes.md`, `examples/sample-notes.md`, and `docs/notion-import.md`.
- Study-note research section and design choices in `docs/research.md`.

### Fixed
- The release workflow no longer fails when the release for a tag already exists.

## [1.0.1] - 2026-11-05

### Changed
- New banner and social preview.
- Example cards now follow the card checklist: no yes/no questions, a domain prefix on every front.
- Sample session matches the rules: two-question gate, plan and ending consistent.
- Added a cards-only mode for learners who bring their own notes.
- Answering "ok" or "got it" now follows one rule across the skill files.
- Documented which rules are design choices in `docs/research.md`.

## [1.0.0] - 2026-11-05

### Added
- First public release of the `learn-topic` Agent Skill.
- Short-turn tutoring flow: intake, scope contract, pretest, teaching chunks, attempt-first practice, closed-book mastery gate, wrap-up.
- Hint ladder and an explicit "just tell me" switch.
- Flashcard export as CSV with the columns `front,back,notes,tags`, built from the learner's own mistakes and hesitations.
- Installation through the Claude Code plugin marketplace, `npx skills`, manual copy, Antigravity CLI, and release zips for claude.ai and the Gemini app.
- Docs for install options, Anki import, and the research behind the method.
