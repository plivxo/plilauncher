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

WINDOWEXISTS=false
# Use regexp since xdotool interprets this as a regexp pattern, so make
# sure we don't match any other window containing "PliLauncher" in the name:
if xdotool search --name 'PliLauncher$'
then
	WINDOWEXISTS=true
fi

if [ $WINDOWEXISTS = true ]
then
	# Make sure that if you pressed your hotkey to display the window, another
	# press of that key hides the menu:
	xdotool search --name 'PliLauncher$' windowkill
else
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	$DIR/plilauncher.py &
fi
