#!/usr/bin/env bash
# Builds learn-topic.zip (claude.ai) and learn-topic-gemini.zip (Gemini app) into the repo root.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist learn-topic.zip learn-topic-gemini.zip
mkdir -p dist

# claude.ai: the skill folder is the top level of the zip
cp -r skills/learn-topic dist/learn-topic
(cd dist && zip -qr ../learn-topic.zip learn-topic)

# Gemini app: SKILL.md at the zip root, references inlined (the model may not open files)
mkdir -p dist/gemini
cp -r skills/learn-topic/. dist/gemini/
{
  cat skills/learn-topic/SKILL.md
  printf '\n\n# References (included here, so there is no need to open files)\n'
  for f in session-flow tutoring-rules teaching-moves visuals anki-cards study-notes; do
    printf '\n\n## REFERENCE: references/%s.md\n\n' "$f"
    # demote the reference title so it does not clash with the SKILL.md title
    sed '1s/^# /### /' "skills/learn-topic/references/$f.md"
  done
} > dist/gemini/SKILL.md
(cd dist/gemini && zip -qr ../../learn-topic-gemini.zip .)
unzip -l learn-topic-gemini.zip | grep -qE ' SKILL\.md$' || { echo "SKILL.md not at gemini zip root"; exit 1; }
echo "built learn-topic.zip and learn-topic-gemini.zip"
