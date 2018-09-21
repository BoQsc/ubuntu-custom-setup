# First thing to notice
* It is common that file **/etc/X11/xorg.conf** and folder **/etc/X11/xorg.conf.d/** might not exist.
* **/etc/X11/xorg.conf** might be overwritten/overriden by other applications or **.conf** files inside folder **/etc/X11/xorg.conf.d/**
* That's why we use folder **/etc/X11/xorg.conf.d/** to setup our custom properties for the X input devices.

Some original example can be found in **/usr/share/X11/xorg.conf.d/*:
* 10-amdgpu.conf
* 10-quirks.conf
* 10-radeon.conf
* 40-libinput.conf
* 51-synaptics-quirks.conf
* 70-synaptics.conf
* 70-wacom.conf

