#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Pär Lindahl 2017-08-23
# Use this script together with plilauncher.sh

import pygtk
pygtk.require('2.0')
import gtk
import subprocess

commands = []
# Configure your menu options here.
commands.append(["Start XTerm", "xterm"])
commands.append(["Start XCalc", "xcalc -title hello"])

class PliLauncher:

    # When a button is pressed:
    def callback(self, widget, data):
        subprocess.Popen(data, shell = True)
        exit()

    # another callback
    def delete_event(self, widget, event, data=None):
        gtk.main_quit()
        return False

    def __init__(self):
		
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_title("PliLauncherWindow")
        self.window.connect("delete_event", self.delete_event)
        self.window.set_border_width(10)
        self.box1 = gtk.VBox(False, 0)
        self.window.add(self.box1)
        
        for cmd in commands:
        	self.button = gtk.Button(cmd[0])
		self.button.connect("clicked", self.callback, cmd[1])
		self.box1.pack_start(self.button, True, True)
		self.button.show()

        self.box1.show()
        
        # Fetch current mouse cursor position so that we can comfortably
        # display the popup menu at the cursor's position:
        x_pos = subprocess.check_output("xdotool getmouselocation --shell|grep 'X='|cut -d '=' -f 2", shell=True)
        x_pos = int(x_pos.strip())
        y_pos = subprocess.check_output("xdotool getmouselocation --shell|grep 'Y='|cut -d '=' -f 2", shell=True)
        y_pos = int(y_pos.strip())
        # Compensate in Y axis due to title bar not being displayed but still taking space:
        y_pos = y_pos - 28
        
        self.window.move(x_pos, y_pos)
        self.window.show()
        # Uncomment this line if you want the title bar to be visible:
        self.window.set_decorated(False)

def main():
    gtk.main()

if __name__ == "__main__":
    hello = PliLauncher()
    main()
