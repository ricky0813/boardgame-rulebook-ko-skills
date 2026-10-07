#!/bin/sh
set -eu

usage() {
  cat <<'EOF'
Usage: sh install.sh [--target codex|claude|both] [--codex-dir PATH] [--claude-dir PATH]

Link the three skills to Codex (~/.agents/skills) and/or Claude Code
(~/.claude/skills). Existing different entries are never overwritten.
EOF
}

target=both
codex_dir="$HOME/.agents/skills"
claude_dir="$HOME/.claude/skills"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --target|--codex-dir|--claude-dir)
      option=$1
      if [ "$#" -lt 2 ]; then
        echo "Missing value for $option" >&2
        exit 2
      fi
      case "$option" in
        --target) target=$2 ;;
        --codex-dir) codex_dir=$2 ;;
        --claude-dir) claude_dir=$2 ;;
      esac
      shift 2
      ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

case "$target" in
  codex) set -- "$codex_dir" ;;
  claude) set -- "$claude_dir" ;;
  both) set -- "$codex_dir" "$claude_dir" ;;
  *) echo "Invalid target: $target" >&2; exit 2 ;;
esac

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
skills_dir="$repo_dir/skills"

if [ ! -d "$skills_dir" ]; then
  echo "Missing skills directory: $skills_dir" >&2
  exit 1
fi

# Check every destination before creating any link.
for destination_dir in "$@"; do
  for skill_dir in "$skills_dir"/*; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    destination="$destination_dir/$(basename "$skill_dir")"
    if [ -e "$destination" ] || [ -L "$destination" ]; then
      if [ -L "$destination" ] && [ "$(readlink "$destination")" = "$skill_dir" ]; then
        continue
      fi
      echo "Existing skill blocks installation: $destination" >&2
      exit 1
    fi
  done
done

for destination_dir in "$@"; do
  mkdir -p "$destination_dir"
  for skill_dir in "$skills_dir"/*; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    destination="$destination_dir/$(basename "$skill_dir")"
    if [ ! -L "$destination" ]; then
      ln -s "$skill_dir" "$destination"
      echo "Linked $destination"
    fi
  done
done
