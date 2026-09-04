# dotfiles

Personal dev environment setup: zsh, [Starship](https://starship.rs) prompt, [Ghostty](https://ghostty.org) terminal, and [Neovim](https://neovim.io) ([LazyVim](https://www.lazyvim.org)), plus a Homebrew package snapshot.

## Contents

- `zsh/zshrc`, `zsh/zprofile` — shell config, aliases, and functions
- `starship.toml` — prompt config (catppuccin mocha theme, per-language segments)
- `ghostty/config` — terminal config (theme, font, keybinds)
- `nvim/` — Neovim config, based on the [LazyVim starter](https://github.com/LazyVim/starter)
- `Brewfile` — Homebrew formulae/casks snapshot (`brew bundle dump`)

Ghostty's font is set to `JetBrainsMono Nerd Font` (installed via the
`font-jetbrains-mono-nerd-font` cask) so LazyVim's icons render correctly.

`zsh/zshrc` also wires up a "Warp-lite" shell experience via Homebrew packages:
`zsh-autosuggestions` (inline history-based command suggestions, accept with
`→`), `zsh-syntax-highlighting` (color commands as valid/invalid while typing),
and `fzf` + `fzf-tab` (fuzzy-searchable Tab-completion menu and `Ctrl+R`/`Ctrl+T`/
`Alt+C` fuzzy history/file/directory search). These are resolved via
`$(brew --prefix)` at shell startup rather than hardcoded, so the config still
works if Homebrew's prefix differs (e.g. Intel Mac).

## Install

```sh
git clone <this-repo> ~/Documents/Personal/dotfiles
cd ~/Documents/Personal/dotfiles
./install.sh
```

This symlinks each config into its expected location (`~/.zshrc`, `~/.zprofile`,
`~/.config/starship.toml`, `~/.config/ghostty/config`, `~/.config/nvim`), backing
up any existing non-symlink file/dir first (as `<name>.bak`).

To restore Homebrew packages on a new machine:

```sh
brew bundle --file=./Brewfile
```

On first launch, Neovim/LazyVim will bootstrap its plugins automatically. To
do that non-interactively (e.g. right after `install.sh`):

```sh
nvim --headless "+Lazy! sync" +qa
```

## Updating

Edit the files directly in this repo (they're symlinked into place, so changes
take effect immediately), then commit. If you edit `~/.zshrc` etc. directly,
those edits already land here since it's a symlink.

To refresh the Brewfile snapshot after installing new packages:

```sh
brew bundle dump --file=./Brewfile --force
```
