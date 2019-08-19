#/usr/bin/env bash

# Read in a csv file,
# strip empty lines
# convert to lowercase
# replace endings with \r\n

for f in "$@"
do
	input=$f;
	file="$(basename "${input}")";
	dir="$(dirname "${input}")";

	output=$dir/modified_$file;
	temp="$dir/temp.csv";
	touch "$temp";

	# remove empty lines
	awk -F, 'length>NF+1' "$input" > "$temp"; # This was originally && the following line;
	mv "$temp" "$output";

	/usr/local/bin/unix2dos "$output";

	# to lowercase
	tr A-Z a-z < "$output" > "$temp"; # same re: &&
	mv "$temp" "$output";

done

# remove \r only
#tr -d '\r' < $1 > temp.csv && mv temp.csv $1

# replace endings with \r\n
#sed 's/$/^M/' "$1" > temp.csv && mv temp.csv "$1";



# Resources
# 0. https://www.unix.com/shell-programming-and-scripting/152047-how-remove-blank-rows-csv-file.html
