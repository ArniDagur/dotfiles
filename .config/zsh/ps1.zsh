function powerline_precmd() {
    PS1="$(powerline-go -shell zsh \
           -modules "venv,user,ssh,cwd,perms,git,hg,jobs,exit,root" \
           -priority "root,cwd,user,ssh,perms,git-branch,git-status, \
                      hg,jobs,exit,cwd-path
           -numeric-exit-codes -error $?")"
}

function install_powerline_precmd() {
    # If we haven't added the powerline precmd already, add it.
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    # If we're not in the default Linux terminal.
    install_powerline_precmd
fi
