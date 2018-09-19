# Load prompt
source "$HOME/.config/zsh/ps1.zsh"

# Load aliases
source "$HOME/.config/zsh/alias.zsh"

# Set TTY for GPG for each instance
export GPG_TTY="$(tty)"
