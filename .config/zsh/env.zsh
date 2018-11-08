# -- Path --
export PATH="$HOME/scripts:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
# Rust
	# Cargo binaries
	[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"
	# Rust source code (needed for rust-racer)
	RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
	[[ -d $RUST_SRC_PATH ]] && export RUST_SRC_PATH
# CUDA
[[ -d /opt/cuda/bin ]] && export PATH="/opt/cuda/bin:$PATH"
# Miniconda
[[ -d $HOME/miniconda3/bin ]] && export PATH="$HOME/miniconda/bin:$PATH"

# -- Other --
export URHO3D_HOME="~/OpenSource/Urho3D"

# -- Applications --
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="qutebrowser"
export TERMINAL="alacritty"

# -- History --
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=1000000
export HISTSIZE=1000000

# -- ls / completion colors --
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=2"
