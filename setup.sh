#!/usr/bin/env bash
set -euo pipefail

# ─── Homebrew ────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update --quiet

# ─── Oh My Zsh ───────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ─── Homebrew Bundle ─────────────────────────────────────────────────────────
# Add new packages to Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/Brewfile"

echo ""
echo "Setup complete! Run 'chezmoi apply' to apply your dotfiles."
