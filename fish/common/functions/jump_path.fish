#!/usr/bin/env fish

function jump_path -a _dir_name
	# autojump will return '.' if it don't have record by default.
	set -lx dot_path (autojump $_dir_name) && test ! $dot_path = "."
	or read -P "autojump fail to find `$_dir_name` directory, you need manually input the directory:" -lx dot_path
	or return 1
	eval "set -x dot_path $dot_path"
	if string match -q -- "*$_dir_name" $dot_path and test -d $dot_path
		echo ( realpath $dot_path )
		return 0
	else if test -d $dot_path/$_dir_name
		echo ( realpath $dot_path/$_dir_name )
		return 0
	else
		echo "the directory not exist."
		return 1
	end
end
