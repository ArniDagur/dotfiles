# -- Path --
export PATH="$HOME/bin:/usr/local/bin:$PATH"
# Rust
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"
# CUDA
[[ -d /opt/cuda/bin ]] && export PATH="/opt/cuda/bin:$PATH"
# Miniconda
[[ -d $HOME/miniconda3/bin ]] && export PATH="$HOME/miniconda/bin:$PATH"

# -- Applications --
export EDITOR="emacs"
export VISUAL="emacs"
export BROWSER="qutebrowser"
export TERMINAL="alacritty"

# -- History --
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=1000000
export HISTSIZE=1000000

# -- ls / completion colors --
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=2"
