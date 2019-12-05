#!/usr/bin/env bash
# For scripts to use new bash explicitly, copy/paste line 1
# Optionally uncomment line 4 following that to print the current bash version
#echo $BASH_VERSION

#================================================

    # Abstraction to source (dot)files
    function loadSources(){
        files=$1;
        for file in $files; do
            [ -r "$file" ] && 
            [ -f "$file" ] && 
            source "$file" && 
            echo "$file";
        done
        unset file
    }

    # define main configs and load them
    main=($HOME/.{path,apps,filesystem,utils,macos});
    loadSources "$(echo ${main[*]})";
    #loadSources "$(echo ${($HOME/.{exports,path,apps,filesystem,utils,bash_prompt,macos})})";

    # Keeping this in case I want to load files/exports/secrets 
    # automatically for interactive shells
    # But why, Paul, why? 
    #case $- in
    #   *i*) source ~/.extra
    #esac

    # load secrets, work, .envs, etc.
    function loadExtra(){
        source $HOME/.dotfiles/extra/.extra;
        #unloadExtra; # unset the variables created by .extra
    }

# Load Secondary Fiddly bits;
    [ -f "$HOME/.dotfiles/extra/ptg.sh" ] && source "$HOME/.dotfiles/extra/ptg.sh";
    [ -f "$HOME/.dotfiles/tools/node/.node" ] && source "$HOME/.dotfiles/tools/node/.node";
    #source "$HOME/.dotfiles/tools/node/.node" && echo "node configs loaded";
    
    for badname in $HOME/bin/scripts/.*; do
        
        if [ ! -d "$badname" ]; then # [3]
            #echo "$badname";
            [ -r "$badname" ] && source "$badname"
        fi 
    done
    unset badname
    echo "~/bin/scripts loaded..."

# TODOs
# x Dotbot config
# clean up .bashrc/rvm/nvm debacle
# https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
# https://hackernoon.com/my-minimal-vimrc-config-c1a4d26553ca
# https://github.com/dotphiles/dotphiles/blob/master/deploy/osx
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Keyboards - I think what I meant here is now covered by inputrc
#

# Resources
# 3. https://unix.stackexchange.com/questions/351210/loop-through-files-excluding-directories
