#!/bin/bash
sudo apt-add-repository multiverse && sudo apt-get update
sudo apt-get install chrome-gnome-shell



	 

wget --no-check-certificate `don't validate the server's certificate` \
     --content-disposition `Honor the Content-Disposition header when choosing local file names (EXPERIMENTAL)` \
     --output-document=gnome_shell_integration-10.1-an+fx-linuz.xpi   `Filename of the downloaded extension archive` \
`Download URL` https://addons.mozilla.org/firefox/downloads/file/898030 \
	 
	 
	 

# Create extension's folder according to extension's id
sudo mkdir /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org
# .xpi extension files are simply .zip files
sudo unzip gnome_shell_integration-10.1-an+fx-linuz.xpi -d /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org






printf '
defaultPref("browser.tabs.drawInTitlebar", true);
pref("browser.tabs.drawInTitlebar", true);
lockPref("browser.tabs.drawInTitlebar", true);
' | sudo tee /usr/lib/firefox/browser/defaults/preferences/99-local-settings.js &> /dev/null
