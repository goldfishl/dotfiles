#!/usr/bin/env fish

read -P "user name: " -l _flag_n
or return

useradd -d /ai/ljl1/$_flag_n -m $_flag_n -s /bin/bash
passwd $_flag_n
conda create -n $_flag_n --clone base
cat scnu_conda_init.bashrc >> /ai/ljl1/$_flag_n/.bashrc
echo "conda activate $_flag_n" >> /ai/ljl1/$_flag_n/.bashrc
