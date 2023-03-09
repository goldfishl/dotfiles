#!/usr/bin/env fish

read -P "user name: " -l _flag_n
or return

sudo useradd -d /ai/ljl1/$_flag_n -m $_flag_n -s /bin/bash
sudo passwd $_flag_n
sudo conda create -n $_flag_n --clone base
cat scnu_conda_init.bashrc >> /ai/ljl1/$_flag_n/.bashrc
echo "conda activate $_flag_n" >> /ai/ljl1/$_flag_n/.bashrc
