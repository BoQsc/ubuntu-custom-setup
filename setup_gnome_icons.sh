#!/bin/sh
# setup_gnome_icons_extension.sh

# Make Gnome extensions directory and prepare it for Gnome Icons extension download.
# mkdir will not output an error if extensions directory already exists.  
mkdir ~/.local/share/gnome-shell/extensions > /dev/null 2>&1 
cd ~/.local/share/gnome-shell/extensions

# Downloading Gnome Icons extension using linux built-in http download tool named "wget".
wget --no-check-certificate `don't validate the server's certificate` \
     --content-disposition `Honor the Content-Disposition header when choosing local file names (EXPERIMENTAL)` \
     --output-document=desktop-icons-master.tar.gz   `Filename of the downloaded extension archive` \
`Download URL` https://gitlab.gnome.org/World/ShellExtensions/desktop-icons/-/archive/master/desktop-icons-master.tar.gz \

# Extract downloaded extension archive .tar.gz using built-in archiving utility named "tar".
tar -xvzf ./desktop-icons-master.tar.gz

# Disable old Gnome Icons extension if it was installed/enabled before
gnome-shell-extension-tool --d desktop-icons@csoriano

  # Delete old ./desktop-icons@csoriano extension folder
  rm -rf ./desktop-icons@csoriano

# Rename extracted extension folder to fit UUID from metadata.json
mv ./desktop-icons-master ./desktop-icons@csoriano

### disable Ubuntu Icons implementation.
gsettings set org.gnome.desktop.background show-desktop-icons false

### Enable Gnome Icons Extension
gnome-shell-extension-tool --e desktop-icons@csoriano

### Replace Gnome Window manager with new one, to see the icons appear.
# -r, --replace             Replace the running window manager
gnome-shell --replace & disown


read -rsp $'Press enter to continue...\n'



## Giving Strange error, unable to refresh
#gnome-shell-extension-tool --r desktop-icons@csoriano





#press alt+f2 and write restart - to restart gnome and see new available extensions






# z: tells tar to decompress the archive using gzip
# x: tar can collect files or extract them. x does the latter.
# v: makes tar talk a lot. Verbose output shows you all the files being extracted.
# f: this must be the last flag of the command, and the tar file must be immediately after. It tells tar the name and path of the compressed file.

sudo add-apt-repository universe

## Installing Flatpak

 sudo add-apt-repository ppa:alexlarsson/flatpak
 sudo apt update
 sudo apt install flatpak

## Install the Software Flatpak plugin
sudo apt install gnome-software-plugin-flatpak

## Add the Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


## Setting up GNOME nightly release
#Add the gnome-nightly repository, which provides the nightly GNOME runtime: 
flatpak remote-add --if-not-exists gnome-nightly https://sdk.gnome.org/gnome-nightly.flatpakrepo

#Add the gnome-apps-nightly repository, which provides the nightly GNOME apps: 
flatpak remote-add --if-not-exists gnome-apps-nightly --from https://sdk.gnome.org/gnome-apps-nightly.flatpakrepo

#Install Nautilus Flatpak nightly 
flatpak install gnome-apps-nightly org.gnome.NautilusDevel






