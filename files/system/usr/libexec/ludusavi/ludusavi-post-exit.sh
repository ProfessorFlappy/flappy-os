#!/usr/bin/env bash
set -euo pipefail

GAME_TITLE="${1:?Usage: $(basename "$0") <game title>}"

if ! command -v flatpak >/dev/null 2>&1; then
    echo "Error: flatpak not found in PATH" >&2
    exit 1
fi

if ! flatpak info com.github.mtkennerly.ludusavi >/dev/null 2>&1; then
    echo "Error: ludusavi flatpak (com.github.mtkennerly.ludusavi) is not installed" >&2
    exit 1
fi

flatpak run com.github.mtkennerly.ludusavi backup --force "$GAME_TITLE"
