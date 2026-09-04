# dotfiles

Personal dev environment setup: zsh, [Starship](https://starship.rs) prompt, and [Ghostty](https://ghostty.org) terminal, plus a Homebrew package snapshot.

## Contents

- `zsh/zshrc`, `zsh/zprofile` — shell config, aliases, and functions
- `starship.toml` — prompt config (catppuccin mocha theme, per-language segments)
- `ghostty/config` — terminal config (theme, font, keybinds)
- `Brewfile` — Homebrew formulae/casks snapshot (`brew bundle dump`)

## Install

```sh
git clone <this-repo> ~/Documents/Personal/dotfiles
cd ~/Documents/Personal/dotfiles
./install.sh
```

This symlinks each config into its expected location (`~/.zshrc`, `~/.zprofile`,
`~/.config/starship.toml`, `~/.config/ghostty/config`), backing up any existing
non-symlink file first (as `<file>.bak`).

To restore Homebrew packages on a new machine:

```sh
brew bundle --file=./Brewfile
```

## Updating

Edit the files directly in this repo (they're symlinked into place, so changes
take effect immediately), then commit. If you edit `~/.zshrc` etc. directly,
those edits already land here since it's a symlink.

To refresh the Brewfile snapshot after installing new packages:

```sh
brew bundle dump --file=./Brewfile --force
```
