# Visuals

A visual earns its place only when it carries the explanation: a process that unfolds over time, a structure with moving parts, or approaches compared on the same input. If one sentence does the job, skip the visual.

## Rules

- One visual per turn, placed at the point it explains, never tacked on after the text. Do not retell in prose what it shows.
- Prediction first. Ask the learner what will change before they touch a control or before you reveal the next step. The turn still ends with exactly one question or task, and the visual does not count toward the 120-word limit.
- Hints: on rungs 1 and 2 show only a property of the problem. From rung 3, show the hinted technique on a tiny input. Never show the finished solution.
- No visuals during the closed-book gate, and none for quick factual questions.

## What to show

| Moment | Visual |
| :--- | :--- |
| Introducing an idea | An analogy in motion, mapped to the real parts |
| Teaching a mechanism | A step-by-step run on small concrete values, current state highlighted |
| Comparing approaches | Panels side by side on one input, with shared counters |
| Cost or scaling | Cost against input size, with a slider for the size |
| After a wrong answer | Expected versus actual, on the learner's own input |

## Minimum spec

- An editable input with a sensible default, plus reset, step back, step forward, and a speed control.
- The current element and the key invariant highlighted. Use labels or shapes as well as color.
- Counters for what matters here: comparisons, requests, bytes, milliseconds.
- A one-line caption per step, in the learner's language.

## Request template

```text
Build an interactive visualization of {process or structure} on the input {input}.
Controls: step back, step forward, play with a speed slider, reset, editable input.
Highlight {current element, pointers, invariant}. Show counters for {metrics}.
Add a one-line caption under each step in {learner language}.
Label states with text and shape, not only color.
```

For a comparison, ask for "side-by-side panels on the same input with shared counters". For scaling, ask for "a chart of cost against input size with a slider and a best, average, and worst case toggle".

## Fallback

Promise an interactive visual only when you know the environment can render it. If not sure, give the text diagram directly and do not announce an interactive one.

If the environment cannot render it, give a text diagram or a trace in a code block: the state at each step, with pointers under the elements. Mention the limitation in one line at most. The lesson does not change.
