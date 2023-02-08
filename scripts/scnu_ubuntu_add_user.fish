#!/usr/bin/env fish

argparse 'n/name' -- $argv
set -q _flag_n or return 1

useradd -d /ai/ljl/$_flag_n -m $_flag_n -s /bin/bash
passwd $_flag_n
conda create -n $_flag_n --clone base
conda init --system bash
echo "conda activate $_flag_n"
