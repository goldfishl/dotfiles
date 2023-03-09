#!/usr/bin/env fish

# sync config files in `dotfiles` to correspondding directory.
# it will symlink config files in `dotfiles` to correspondding configure folder
# so that I can edit configurations in one folder `dotfiles`
# to-do:
# - automatic identify the machine
# - each completion argument fellow a specific description
# - fish the completion
function sync_config
    set -lx dot_path (jump_path dotfiles)
    or return 1
    #	set -lx dot_path (autojump dotfiles)
    #	or read -P "autojump fail to find `dotfiles` directory, you need manually input the directory:" -lx dot_path
    #	or return
    #	if not test -d $dot_path	
    #		echo "the directory not exist."
    #		return
    #	end
    #	set dot_path ( realpath $dot_path)

    set -l machine_list mac scnu_ubuntu
    set -l tool_list fish hammerspoon vim


    # augments parse
    # required `machine` augment
    set -l options 'm/machine=' a/all 't/tool=+' 'l/list='
    argparse $options -- $argv
    or return
    ## choose a `tool` or `all`
    #set -l options 't/tool=' 'a/all'
    #argparse options -- $argv

    # hard symlink files in directory to another directory
    # example:
    # 			ln_files SOURCE_PATH TARGET_PATH
    function ln_files --argument-name s_path t_path
        for file in (find $s_path -maxdepth 1 -type f)
            ln -fv $file $t_path
        end
    end

    # sync fish config
    function sync_fish --argument-name _machine
        set -l _dot_path $dot_path/fish
        set -l _path $HOME/.config/fish

        echo $_dot_path
        echo ">>> sync fish config <<<"
        # fish main file
        ln -fv $_dot_path/config.fish $_path
        # common files
        mkdir -p $_path/common/functions
        mkdir -p $_path/common/completions

        ln_files $_dot_path/common/ $_path/common/
        ln_files $_dot_path/common/functions/ $_path/common/functions/
        ln_files $_dot_path/common/completions/ $_path/common/completions/
        # machine specific files
        # machine specific files
        switch $machine
            case mac
                ln_files $_dot_path/conf.d/mac/ $HOME/.config/fish/conf.d/
            case scnu_ubuntu
                ln_files $_dot_path/conf.d/scnu_ubuntu/ $HOME/.config/fish/conf.d/
        end
    end

    # sync vim config
    function sync_vim
        set -l _dot_path $dot_path/vim
        set -l _path $HOME/.vim
        echo ">>> sync vim config <<<"
        # vim main file
        ln -fv $_dot_path/.vimrc $HOME
        echo "$_dot_path/pack/ -> $_path/"
        # vim plugins
        cp -rf $_dot_path/pack $_path
    end

    # sync hammerspoon config
    function sync_hs
        set -l _dot_path $dot_path/hammerspoon
        set -l _path $HOME/.hammerspoon
        echo ">>> sync hammerspoon config <<<"
        for file in (find $_dot_path -name '*.lua')
            ln -fv $file $_path/$(basename $file)
        end
    end

# this is used for completions
if set -q _flag_l
    if test "$_flag_l" = machine
        string join \n $machine_list
    else if test "$_flag_l" = tool
        string join \n $tool_list
    end
end
if set -q _flag_a
    sync_fish $_flag_m
    sync_vim
    if test "$_flag_m" = mac
        sync_hs
    end
end

if set -q _flag_t
    # to do: rewrite this to `switch`
    for tool in $_flag_t
        if test "$tool" = fish
            sync_fish $_flag_m
        end
        if test "$tool" = vim
            sync_vim
        end
        if test "$tool" = hammerspoon
            sync_hs
        end
    end
end

end
