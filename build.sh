#!/usr/bin/env bash
# Copia el prompt de chat (fuente única) como referencia de la skill.
# Además arma dist/session-handoff.zip (ignorado por git) por si alguien
# quiere un ZIP solo con la skill. No se commitea: claude.ai rechaza un ZIP
# que traiga otro ZIP adentro, y el ZIP del repo debe poder subirse tal cual.
set -euo pipefail
cd "$(dirname "$0")"
cp chat/documento-de-memoria.md skill/session-handoff/references/memory-document.md
mkdir -p dist
rm -f dist/session-handoff.zip
(cd skill && zip -qrX ../dist/session-handoff.zip session-handoff -x '*.DS_Store')
unzip -l dist/session-handoff.zip
