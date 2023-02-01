if status is-interactive
    # Commands to run in interactive sessions can go here

    # enable vi-mode
    fish_vi_key_bindings


end
# tide configuration
## command_duration
set --global tide_cmd_duration_threshold 0
set --global tide_cmd_duration_decimals 3 

# abbreviations
## screen
abbr --add scl screen -ls
abbr --add scr screen -r
## specify UTF-8
abbr --add scc screen -SU
abbr --add shbf "#!/usr/bin/env fish"

## git
abbr --add gtei vim .gitignore
abbr --add gtad git add
abbr --add gti git init
abbr --add gtrm git remote
abbr --add gtlg git log --all --graph
abbr --add gtcl git clone
abbr --add gts git status
abbr --add gtcm git commit
abbr --add gtp git push
abbr --add gtr git reset

## tools
abbr --add v vim

## system
abbr --add ae chmod +x
abbr --add rd rm -rf

## dir
set fs ~/.config/fish
set ob ~/Documents/Obsidian\ Vault/

## url
set lgithub https://github.com/goldfishl
set github https://github.com
set lrawgithub https://raw.githubusercontent.com/goldfishl
set rawgithub https://raw.githubusercontent.com/
set slgithub git@github.com:goldfishl

for file in (find $HOME/.config/fish/common/functions/ -maxdepth 1 -type f)
    source $file
end
for file in (find $HOME/.config/fish/common/completions/ -maxdepth 1 -type f)
    source $file
end 
