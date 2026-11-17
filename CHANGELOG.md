# Changelog

All notable changes to this project are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses [Semantic Versioning](https://semver.org/).

## [1.4.1] - 2026-11-17

Found by reviewing a real Gemini run (Kafka): the model did not open the references, so the card format, the note template, the word limits and the gate were all skipped.

### Added
- `SKILL.md` now has a "First action" gate (open the two core references, or say so and use the fallback) and a "Hard minimum" block: the one place for word limits, question limits, the ban on LaTeX, `$` and em/en dashes, the CSV spec and the note outline.
- The Gemini archive is built with all references inlined into `SKILL.md` (`scripts/build-zips.sh`), so it works when the model cannot open files.
- A rule to name each system's real mechanism or mark the claim unverified (for example SQS is pull).
- A fallback for the study note without file tools (four-backtick fence), notes headings in the learner's language, and no `---`, `$` or bold in table cells.

### Changed
- The check and the mastery gate are one round: two questions, one at a time, no hints. "Passed" is said only after it.
- Shaky list lifecycle defined: closed when answered correctly without a hint, parked items stay. The wrap-up lists concrete gaps only.
- "I don't know" on the pretest leads straight to the block explanation. The "thank them" line is gone, it clashed with the no-praise rule.
- Cards: up to 6 per passed block, never padded, one file per session.
- Examples, README and docs synced: three blocks, a diagram in the composite-index block, no topic prefix, consistent shaky spots.

## [1.4.0] - 2026-11-16

### Added
- Diagrams are now required for any block about a process, a structure, or a comparison, and for the second explanation after "I did not understand" a mechanism. A text diagram in a code block is the baseline, an interactive visual is an upgrade where the environment can render one. The skill no longer promises a visual it does not produce.
- A silent pre-send check in `tutoring-rules.md`: word count, at most 3 ideas, visual present, check questions use only taught ideas and are not answered by the tutor, no praise words, concrete closing question, no LaTeX or dashes.

### Changed
- Never leak the answer to an open check question, even when the learner asks to see the block again.
- A question the learner did not understand is rephrased once and is not counted as answered or passed.
- Check questions may use only ideas explained so far. Command syntax is added only when the scope contract asks for it.
- Praise phrases and vague closers ("is it clear now?") are not allowed. No LaTeX in chat replies either.

## [1.3.0] - 2026-11-09

### Changed
- `SKILL.md` is now a short router: five always-on rules, a "read before you act" table, and the flow. The turn contract and hard rules moved to `references/tutoring-rules.md`.
- Things the learner did not understand now stay on a shaky list until resolved. The list drives the next warm-up, the mastery gate, the cards, and the "Shaky spots" section of the study note.
- "I did not understand" no longer triggers a long second analogy followed by moving on. The tutor cuts to one step, explains it differently, and parks the item explicitly if needed.
- Answers are checked against the key point of the question before the tutor reacts. Partial answers get the right part named and one follow-up. No praise phrases.
- Number of blocks is derived from the topic (2 to 8), not defaulted. A block that needs more than 300 words is split.
- Cards: 4 to 6 per block, no topic prefix, shaky items first, one idea per card, no duplicates.
- Interactive visuals are promised only when the environment can show them.

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
