#!/usr/bin/env fish

read -P "Enter the python version:" -lx _version
or return
eval "type -f python$_version &> /dev/null"
if not test $status -eq 0 
    echo "python$_version not installed, installation starts"
    add-sudo apt-repository ppa:deadsnakes/ppa
    eval "sudo apt install python$_version"
    val "sudo apt install python$_version-venv"
end

set -lx _venv_path (jump_path .venv)
if test $status -ne 0
    read -P "`.venv` dir not find, enter the path to create `.venv` directory:" -lx _venv_path
    or return

    set _venv_path -lx (realpath $_venv_path)/.venv
    or echo "directory not exists" && return

    test -d $_venv_path
    or mkdir -p $_venv_path/.venv && echo "`.venv` dir created"
end

read -P "Enter the venv dir name:" -lx _venv_dir
or return
read -P "Enter the venv name for display:" -lx _venv_name
or return

eval "python$_version -m venv $_venv_path/$_venv_dir --prompt=$_venv_name"
source $_venv_path/$_venv_name/bin/activate.fish
