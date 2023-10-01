#!/bin/sh
for node in $(ls); do
	if [ -f $node ]; then
		echo "Skipping $node"
		continue
	fi

	SRC="$PWD/$node"
	DEST="$HOME/.config/$node"

	echo "Linking $SRC to $DEST"
	ln --force -sn $SRC $DEST
done
