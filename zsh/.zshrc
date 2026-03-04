# Enable profiling if needed (uncomment to debug)
# zmodload zsh/zprof

# --- Performance: Fast compinit ---
# Only run compinit once a day or if .zcompdump is missing
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

# --- Plugins (Antidote) ---
source ~/.zsh_plugins.zsh

# --- Theme & Prompt ---
# Defer starship for faster initial prompt
if command -v starship &>/dev/null; then
  zsh-defer -c 'eval "$(starship init zsh)"'
fi

# --- Version Manager (mise) ---
# Defer mise activation
if command -v mise &>/dev/null; then
  zsh-defer -c 'eval "$(mise activate zsh)"'
fi

# --- Core Aliases & Tools ---
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias tree="eza --tree --icons"
alias cat="bat"
alias help="tldr"
alias du="dust"
alias lg="lazygit"
alias ld="lazydocker"
alias config="cd ~/dotfiles"
alias reload="source ~/.zshrc"
alias vi="nvim"
alias v="nvim ."

# Docker Aliases
alias dco="docker compose"
alias dps="docker ps"

# --- Homebrew & Path ---
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# FZF integration
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# Zoxide (Better cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Atuin (Better history)
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# --- Completion Settings ---
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Finalize profiling
# [[ $terminfo[kcuu1] == "" ]] && zprof
