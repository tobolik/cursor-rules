#!/bin/sh
# Instalace firemních Cursor rules do projektu
# Použití: ./install.sh [cesta-k-projektu]
# Bez argumentu: zkopíruje do .cursor/rules/ v aktuální složce

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RULES_SRC="$SCRIPT_DIR/rules"
TARGET="${1:-.}"
RULES_DST="$TARGET/.cursor/rules"

if [ ! -d "$RULES_SRC" ]; then
  echo "Chyba: slozka rules nenalezena: $RULES_SRC" >&2
  exit 1
fi
mkdir -p "$RULES_DST"
cp -f "$RULES_SRC"/*.mdc "$RULES_DST/"
echo "Pravidla zkopirovana do $RULES_DST"
