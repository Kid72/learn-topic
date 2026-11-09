# Install options

`learn-topic` is a standard Agent Skill: a folder with a `SKILL.md` and a `references/` directory. Pick the route that matches your agent.

> A skill is plain-text instructions your agent follows, and a plugin can run code with your user privileges. As with any third-party skill, read `skills/learn-topic/` before installing. This one contains Markdown only, with no scripts.

## Claude Code, plugin marketplace

```text
/plugin marketplace add Kid72/learn-topic
/plugin install learn-topic@kid72-skills
```

Pin a version with `Kid72/learn-topic#v1.3.0`. Third-party marketplaces do not auto-update by default, so re-run the install to upgrade.

## Any agent, via `npx skills`

Needs Node.js 22.20 or newer. The [`skills` CLI](https://github.com/vercel-labs/skills) finds the skill in this repository and installs it for the agents you choose.

```bash
npx skills add Kid72/learn-topic --list                      # show what is inside
npx skills add Kid72/learn-topic --skill learn-topic         # interactive
npx skills add Kid72/learn-topic --skill learn-topic -g      # global instead of per project
npx skills add Kid72/learn-topic --skill learn-topic -a antigravity-cli
```

## Claude.ai and Claude Desktop

1. Download `learn-topic.zip` from the [latest release](https://github.com/Kid72/learn-topic/releases/latest).
2. Open **Customize → Skills**, upload the zip, and switch the skill on.

Use the zip from the release page. GitHub's "Download ZIP" button wraps everything in a `learn-topic-main/` folder, which the upload does not accept.

## Gemini app (web, mobile, Mac)

Google's help page for [Skills in the Gemini app](https://support.google.com/gemini/answer/17094296) lists the requirements: you must be 18 or older, signed in, and have Keep Activity turned on.

1. Download `learn-topic-gemini.zip` from the [latest release](https://github.com/Kid72/learn-topic/releases/latest). It has `SKILL.md` at the root of the archive, which is what the Gemini upload expects.
2. Open gemini.google.com, choose **Customize** (under **More** if you do not see it), then **Skills**.
3. Choose **Create**, then **Upload**, pick the zip (you can also pick the unzipped folder or `SKILL.md`), then **Create**.
4. Check that the skill shows as active.

To update it later, use **More → Replace skill** and upload the whole skill again, references included.

## Antigravity CLI (`agy`)

Google replaced Gemini CLI with Antigravity CLI. It reads skills from these folders:

```bash
# one project
mkdir -p .agents/skills && cp -r skills/learn-topic .agents/skills/

# all projects
mkdir -p ~/.gemini/config/skills && cp -r skills/learn-topic ~/.gemini/config/skills/
```

Then run `/skills reload` inside `agy`, or start a new conversation. See the [Antigravity skills docs](https://antigravity.google/docs/skills).

## Other agents and manual copy

```bash
git clone https://github.com/Kid72/learn-topic.git
cp -r learn-topic/skills/learn-topic ~/.claude/skills/    # Claude Code, personal
cp -r learn-topic/skills/learn-topic .claude/skills/      # Claude Code, one project
cp -r learn-topic/skills/learn-topic ~/.agents/skills/    # agents that read .agents/skills
```

## Updating

Pull the repository and copy the folder again, run `npx skills update`, or re-upload the newest release zip.
