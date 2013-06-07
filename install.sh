#!/bin/bash

function install_configs {
	for FILENAME in $@; do
		COMMAND="ln -s -f `pwd`/.$FILENAME $HOME/.$FILENAME"
		echo $COMMAND
		$COMMAND
	done
}

echo "Setting basic configuration:"
echo ""

DEFAULT_APPS="vim vimrc gitconfig screenrc"
XMONAD_APPS="xmonad xmobarrc"

install_configs $DEFAULT_APPS

echo ""
read -p "Install .xmonad? [y/N] "
if [ "$REPLY" == "y" ] ; then
	install_configs $XMONAD_APPS
fi
