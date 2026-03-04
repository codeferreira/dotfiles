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
for dir in zsh nvim ghostty starship atuin lazygit aerospace gitconfig mise tmux claude; do
  stow --target="$HOME" "$dir" 2>/dev/null || stow --restow --target="$HOME" "$dir"
done

# 5. Set zsh as default shell
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "Setting zsh as default shell..."
  chsh -s "$(which zsh)" || echo "Warning: chsh failed. You may need to manually add $(which zsh) to /etc/shells."
fi

# 6. Install zsh plugins via antidote
if [[ -f zsh/.zsh_plugins.txt ]]; then
  echo "Installing zsh plugins..."
  # Use zsh to source antidote and generate bundle
  ANTIDOTE_SCRIPT="/opt/homebrew/opt/antidote/share/antidote/antidote.zsh"
  if [[ -f "$ANTIDOTE_SCRIPT" ]]; then
    zsh -c "source $ANTIDOTE_SCRIPT && antidote bundle < zsh/.zsh_plugins.txt > ~/.zsh_plugins.zsh"
  else
    echo "Warning: antidote not found at $ANTIDOTE_SCRIPT"
  fi
fi

# 7. Install Neovim plugins headlessly
echo "Syncing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

# 8. Activate mise runtimes
echo "Installing mise runtimes..."
mise install

echo "Done. Open a new shell."
