#/usr/bin/env fish

argparse 'd/dir=' -- $argv
if set -q _flag_d
    test -d $_flag_d
    or echo "dir not exist." && return 1
    find $_flag_d -type f | grep -v ubuntu_sudo.fish
    find $_flag_d -type f | grep -v ubuntu_sudo.fish | xargs sed -i "s/add\-apt\-repository/sudo add\-apt\-repository/g"
    find $_flag_d -type f | grep -v ubuntu_sudo.fish | xargs sed -i "s/^apt/sudo apt/g"
    echo "change all files to sudo."
else
    echo "please input directory" && return 1
end
