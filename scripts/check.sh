#!/usr/bin/env bash
# Repo consistency checks. Run locally or in CI.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
bad() { echo "FAIL: $1"; fail=1; }

v_plugin=$(python3 -c 'import json;print(json.load(open(".claude-plugin/plugin.json"))["version"])')
v_skill=$(sed -n 's/^  version: "\(.*\)"/\1/p' skills/learn-topic/SKILL.md)
v_log=$(sed -n 's/^## \[\([0-9][^]]*\)\].*/\1/p' CHANGELOG.md | head -1)
v_install=$(sed -n 's/.*learn-topic#v\([0-9.]*\)`.*/\1/p' docs/INSTALL.md | head -1)
[ "$v_plugin" = "$v_skill" ] || bad "plugin.json $v_plugin != SKILL.md $v_skill"
[ "$v_plugin" = "$v_log" ] || bad "plugin.json $v_plugin != CHANGELOG $v_log"
[ "$v_plugin" = "$v_install" ] || bad "plugin.json $v_plugin != INSTALL pin $v_install"
if [ -n "${GITHUB_REF_NAME:-}" ] && [[ "${GITHUB_REF_NAME}" == v* ]]; then
  [ "v$v_plugin" = "$GITHUB_REF_NAME" ] || bad "tag $GITHUB_REF_NAME != version $v_plugin"
fi

if grep -rnP '[\x{2013}\x{2014}]' skills examples README.md docs CHANGELOG.md scripts >/dev/null 2>&1; then
  bad "em or en dash found"; grep -rnP '[\x{2013}\x{2014}]' skills examples README.md docs CHANGELOG.md scripts | head -5
fi

python3 -I - <<'PY' || fail=1
import csv, sys
rows = list(csv.reader(open("examples/sample-cards.csv", encoding="utf-8")))
if rows[0] != ["front", "back", "notes", "tags"]:
    sys.exit("FAIL: sample-cards.csv header")
if any(len(r) != 4 for r in rows):
    sys.exit("FAIL: sample-cards.csv column count")
if any(len(r[1].split()) > 12 for r in rows[1:]):
    sys.exit("FAIL: sample-cards.csv back over 12 words")
PY

scripts/build-zips.sh >/dev/null
unzip -l learn-topic-gemini.zip | grep -qE ' SKILL\.md$' || bad "SKILL.md not at gemini zip root"
unzip -p learn-topic-gemini.zip SKILL.md | grep -q "REFERENCE: references/study-notes.md" || bad "references not inlined in gemini SKILL.md"
unzip -l learn-topic.zip | grep -q 'learn-topic/SKILL.md' || bad "claude zip layout"
rm -rf dist learn-topic.zip learn-topic-gemini.zip

[ "$fail" = 0 ] && echo "all checks passed" || exit 1
