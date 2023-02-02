#!/usr/bin/env bash

# install basic tools
apt update && apt upgrade -y
apt install -y --upgrade lsof screen software-properties-common autojump

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
echo "\n" | apt-add-repository ppa:fish-shell/release-3; apt update; apt install -y --upgrade fish

## install newest git
echo "\n" | add-apt-repository ppa:git-core/ppa
apt update; apt install -y --upgrade git

## put fish to /etc/shells
echo /usr/local/bin/fish | tee -a /etc/shells

## install fisher
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/HEAD/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install IlanCosman/tide@v5'

## copy dotfiles
cp -f ./fish/config.fish ~/.config/fish/config.fish
cp -f ./fish/conf.d/scnu_ubuntu/* ~/.config/fish/conf.d

## set tide
### Lean type 
fish -c 'echo "1112121y" | tide configure'

### Rainbow type
# fish -c 'echo "31121121121y" | tide configure'


#which zsh | xargs chsh -s
which fish | xargs chsh -s

fish -c 'source ./fish/common/functions/sync_config.fish && sync_config -m scnu_ubuntu -a'
