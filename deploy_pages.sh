#!/usr/bin/env bash
set -euo pipefail
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "ERROR: run this in a git repository"; exit 1; }
echo "OK: inside git repository"
