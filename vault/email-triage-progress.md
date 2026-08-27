# Email Triage — Backlog Progress Tracker

Started 2026-08-26. Goal: work backward through richfabiani@gmail.com's inbox backlog,
applying `email-triage-policy.md`, until fully caught up — then shift to just handling new
incoming mail. A recurring automated Routine processes one batch per firing and updates this
file so progress survives between runs (each firing may be a fresh session with no memory of
prior ones — this file IS the memory).

## How to resume (read this first, every firing)
1. Check "Oldest processed boundary" below — that's the cutoff from the last run.
2. Search `in:inbox before:<boundary>` (or `in:inbox` entirely if boundary is unset — first run)
   for the next batch of up to 150 un-triaged messages, oldest-first within that slice.
3. Classify each per `email-triage-policy.md` (Rule Zero self-sent protection first, then the
   4 buckets). Trash junk, label ambiguous `Needs-Review`, leave project/personal-important untouched.
4. Update this file: new boundary (oldest date/id reached this run), running totals, log line.
5. Commit + push + mirror to Drive.
6. If the batch comes back empty or smaller than requested → **fully caught up**. Note it below
   and stop the backlog run (the recurring job then just handles new mail going forward, or can
   be told to reduce firing frequency).

## Running totals (cumulative, update each run)
- Trashed (junk): 14
- Flagged Needs-Review: 2
- Runs completed: 1

## Oldest processed boundary
- As of 2026-08-26: only the most recent ~20 threads (last ~3 days) have been triaged so far.
  Everything older than that is still untouched backlog. Next run should start from there and
  work backward.

## Log
- 2026-08-26 — First manual pass, 20 most recent threads reviewed: 14 trashed, 2 flagged,
  4 left untouched (Twilio system mail), 1 calendar notice left untouched. Recurring job set
  up same day to continue automatically.
