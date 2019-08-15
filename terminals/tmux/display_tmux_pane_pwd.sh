#!/usr/bin/env bash

[ -n $TMUX ] && tmux showenv -g TMUX_PWD_$( [ -n $TMUX ] && tmux display -p "#D" | tr -d %)  | sed 's/^.*=//'