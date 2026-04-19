# Project Memory Reference Implementation

This directory contains a minimal SQLite-backed reference implementation for the `project-memory` adapter.

It is intentionally small.

Its purpose is to show:

- how memory can be initialized
- how entries can be stored
- how entries can be linked
- how scoped retrieval can work

It is not intended to be a production-ready memory system.

## Files

- `schema.sql` — SQLite schema
- `memory_store.py` — minimal CLI
- `ingestion-notes.md` — ingestion guidance
- `retrieval-notes.md` — retrieval guidance
- `queries.sql` — example SQL queries

## Commands

Initialize a database:

```bash
python3 memory_store.py init --db ./memory.db
```

Add an entry:

```bash
python3 memory_store.py add-entry \
  --db ./memory.db \
  --category decision \
  --title "Keep API validation in src/api" \
  --summary "Validation stays at the boundary layer." \
  --content "Business logic should not own raw request validation." \
  --tags api,validation,boundary \
  --source-kind decision-record \
  --source-ref docs/decisions/D-001.md \
  --module-scope src/api \
  --change-kind accepted-decision
```

Query scoped memory:

```bash
python3 memory_store.py query \
  --db ./memory.db \
  --module-scope src/api \
  --category failure \
  --category decision \
  --tag validation
```

## When To Harden

Do not overbuild this too early.

Stay with the minimal implementation until at least one of these becomes true:

1. memory volume is high enough that naive querying becomes slow
2. multiple projects need the same memory engine
3. retrieval quality is clearly limited by the current schema
4. ranking or semantic search becomes more important than exact filtering
5. concurrent writers or service deployment requirements appear

That is the right time to consider:

- service extraction
- better ranking
- embeddings or vector search
- transcript parsers
- background ingestion

Before that point, SQLite plus structured summaries is usually enough.
