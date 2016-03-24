function watch
	set -l start (__hd_path)
	if not test -d $start
		echo "Erro:"
		echo (__hd_error_message $start)
		return 1
		end
	set -l cmd $argv
	set -l cmd_len (count $argv)
	set -l a $start
	for i in (seq 1 $cmd_len)
		set a "$a$cmd[$i]/"
		end
	set -l extensoes "mp4" "mkv" "avi" "m4v"
	for j in $extensoes
		if test -z $file
			echo $j
			set file (ls $a | grep $j)
			end
		end
	if test -z $file
		echo "Nenhum filme encontrado!"
		return 1
		end
	vlc --fullscreen $a$file
	return 0
	end
