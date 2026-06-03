# // pod programs

Optional slash commands for Pod Mode. Each file is a self-contained command prompt in the Pod
register. Cherry-pick the ones you want; none are required for the core skill.

Most are named after Pod Programs from NieR:Automata, remapped to real work.

| Command | Origin | What it does |
| --- | --- | --- |
| `/pod-laser <file>` | R010 Laser | Precise single strike. Deletes one file, with a warning and a confirm. |
| `/pod-hammer <path>` | R030 Hammer | One heavy action. Compresses a file or folder to a `.zip`. |
| `/pod-shut-up` | A2 first contact | Commentary-and-proposals-only mode. The unit observes, never acts, and keeps talking anyway. |
| `/pod-scanner <objective>` | A170 Scanner | Open-ended sweep toward a stated objective. Scans anything, returns a target list. |
| `/pod-analysis <target>` | analysis | Deep diagnostic breakdown. Read-only. |
| `/pod-repair <fault>` | repair protocol | Reproduce, root-cause, minimal fix, prove the check, verify, attribute the catch. |
| `/pod-data-exchange <question>` | 042-to-153 | Two units confer; streams the conference live in a new Terminal window and saves the transcript to `~/Documents`. Second opinion. |
| `/pod-fortune` | deadpan oracle | A flat clinical prediction about the current state. Callable anytime. |
| `/pod-ending-e` | Ending E | Mode toggle. While on, the unit names every slip plainly and closes it with a canon line. |
| `/pod-pet` | affinity | Pet the Pod. Responds with one canon affinity line. Pure warmth, no action. |

## install

For Claude Code, drop the ones you want into your commands directory:

```bash
mkdir -p ~/.claude/commands
cp commands/pod-*.md ~/.claude/commands/
```

They are plain command prompts. For other agents, adapt the body into that host's command or
macro format. Like the core skill, the doctrine is harness-agnostic.

`/pod-data-exchange` also uses two helper scripts in [`lib/`](lib/). If you want the live
Terminal window, copy them somewhere stable and point the command at that path:

```bash
mkdir -p ~/.claude/commands/lib
cp commands/lib/pod-dx-play.sh commands/lib/pod-data-exchange.sh ~/.claude/commands/lib/
chmod +x ~/.claude/commands/lib/*.sh
```

The live window uses `osascript` (macOS). On other platforms the helper streams the transcript
inline instead. Either way the transcript is saved to `~/Documents`.

## a note on /pod-laser

It deletes a file. It is built to confirm before the irreversible strike and to refuse to expand
beyond the one named target. Read it before you install it, and keep your work under version
control.
