# Sample session: database indexes for a backend interview

An illustrative session that shows the rhythm of `learn-topic`: a guess first, then one full explanation per block, then a short check, a closed-book gate, then cards. Text is condensed for reading.

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

**Tutor:** Yes, a full scan. Here is how indexes fix that, and what they cost.

An index is a separate sorted structure (in Postgres, a B-tree by default) that maps column values to row locations. With an index on `email`, the database walks the tree in a handful of steps and jumps to the matching rows. On 10 million rows that is the difference between reading everything and reading a few pages.

The price is paid on writes. Every INSERT, UPDATE of an indexed column, and DELETE updates the table and every index on it. One index is cheap. Five indexes on a write-heavy table mean six structures to maintain per insert, plus more disk and memory.

So the rule of thumb is: index the columns you filter, join, or sort on often, and do not index everything. Reads get faster, writes get slower.

Check, two questions. First: what does a filter on a 10-million-row table cost without an index, and what does the index change? Second: a table has five indexes and a write-heavy workload. What happens to write throughput, and why?

**You:** Without an index it scans every row, with one it jumps straight to the matches. Five indexes slow writes down because each insert updates six structures.

**Tutor:** Both correct. Blocks 1 and 2 are done. Next, composite indexes. Guess first: you have an index on `(country, city)`. Will a query that filters only by `city` use it well?

**You:** Not sure, probably not?

**Tutor:** Probably not is right, and here is why. A composite index is sorted by the first column, then by the second inside each first value, like a phone book sorted by last name, then first name. You can find "Smith, Anna" fast, but not every "Anna" in the book, because Annas are scattered across all last names. So the index helps filters on `country`, or on `country` plus `city`, but a filter on `city` alone usually cannot use it well. The order of columns matters: put the column you filter by most often, with equality, first.

Check: you filter by `status` (3 values) and `user_id` (millions of values), both with equality. Which column goes first, and why might your first instinct need a second look?

*[... block 4 continues in the same rhythm ...]*

**Tutor:** All four blocks passed the closed-book check. Make cards for them (up to 6 per block)?

**You:** Yes.

**Tutor:** Done: `database-indexes-cards.csv`, 5 cards, fields Front, Back, Notes, Tags. Next step: run `EXPLAIN ANALYZE` on one of your own queries and bring the output here. Ready?

---

The cards from this session are in [`sample-cards.csv`](sample-cards.csv).
