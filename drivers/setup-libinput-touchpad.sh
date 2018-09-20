#!/bin/bash

echo "begins"

sudo mkdir /etc/X11/xorg.conf.d

## It is not possible to write a file using SUDO PRINTF directly into protected /etc/ directory
# sudo printf "Some Example Text" >> \etc\X11\xorg.conf.d\99-general-synaptics-touchpad.conf

## The Explanation of why it is not possible:
# It is normal. The file after the > is not open by the process running under sudo, but by the shell, which isn't. 
# https://unix.stackexchange.com/questions/19707/why-cant-sudo-redirect-stdout-to-etc-file-but-sudo-nano-or-cp-can

## The solution seems to be to use: tee --append
# The --append flag for appending to text file, instead of overwritting completely.
printf '
Section "InputClass"
            Identifier "synaptics driver touchpad reconfiguration"
            MatchIsTouchpad "on"
            Option "AccelerationProfile" "0"
EndSection
' |
sudo tee /etc/X11/xorg.conf.d/99-general-touchpad.conf &> /dev/null


##Futher read
#https://ask.fedoraproject.org/en/question/102327/how-to-properly-set-xinput-settings-to-be-persistent/
#http://manpages.ubuntu.com/manpages/bionic/man4/libinput.4.html

