#!/usr/bin/env bash
# init-project.sh — Bootstrap a new project following dev-standards@0.1.0
#
# Usage:
#   bash init-project.sh <target-dir> <project-name>
#
# Example:
#   bash init-project.sh ~/dev/my-project "My Project"
#
# What it does:
#   1. Create the target directory
#   2. Copy templates/common/ into it (docs/, CLAUDE.md, README.md, .gitignore)
#   3. Substitute {{PROJECT_NAME}} placeholders
#   4. Copy memory/*.md into the Claude Code memory directory
#   5. git init + initial commit
#
# Requirements: bash, sed, git

set -euo pipefail

# -------- Arguments --------

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <target-dir> <project-name>"
  echo "Example: $0 ~/dev/my-project 'My Project'"
  exit 1
fi

TARGET_DIR="$1"
PROJECT_NAME="$2"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STANDARDS_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$STANDARDS_DIR/templates/common"
MEMORY_DIR="$STANDARDS_DIR/memory"

if [[ ! -d "$TEMPLATES_DIR" ]]; then
  echo "Error: templates directory not found at $TEMPLATES_DIR"
  exit 1
fi

# -------- Create target directory --------

if [[ -e "$TARGET_DIR" ]]; then
  echo "Error: $TARGET_DIR already exists"
  exit 1
fi

mkdir -p "$TARGET_DIR"
echo "Created $TARGET_DIR"

# -------- Copy templates --------

echo "Copying templates from $TEMPLATES_DIR..."
cp -r "$TEMPLATES_DIR/." "$TARGET_DIR/"

# Remove .gitkeep files (they were just for git to track empty dirs)
find "$TARGET_DIR" -name ".gitkeep" -delete

# -------- Substitute placeholders --------

echo "Substituting placeholders..."
find "$TARGET_DIR" -type f \( -name "*.md" -o -name "*.txt" \) -exec \
  sed -i "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" {} +

find "$TARGET_DIR" -type f \( -name "*.md" -o -name "*.txt" \) -exec \
  sed -i "s|{{PROJECT_TAGLINE}}|A project following dev-standards|g" {} +

TODAY="$(date -u +%Y-%m-%d)"
if [[ -f "$TARGET_DIR/docs/PROJECT-JOURNAL.md" ]]; then
  sed -i "s|YYYY-MM-DD|$TODAY|g" "$TARGET_DIR/docs/PROJECT-JOURNAL.md"
fi

# -------- Copy memory rules --------

CLAUDE_PROJECT_SLUG="$(echo "$TARGET_DIR" | sed 's|^/||' | sed 's|/|-|g')"
CLAUDE_MEMORY_DIR="$HOME/.claude/projects/-$CLAUDE_PROJECT_SLUG/memory"

if [[ -d "$MEMORY_DIR" ]]; then
  mkdir -p "$CLAUDE_MEMORY_DIR"
  cp "$MEMORY_DIR"/*.md "$CLAUDE_MEMORY_DIR/"
  echo "Copied memory rules to $CLAUDE_MEMORY_DIR"
else
  echo "Warning: memory directory not found, skipping memory rule copy"
fi

# -------- Git init --------

cd "$TARGET_DIR"
git init -q
git add -A
git commit -q -m "Initial scaffold from dev-standards@0.1.0

Project: $PROJECT_NAME
Standards: dev-standards@0.1.0 (R1-R9)
Directory structure: docs/{plan,analysis,tasklog,findings,reference}/
Portal: docs/PROJECT-JOURNAL.md
"

echo ""
echo "================================================================"
echo "Project initialized successfully"
echo "================================================================"
echo "Location:     $TARGET_DIR"
echo "Standards:    dev-standards@0.1.0"
echo "Memory rules: $CLAUDE_MEMORY_DIR"
echo ""
echo "Next steps:"
echo "  cd $TARGET_DIR"
echo "  # Edit README.md, CLAUDE.md, docs/PROJECT-JOURNAL.md with project details"
echo "  # Add remote: git remote add origin <your-remote-url>"
echo "  # Push: git push -u origin main"
echo ""
