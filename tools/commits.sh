#!/bin/bash

TEMPLATE_DIR="$HOME/Projects/workspace/templates/commits"
TARGET_DIR="$(pwd)"

echo "🔧 Setting up conventional commits in: $TARGET_DIR"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "❌ TEMPLATE_DIR not found: $TEMPLATE_DIR"
    echo "Please check the path to your workspace and try again."
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm not found!"
    echo "Do you want to install Node.js & npm now? [Y/n]"
    read -r INSTALL_NPM

    if [[ "$INSTALL_NPM" =~ ^[Yy]$ || -z "$INSTALL_NPM" ]]; then
        if [ -f "/etc/debian_version" ]; then
            echo "📦 Installing Node.js & npm via apt..."
            sudo apt update && sudo apt install -y nodejs npm
        else
            echo "🚫 Unsupported OS for automatic install. Please install Node.js manually: https://nodejs.org/"
            exit 1
        fi
    else
        echo "❌ Aborted. Please install npm and try again."
        exit 1
    fi
fi

cp "$TEMPLATE_DIR/.commitlintrc.json" "$TARGET_DIR"

mkdir -p "$TARGET_DIR/.husky"
cp -r "$TEMPLATE_DIR/.husky/commit-msg" "$TARGET_DIR/.husky/"
chmod +x "$TARGET_DIR/.husky/commit-msg"

if [ -f "$TARGET_DIR/package.json" ]; then
    echo "⚠️  package.json already exists — please merge manually if needed"
else
    cp "$TEMPLATE_DIR/package.json" "$TARGET_DIR"
fi

echo "📦 Installing commitlint & husky..."
npm install

echo "🔧 Running husky install..."
npm run prepare

echo "✅ Conventional commit setup complete!"
echo "📌 Try it: git commit -m \"feat: add awesome support\""
