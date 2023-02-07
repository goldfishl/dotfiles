#/usr/bin/env bash

find . -type f | grep -v ubuntu_sudo.fish
find . -type f | grep -v ubuntu_sudo.fish | xargs sed -i "s/add-apt-repository/sudo add-apt-repository/g"
find . -type f | grep -v ubuntu_sudo.fish | xargs sed -i "s/apt-add-repository/sudo apt-add-repository/g"
find . -type f | grep -v ubuntu_sudo.fish | xargs sed -i "s/apt/sudo apt/g"
find . -type f | grep -v ubuntu_sudo.fish | xargs sed -i "s/chsh/sudo chsh/g"