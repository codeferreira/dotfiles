source ~/.zplug/init.zsh

alias ls="exa"
alias cat="bat"
alias vi="nvim"
alias v="nvim ."
alias cl='clear'
alias lz='lazygit'
alias lzd='lazydocker'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

. /opt/homebrew/opt/asdf/libexec/asdf.sh
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

zplug "agkozak/zsh-z"
eval $(thefuck --alias)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

source ~/aws_login.zsh

export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/nvim

export ANDROID_HOME="/users/joseferreira/Library/Android/sdk/"

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# Created by `pipx` on 2023-12-04 22:55:37
export PATH="$PATH:/Users/joseferreira/.local/bin"

# bun completions
[ -s "/Users/joseferreira/.bun/_bun" ] && source "/Users/joseferreira/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

PATH=~/.console-ninja/.bin:$PATH

# pnpm
export PNPM_HOME="/Users/joseferreira/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
alias config='/usr/bin/git --git-dir=/Users/joseferreira/dotfiles/.git --work-tree=/Users/joseferreira/dotfiles'
