# Session Handoff: a skill for Claude Code (and a prompt for any chat)

A [Claude Code](https://claude.com/claude-code) skill that turns the end of a
work session into a clean handoff, so the next session (yours tomorrow, or a
fresh one after `/clear`) picks up exactly where you left off **without
re-reading the whole conversation.**

It produces a small, routing document: what you were doing, what's done, what's
half-done, where the files live, and the single next action. It **links** to
your source material instead of copying it, so resuming costs a fraction of the
tokens a normal "catch me up" would.

Works for any kind of work: writing, research, design, spreadsheets, planning,
code. Not code-specific.

---

## Why use it (the difference)

Without the skill, continuing a long task across sessions means one of two bad options:

- **Re-paste everything.** You dump the old transcript or a wall of context into
  the new session. It works, but it's slow and burns a huge number of tokens on
  things the model could just *look up*.
- **Wing it from memory.** You give a one-line summary and the new session
  guesses at the rest, re-deriving decisions you already made, re-reading files
  you already finished, and sometimes redoing work.

**With the skill** you get a one-screen handoff that is *pointer-first*:

| | Without | With Session Handoff |
|---|---|---|
| Resuming context | re-paste transcript or re-explain | read one short file |
| Token cost | high: full context re-sent | low: links, not copies |
| What's done vs pending | fuzzy / from memory | explicit step ledger |
| Parallel work | hard: sessions step on each other | fan-out tracks own disjoint files |
| Next action | "uh, where was I?" | one explicit line |

It has three modes:

- **Chat mode** (default): prints the handoff in the conversation. Good for a
  quick "where am I" before you clear.
- **File mode**: writes a portable `*-handoff.md` to disk so a brand-new
  session can resume by reading just that file, or so you can split one finished
  plan into several parallel sessions.
- **Memory document mode**: reads the *whole* conversation and returns a
  self-contained *Documento de memoria* you paste into a new chat (or another
  tool) to keep going. Invoke it again later and it upgrades the same document
  to the next version instead of writing a second summary. Built for people who
  only use the chat, where long conversations get compacted or hit the limit.

---

## No Claude Code? Use it in the chat (claude.ai or ChatGPT)

You don't need to install anything. Open [`chat/documento-de-memoria.md`](chat/documento-de-memoria.md),
paste its full contents at the end of a long conversation, and you get a memory
document to copy. Start the next conversation by pasting that document; when it
grows, paste the prompt again and you get version 2 of the same document.

- **Projects (Claude or ChatGPT) / custom GPTs:** put the prompt in the
  instructions, then just say "actualiza la memoria".
- **Skills on claude.ai** (Pro, Max, Team, Enterprise, with code execution on):
  upload the same `.zip` you downloaded (`claude-session-handoff-main.zip`)
  under Settings → Skills, without unzipping it. It includes the memory
  document mode.

Step-by-step guide in Spanish: [`chat/README.md`](chat/README.md).

---

## Install (Claude Code)

A Claude Code skill is just a folder with a `SKILL.md` inside it, placed where
Claude Code looks for skills.

### The easy way: let Claude install it

If you have **Claude Code** installed, paste this to it:

> Clone `https://github.com/hackeryisus/claude-session-handoff` and install the
> `skill/session-handoff` folder into my Claude Code skills directory
> (`~/.claude/skills/session-handoff`). Then confirm the `session-handoff` skill
> shows up.

### The manual way

```bash
git clone https://github.com/hackeryisus/claude-session-handoff
mkdir -p ~/.claude/skills
cp -R claude-session-handoff/skill/session-handoff ~/.claude/skills/
```

Restart Claude Code (or start a new session). The skill activates automatically
when you say things like "session handoff" or "wrap up this session"; no slash
command needed.

> **Project-scoped instead?** Copy the `skill/session-handoff` folder into
> `.claude/skills/` inside a specific project to make it available only there.

---

## Use it

Just talk to Claude Code:

- `wrap up this session` → chat-mode handoff, printed in the conversation.
- `handoff to file` → writes a `{date}-{slug}-handoff.md` you can hand to a fresh session.
- `I'm going to open several sessions, hand this off` → adds parallel **tracks**, each owning disjoint files so they don't clobber each other.
- `documento de memoria` / `actualiza la memoria` → self-contained memory document of the whole conversation, upgraded in place each time.

Then in the next session:

- **Resume:** `continue from <path-to-handoff>`
- **Fan-out:** open N sessions, tell each `read <path-to-handoff> and do Track A only`

---

## What's in this repo

```
skill/session-handoff/   ← the skill (SKILL.md + references/), what you install
chat/                    ← pasteable prompt for chat-only users (claude.ai, ChatGPT)
build.sh                 ← syncs the chat prompt into the skill
web/                     ← the landing page (promo site)
LICENSE          ← MIT
```

---

## License

MIT. See [LICENSE](LICENSE).
