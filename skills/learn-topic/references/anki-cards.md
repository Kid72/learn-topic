# Flashcards for Anki

Before writing any card: read the checklist below, build cards from the shaky list first, keep each answer to one idea, then run the checklist on every card and drop the failures.

## When

Only after the mastery gate and a clear yes from the learner (or an explicit cards-only request with the learner's own notes). Only for items the learner worked through or supplied. Never a summary of the textbook or of your own explanation.

## Where cards come from (in priority order)

1. The shaky list: what the learner missed, did not understand, or answered only partly in this session.
2. What they hesitated on, asked about, or said they had not known.
3. Insights they reconstructed themselves.
4. A few anchor numbers or rules they now need to use fluently, with the word "estimate" where a figure is not exact.

## Checklist (every answer must be yes, otherwise split, shrink, or drop)

- One idea: a single fact or a single relationship.
- The answer is one thing: a number with units, a name, a short phrase, or a one-sentence reason of about 12 words or fewer. Recallable in under 10 seconds.
- The front stands alone: it names its subject explicitly (not "this approach"), and carries the units and the shape of the answer ("order of magnitude", "why", "how many times"). No topic prefix is needed.
- No lists or enumerations ("name 5..."), no yes/no questions, no "explain how X works" mega-questions, no formula with 3 or more factors.
- The front does not give the answer away through wording.
- It will make sense in 3 months without "as we discussed".
- It serves the learner's stated goal.

## Card types

- Anchor number: "Latency: order of magnitude of an NVMe SSD random read?" with the back "tens of microseconds".
- Estimation drill: "300M requests per day: rough average QPS?" with the back "about 3,000".
- Why, short: "Why is synchronous cross-continent replication slow?" with the back "every write waits one RTT, 70-100 ms".
- Trap from the session: the front names the trap, the back gives the resolution, and notes record how the learner stumbled.
- Contrast: "When do you choose A over B?" with one deciding condition.
- Fix for the learner's own slip: the exact calculation they got wrong.

## Rewrites of weak cards

- Weak: "What are the powers of ten for KB, MB, GB, TB, PB?" (a list in disguise). Better: "1M records of 1 KB each: how much memory?" with the back "about 1 GB" and notes "10^6 x 10^3 = 10^9".
- Weak: "What is the formula for total disk capacity?" with a four-factor formula as the back. Better, split into separate cards: "36 TB of data, replication factor 3: how much to store?" with the back "about 108 TB", and "Why is an SSD cluster not filled to 100%?" with the back "performance drops, headroom is needed".
- Weak: a long back with context and two examples. Better: keep one sentence in the back and move the example to notes.

Numbers in these examples only illustrate the format; use the figures from the actual session and verify them.

## CSV format

- Deliver a file named `<topic>-cards.csv` when file tools are available and send it to the learner. Otherwise one `csv` code block. UTF-8.
- First line is the header: `front,back,notes,tags`. If the card app imports that line as a card, delete that one card after import.
- Comma separator. Every field in double quotes. A double quote inside a field is doubled.
- No line breaks inside fields and no HTML. Write each field on one line and separate parts with " / " or a semicolon.
- `tags`: lowercase, separated by spaces, no spaces inside a tag, never commas. Use `::` for hierarchy, for example `system_design::numbers latency`.
- `notes`: up to 25 words, usually empty or one line: what happened in the session (the learner's slip, their analogy) or a one-line reason. Empty is fine: `""`.
- Language: the learner's language for front, back and notes, with established technical terms kept in their original form.
- 4 to 6 cards per block, more only if the learner asks. No duplicates: if two cards test the same idea, keep the better one. A card with two ideas is split or cut.

## Finish

Run the checklist on each card once and remove failures. Tell the learner in one line: the file name, the card count, and the field order (Front, Back, Notes, Tags).
