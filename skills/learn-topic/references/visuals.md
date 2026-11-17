# Visuals

A visual is part of the explanation, not an extra. Skipping a required one is a failure.

## When required

- A block that teaches a process over time (a request path, a lock timeline, a failure sequence), a structure (how data is laid out), or a comparison of approaches on the same input.
- The second explanation after "I did not understand" a mechanism: show it on concrete values.
- Skip it for a pure definition, a single number, and during the gate.

## Baseline: a text diagram

Always available, so never skip a required visual because the client cannot render anything. Boxes and arrows for a path, a timeline with timestamps for a sequence, a small state table for a structure, inside a code block. Concrete values only, at most 12 lines, placed where it explains, not retold in prose. It does not count toward the word limit. Label states with text, not only color.

```text
key: rate:user_42   (sorted set, member → score = time)
  req_1 → 12:00:10    removed, older than 60 s
  req_2 → 12:00:25
  req_3 → 12:00:40
new request at 12:01:15: count = 2 < 3, allowed, add req_4
```

## Interactive version (only when the client can render it)

The same diagram as an interactive visual: an editable input with a default, step back and forward, reset, the current element highlighted, counters (comparisons, requests, ms), a one-line caption per step. If you are not sure it renders, give the text diagram and do not announce an interactive one. Ask for the learner's prediction first. Never show the finished solution to an open check question.
