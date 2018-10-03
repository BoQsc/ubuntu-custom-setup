#!/bin/bash

function setupSynapticsTouchpad(){

sudo apt install xserver-xorg-input-synaptics



# Device Test
## Test if you selected correct touchpad/mouse device
## xinput will start tracking mouse movement.
# xinput --test 11


# For single time look up on touchpad settings properties
# xinput --list-props 11 
# xinput --list-props 'SynPS/2 Synaptics TouchPad'

# To show auto-refreshing list of currently set touchpad properties
## Press Ctrl + C to quit if you are done monitoring values
# xinput --watch-props 11 
# xinput --watch-props 'SynPS/2 Synaptics TouchPad'


# Dynamic real-time touchpad changes using xinput
# Change Device Accel Profile (274) to zero profile
sudo xinput --set-prop 'SynPS/2 Synaptics TouchPad' "Device Accel Profile" 0

# Synaptics Finger (279): 
sudo xinput --set-prop 'SynPS/2 Synaptics TouchPad' "Synaptics Finger" 40, 40, 0


sudo mkdir /etc/X11/xorg.conf.d

## It is not possible to directly write a file using SUDO PRINTF into protected /etc/ directory
# sudo printf "Some Example Text" >> \etc\X11\xorg.conf.d\99-general-synaptics-touchpad.conf

## The Explanation of why it is not possible:
# It is normal. The file after the > is not open by the process running under sudo, but by the shell, which isn't. 
# https://unix.stackexchange.com/questions/19707/why-cant-sudo-redirect-stdout-to-etc-file-but-sudo-nano-or-cp-can

## The solution seems to be to use: tee --append
# The --append flag for appending to text file, instead of overwritting completely.
printf '
Section "InputClass"
            Identifier "SynPS/2 Synaptics TouchPad reconfiguration"
            MatchIsTouchpad "on"
            
            # Enable Synaptics Driver insted of libinput Driver
            Driver "synaptics"
            
            # Enable Flat Acceleration profile instead of adaptive
            Option "AccelerationProfile" "0"
            
            # Stop moving mouse after pressing on the touchpad area
            Option "FingerLow" "40"
            Option "FingerHigh" "40"
EndSection
' | sudo tee /etc/X11/xorg.conf.d/99-general-touchpad.conf &> /dev/null


}

##Futher read
#https://ask.fedoraproject.org/en/question/102327/how-to-properly-set-xinput-settings-to-be-persistent/
#http://manpages.ubuntu.com/manpages/bionic/man4/libinput.4.html
