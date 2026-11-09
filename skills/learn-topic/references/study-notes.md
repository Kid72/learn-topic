# Study notes for Notion

Before writing the note: read this file, take the shaky list from the session for the "Shaky spots" section, include one running worked example if the topic has a path or process, write no LaTeX and no dashes, then run the pre-send check at the end.

A short Markdown note that covers the whole topic, so the learner can walk through it later and review by recall. It is a review tool, not a transcript and not a textbook chapter. This applies retrieval practice and spacing; the exact format is a design choice, not a proven layout.

## When

- Offer it in one line at the wrap-up, next to cards. Write it only after a clear yes, or on an explicit request at any point.
- Notes-only mode: if the learner pastes their own material and asks only for a note, skip the tutoring flow and base the note on that material alone. There is no session, so write no "shaky spots" claims; offer a placeholder line the learner fills in.
- A note may be written when the mastery gate was not passed. It must then say so under shaky spots. Never claim the learner has mastered anything.

## Symbols: no LaTeX, ever

A note is pasted into Notion, which shows LaTeX source as raw text. Never write `$...$`, `$$...$$`, `\text{}`, `\approx`, `\rightarrow`, `\leftrightarrow`, or any backslash command. Write math and arrows as plain text or Unicode: `→`, `↔`, `≈`, `≤`, `≥`, `×`, `µs`, `ms`, `2^10`. A formula with units goes in inline code, for example `RTT = 150 ms`.

Bad: `$\approx 150 \text{ ms}$` and `SF $\leftrightarrow$ London`.
Good: `≈ 150 ms` and `SF ↔ London`.

## What goes in, in this order

1. Title: the topic, as a level 1 heading. Directly under it one line: "Cover the answers and try first. Feeling fluent while the answer is visible is not proof you know it."
2. Overview: 2 to 3 lines. What the topic is, the one big idea, how the main ideas connect. Not a list of section titles.
3. Key ideas: 5 to 8 sections (design choice), each a level 3 heading naming one idea, followed by 1 to 4 short bullets. Use bullets for parallel facts and full sentences for causes ("X leads to Y because Z"). Define a term where it first appears. Add the relation to a neighbouring idea (depends on, causes, contrasts with).
4. Worked example: at most one tiny example per technical idea, 5 lines or fewer, in a fenced code block with a language tag or in a short numbered list. Skip it for ideas that do not need one. Put a one-line caption right under it.
5. Comparison: one table only if the topic holds a real comparison with the same attributes across items. At most 3 columns, plain text cells. Otherwise omit it. No empty or decorative table.
6. Shaky spots: drawn from the session's shaky list only: answers the learner missed or only partly gave, hints they needed, questions they asked, things they said they had not understood. An item the learner said they did not understand must appear here, with the short explanation that finally worked. Name each specifically, with a pointer to the idea it belongs to. If the session showed no gaps, write "None showed up in this session" and nothing else.
7. Self-test: 6 to 10 questions (design choice), about one per key idea, each needing a "why" or "what happens if" answer, never yes/no and never answerable by copying a phrase from the overview. Put a blank line after the question, then the answer in its own paragraph starting with `Answer:`, so question and answer stay separate lines after import and the note works without toggles. Order: questions on shaky spots first.
8. Your turn: 2 or more prompts with nothing under them, for the learner to fill in, for example "Explain idea X in your own words", "Redraw how A, B, C relate from memory", "Write the gist in one sentence". Never pre-fill these.
9. Review schedule: a `- [ ]` checklist, see below.

## Review schedule

Suggest the next day, about 1 week, and about 3 weeks. Say in the note that these intervals are a convention, not a tested optimum. Each review is a recall attempt: cover the answers, answer from memory, then check. At the second review add "write 3 to 5 keywords from memory". Do not present rereading the note as a review.

## Length

Design choice, not evidence: no study located gives the best length for a whole-topic note. Aim for about 500 to 800 words in the body, one to two screens, a full pass in about 10 to 15 minutes. Treat it as tunable. If the topic needs more, cut ideas that are not in the scope contract before lengthening, or tell the learner which extra detail was left out and offer a second note.

## What to cut

- Anything not tied to a key idea: anecdotes, jokes, fun facts, decorative emoji, and a replay of the session in order.
- Repeats. Say each point once. The only deliberate repeat is the self-test question.
- Material the learner already knew and showed they knew; keep one line at most.
- "See above" references. Put a label or caption where a thing is used.
- Praise, motivation talk, and claims like "you now know".

## Source honesty

- Everything in the note comes from the learner's material or this session. Mark any addition from elsewhere with `(outside the session)` right after it, and keep such additions to a few lines.
- Do not add a fact only because it is typical. If a number is an estimate, give a range with units and write "estimate".
- Verify changeable or uncertain facts with search when it is available; otherwise mark them `(unverified)`.
- Do not cite studies or effect sizes in the note.

## Markdown subset for Notion import

Use only: headings `#` to `###`; short paragraphs; `-` bullets and `1.` lists nested at most 2 levels; `**bold**` for a handful of key terms per page; `*italic*`; inline code; fenced code blocks with a language tag; links as `[text](https://full-url)`; a block quote `>` sparingly, never as a toggle. The documented import path is Settings, Import, Text & Markdown.

Use with care, and expect it may arrive as plain text but still read well: one pipe table of 3 columns or fewer; `- [ ]` for the review checklist only.

Do not use (not verified to import; treat as forbidden): toggles and `<details>`, callouts and `> [!NOTE]`, `$` or `$$` math (put formulas in a code block), Mermaid, columns, HTML tags, footnotes, page mentions, anchor or relative links, images, a table mixed with HTML.

The format is designed to degrade gracefully. Do not say "works in Notion"; it has not been test-imported. Optional tip: in Notion the learner can select the answer lines and apply the toggle shortcut to hide them.

## File and message

- Name: `<topic-slug>-notes.md`, lowercase with hyphens, in the same place as a cards file, for example `database-indexes-notes.md`.
- Before sending, check: no `$` and no backslash anywhere; every key idea has a question; every question is followed by a blank line and an `Answer:` paragraph; the "Your turn" prompts are empty; no sentence is a repeat; no em dash or en dash.
- After writing, one short message in the learner's language, which also ends with exactly one task. For example: "Saved `database-indexes-notes.md`, about 600 words. Import it via Settings, Import, Text & Markdown. Task for tomorrow: cover the answers and try every question first." A note file is an exception to the 120-word limit, like a cards file; the message itself stays within the limit.
