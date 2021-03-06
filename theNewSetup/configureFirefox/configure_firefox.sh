#!/bin/bash
sudo apt-add-repository multiverse && sudo apt-get update
sudo apt-get install chrome-gnome-shell


sudo mkdir /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org

# .xpi extension files are simply .zip files
sudo unzip gnome_shell_integration-10.1-an+fx-linuz.xpi -d /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org



# defaultPref();  // set new default value
# pref();         // set pref, but allow changes in current session
# lockPref();     // lock pref, disallow changes





# https://support.mozilla.org/en-US/questions/1103050
#/usr/lib/firefox/browser/defaults/preferences
# change: pref("extensions.autoDisableScopes", 3);
# to: lockpref("extensions.autoDisableScopes", 0);



# sudo rm -rf /usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org


#  https://addons.mozilla.org/firefox/downloads/file/898030/gnome_shell_integration-10.1-an+fx-linux.xpi?src=dp-btn-primary


## disable title menu
# about:config


## refresh firefox
#https://support.mozilla.org/en-US/kb/refresh-firefox-reset-add-ons-and-settings




#-----------------------------------------------------

# /usr/lib/firefox/browser/defaults/pref/local-settings.js
# pref("general.config.obscure_value", 0);
# pref("general.config.filename", "mozilla.cfg");


# defaultPref("browser.tabs.drawInTitlebar", true);
# pref("browser.tabs.drawInTitlebar", true);
# lockPref("browser.tabs.drawInTitlebar", true);


# ------------------Correct One, only this is needed-----------------------------
#/usr/lib/firefox/browser/defaults/preferences/vendor-firefox.js
# /usr/lib/firefox/defaults/pref/vendor-gre.js

# defaultPref("browser.tabs.drawInTitlebar", true);
# pref("browser.tabs.drawInTitlebar", true);
# lockPref("browser.tabs.drawInTitlebar", true);
