#!/usr/bin/env fish

complete -x -c sync_config -s m -l machine -d "Specify machines to do sync" -a "(sync_config -l machine)"
complete -x -c sync_config -s t -l tool -d "Specify machines to do sync" -a "(sync_config -l tool)"