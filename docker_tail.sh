#!/usr/bin/env bash
die () {
    echo >&2 "$@"
	echo 
    exit 1
}

[ "$#" -eq 2 ] || die "Eksempel: docker_tail.sh 9ad 4de"
tmux -2 new-session -n 'Logger' "docker logs -f $1; read -p 'Ferdig'" 
split-window  "docker logs -f $2; read -p 'Ferdig'"
select-layout even-vertical
set-window-option synchronize-panes on
select-window
attach-session