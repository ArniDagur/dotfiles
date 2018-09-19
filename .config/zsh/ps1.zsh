# Terminal name style; generate one easily with: http://bashrcgenerator.com/
# Source git-prompt.sh to enable __git_ps1 command used in PS1 environment var.
source /usr/share/git/completion/git-prompt.sh
PS1='[\[$(tput sgr0)\]\[\033[38;5;9m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;6m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;10m\]$(__git_ps1 " (%s)")\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]'
