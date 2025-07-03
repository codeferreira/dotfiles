eval "$(starship init zsh)"

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
alias ccm="git diff | cody chat -m 'Write a commit message for this diff' -"

# Homebrew Initialization
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# . /opt/homebrew/opt/asdf/libexec/asdf.sh
# 
# Environment Variables
export LANG=en_US.UTF-8
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory



. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval "$TF_CMD";
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s "$TF_CMD"
            }
        

