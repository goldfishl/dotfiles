if status is-interactive
    # Commands to run in interactive sessions can go here

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval /opt/conda/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<

    # others
    ## autojump
    [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
end
