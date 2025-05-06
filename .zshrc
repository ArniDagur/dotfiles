# Load aliases
source "$HOME/.config/zsh/alias.zsh"

# Load zsh options
source "$HOME/.config/zsh/setopt.zsh"

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

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Load keybindings
source "$HOME/.config/zsh/keybindings.zsh"

# Environment variables for gpg

if command -v gpgconf 2>&1 > /dev/null
then
	export GPG_TTY="$(tty)"
	unset SSH_AGENT_PID
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpg-connect-agent updatestartuptty /bye > /dev/null
fi

# Autosuggestions. Clone 'zsh-autosuggestions' from:
# https://github.com/zsh-users/zsh-autosuggestions.git
source "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Syntax highlighting. Clone 'zsh-syntax-highlighting' from:
# https://github.com/zsh-users/zsh-syntax-highlighting.git
source "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Load prompt
source "$HOME/.config/zsh/ps1.zsh"

target=$(python3 -c "import glob; m=glob.glob('/opt/*_mde/etc/zshrc'); print(m[0] if m else '')")
[ -f "$target" ] && source "$target"
source $HOME/workspace/source/tools/scripts/bazel_ide/autocompletion/auto-completion.sh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/mamba';
export MAMBA_ROOT_PREFIX="/Users/${USER}/mamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
