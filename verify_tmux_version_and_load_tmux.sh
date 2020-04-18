#!/bin/bash

verify_tmux_version () {
    tmux_home=~/.tmux
    tmux_version="$(tmux -V)"

    if [[ $(echo "$tmux_version >= 2.3" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/.tmux_2.3_up.conf"
        exit
    elif [[ $(echo "$tmux_version >= 1.9" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/.tmux_1.9_to_2.1.conf"
        exit
    else
        tmux source-file "$tmux_home/tmux_1.9_down.conf"
        exit
    fi
}

verify_tmux_version