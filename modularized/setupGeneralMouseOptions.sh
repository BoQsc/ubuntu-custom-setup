#!/bin/bash
function setupGeneralMouseOptions(){

## For Scroll speed adjustment additional drivers might be installed
# https://askubuntu.com/a/609268



### might be interesting to look up: org.gnome.desktop.peripherals.mouse accel-profile: adaptive
## Source of the script: https://stackoverflow.com/questions/18755967/how-to-make-a-program-that-finds-ids-of-xinput-devices-and-sets-xinput-some-set/18756948#18756948
SEARCH="USB OPTICAL MOUSE"
if [ "$SEARCH" = "" ]; then 
    exit 1
fi

ids=$(xinput --list | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
    xinput set-prop $i 'libinput Accel Speed' -0.496403
done
##

sudo mkdir /etc/X11/xorg.conf.d

printf '
Section "InputClass"
            Identifier "Mouse reconfiguration"
            MatchIsPointer "yes"
            Option "AccelSpeed" "-0.496403"

EndSection
' | sudo tee /etc/X11/xorg.conf.d/98-general-mouse.conf &> /dev/null


}
