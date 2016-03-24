function __fish_watch_path
	set -l start (__hd_path)
	if not test -d $start
		echo "Erro:"
		echo (__hd_error_message $start)
		return 1
		end
	set -l cmd (commandline -opc)
	set -l cmd_len (count $cmd)
	set -l a $start
	for i in (seq 2 $cmd_len)
		set a "$a$cmd[$i]/"
		end
	for i in (ls $a)
		if test -d $a$i
			echo $i
		end
	end
	return 0
	end

complete -A -f -c "watch" -a '(__fish_watch_path)'
