#!/bin/bash

# Graphical popup menu with program launcher.
# By Pär Lindahl 2017-08-23
# Bind your X11 hotkey to run this shell script, for example
# when you press the Windows key.
# This script will in turn call plilauncher.py which displays
# the popup. In that file, you configure the programs you want
# in your menu.

# Requirements:
# External command "xdotool"

# Make sure 'xdotool' is installed, otherwise display a warning:
XDOTOOLEXISTS=false
which xdotool && XDOTOOLEXISTS=true
if [ $XDOTOOLEXISTS = false ]
then
	xmessage "You need to install xdotool"
	exit 1
fi

# Use regexp since xdotool interprets this as a regexp pattern, so make
# sure we don't match any other window containing "PliLauncherWindow" in the name:
WINDOWEXISTS=false
if xdotool search --name 'PliLauncherWindow$'
then
	WINDOWEXISTS=true
fi

if [ $WINDOWEXISTS = true ]
then
	# Make sure that if you pressed your hotkey to display the window, another
	# press of that key hides the menu:
	xdotool search --name 'PliLauncherWindow$' windowkill
else
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	$DIR/plilauncher.py &
fi
