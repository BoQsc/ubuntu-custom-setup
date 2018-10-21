#!/bin/bash
function download() {
  command wget --quiet --show-progress --timestamping --content-disposition --output-document="downloaded-file" $1
  # --content-disposition Removes ?shell_version=9.99.9 option from the downloaded filename
  # --timestamping Ensures that redownload of the file do not happen after successfull download. 
}

# https://stackoverflow.com/a/8574081

# dash-to-panel

# Download latest version from official extensions.gnome.org repository (downloads .zip file)
declare url="https://extensions.gnome.org/download-extension/dash-to-panel@jderose9.github.com.shell-extension.zip?shell_version=9.99.9"; 

# Download very latest version directly from project's owner repository (downloads .zip file)
# declare url="https://github.com/home-sweet-gnome/dash-to-panel/archive/master.zip";



download "$url";
# Determine file extension and rename
declare determinedFileExtension=$(file --brief --mime-type "downloaded-file");
echo -------TODO---------
if [ $determinedFileExtension = "application/zip" ]
then mv --no-target-directory "downloaded-file" "dash-to-panel@jderose9.github.com.zip"
fi
echo ----------------



#dash-to-panel@jderose9.github.com


mkdir "$HOME/.local/share/gnome-shell/extensions/"
mkdir "$HOME/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/";

unzip -q -o "dash-to-panel@jderose9.github.com.zip" -d "/home/ubuntu/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/"

gnome-shell-extension-tool -e "dash-to-panel@jderose9.github.com" 


