#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Terminal name style; generate one easily with:
# http://bashrcgenerator.com/
PS1='[\u: \W]\\$ \[$(tput sgr0)\]'

# Add to path
export PATH="/home/arni/miniconda3/bin:$PATH"
export PATH="/home/arni/.gem/ruby/2.5.0/bin:$PATH"
export PATH="/opt/cuda/bin:$PATH"

# Config management alias; see the following for details:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotflies-git-bare-repo/
alias config='/usr/bin/git --git-dir=/home/arni/.dotfiles/ --work-tree=/home/arni'
