# learn-topic 1.6.0: two modes and a question audit

Status: draft for approval. Nothing in the skill has been changed yet.

## Intent and why

The owner (Kid72) uses `learn-topic` to prepare for system design interviews and wants the tutor to teach well. Real sessions in Gemini (NFR, system design, Kafka) and Sonnet simulations showed the same failure: the tutor asks the learner to produce something it has not taught ("formulate NFRs with p99, consistency, durability"), the learner honestly says "you did not teach me", and the tutor either lectures for 500 words or drops the checks. The owner's position: the skill must not behave so badly that handling an annoyed learner is needed. Prevention first; recovery is a one-line safety net.

Causes found, by evidence:
1. A check or gate question uses terms or an output format that the block never explained (seen in 3 of 3 real sessions and in both Sonnet runs). The rule exists in `SKILL.md`; models do not apply it, and nothing makes them check.
2. For judgement skills (NFR, running an interview, estimation, design) the pipeline explain, check, gate tests recall of what was just read and never shows a model answer. The learner asked three times for a chain of thought, a diagram and an example.
3. The map and ritual rules (6 words per line, out of scope, "Go with this, or adjust?", depth) and the recovery moves live in `session-flow.md` and `teaching-moves.md`. The Gemini archive since 1.5.0 inlines only the card and note formats, so Gemini never sees them.
4. The map ignores the learner's level and goal (a Senior who wants to learn "running the interview" got a map without it; a pretest was a set of four calculations).
5. Smaller: 12 of 19 turns over 120 words, blocks with 4 or 5 ideas, tasks with 2 to 4 items, 29 em dashes, invented thresholds stated as facts, "Saved file X.csv" without file tools.

## Goals

- A learner who answers honestly never gets a question about something not shown to them in this session.
- A judgement-skill topic ends with the learner doing the whole task alone on a new case and being assessed against criteria they were given.
- Everything a weak client needs to behave is in what it loads (`SKILL.md` plus the Gemini inlined parts), without opening files.
- The knowledge-topic flow (Redis, Kafka, Postgres) keeps working as in 1.5.0.

## Non-goals

- No rewrite of the pedagogy for knowledge topics. No removal of the pretest and gate there.
- No new file formats. Cards and notes stay as they are, apart from the fixes below.
- No growth of the loaded text beyond about 4,000 words for Gemini, and the core `SKILL.md` stays under about 1,400 words.

## Anti-goals (failure even if it technically works)

- The skill becomes a longer rulebook that models still skip. A rule with no check is not a fix.
- Mode detection misfires and a knowledge topic gets the heavy skill flow, or the reverse, with no way for the learner to correct it.
- The tutor treats the learner as difficult. Complaints "you did not teach me" are counted as tutor errors.

## Constraints

- Works in Claude clients and in Gemini (zip with `SKILL.md` at the root). Gemini cannot be assumed to open files.
- Output rules stay: no LaTeX, no `$`, no em or en dash, no praise words, word limits.
- Releases and pushes only on the owner's explicit "yes". Commits by Kid72, no Co-Authored-By lines.
- `scripts/check.sh` must keep passing; it is extended, not bypassed.

## Approaches considered

- A. Patch rules only (map in core, question audit). Cheap, but keeps the same pipeline for judgement skills.
- B. Two modes by topic type, plus the question audit in both. Chosen by the owner.
- C. Rebuild every topic around worked examples and drop the pretest and gate. Cleanest, but throws away what works for knowledge topics.

Chosen: B with the audit from A, because it fixes the sessions that failed and leaves the working flow alone.

## Design

### 1. Question audit (both modes, in `SKILL.md`)

Before sending any check, gate or practice question, silently list: (a) every term it uses, (b) the format of the answer asked for (explain, name, calculate, write, design). Every term must be defined in this session before the question, or defined inside the question in one line. If (b) is production (write, formulate, design, choose), a worked example of that same kind of output must already have been shown in this block. If either fails, rewrite the question or teach first. Criteria for judging the answer are stated with the task, never held back. The tutor never states the answer to an open question.

When the learner says "you did not teach me" or "I do not know how to do this", it is a tutor error. One clause of acknowledgement, then a short worked example of the missing piece and a task with a gap. No lecture over 120 words, no dropping the checks.

### 2. Two modes (decided at intake, shown in the scope contract line)

- Knowledge topic: the learner must understand and recall (Redis, Kafka, indexes). The 1.5.0 flow stays: pretest guess, explanation, two-question gate, cards.
- Judgement skill: the learner must do or decide on an open case (NFR, running an interview, estimation, API or system design). Flow below. If unclear, the tutor asks in one line which it is, and the learner can switch at any time.

Judgement-skill flow, per block (details in a new `references/judgement-skills.md`):
1. Worked example: one concrete scenario done in full, with the chain of thought (what to ask, what to choose, why, where each number comes from), up to 300 words, with a compact outline or diagram. This is the explanation of the block.
2. Gap task: a similar scenario where the learner fills one named part. Up to 4 criteria are stated first. Feedback goes criterion by criterion: met, partly (what is right, one follow-up), missed (show the model line).
3. Own case: a new scenario, the learner does the whole thing, same criteria. Passing it is the gate. A miss goes to the shaky list and the next block's warm-up.
4. The pretest is optional: one open question ("how would you start?") only if the learner's level is unknown; never a set of calculations.

The map for a judgement skill is built by scenarios (payment, feed, shared document), not by terms. A term is defined in one line at its first use in a worked example.

### 3. Map rules in `SKILL.md`

One message, at most 8 lines: goal in the learner's words; depth as what a practitioner can do in 2 minutes; one line per block, 6 words or fewer, phrased as what the learner will be able to do; 2 or 3 out-of-scope items; the closing line "Go with this, or adjust?". The map follows the learner's stated level and goal. A block the learner already shows they know is compressed or skipped. If the learner gave their own structure (word limit, number of cards, order), follow it within the rules on facts, format and the question audit.

### 4. Loaded text for Gemini

`scripts/build-zips.sh` inlines `session-flow.md`, `judgement-skills.md`, `anki-cards.md` and `study-notes.md` after `SKILL.md` (about 4,000 words). `teaching-moves.md` and `visuals.md` stay references; the hint ladder, partial answers and complaints are in the core.

### 5. Smaller fixes

- A pretest is one question with one guess.
- One task per turn; at most 3 ideas per block.
- A number that is only an example is labelled "illustrative"; no invented formulas or thresholds stated as facts.
- Without file tools the tutor never says "saved file"; it prints the content and says so.

## Success measure

Simulations in Claude with an honest learner who answers truthfully and says so when something was not taught, 3 repeats per scenario, scenarios NFR and running a system design interview, plus one knowledge topic (Redis) as a regression check. Counts compared with 1.5.0 on the same scripts:
- check or gate questions that use terms or formats not shown in the session: target 0;
- map rule violations (line length, out of scope, closing question, depth): target 0;
- turns over the word limit, praise words, dashes, `$`: target 0;
- the judgement-skill run ends with the learner doing an own case judged against stated criteria.

Not covered by this measure: real Gemini behaviour. The owner runs a real Gemini session and sends it back.

## Left to the builder

Exact wording of the rules; the length of each worked example; the order of sections in `judgement-skills.md`; the wording of the intake line that picks the mode; extending `check.sh` (mode names present, inlined files present, no dashes).
