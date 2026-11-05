# Sample session: database indexes for a backend interview

An illustrative session that shows the rhythm of `learn-topic`: short turns, one question each, attempt before hint, a closed-book gate, then cards. Text is condensed for reading.

---

**You:** Teach me how database indexes work. I have a backend interview in two weeks.

**Tutor:** Quick setup so I aim right. Which database do you use day to day, have you added or dropped an index before and what happened, and do you want interview-level answers or deep tuning?

**You:** Postgres. Added a few, never measured anything. Interview level.

**Tutor:** Here is the plan.
- Goal: explain indexes clearly and reason about them in an interview.
- Depth: what a good backend engineer can say about an index in two minutes.
- Blocks: 1. What an index does. 2. The write cost. 3. Composite indexes. 4. Selectivity and EXPLAIN.
- Out of scope: B-tree internals, vacuum tuning.

Go with this, or adjust?

**You:** Go.

**Tutor:** Before I explain anything: a table has 10 million rows and you filter by `email` with no index. Roughly, what does the database have to do? A wrong guess is fine.

**You:** Check every row?

**Tutor:** Yes, a full scan. An index is a sorted lookup structure, so the database jumps to the matching rows instead of reading all of them. Now you: you add an index on `email`. Name one cost you now pay on every INSERT.

**You:** No idea.

**Tutor:** Hint: when a new row arrives, where else does its email value have to go?

**You:** Into the index too?

**Tutor:** Exactly. Every write updates the table and each index on it. Closed-book check for blocks 1 and 2, first question: without an index, what does a filter on a 10-million-row table cost, and what does the index change?

**You:** A full scan, every row. With an index it jumps straight to the matching rows.

**Tutor:** Correct. Second question: a table has five indexes and a write-heavy workload. What happens to write throughput, and why?

**You:** It drops, because each insert updates six structures.

**Tutor:** Correct. Blocks 1 and 2 are done. On to composite indexes: you have an index on `(country, city)`. Will a query that filters only by `city` use it well? Guess first.

*[... blocks 3 and 4 continue in the same rhythm ...]*

**Tutor:** All four blocks passed the closed-book check. Make cards for them (up to 6 per block)?

**You:** Yes.

**Tutor:** Done: `database-indexes-cards.csv`, 5 cards, fields Front, Back, Notes, Tags. Next step: run `EXPLAIN ANALYZE` on one of your own queries and bring the output here. Ready?

---

The cards from this session are in [`sample-cards.csv`](sample-cards.csv).
