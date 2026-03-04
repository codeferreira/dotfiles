# dotfiles

Personal macOS development environment managed with GNU Stow.

## Quick Start

```bash
git clone https://github.com/ferreiracode/dotfiles ~/dotfiles
cd ~/dotfiles
bash bootstrap.sh
```

That's it. One command installs everything and links all configs.

---

## What bootstrap.sh Does

1. **Homebrew** — installs if missing, runs `brew bundle`
2. **Stow** — symlinks all configs to `$HOME`
3. **Default shell** — sets zsh as default
4. **Antidote** — bundles zsh plugins
5. **Neovim** — syncs lazy.nvim plugins headlessly
6. **mise** — installs all runtime versions

---

## Tools Installed

### Shell
| Tool | Purpose |
|------|---------|
| zsh + antidote | Shell + plugin manager |
| starship | Prompt |
| atuin | Shell history (fuzzy, synced) |
| zoxide | Smart `cd` |
| fzf | Fuzzy finder |

### CLI Replacements
| Tool | Replaces | Command |
|------|----------|---------|
| bat | cat | `cat file` |
| eza | ls | `ll`, `ls`, `lt` |
| ripgrep | grep | `rg` |
| fd | find | `fd` |
| delta | diff pager | automatic via git |
| bottom | top/htop | `bt` |
| procs | ps | `ps` |
| glow | — | `glow README.md` |

### Dev
| Tool | Purpose |
|------|---------|
| neovim (AstroNvim) | Editor |
| lazygit | Git TUI |
| gh | GitHub CLI |
| mise | Runtime version manager (node, go, java, python) |
| zellij | Terminal multiplexer |
| yazi | File manager TUI |

### Kubernetes / Infra
| Tool | Purpose |
|------|---------|
| kubectl | Kubernetes CLI |
| helm | Kubernetes package manager |
| k9s | Kubernetes TUI |

### macOS Apps (Casks)
| App | Purpose |
|-----|---------|
| Ghostty | Terminal |
| Aerospace | Tiling window manager |
| Raycast | Spotlight replacement (launcher, snippets, scripts) |
| Maccy | Clipboard manager |
| Shottr | Screenshot tool |
| Claude | Anthropic desktop app |
| Claude Code | AI coding CLI (`claude` in terminal) |

---

## Zellij Keybindings

`Ctrl+A` activates tmux-mode. Mirrors the old tmux config.

| Key | Action |
|-----|--------|
| `Ctrl+A` | Enter tmux-mode |
| `Ctrl+A` again | Back to normal |
| `Ctrl+A` + `\|` | Split right |
| `Ctrl+A` + `-` | Split down |
| `Ctrl+A` + `hjkl` | Move focus |
| `Ctrl+A` + `c` | New tab |
| `Ctrl+A` + `n/p` | Next/previous tab |
| `Ctrl+A` + `z` | Fullscreen toggle |
| `Ctrl+A` + `s` / `o` | Session manager |
| `Alt+hjkl` | Move focus (no prefix) |
| `Alt+n/p` | Next/previous tab (no prefix) |

---

## mise — Runtime Versions

Replaces asdf. Uses the same `.tool-versions` files.

```bash
mise ls          # list installed versions
mise install     # install versions from config
mise use node@20 # switch version in current dir
```

Global config: `~/.config/mise/config.toml`

---

## Post-Install Manual Steps

These require UI interaction or account sign-in after install:

- **Raycast** — open app, grant accessibility permissions, set hotkey (`⌥ Space` recommended), import settings/snippets
- **Maccy** — open app, grant accessibility permissions, enable "Launch at Login"
- **Shottr** — open app, grant screen recording permission, configure hotkeys
- **Aerospace** — grant accessibility permissions: System Settings → Privacy → Accessibility
- **Atuin** — `atuin login` to sync history across machines
- **GPG signing** — import your GPG key: `gpg --import private.key`
- **SSH keys** — copy `~/.ssh` from old machine or generate new: `ssh-keygen -t ed25519`
- **Claude Code** — `claude login` to authenticate

---

## Directory Layout

```
dotfiles/
├── bootstrap.sh        # single-command setup
├── Brewfile            # all packages
├── zsh/                # .zshrc, .zsh_plugins.txt
├── nvim/               # AstroNvim config
├── ghostty/            # terminal config + themes
├── zellij/             # multiplexer config
├── starship/           # prompt config
├── atuin/              # history config
├── lazygit/            # git TUI config
├── gitconfig/          # .gitconfig (delta, aliases, gpg)
├── aerospace/          # window manager config
├── mise/               # runtime version manager
└── claude/             # Claude Code config, skills, agents
```

Each directory mirrors `$HOME` — stow creates symlinks directly.
