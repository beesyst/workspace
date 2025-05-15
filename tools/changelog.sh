#!/bin/bash

TEMPLATE_DIR="$HOME/Projects/workspace/templates/changelog"
TARGET_DIR="$(pwd)"

echo "🔧 Initializing CHANGELOG structure in: $TARGET_DIR"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "❌ Template directory not found: $TEMPLATE_DIR"
  echo "Make sure the workspace is correctly located."
  exit 1
fi

if [ -f "$TARGET_DIR/CHANGELOG.md" ]; then
  echo "⚠️  CHANGELOG.md already exists — skipping."
else
  cp "$TEMPLATE_DIR/CHANGELOG.md" "$TARGET_DIR"
  echo "✅ CHANGELOG.md added."
fi

if [ -f "$TARGET_DIR/version.txt" ]; then
  echo "⚠️  version.txt already exists — skipping."
else
  cp "$TEMPLATE_DIR/version.txt" "$TARGET_DIR"
  echo "✅ version.txt added."
fi

mkdir -p "$TARGET_DIR/.github/workflows"
cp "$TEMPLATE_DIR/.github/workflows/release-please.yml" "$TARGET_DIR/.github/workflows/release-please.yml"
echo "✅ release-please.yml workflow added."

echo "🎉 Changelog template successfully initialized!"
echo "💡 Next: Commit these files and push to enable release automation via GitHub Actions."