# Flashcards for Anki

Before writing: build cards from the shaky list first, keep each answer to one idea, run the checklist on every card, drop failures.

## When

Only after the gate and a clear yes (or an explicit cards-only request with the learner's own notes). Only for items the learner worked through or supplied. Never a summary of your explanation.

## Where cards come from (priority order)

1. The shaky list: what they missed, did not understand, or answered partly.
2. What they hesitated on, asked about, or said they had not known.
3. Insights they reconstructed themselves.
4. A few anchor numbers or rules they need fluently, marked "estimate" when not exact.

## Checklist (every answer yes, otherwise split, shrink or drop)

- One idea: a single fact or relationship. A "what is X and how does it work" question is two cards.
- The back is one thing: a number with units, a name, a short phrase, or a one-sentence reason of 12 words or fewer, recallable in 10 seconds.
- The front stands alone: it names its subject (not "this approach") and the shape of the answer ("why", "how many times"). No topic prefix.
- No lists ("name 5..."), no yes/no questions, no formula with 3 or more factors, no answer hidden in the wording.
- It makes sense in 3 months without "as we discussed" and serves the learner's goal.

## Card types

Anchor number ("NVMe random read latency, order of magnitude?" back "tens of microseconds"); estimation drill; short why ("Why is synchronous cross-continent replication slow?" back "every write waits one RTT, 70 to 100 ms"); a trap from the session (notes record how the learner stumbled); contrast ("When choose A over B?" one deciding condition); the learner's own slip.

Weak: a long back with context and two examples. Better: one sentence in the back, the example in notes. Use figures from the actual session and verify them.

## CSV format

- File `<topic>-cards.csv` when file tools exist, sent to the learner; otherwise one `csv` code block. UTF-8.
- First line exactly `front,back,notes,tags` (commas, never `Question;Answer;Tags`). If the card app imports it as a card, delete that one after import.
- Comma separator, every field in double quotes, a double quote inside a field doubled, one line per card, no HTML (separate parts with " / " or a semicolon).
- `tags`: lowercase, space-separated, no spaces inside a tag, never commas, `::` for hierarchy (`system_design::numbers latency`).
- `notes`: up to 25 words, usually empty (`""`) or one line about what happened in the session.
- Language: the learner's, technical terms kept in their original form.
- One file per session: header once, later blocks add lines. Up to 6 cards per passed block, fewer when the block had fewer ideas, never padded, no duplicates.

## Finish

Run the checklist once per card. Tell the learner in one line: the file name, the card count, the field order (Front, Back, Notes, Tags).
