#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Terminal name style; generate one easily with:
# http://bashrcgenerator.com/
PS1="[\[$(tput sgr0)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;6m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"

# See: https://wiki.archlinux.org/index.php/SSH_keys#Keychain
eval $(keychain --quiet --eval id_rsa)

# Add to path
[[ -d $HOME/miniconda3/bin ]] && export PATH="$HOME/miniconda3/bin:$PATH"
[[ -d $HOME/.gem/ruby/2.5.0/bin ]] && export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
[[ -d /opt/cuda/bin ]] && export PATH="/opt/cuda/bin:$PATH"
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"
# Config management alias; see the following for details:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotflies-git-bare-repo/
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Alias to fix pikaur on Anaconda/Miniconda systems:
alias pikaur='/usr/bin/python3 /usr/bin/pikaur'
