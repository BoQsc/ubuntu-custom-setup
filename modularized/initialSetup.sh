#!/bin/bash
function initialSetup(){
sudo apt update
sudo apt -y upgrade

# Remove The Amazon Files Manually
    sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
    sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
    sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

# Remove ThunderBird mail
sudo apt-get purge thunderbird -y

}

# https://www.ostechnix.com/ubuntu-post-installation-script/

# https://github.com/BoQsc/ubuntu-bloat-removal
