# First thing to notice
It is common that file **/etc/X11/xorg.conf** and folder **/etc/X11/xorg.conf.d/** might not exist.

**/etc/X11/xorg.conf** might be overwritten/overriden by other applications or **.conf** files inside folder **/etc/X11/xorg.conf.d/**

That's why we use folder **/etc/X11/xorg.conf.d/** to setup our custom properties for the X input devices.
