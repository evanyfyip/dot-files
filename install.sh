#!/usr/bin/env bash
# Symlinks this repo's configs into place. Safe to re-run.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up existing $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/zsh/zprofile" "$HOME/.zprofile"
link "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

echo
echo "Done. Restart your terminal or run: exec zsh"
echo "To install Homebrew packages from this repo's Brewfile: brew bundle --file=$DOTFILES_DIR/Brewfile"
