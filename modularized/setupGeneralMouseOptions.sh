sudo mkdir /etc/X11/xorg.conf.d

printf '
Section "InputClass"
            Identifier "Mouse reconfiguration"
            MatchIsPointer "yes"
            Option "AccelSpeed" "-0.496403"

EndSection
' | sudo tee /etc/X11/xorg.conf.d/99-general-touchpad.conf &> /dev/null


}
