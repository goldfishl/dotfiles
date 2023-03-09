#!/usr/bin/env bash

# install basic tools
sudo apt update && sudo apt upgrade -y
sudo apt install -y --upgrade lsof software-properties-common autojump tar libevent-dev ncurses-dev build-essential bison pkg-config

curl -L https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz -O
tar -zxf tmux-3.3a.tar.gz
cd tmux-3.3a
./configure
make && make install

# zsh+powerlevel10k and set zsh as default shell
## install zsh shell
#apt install -y --upgrade zsh

## install powerlevel10k
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k

## copy the dotfiles
#cp -f ./zsh/scnu_ubuntu/.zshrc ~/
#cp -f ./zsh/scnu_ubuntu/.p10k.zsh ~/

# fish+fisher+tide and set fish as default shell
## install fish
echo "\n" | sudo apt-add-repository ppa:fish-shell/release-3;sudo apt update;sudo apt install -y --upgrade fish

## install newest git
echo "\n" | sudo add-apt-repository ppa:git-core/ppa
sudo apt update; sudo apt install -y --upgrade git

## git init
git config --global core.editor vim

## put fish to /etc/shells
echo /usr/local/bin/fish | tee -a /etc/shells

## install fisher
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/HEAD/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install IlanCosman/tide@v5'

## copy dotfiles
#cp -f ./fish/config.fish ~/.config/fish/config.fish
#cp -f ./fish/conf.d/scnu_ubuntu/* ~/.config/fish/conf.d

## set tide
### Lean type 
fish -c 'echo "1112121y" | tide configure'

### Rainbow type
# fish -c 'echo "31121121121y" | tide configure'


#which zsh | xargs chsh -s
sudo chsh -s $(which fish) $USER

fish -c 'source ../fish/common/functions/jump_path.fish && source ../fish/common/functions/sync_config.fish && sync_config -m scnu_ubuntu -a'
