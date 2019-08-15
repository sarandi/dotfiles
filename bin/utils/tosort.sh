#!/usr/bin/env bash

inputfile=$1;
justfilename=$(basename "${inputfile}");
echo $justfilename;
sortdir="$HOME/Documents/_my_library/_Sort/";
mv $inputfile $sortdir$justfilename
if [ -f $sortdir$justfilename ]; then
    echo $sortdir$justfilename " moved to sort";
    
    #add logger here to keep track.
    echo `date` $sortdir$justfilename >> $sortdir.sortlog;
fi