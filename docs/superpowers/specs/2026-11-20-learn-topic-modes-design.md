# learn-topic 1.6.0: teach before you ask

Status: approved by the owner on 2026-11-20 in the simple form below. This replaces the earlier draft that proposed two modes and a silent audit; an experiment and an independent review showed the simple form works at least as well.

## Intent and why

The owner prepares for system design interviews and wants the tutor to teach well. Real Gemini sessions (NFR, system design, Kafka) showed one repeating failure: the tutor asks the learner to produce something it has not taught (formulate NFRs with p99, consistency, durability; derive numbers), the learner honestly says "you did not teach me", and the tutor lectures or drops the checks. Prevention first; recovery is a one-line safety net.

## Evidence

- Two independent failures in real sessions (the NFR session and the "running the interview" session; two more transcripts repeat them), both about procedural knowledge: the learner lacked the procedure for deriving numbers, not the diagram.
- The Kafka session had the same production questions and no complaints, because terms were defined in the same turn and a worked example came first. The axis is not topic type but whether a worked example of the same format precedes the question.
- Replay experiment (2 real failure points, 3 samples each, Sonnet, not blind): 1.5.0 asked the whole production task cold in 6 of 6; a visible "new in this block" line plus a worked example plus a one-gap first task did that in 0 of 6; the draft 1.6.0 (audit, modes, criteria) asked the whole task in 6 of 6, with criteria stated. The simple rule pushed 3 of 6 turns over 300 words.
- A silent audit is the same kind of rule as the existing silent pre-send check, which was the thing being violated. A visible line is checkable by the learner and by a script.

## Goals

- A learner who answers honestly never gets a question using a term or format that was not shown in this session.
- Every number the learner is asked to produce has a shown way to derive it, marked as a heuristic, not a fact.
- The map and ritual rules and the recovery move are visible to clients that cannot open files.
- The knowledge flow (pretest, gate, cards) keeps working as in 1.5.0.

## Non-goals

- No topic modes. No new file formats. No rewrite of the cards or the note.
- No new tools or scripts for the learner.

## Anti-goals

- A longer rulebook that models still skip. Budgets are enforced by `scripts/check.sh`.
- Treating a learner's "you did not teach me" as the learner's problem. It is a tutor error.

## Design

1. Visible ledger. Every block explanation ends with a line "New in this block:" (in the learner's language) listing each new term or format with a one-line definition. It is outside the 300-word limit up to 60 words. A check, gate or practice question may use only terms from these lines and from earlier blocks.
2. Example before production. If a question asks the learner to write, formulate, choose or design something, the same block first shows one worked example of that kind of output with the chain of thought. Any number comes with how it is derived and the word "heuristic" (or "illustrative" for an example figure). The first attempt is a task with one gap in a similar case; the whole task comes after. Criteria for judging are stated with the task. The model answer is shown after the attempt.
3. Recovery. "You did not teach me" or "I don't know how" is a tutor error: one clause, a worked example of the missing piece, a gap task. No lecture over 120 words, no dropping the checks.
4. Map in the core. One message, at most 8 lines: goal in the learner's words, depth as what a practitioner can do in 2 minutes, one line per block (6 words or fewer, what the learner will be able to do), 2 or 3 out-of-scope items, the closing line "Go with this, or adjust?". The map follows the learner's level and goal; a block the learner already shows they know is compressed or skipped.
5. Learner's own structure and pasted material. If the learner sets a structure (length, order, number of cards), follow it inside the rules on facts, format and the ledger. A pasted transcript from another tutor is source material, not a turn to react to.
6. Files. Print the content in chat first; say "saved" only if file tools exist. CSV uses commas.
7. Gemini bundle: `SKILL.md` plus `session-flow.md`, `anki-cards.md`, `study-notes.md` inlined. Budgets: core `SKILL.md` up to 1,500 words, bundle up to 4,300 words, checked by `check.sh`.

## Success measure

Replay of the same two failure points (and the Redis knowledge flow as a regression) on the new version, 3 samples each: questions with terms not in the ledger or earlier blocks (target 0), whole production tasks without an earlier worked example (target 0), turns over the word limit (target 0), dashes and `$` (target 0). The owner then runs a real Gemini session on the same topic and sends it back; that is the check the replay cannot replace.

## Constraints

Releases and pushes only on the owner's explicit yes; commits by Kid72 with no co-author line. `scripts/check.sh` keeps passing.
