---
name: session-handoff
version: 1.1.0
description: Use when the user says "session handoff", "wrap up session", "hand off", "handoff summary", "handoff to file", or wants to carry context from one session into one or more fresh sessions — especially to continue a multi-step effort after a break, or to fan a finished planning/brainstorm session out into parallel implementation sessions. Two modes - chat-only (default) and file (writes a portable, pointer-first handoff to disk so a new session resumes token-efficiently). Covers goal, step ledger, deliverables, live state, read-on-demand pointers, parallel tracks, how-to-verify, and the single next action.
---

# Session Handoff

Produce a handoff so work survives a `/clear`, a break of hours, or a fan-out into several sessions — without losing continuity and without burning tokens re-deriving what's already written.

The audience is a **future instance of you** (or several), not a stakeholder. A handoff is a routing artifact, not a status report.

## Two modes

- **Chat mode (default).** Output the handoff in chat only. Use for a quick "where am I" before the user clears, when nothing needs to persist to disk.
- **File mode.** Write a portable handoff to a file so a fresh session (or many) can pick up by reading that file. Use when the user will stop for hours, start a brand-new session after `/clear`, or split one finished effort into parallel sessions. Triggers: "handoff to file", "handoff for the next session(s)", "leave this ready for tomorrow / another session", or any time the session is the continuation of a finished planning/brainstorm effort.

When unsure which mode, ask one line: "chat-only, or write a file to continue later / in other sessions?"

## Core principle: pointer-first, not paste

Token efficiency is the whole point of file mode. The handoff stays **small and routing** — roughly one screen. It **links** to the source material (a prior brainstorm or plan, the deliverable being built, reference notes); it does **not** copy their contents. The next session reads the handoff first, then pulls referenced files **only for the step it is executing.**

A handoff that pastes full context defeats its own purpose.

## When to invoke

- "session handoff", "wrap up session", "hand off", "handoff summary", "summarize before I clear" → usually **chat mode**.
- "handoff to file", "leave it ready for another session / for tomorrow", "I'm going to open several sessions", "I'll continue this later" → **file mode**.
- Proactively, if the user says they're about to `/clear` mid-effort, or just finished a planning/brainstorm pass and is moving into doing the work.

## How to gather the handoff (both modes)

1. **Review the full conversation**, not just the last few turns.
2. **Pull state from these sources (in order):**
   - The planning or brainstorm file if this followed one — link it, don't restate it.
   - Plan files referenced this session.
   - Task / todo state — in-progress and pending items become the step ledger.
   - Deliverables created or modified this session — the actual output (doc, spreadsheet, diagram, deck, design, draft, analysis, code).
   - Background processes started this session — shell IDs are load-bearing.
   - Open apps / external tools mid-task (a design file, a spreadsheet, a video timeline, a browser flow) — name them and where they are.
   - Memory / notes written this session.
   - Unresolved questions — asked but never answered, on either side.
3. **Do NOT audit the filesystem.** Synthesize what happened in THIS session. No `git log`, no broad searches. If you didn't touch it this session, it doesn't belong here.
4. Write the handoff in the **same language the session was working in.**

## Chat-mode template

```
# Session Handoff — <one-line title>

## Where it started
<2-3 sentences: what was asked, key framing/constraints>

## Decisions locked + what was produced
- <decision or output> — <why, and where it lives (absolute path if a file)>

## Key files / artifacts for next session
- `<absolute path or link>` — <why read this first>

## Live state
- Background processes / open apps / drafts in flight — or "none"

## How to confirm it's right
- <check> — <expected>

## Deferred + open questions
- Deferred: <item> — <why>
- Open: <question for the user> — <context>

## Pick up here
<single most likely next action>
```

## File-mode template — artifact-neutral

Most work is **not code** (plans, content, spreadsheets, diagrams, design, analysis); code is the minority. The template leads with the **deliverable** and treats running-processes/commands as an optional sub-case, present only when relevant.

```
# Handoff — <slug> · <date>
source: <abs path or link to the plan/brainstorm>   ← read for the WHY; do not re-derive it here
plan: <abs path, link, or "inline below">
working-language: <language>

## Goal
<1-2 lines: the multi-step effort being carried forward>

## Deliverable(s)
- <what is being produced> — `<path or link>` — format <md/xlsx/diagram/deck/design/code/…> — status <draft | in review | final>

## Step ledger   ← the delta the source files do NOT already contain
- [x] 1. <done> — <where it landed>
- [~] 2. <in progress> — <exact stopping point / what's half-done>
- [ ] 3. <pending>
- [ ] 4. <pending>

## Read-on-demand (pointers, not copies)
- `<path or link>` — read when doing step N
- <reference / source / data file> — context for step M

## Live state
- Open apps / external tools: <design file, spreadsheet, video timeline, browser flow> — or "none"
- Background processes: <shell IDs + what + how to kill> — or "none"
- (code only) branch / worktree / dev server + port — or "n/a"

## Parallel tracks (fan-out only — omit for single-session resume)
- Track A → steps <2-3>, owns files <X> → tell a session: "read this handoff, do Track A only"
- Track B → step <4>, owns files <Y>
  (tracks must own DISJOINT files to avoid clobbering each other)

## Definition of done
- <per deliverable: acceptance criteria, where the finished thing should live, who/what validates it>
- (code only) `<command>` — expected outcome

## Deferred + open questions
- Deferred: <item> — <why>
- Open: <question needing the user> — <context>

## Pick up here
<single next action for a fresh session>
```

Two sections carry the real load:
- **Step ledger** — the only thing the source files don't already have. The resume anchor.
- **Parallel tracks** — the fan-out enabler. Include only when splitting into multiple sessions; each track must own disjoint files.

## Where the file goes (file mode)

Write to a stable, discoverable location, named: `{date}-{slug}-handoff.md` (date as `YYYY-MM-DD`).

- Default to a `handoffs/` directory at the project root, or co-locate it with the plan/brainstorm it continues so the pair is discoverable together.
- The `-handoff` suffix keeps them filterable for later cleanup.

If the effort had no prior plan, derive `{slug}` from the goal. Use today's date, converting any relative date first.

## How the next session consumes it (cheap)

- **Resume-later (single session):** tell the fresh session one line — `continue from {path-to-handoff}`. It reads the handoff, then pulls referenced files lazily per step.
- **Fan-out (multiple sessions):** open N sessions; give each — `read {path-to-handoff} and do Track <X> only`. Shared base context, isolated scope, no cross-talk.

The file is the vehicle; the user points the next session at it.

## Hard rules

1. **Mode discipline.** Chat mode: never write a file. File mode: write exactly one handoff file and also surface its path in chat. Don't update memory from this skill in either mode.
2. **Pointer-first.** Link source material; never paste the contents of the plan, brainstorm, or large deliverables into the handoff. Quote only the in-flight delta the source files lack.
3. **Never invent state.** A section with nothing to report says "none" / "n/a" — do not omit it. Structure stability is the point.
4. **Absolute paths or stable links.** The next session may have a different working directory.
5. **If a plan or brainstorm drove the effort, name it first** (`source` / `plan`) so the next session reads it before anything else.
6. **Deliverable-first, not code-first.** Lead with what's being produced and its acceptance criteria. Use the code-only sub-bullets (branch, dev server, verification command) only when the session actually involved code.
7. **No emojis, no hype, no retrospective.** Terse and concrete — paths, statuses, the next action. End-of-shift tone.
8. **Background process IDs are critical.** Any background shells must appear in "Live state" with their kill command.

## Anti-patterns — do not do these

- Pasting the plan or brainstorm into the handoff instead of linking it (kills token efficiency).
- A code-shaped handoff (branches, test commands, ports) for a content/spreadsheet/design/analysis session.
- Summarizing the last 3 turns and calling it a handoff.
- Relative paths.
- Omitting a section because "nothing is running" — write "none".
- Fan-out tracks that share the same files — they will clobber each other.
- Writing more than one handoff file, or scattering them across the project.
- A "what went well / poorly" retro, or next-step recommendations beyond the single "Pick up here" line.
