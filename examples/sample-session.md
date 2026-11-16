# Sample session: database indexes for a backend interview

An illustrative session that shows the rhythm of `learn-topic`: a guess first, then one full explanation per block, then a two-question closed-book check that is also the gate, then cards. Text is condensed for reading.

---

**You:** Teach me how database indexes work. I have a backend interview in two weeks.

**Tutor:** Quick setup so I aim right. Which database do you use day to day, have you added or dropped an index before and what happened, and do you want interview-level answers or deep tuning?

**You:** Postgres. Added a few, never measured anything. Interview level.

**Tutor:** Here is the plan.
- Goal: explain indexes clearly and reason about them in an interview.
- Depth: what a good backend engineer can say about an index in two minutes.
- Blocks:
  1. Why an index speeds reads and slows writes.
  2. Why column order matters in a composite index.
  3. How to tell if an index is worth it, with EXPLAIN.
- Out of scope: B-tree internals, vacuum tuning.

Go with this, or adjust?

**You:** Go.

**Tutor:** Before I explain anything: a table has 10 million rows and you filter by `email` with no index. Roughly, what does the database have to do? A wrong guess is fine.

**You:** Check every row?

**Tutor:** Yes, a full scan. Here is how an index fixes that, and what it costs.

An index is a separate sorted structure (in Postgres, a B-tree by default) that maps column values to row locations. With an index on `email`, the database walks the tree in a few steps and jumps to the matching rows, instead of reading 10 million.

```text
email index (sorted)          table (10M rows)
  anna@x.com → row 8201
  bob@x.com  → row 17         lookup "bob@x.com": 3 steps + 1 row read
  ...                         no index: 10,000,000 rows read
```

The price is paid on writes. Every INSERT, UPDATE of an indexed column, and DELETE updates the table and every index on it. Five indexes on a write-heavy table mean six structures to maintain per insert. So index the columns you filter, join, or sort on often, and not everything.

Check, first question: what does the index change for a filter on 10 million rows?

**You:** It jumps straight to the matches instead of scanning every row.

**Tutor:** Right. Second question: a table has five indexes and a write-heavy workload. What happens to write throughput, and why?

**You:** It drops, because each insert updates six structures.

**Tutor:** Both correct, block 1 passed. Block 2. Guess first: you have an index on `(country, city)`. Will a query that filters only by `city` use it well?

**You:** Not sure, probably not?

**Tutor:** Probably not is the right guess, and here is why. A composite index is sorted by the first column, then by the second inside each first value, like a phone book sorted by last name, then first name.

```text
(country, city) index, sorted
  DE, Berlin
  DE, Munich
  FR, Lyon
  FR, Paris      filter country = 'FR'          → one contiguous range
                 filter city = 'Paris' only     → Paris is spread across all countries
```

So the index helps filters on `country`, or on `country` plus `city`, but a filter on `city` alone usually cannot use it well. Put the column you filter by most often, with equality, first.

Check, first question: you filter by `status` (3 values) and `user_id` (millions of values), both with equality. Which column goes first, and why?

*[... the gate for block 2, then block 3 in the same rhythm ...]*

**Tutor:** All three blocks passed the closed-book check. Make cards for them (up to 6 per block)?

**You:** Yes.

**Tutor:** Done: `database-indexes-cards.csv`, 5 cards (a short deck, because the blocks held few ideas), fields Front, Back, Notes, Tags. Next step: run `EXPLAIN ANALYZE` on one of your own queries and bring the output here. Ready?

---

The cards from this session are in [`sample-cards.csv`](sample-cards.csv).
