# Load prompt
source "$HOME/.config/zsh/ps1.zsh"

# Load aliases
source "$HOME/.config/zsh/alias.zsh"

# Load zsh options
source "$HOME/.config/zsh/setopt.zsh"

# Autosuggestions
# 'zsh-autosuggestions' Arch repo package required
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Completion and ls colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# Autoload functions
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# Set TTY for GPG for each instance
export GPG_TTY="$(tty)"
