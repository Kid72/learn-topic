# The research behind the method

Most steps of the workflow map to a technique with published evidence. The table says what each source found and where `learn-topic` uses it. The rules that have no study behind them are listed at the end as design choices.

| Idea | Where it shows up | What the source found |
| :--- | :--- | :--- |
| Practice testing | Pretest per block, closed-book gate | [Dunlosky et al. 2013](https://www.psychologicalscience.org/news/releases/which-study-strategies-make-the-grade.html) rated practice testing and distributed practice as high-utility techniques, and rereading, highlighting, and summarization as low-utility. |
| Spaced repetition | Cards for Anki, review schedule | [Cepeda et al. 2008](https://pubmed.ncbi.nlm.nih.gov/19076480/) showed that the best gap between study sessions depends on how long you need to remember the material. |
| Pretesting | A guess before each explanation | [Richland, Kornell, and Kao 2009](https://learninglab.uchicago.edu/Pre-Testing_files/RichlandKornellKao.pdf) found that trying to answer questions before studying improved later memory of the material. |
| Attempt first, hints over answers | Hint ladder, "just tell me" switch | [Bastani et al., PNAS 2025](https://knowledge.wharton.upenn.edu/article/without-guardrails-generative-ai-can-harm-education): in a high-school math trial, students using plain GPT did better during practice but worse on a later exam without AI, while a tutor-style version with hints avoided that drop. Summary from the Wharton write-up. |
| Guided AI tutoring | One small chunk at a time, scaffolded steps | [Kestin et al., Scientific Reports 2025](https://pmc.ncbi.nlm.nih.gov/articles/PMC12179260/): in a randomized crossover with 194 physics students, a carefully prompted AI tutor beat in-class active learning on a post-test. |
| Atomic flashcards | One idea per card, short answers | [Wozniak, Twenty rules of formulating knowledge](https://www.supermemo.com/en/blog/twenty-rules-of-formulating-knowledge): practitioner guidance from SuperMemo, not a controlled trial. |

## Study notes

The study note for Notion follows a few findings and keeps the rest as design choices. Sources below were read at abstract or summary level.

| Idea | Where it shows up | What the source found |
| :--- | :--- | :--- |
| Review by recall, not rereading | Self-test questions with answers below them, review schedule | [Dunlosky et al. 2013](https://doi.org/10.1177/1529100612453266) rated practice testing as high-utility and rereading and summarization as low-utility. |
| The learner's own generation | A "Your turn" section left empty for the learner | [Fiorella and Mayer 2016](https://eric.ed.gov/?id=EJ1120458) review generative strategies such as summarizing, mapping, and self-explaining. A 2025 preprint on AI-supported note-taking ([Chen et al.](https://arxiv.org/pdf/2509.03392)) studies how AI assistance affects cognitive engagement. |
| Typing or handwriting matters little | No rule on medium; the note is a review tool | [Morehead, Dunlosky, and Rawson 2019](https://www.learningscientists.org/blog/2019/2/21-1) and [Urry et al. 2021](https://doi.org/10.1177/0956797620965541) report that the pen-over-keyboard result of Mueller and Oppenheimer 2014 did not replicate. |

Notion documents Markdown import for headings, lists, and code blocks, and says nonstandard extensions may not import cleanly ([Notion Help](https://www.notion.com/help/import-data-into-notion)). The note therefore sticks to a small Markdown subset.

### Note design choices

No source located gives the best length or structure for a whole-topic note, so these are the author's choices:

- About 500 to 800 words, 5 to 8 key ideas, 6 to 10 self-test questions.
- Review after about 1 day, 1 week, and 3 weeks.
- Keywords from memory at the second review (inspired by research on delayed summaries such as [Thiede and Anderson 2003](https://experts.boisestate.edu/en/publications/summarizing-can-improve-metacomprehension-accuracy/), which studied judgment accuracy, not memory).
- One comparison table, only when the topic holds a real comparison. Concept maps ([Nesbit and Adesope 2006](https://www.sfu.ca/~jcnesbit/research/nesbitadesope2006.htm)) are not used in the note.
- Answers written on the next line so the note works without toggles.

## How the pieces fit

- The **pretest** and the **closed-book gate** are practice testing.
- The **cards** carry the material into spaced review, scheduled by Anki.
- The **study note** gives a whole-topic pass that is reviewed by recall.
- The **hint ladder** (used after a wrong attempt, not after "I don't know") keeps the thinking on your side, which is the difference between the plain and tutor-style conditions in the Bastani study.
- The **scope contract** and the one-block-per-explanation rhythm keep each step small enough to attempt.

## Design choices

These rules are the author's decisions for keeping a chat tutor usable, not findings from a study. Change them if your sessions call for it.

- **One explanation per block, up to 300 words, then a short check.** The pretest comes first, and the learner is never questioned on an idea before it has been explained. Other turns stay under 120 words.
- **No escalation after a correct answer.** The depth is set once in the scope contract, so the session does not drift past the goal.
- **Two questions in the mastery gate**, one of them from an earlier block after the first block.
- **Up to 6 cards per block.** Keeps the deck small enough to actually review.
- **Self-quiz after 1 day, 1 week, and 1 month** when there are no cards. The gaps follow the spacing idea from Cepeda et al., but the exact numbers are a convention.
