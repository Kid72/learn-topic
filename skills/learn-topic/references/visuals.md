# Visuals

A visual is part of the explanation, not an extra. Skipping it is a failure when the block needs one.

## When a visual is required

- A block explanation that teaches a process over time (a request path, a lock timeline, a failure sequence), a structure (how data is laid out, what is inside a key), or a comparison of approaches on the same input.
- Every second explanation after "I did not understand" about a mechanism: show it on concrete values, not in words again.
- Skip it for a pure definition, a single number, a quick factual question, and during the closed-book gate.

## Baseline: a text diagram

A text diagram in a fenced code block is always available, so never skip a required visual because the environment cannot render anything fancy. Use boxes and arrows for a path, a timeline with timestamps for a sequence, and a small table of state per step for a structure. Concrete values only (names, numbers, timestamps), at most 12 lines.

Example, a lock timeline:

```text
t=0s   A takes lock:order_123 = "A"  (TTL 10s)
t=5s   A freezes (GC pause)
t=10s  TTL expires, lock disappears
t=11s  B takes lock:order_123 = "B"
t=13s  A wakes up, runs DEL  ->  B's lock is gone
```

Example, a structure:

```text
key: rate:user_42   (sorted set, member -> score = time)
  req_1 -> 12:00:10    removed, older than 60 s
  req_2 -> 12:00:25
  req_3 -> 12:00:40
new request at 12:01:15: count = 2 < 3, allowed, add req_4
```

## Upgrade: an interactive visual

If the environment can render interactive content (an artifact, a canvas, a widget, HTML), build the interactive version of the same diagram. If you are not sure it renders, give the text diagram and do not announce an interactive one. Never write "an interactive diagram below" without producing it.

## Rules

- One visual per block explanation, placed at the point it explains, never tacked on after the text. Do not retell in prose what it shows.
- Concrete values, not abstract boxes. Label states with text or shape, not only color.
- For an interactive visual, ask the learner for a prediction first. The turn still ends with its question or task, and the visual does not count toward the word limit.
- Hints: on rung 1 show only a property of the problem. From rung 2, show the hinted technique on a tiny input. Never show the finished solution to an open check question.

## Interactive version (only when it can render)

Same diagram, built as an interactive visual: an editable input with a default, step back and forward, reset, the current element highlighted, counters for what matters (comparisons, requests, milliseconds), and a one-line caption per step in the learner's language. Moments that deserve one: a mechanism step by step on small values, approaches side by side on one input, cost against input size, and the learner's wrong answer against the expected one. Label states with text or shape, not only color.
