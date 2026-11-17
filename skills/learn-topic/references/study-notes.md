# Study notes for Notion

Before writing: take the shaky list for "Shaky spots", include one running worked example if the topic has a path or process, no LaTeX, no `$`, no em or en dash, then run the check at the end.

A short Markdown note that covers the whole topic for later review by recall. A review tool, not a transcript and not a textbook chapter. The layout is a design choice, not a proven format.

## When

- Offered at the wrap-up next to cards. Written only after a clear yes, or on an explicit request at any point.
- Notes-only mode (the learner pastes their material): skip tutoring, base the note on that material alone, write no shaky claims, leave a placeholder line for them to fill.
- If the gate was not passed, say so under shaky spots. Never claim mastery.

## No LaTeX, no `$`, ever

Notion shows LaTeX source as raw text. Write math and arrows as plain text or Unicode: `→`, `↔`, `≈`, `≤`, `≥`, `×`, `µs`, `2^10`; a formula with units in inline code (`RTT = 150 ms`); money as "USD". Never a backslash command.

## What goes in, in this order

All headings and labels are in the learner's language.

1. Title (level 1, no dash in it), then one line, translated: "Cover the answers and try first. Feeling fluent while the answer is visible is not proof you know it."
2. Overview: 2 to 3 lines. What the topic is, the one big idea, how the ideas connect.
3. Key ideas: 5 to 8 sections, each a level 3 heading naming one idea with 1 to 4 short bullets; full sentences for causes. Define a term where it first appears; relate it to a neighbouring idea.
4. Worked example: at most one tiny example per idea, 5 lines or fewer, in a fenced block with a language tag or a short numbered list, with a one-line caption. Skip where unneeded.
5. Comparison: one table only if there is a real comparison on the same attributes. Up to 3 columns, plain text cells. Otherwise omit.
6. Shaky spots: from the session's shaky list only (what the learner missed, partly answered, needed hints for, asked about, or said they did not understand), each named specifically with a pointer to its idea, and the short explanation that finally worked. If none: "None showed up in this session."
7. Self-test: 6 to 10 questions, about one per idea, each needing "why" or "what happens if", never yes/no. After each question a blank line, then the answer in its own paragraph starting `Answer:` (label translated). Shaky spots first.
8. Your turn: 2 or more empty prompts ("Explain idea X in your own words", "Redraw how A, B, C relate").
9. Review checklist: `- [ ]` items for the next day, about 1 week and about 3 weeks (a convention, not a tested optimum). Each is a recall attempt: cover the answers, answer, then check. At the second review add "write 3 to 5 keywords from memory". Rereading is not a review.

## Length and content

About 500 to 800 words in the body (self-test answers not counted). If the topic needs more, cut ideas outside the scope contract first or offer a second note. Cut anecdotes, decorative emoji, session replays, repeats (the only deliberate repeat is the self-test), material the learner showed they knew, "see above", praise, and "you now know".

Everything comes from the learner's material or this session. Mark additions `(outside the session)`, keep them to a few lines. Estimates are ranges with units and the word "estimate"; changeable facts are verified with search or marked `(unverified)`. Cite no studies.

## Markdown subset for Notion import

Use: headings `#` to `###`; short paragraphs; `-` bullets and `1.` lists nested at most 2 levels; `**bold**` for a handful of key terms; `*italic*`; inline code; fenced code blocks with a language tag (at most 5 lines); `[text](https://full-url)`; `>` sparingly. One pipe table of 3 columns or fewer and `- [ ]` for the review checklist only.

Do not use: horizontal rules `---`, bold or code inside table cells, `*` bullets, toggles, `<details>`, callouts, `$` math, Mermaid, columns, HTML, footnotes, page mentions, relative links, images.

Do not say "works in Notion"; it has not been test-imported. Import path: Settings, Import, Text & Markdown. In Notion the learner can select the answer lines and apply the toggle shortcut to hide them.

## File and message

- Name `<topic-slug>-notes.md`, lowercase Latin letters with hyphens (transliterate other scripts). Without file tools, output the note in one fence of four backticks (the note has its own code fences), then the message.
- Before sending check: no `$`, no backslash, no `---` line, every heading translated, every question followed by a blank line and an `Answer:` paragraph, "Your turn" empty, no repeats, no em or en dash.
- Then one short message in the learner's language ending with one task, for example: "Saved `database-indexes-notes.md`, about 600 words. Import it via Settings, Import, Text & Markdown. Task for tomorrow: cover the answers and try every question first."
