# Contributing

Thanks for helping make `learn-topic` better. The skill is plain Markdown, so most contributions are small.

## Good contributions

- A session where the tutor misbehaved (too long, skipped the attempt, escalated difficulty, weak flashcards). Open an issue with the topic, your prompts, and what happened.
- Better wording for a rule, hint, or card example.
- Translations of the example session in `examples/`.

## Pull requests

1. Keep `SKILL.md` under 500 lines and link detail files one level deep from it.
2. Keep `name` equal to the folder name and `description` under 1024 characters.
3. Describe what behavior changed and show a short transcript before and after.
4. Update `CHANGELOG.md` under an `Unreleased` heading.

## Releasing (maintainer)

Bump `version` in `.claude-plugin/plugin.json` and `metadata.version` in `SKILL.md`, update `CHANGELOG.md`, then push a tag such as `v1.0.1`. The release workflow builds `learn-topic.zip` and attaches it to the GitHub release.

## Local check

Copy the skill into your agent's skills folder and start a fresh session:

```bash
cp -r skills/learn-topic ~/.claude/skills/
```
