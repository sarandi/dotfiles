#!/usr/bin/env bash

#Bash
# I think this sets the shell for vi; move to .vimrc when able?
#set shell=/usr/bin/env bash;

set -o vi; # set keybindings to vi

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"';
#export PROMPT_COMMAND='! [ -n $TMUX ] && echo -ne "\033]0;${PWD/#$HOME/~}\007"';

# create a global per-pane variable that holds the pane's PWD source 2
#export PS1=$PS1'$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$([ -n $TMUX ] && tmux display -p "#D" | tr -d %) $PWD)'


export VISUAL="vi"; #1
export EDITOR='vi';
#export EDITOR='subl -w'

#shopt HIST_IGNORE_DUPS
#shopt HIST_IGNORE_SPACE
# Does this actually work? source 3
#export HISTIGNORE="ls*:cat*:*AWS*:*SECRET*";
export HISTIGNORE="*AWS*:*SECRET*";
export HISTCONTROL="ignoreboth";

alias b_p="vi ~/.bash_profile"; # not sure why this is in .bash instead of bp itself
#alias b_p="subl ~/.bash_profile";

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s cmdhist;

echo `date '+%A %W %Y%m%d %X'`;

# Resources:
# 1. https://davidhamann.de/2018/01/28/using-vi-commands-in-your-bash-shell/
# 2. https://stackoverflow.com/questions/19200589/auto-update-tmux-status-bar-with-active-pane-pwd
# 3. https://medium.com/@prasincs/hiding-secret-keys-from-shell-history-part-1-5875eb5556cc

