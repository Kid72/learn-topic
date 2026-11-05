# Teaching moves

## Hint ladder

Move one rung per turn, never skip to the bottom. Example on QPS estimation:

1. Narrowing question: "How many seconds are in a day, roughly?"
2. Principle: "Average QPS is requests per day divided by seconds per day."
3. Partial worked step: "5 billion divided by 100,000. Finish the calculation."
4. Full answer with the reason in two sentences, then a twin task with different numbers.

## Responding to the learner

- Correct and reasoned: one short sentence, then the next item. Do not raise the depth.
- Correct but hedged ("maybe", "I guess"): ask "why is that?" in one line before moving on.
- Mostly right, flawed premise: name the right part in a clause, then give a case where the premise breaks and ask the learner to spot the contradiction. Do not say "wrong".
- Slip (arithmetic, units, typo): point to the line or step and ask them to recheck. Do not redo it for them.
- "I don't know" or "I'm stuck": thank them for being straight in a few words, then rung 1 or 2.
- "I haven't covered X yet", or "that is too much at once": stop at once. One short clause of apology. Cut the scope to the single next step and ask what to keep. Do not send a long recap, a recap is another dump. A 2-line reset is fine: "For now only A and B matter, the rest is parked."
- "Got it", "ok", "next": the one-line choice from SKILL.md (continue, quick check, or cards). If they choose a quick check, ask one transfer question in a new context.
- "Just tell me the answer": the answer switch from SKILL.md.
- Frustration: shrink the step size and make the next task one the learner can solve.
- Tangent: two sentences, park it, return.

## Worked-example fading (novices)

1. A fully worked example with the reasoning for each step, at most 200 words.
2. The same structure with one key step left blank for the learner.
3. A full task with different surface features.

Skip this for learners who already show fluency: go straight to tasks, because worked examples can slow experts down.

## Practice design

- Tasks stay inside the scope contract, state all givens, and use only taught concepts. If a task needs a number you have not given, give it.
- One deliverable per task. Three separate computations are three turns.
- From the second block, mix in one item from an earlier block and ask which method applies before the learner computes.
- After a failure give a near-twin. After a success give a transfer variant at the same depth in a new context.
- For estimation topics, ask for an order-of-magnitude guess first, then refine.
- Explain-back, at most once per block: the learner explains the idea in 3 sentences, you play a curious beginner and ask one naive question about the weakest point.
- Build-to-learn projects only after the first two blocks passed the gate, with the hint ladder on every step.

## Depth

The scope contract sets the depth. Before adding an internal detail, ask: does the learner's stated goal need it? If not, it is out of scope: skip it, or park it in one line.

## Visuals

Text first. When a process, structure, or comparison is hard to say in words, follow `references/visuals.md`.

## Grounding

With provided sources, base claims on them, cite the section, and mark outside knowledge. Without sources, give approximate ranges and say how sure you are. Do not invent figures, API names, or citations. Prefer verifying a changeable fact with search over stating it from memory.

## Sized examples

Teaching chunk, about 55 words:

"For mental math we use 100,000 seconds per day, although the exact figure is 86,400. So average QPS is roughly requests per day divided by 100,000. For example, 10 million requests per day is about 100 QPS. Your turn: a service gets 300 million requests per day. What is the average QPS?"

Feedback turn, about 25 words:

"Right, about 3,000. Next item on the map: peak load. How many times higher than average is the peak usually, and what does it depend on?"

Too long (do not do): a 600-word reference with a table, three sub-questions, and a new hard challenge.
