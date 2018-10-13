function setupGeneralMouseOptions(){

sudo mkdir /etc/X11/xorg.conf.d

printf '
Section "InputClass"
            Identifier "Mouse reconfiguration"
            MatchIsPointer "yes"
            Option "AccelSpeed" "-0.496403"

EndSection
' | sudo tee /etc/X11/xorg.conf.d/98-general-mouse.conf &> /dev/null


}
