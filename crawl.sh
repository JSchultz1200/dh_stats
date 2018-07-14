#!/bin/bash

#247

for (( c=1; c<=247; c++ ))
do
#	wget "http://www.dreamhoststatus.com/page/$c/" -O - >> total.html

	echo "Downloading page $c..."
	sleep 1
done
