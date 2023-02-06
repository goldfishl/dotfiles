#!/usr/bin/env fish

function jump_path -a _dir_name
	set -lx dot_path (autojump $_dir_name) && test ! $dot_path = "."
	or read -P "autojump fail to find `$_dir_name` directory, you need manually input the directory:" -lx dot_path
	or return
	if not test -d $dot_path	
		echo "the directory not exist."
		return
	end
	echo ( realpath $dot_path )
end
