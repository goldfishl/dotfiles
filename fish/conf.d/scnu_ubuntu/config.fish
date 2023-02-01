if status is-interactive
    # Commands to run in interactive sessions can go here

    # tools
    ## autojump
    [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    #eval /opt/conda/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<

    # venv default python env
    source (autojump bin)/activate.fish	

end
