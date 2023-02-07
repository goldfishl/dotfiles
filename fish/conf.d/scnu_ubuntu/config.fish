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
    source (autojump .venv)/jupyter/bin/activate.fish	

end

#set -gx JUPYTER_CONFIG_DIR /ai/ljl1/ljy/.jupyter
#set -gx JUPYTERLAB_WORKSPACES_DIR /ai/ljl1/ljy/

function python_venv
    set -f _venv_path ( jump_path .venv)
    echo "source $_venv_path/%/bin/activate.fish"
end
abbr --add pyv --set-cursor --function python_venv

abbr -add abd authbind --deep
