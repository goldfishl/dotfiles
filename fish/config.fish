if status is-interactive
    # Commands to run in interactive sessions can go here
end

# enable vi-mode
fish_vi_key_bindings

# tide configuration
## command_duration
set --global tide_cmd_duration_threshold 0
set --global tide_cmd_duration_decimals 3 

# abbreviations
## tmux
abbr --add tl tmux ls
abbr --add ta tmux a -t
abbr --add tn tmux new -s
## iterm integration
abbr --add tin tmux -CC new -s
abbr --add tia tmux -CC attach -t

## git
abbr --add gtei vim .gitignore
abbr --add ga git add -u
abbr --add gi git init
abbr --add grm git rm --cache
abbr --add glg git log --all --graph
abbr --add gcl git clone
abbr --add gs git status
abbr --add gcm git commit
abbr --add gps git push
abbr --add gpl git pull
abbr --add gf git fetch
abbr --add grs git reset
abbr --add gdff git diff

# python
## document suggested
abbr --add pip python -m pip

# tools
abbr --add v vim

# system
abbr --add ae chmod +x
abbr --add rd rm -rf
abbr --add tr tree -L 1

# network
abbr --add ipl curl -L http://myip.ipip.net/

## dir
set fs ~/.config/fish
set ob ~/Documents/Obsidian\ Vault/

## url
set lgithub https://github.com/goldfishl
set github https://github.com
set lrawgithub https://raw.githubusercontent.com/goldfishl
set rawgithub https://raw.githubusercontent.com/
set slgithub git@github.com:goldfishl

# load my functions and
for file in (find $HOME/.config/fish/common/functions/ -maxdepth 1 -type f)
    source $file
end
for file in (find $HOME/.config/fish/common/completions/ -maxdepth 1 -type f)
    source $file
end 
