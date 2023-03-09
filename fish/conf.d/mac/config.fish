if status is-interactive
    # Commands to run in interactive sessions can go here

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval /Users/longjinyu/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<

    # function
    ## obsidian markdown edit
    #function lmd
       # ln -s ( realpath $argv[1]) $ob/symlink/(basename $argv[1])
    #end

    function vscode
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $argv
    end
end

# set GNU's core-utils, find-utils, man-db
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/findutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/man-db/libexec/bin $PATH

# others
## autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# abbreviations
abbr --add vs vscode
