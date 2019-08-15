#!/usr/bin/env bash

filein=$1;
fileout=$2; #rewrite this with dirname and inject -64 before .ext in filename

openssl base64 -in $filein -out $fileout;

# References:
# 0. https://superuser.com/questions/120796/how-to-encode-base64-via-command-line
#