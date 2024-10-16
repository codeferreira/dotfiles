# Prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[magenta]%}%(4~|.../%3~|%~)%{$fg[red]%}]%{$reset_color%}$%b "

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME/dotfiles'
alias cat="bat"
alias vi="nvim"
alias v="nvim ."
alias cl='clear'
alias lz='lazygit'
alias lzd='lazydocker'

# eza Aliases
alias ld="eza -lD"
alias lf="eza -lf --color=always | rg -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias ls="eza -alf --color=always --sort=size | rg -v /"
alias lt="eza -al --sort=modified"

# Docker Aliases
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Directory Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ssh="TERM=xterm-256color ssh"
alias yz="yazi"

# Homebrew Initialization
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Zinit Initialization
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    mkdir -p "$HOME/.local/share/zinit" && chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.zsh"
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# OMZP Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# Zsh Styles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Shell Integrations
eval $(thefuck --alias)
eval "$(starship init zsh)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh
source ~/aws_login.zsh

# Environment Variables
export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/nvim
export ANDROID_HOME="$HOME/Library/Android/sdk/"

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export GOPATH=$(asdf where golang)/packages
export GOROOT=$(asdf where golang)/go
export PATH="${PATH}:$(go env GOPATH)/bin"
# pnpm PATH
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
eval "$(zoxide init --cmd cd zsh)"


PATH=~/.console-ninja/.bin:$PATH
