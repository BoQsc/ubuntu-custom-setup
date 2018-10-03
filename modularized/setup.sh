#!/bin/bash

source initialSetup.sh
initialSetup;

source installWebExtensionsSupport.sh
installWebExtensionsSupport;

source setupSynapticsTouchpad.sh
setupSynapticsTouchpad;


# Enable ALT+Shift combination for changing input language
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Super>space', '<Shift>Alt_L', '<Alt>Shift_L']"

# Ubuntu snap does not start?
sudo snap install wine-platform-sudo snap install wine-platform-i386
sudo apt purge snapd snap-confine && sudo apt install -y snapd
snap refresh


# Disable Firefox Title-bar
printf '
	defaultPref("browser.tabs.drawInTitlebar", true);
	pref("browser.tabs.drawInTitlebar", true);
	lockPref("browser.tabs.drawInTitlebar", true);
' | sudo tee /usr/lib/firefox/browser/defaults/preferences/99-local-settings.js &> /dev/null
