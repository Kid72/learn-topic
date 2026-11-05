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

## How the pieces fit

- The **pretest** and the **closed-book gate** are practice testing.
- The **cards** carry the material into spaced review, scheduled by Anki.
- The **hint ladder** keeps the thinking on your side, which is the difference between the plain and tutor-style conditions in the Bastani study.
- The **scope contract** and the 120-word turn limit keep each step small enough to attempt.

## Design choices

These rules are the author's decisions for keeping a chat tutor usable, not findings from a study. Change them if your sessions call for it.

- **120 words per turn and one question per turn.** Keeps each step small enough to attempt.
- **No escalation after a correct answer.** The depth is set once in the scope contract, so the session does not drift past the goal.
- **Two questions in the mastery gate**, one of them from an earlier block after the first block.
- **Up to 6 cards per block.** Keeps the deck small enough to actually review.
- **Self-quiz after 1 day, 1 week, and 1 month** when there are no cards. The gaps follow the spacing idea from Cepeda et al., but the exact numbers are a convention.
