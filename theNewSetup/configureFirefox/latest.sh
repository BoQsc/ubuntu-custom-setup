#!/bin/bash

function installWebExtensionsSupport(){

	# Enable Ubunutu multiverse repository - that contains licensed and restricted software.
	sudo apt-add-repository multiverse && sudo apt-get update
	
	# GNOME Shell integration for WebExtensions
	sudo apt-get install chrome-gnome-shell
	
	
	# Prepare Firefox to communicate with Gnome Shell
	# Download Firefox WebExtension to communicate with Gnome Shell	 
	wget --no-check-certificate `don't validate the server's certificate` \
	     --content-disposition `Honor the Content-Disposition header when choosing local file names (EXPERIMENTAL)` \
	     --output-document=gnome_shell_integration-an+fx-linuz.xpi   `Filename of the downloaded extension archive` \
	`Download URL` https://addons.mozilla.org/firefox/downloads/latest/gnome-shell-integration/addon-898030-latest.xpi \
	# https://github.com/mozilla/addons-frontend/issues/4083	 
		 
		 
	
	# Create extension's folder according to extension's id
	sudo mkdir /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org
	# .xpi extension files are simply .zip files
	sudo unzip gnome_shell_integration-an+fx-linuz.xpi -d /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org
}
installWebExtensionsSupport;


# Disable Firefox Title-bar
printf '
	defaultPref("browser.tabs.drawInTitlebar", true);
	pref("browser.tabs.drawInTitlebar", true);
	lockPref("browser.tabs.drawInTitlebar", true);
' | sudo tee /usr/lib/firefox/browser/defaults/preferences/99-local-settings.js &> /dev/null
