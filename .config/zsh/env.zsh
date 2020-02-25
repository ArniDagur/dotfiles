# -- Path --
export PATH="$HOME/scripts:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
# Matlab
export PATH="$HOME/Matlab/R2019b/bin:$PATH"
# Rust
	# Cargo binaries
	[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"
	# Rust source code (needed for rust-racer)
	RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
	[[ -d $RUST_SRC_PATH ]] && export RUST_SRC_PATH
# CUDA
[[ -d /opt/cuda/bin ]] && export PATH="/opt/cuda/bin:$PATH"
# Miniconda
[[ -d $HOME/miniconda3/bin ]] && export PATH="$HOME/miniconda3/bin:$PATH"
[[ -d /opt/miniconda3/bin ]] && export PATH="/opt/miniconda3/bin:$PATH"

# -- Go environment --
# $GOPATH/src/: location of Go source code (for example, .go, .c, .g, .s).
# $GOPATH/pkg/: location of compiled package code (for example, .a).
# $GOPATH/bin/: location of compiled executable programs built by Go.
export GOPATH="$HOME/go"


# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"

# -- Other --
export URHO3D_HOME="~/OpenSource/Urho3D"

# -- Applications --
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="qutebrowser"
export TERMINAL="kitty"

# -- Settings --
# QT
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Compilation
export RUSTFLAGS="-C target-cpu=native"

# Enable Firefox WebRender
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

# Opt out of Microsoft's telemetry
DOTNET_CLI_TELEMETRY_OPTOUT=1

# Always display Rust backtrace on panic
RUST_BACKTRACE=full

# ls / completion colors --
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=2"

# -- Library paths --
if [[ -d /usr/lib/llvm/ ]]; then
    # Get the directory with the highest "number", e.g. /usr/lib/llvm/9/...
    llvm_version=$(ls --color=no -1 /usr/lib/llvm | head -n1)
    export LIBCLANG_PATH="/usr/lib/llvm/$llvm_version/lib64/libclang.so"
    export LLVM_CONFIG_PATH="/usr/lib/llvm/$llvm_version/bin/llvm-config"
fi
# -- History --
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=1000000
export HISTSIZE=1000000

# -- GPG --
export KEYID="0xC0A5181A3F587326"
