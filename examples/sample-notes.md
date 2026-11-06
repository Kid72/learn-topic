# Database indexes in Postgres

Cover the answers and try first. Feeling fluent while the answer is visible is not proof you know it.

## Overview

An index is a sorted lookup structure that lets Postgres jump to matching rows instead of reading the whole table. The big idea is a trade: faster reads for slower writes. Whether it pays off depends on column order and on selectivity, and `EXPLAIN` shows what the planner chose.

## Key ideas

### 1. What an index does

- Without an index, a filter on a 10-million-row table needs a sequential scan: every row is read.
- With an index on the filtered column, the database jumps to the matching rows.
- Relates to idea 2: the lookup structure has to be kept up to date, and that is where the cost comes from.

### 2. The write cost

- Every INSERT updates the table and each index on it.
- A table with five indexes does six writes per insert, so write-heavy workloads slow down as indexes are added.
- Rule of thumb (outside the session): add an index for a read pattern you actually have, not by default.

### 3. Composite indexes

- An index on `(country, city)` is ordered by `country` first, then `city` inside each country.
- A filter on `country`, or on `country` and `city`, can use it. A filter on `city` alone usually cannot use it well, because the leading column is missing.
- Relates to idea 4: column order should follow how queries filter.

```sql
CREATE INDEX idx_users_country_city ON users (country, city);
SELECT * FROM users WHERE country = 'DE' AND city = 'Berlin';
```

Caption: this query matches the index from its leading column; `WHERE city = 'Berlin'` alone would not.

### 4. Selectivity

- Selectivity is how much a filter narrows the rows. A column with 2 distinct values narrows very little.
- An index on a low-selectivity column is rarely used: the planner usually prefers a full scan.
- Contrasts with idea 1: an index is not always faster than a scan.

### 5. Reading EXPLAIN

- `EXPLAIN` shows the plan the planner chose without running the query.
- `EXPLAIN ANALYZE` runs the query and adds actual run times and row counts, so use it with care on queries that write.
- Look for `Seq Scan` versus an index scan to see whether your index was used.

Partial indexes, which cover only some rows, are another way to cut index size (outside the session).

## Shaky spots from this session

- Write cost (idea 2): the first answer was "no idea"; one hint got you to "the value also goes into the index". Retry it from memory.
- Composite order (idea 3): you made a guess in the session but did not check it on a real query. Test it with `EXPLAIN ANALYZE`.

## Self-test

1. Why does adding an index slow down INSERTs, and what happens on a write-heavy table with five indexes?

Answer: Each insert must also update every index on the table, so a table with five indexes does six writes per insert and write throughput drops.

2. You have an index on `(country, city)`. Why can it fail to help a filter on `city` alone?

Answer: The index is ordered by `country` first, so without the leading column the sorted order does not help.

3. You run `WHERE city = 'Berlin'` on a table that only has the `(country, city)` index. What will `EXPLAIN` most likely show?

Answer: A sequential scan, because the leading column is missing from the filter.

4. A table has 10 million rows and no index on `email`. What does a filter on `email` cost, and what does an index change?

Answer: A full sequential scan reads every row; the index lets the database jump to the matching rows.

5. Why is an index on a 2-value column rarely used?

Answer: Low selectivity: the filter returns a large share of the table, so the planner usually prefers a full scan.

6. What does `EXPLAIN ANALYZE` show that `EXPLAIN` does not, and what is the catch?

Answer: Actual run times and row counts, because it executes the query, so it really runs any write it contains.

## Your turn

- Explain in your own words why an index is a trade, not a free speed-up.
- Redraw from memory how a composite index, selectivity and `EXPLAIN` relate.
- Write the gist of this note in one sentence.

## Review schedule

Intervals are a convention, not a tested optimum. Each review is a recall attempt: cover the answers, answer from memory, then check.

- [ ] Day 1: answer the self-test questions, shaky spots first.
- [ ] About day 7: answer them again, then write 3 to 5 keywords from memory.
- [ ] About day 21: answer them again, then run `EXPLAIN ANALYZE` on one of your own queries and compare with what you predicted.
