# vim: noet
# -- Path --
export PATH="$HOME/scripts:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
# Cargo binaries
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"
# Go binaries
[[ -d $HOME/go/bin ]] && export PATH="$PATH:$HOME/go/bin"
# CUDA
[[ -d /opt/cuda/bin ]] && export PATH="/opt/cuda/bin:$PATH"
# Miniconda
[[ -d $HOME/miniconda3/bin ]] && export PATH="$HOME/miniconda3/bin:$PATH"
[[ -d /opt/miniconda3/bin ]] && export PATH="/opt/miniconda3/bin:$PATH"

# Python poetry
[[ -d $HOME/.poetry/bin ]] && export PATH="$PATH:$HOME/.poetry/bin"
# Homebrew
[[ -d /opt/homebrew ]] && export PATH="/opt/homebrew/bin:$PATH"
# UUtils Coreutils
[[ -d /opt/homebrew/opt/uutils-coreutils ]] && export PATH="/opt/homebrew/opt/uutils-coreutils/libexec/uubin:$PATH"

# Python
export PYTHONSTARTUP="$HOME/.config/python_startup.py"

# -- XDG Directories --
export XDG_CONFIG_HOME="$HOME/.config"

# -- Applications --
export EDITOR="nvim"
export VISUAL="nvim"

# -- Settings --
# Use ARM64 for Bazel
export TO_ARMS=true

# QT
export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Compilation
export RUSTFLAGS="-C target-cpu=native"

# Enable Firefox WebRender
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

# Opt out of Microsoft's telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Always display Rust backtrace on panic
export RUST_BACKTRACE=full

# ls / completion colors --
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=2"

# -- Library paths --
if [[ -d /usr/lib/llvm/ ]]; then
    # Get the directory with the highest "number", e.g. /usr/lib/llvm/9/...
    llvm_version=$(ls --color=no -1 /usr/lib/llvm | head -n1)
    export LIBCLANG_PATH="/usr/lib/llvm/$llvm_version/lib64/"
    export LLVM_CONFIG_PATH="/usr/lib/llvm/$llvm_version/bin/llvm-config"
fi
# -- History --
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=1000000
export HISTSIZE=1000000
