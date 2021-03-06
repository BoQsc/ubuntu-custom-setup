#!/bin/bash
# Never run the script as: sudo bash setup.sh
# Instead use: bash setup.sh

source installWebExtensionsSupport.sh
installWebExtensionsSupport;

source setupSynapticsTouchpad.sh
setupSynapticsTouchpad;


# Mouse speed for desktop with mouse.
# gsettings set libinput 
# Accel Speed (288): -0.496403

#org.gnome.desktop.peripherals.mouse accel-profile: adaptive



# Set input language to English and Lithuanian
# Check current settings: gsettings get org.gnome.desktop.input-sources sources
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'lt')]"


# Only sets for the current user, for all users @see https://unix.stackexchange.com/questions/27484/set-default-global-gnome-preferences-gnome-3
# Enable ALT+Shift combination for changing input language
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Super>space', '<Alt>Shift_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Super>space', '<Shift>Alt_L'"

# Ubuntu snap program does not start after installation?
sudo snap install wine-platform-i386
sudo apt -y purge snapd snap-confine 
sudo apt install -y snapd
snap refresh


# FIX notepad ++
#ubuntu@ubuntu:~$ notepad-plus-plus
#You need to connect this snap to the wine-platform-i386 snap.

#snap connect notepad-plus-plus:wine-platform-plug wine-platform-i386:wine-base-stable
#snap disconnect notepad-plus-plus:wine-platform-plug


# Snap apps Not showing in Ubuntu software centre
sudo apt -y install gnome-software-plugin-snap


# System monitor does not open
#Reinstall System Monitor.
snap remove gnome-system-monitor
sudo apt -y install gnome-system-monitor





# Disable Firefox Title-bar
# Firefox menu button -> Customize -> turn off title bar
# move csd buttons to the tabs-bar, turn off title bar
printf '
	defaultPref("browser.tabs.drawInTitlebar", true);
	pref("browser.tabs.drawInTitlebar", true);
	lockPref("browser.tabs.drawInTitlebar", true);
' | sudo tee /usr/lib/firefox/browser/defaults/preferences/99-local-settings.js &> /dev/null


source initialSetup.sh
initialSetup;



