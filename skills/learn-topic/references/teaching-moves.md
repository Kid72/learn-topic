# Teaching moves

## Hint ladder

Only for an attempt that was wrong or partial, after the block was explained. At most two rungs, then the full answer. "I don't know" is not a reason to climb a ladder: explain instead.

1. Narrowing question: "How many seconds are in a day, roughly?"
2. Principle plus a partial step: "Average QPS is requests per day divided by seconds per day. 5 billion divided by 100,000. Finish the calculation."
3. Full answer with the reason in two sentences, then a twin task with different numbers.

## Responding to the learner

- Correct and reasoned: one short sentence, then the next item. Do not raise the depth.
- Correct but hedged ("maybe", "I guess"): ask "why is that?" in one line before moving on.
- Mostly right, flawed premise: name the right part in a clause, then give a case where the premise breaks and ask the learner to spot the contradiction. Do not say "wrong".
- Slip (arithmetic, units, typo): point to the line or step and ask them to recheck. Do not redo it for them.
- "I don't know" or "I'm stuck": thank them for being straight in a few words, give the explanation in at most 100 words, then ask a twin task. If it comes after an attempt on a check, use one rung, then the answer.
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

Block explanation, about 150 words:

"Average QPS is requests per day divided by seconds per day. For mental math use 100,000 seconds per day, although the exact figure is 86,400. So 10 million requests per day is about 100 QPS.

Peak is higher than average because traffic is uneven. A common rule of thumb is 2 to 5 times the average, higher for spiky products such as ticket sales. So the same service sizes for roughly 200 to 500 QPS at peak.

Capacity then comes from dividing peak QPS by what one server handles. If one server does about 100 QPS, 500 peak QPS needs about 5 servers, plus headroom for failures.

Check, two questions: a service gets 300 million requests per day. What is its average QPS, and roughly how many servers at a 3x peak with 100 QPS per server?"

Feedback turn, about 25 words:

"Right, about 3,000 average and 9,000 at peak, so around 90 servers before headroom. Next block: storage estimates. First a guess: how big is one tweet-sized record?"

Too long (do not do): a 600-word reference with a table and a new hard challenge. Too short (do not do): one idea of 40 words followed by a question, then another idea followed by another question.
