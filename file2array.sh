#!/bin/bash
# File2array
# Free to use everywhere as long as this original header is present
# https://github.com/runexec/File2array
#  

fp="${1}"
l=0
max=`cat "${fp}" | wc -l`
lines=()

echo "var array = ["
cat "${fp}" | while read data
do
	if [ $l == $max ]
	then
		break
	fi
	line=`printf '%s\n' "${data}" | sed -e s/\"/\\\\\\\\\"/g`
	line=`printf '"%s"' "${line}"`

	if [ $l != $[max-1] ]
	then
		echo "${line},"
	else
		echo "$line"
	fi

	let l++
done
echo "];"
