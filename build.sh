#!/usr/bin/env bash
# Copia el prompt de chat (fuente única) como referencia de la skill y
# empaqueta dist/session-handoff.zip con la forma que pide claude.ai:
# session-handoff/SKILL.md en la raíz del ZIP.
set -euo pipefail
cd "$(dirname "$0")"
cp chat/documento-de-memoria.md skill/session-handoff/references/memory-document.md
mkdir -p dist
rm -f dist/session-handoff.zip
(cd skill && zip -qrX ../dist/session-handoff.zip session-handoff -x '*.DS_Store')
unzip -l dist/session-handoff.zip
