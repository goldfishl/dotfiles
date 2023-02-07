#!/usr/bin/env fish

read -P "Enter the python version:" -lx _version
or return
eval "type -f python$_version &> /dev/null"
if not test $status -eq 0 
    echo "python$_version not installed, installation starts"
    sudo apt-add-repository ppa:deadsnakes/ppa
    eval "apt install python$_version"
    eval "apt install python$_version-venv"
end

set -f _venv_path (jump_path .venv)
if test $status -ne 0
    read -P "`.venv` dir not find, enter the path to create `.venv` directory:" -f _venv_path
    or return

    eval "set -f _venv_path $_venv_path/.venv"
    or echo "directory not exists" && return

   # echo $_venv_path
   # return

    eval "test -d $_venv_path"
    or eval "mkdir -vp $_venv_path" && echo "`.venv` dir created"
end

read -P "Enter the venv dir name:" -lx _venv_dir
or return
read -P "Enter the venv name for display:" -lx _venv_name
or return

eval "python$_version -m venv $_venv_path/$_venv_dir --prompt=$_venv_name"
eval "source $_venv_path/$_venv_name/bin/activate.fish"

