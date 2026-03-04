#!/usr/bin/env bash
set -euo pipefail

# 1. Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Install all packages
echo "Installing Brew packages..."
brew bundle --file="$(dirname "$0")/Brewfile"

# 3. Install TPM (Tmux Plugin Manager) if missing
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  mkdir -p "$HOME/.tmux/plugins"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# 4. Link dotfiles with stow
echo "Linking dotfiles with stow..."
cd "$(dirname "$0")"
# Removed 'zellij' from the list
for dir in zsh nvim ghostty starship atuin lazygit aerospace gitconfig mise tmux; do
  stow --target="$HOME" "$dir" 2>/dev/null || stow --restow --target="$HOME" "$dir"
done

# 5. Set zsh as default shell
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "Setting zsh as default shell..."
  chsh -s "$(which zsh)"
fi

# 6. Install zsh plugins via antidote
if [[ -f ~/.zsh_plugins.txt ]]; then
  echo "Installing zsh plugins..."
  antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh
fi

# 7. Install Neovim plugins headlessly
echo "Syncing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

# 8. Activate mise runtimes
echo "Installing mise runtimes..."
mise install

echo "Done. Open a new shell."
