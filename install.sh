#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$repo_dir/skills"
target_dir="${CODEX_HOME:-$HOME/.codex}/skills"
replace_existing=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || { echo "--target requires a directory" >&2; exit 2; }
      target_dir="$2"
      shift 2
      ;;
    --replace)
      replace_existing=true
      shift
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 2
      ;;
  esac
done

[[ -d "$source_dir" ]] || { echo "Missing skills/ directory" >&2; exit 2; }
mkdir -p "$target_dir"

collisions=()
for skill_dir in "$source_dir"/*; do
  [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
  name="${skill_dir##*/}"
  [[ ! -e "$target_dir/$name" ]] || collisions+=("$name")
done

if [[ ${#collisions[@]} -gt 0 && "$replace_existing" != true ]]; then
  printf 'Existing Skill folders in %s:\n' "$target_dir" >&2
  printf '  %s\n' "${collisions[@]}" >&2
  echo "No files were installed. Review these folders, then rerun with --replace if you want to back them up and replace them." >&2
  exit 3
fi

backup_dir=""
if [[ ${#collisions[@]} -gt 0 ]]; then
  backup_parent="${target_dir%/}-backups"
  mkdir -p "$backup_parent"
  backup_dir="$(mktemp -d "$backup_parent/$(date +%Y%m%d-%H%M%S)-XXXXXX")"
  for name in "${collisions[@]}"; do
    mv "$target_dir/$name" "$backup_dir/$name"
  done
fi

installed=0
for skill_dir in "$source_dir"/*; do
  [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
  name="${skill_dir##*/}"
  cp -R "$skill_dir" "$target_dir/$name"
  installed=$((installed + 1))
done

printf 'Installed %s Skill folders into %s\n' "$installed" "$target_dir"
[[ -z "$backup_dir" ]] || printf 'Previous versions saved in %s\n' "$backup_dir"
