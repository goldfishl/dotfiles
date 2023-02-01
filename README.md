## Terminal Font

Powerline fonts

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts
``` 

Meslo Nerd Font

powerlevel10k will ask for installation, or you can

```bash
brew tap homebrew/cask-fonts
brew install --cask font-meslo-nerd-font
```

## iTerm2

set Font in iTerm2 -> Settings/Preferences -> Profiles -> Text -> Non-ASCII Font -> MesloLGS NF

set Color(solarized dark) in iTerm2 -> Settings/Preferences -> Profiles -> Colors -> Color Presets

## Hammerspoon

the main file `~/.hammerspoon/init.lua`

## fish

the main file `~/.config/fish/config.fish`

common files in `~/.config/fish/common/`

machine specific files in `~/.config/fish/conf.d/[machine]/`


## zsh

the main file `~/.zshrc`

powerlevel10k generated file `~/.p10k.zsh`

## vim

the main file `~/.vimrc`

plugins in `~/.vim/pack/`

When you start Vim, it first processes your **.vimrc** file, and then it scans all directories in **~/.vim** for plugins contained in **pack/*/start**.

## machines

macbook19:
- fish's other files in `./fish/conf.d/mac/`

sichuan normal university supercomputing center's ubuntu docker:
- zsh's all files in `./zsh/conf.d/scnu_ubuntu/`
- fish's other files in `./fish/conf.d/ubuntu/`