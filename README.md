# plilauncher

Plilauncher is a simple graphical program launcher for Linux/X. I wrote it
since I just couldn't find anything like it. So it's just a quick'n'dirty
little script. It's really just something for me, but I thought I might as
well put it on github, in case someone else, against all odds, likes it. :-)

## Usage

In your Window Manager of choice, bind a hotkey (myself I use Left-Windows + Left-Ctrl) to launch plilauncher.sh (not .py) when pressed. That script
will then check if the Plilauncher window is already open - if it is, it
will be closed, and if not, it will open. When you click on a program to
launch, the window will close. The menu will pop up where the mouse cursor
is located. 

## Installation

Just copy the two files plilauncher.py and plilauncher.sh somewhere in your
$PATH, for example /usr/local/bin

## External dependencies

* PyGTK 
* xdotool
There are Ubuntu/Debian packages for these so it's easy to install.

## Configuration

Edit plilauncher.py and modify the array at the beginning of the file, it's
self explanatory.

Since it uses PyGTK (GTK) the menu follows your current GNOME/GTK theme
configuration.

## License

MIT

## Author

Pär Lindahl 2017
