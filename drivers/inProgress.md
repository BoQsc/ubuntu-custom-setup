# First thing to notice
* It is common that file **/etc/X11/xorg.conf** and folder **/etc/X11/xorg.conf.d/** might not exist.
* **/etc/X11/xorg.conf** might be overwritten/overriden by other applications or **.conf** files inside folder **/etc/X11/xorg.conf.d/**
* That's why we use folder **/etc/X11/xorg.conf.d/** to setup our custom properties for the X input devices.

Some original example can be found in **/usr/share/X11/xorg.conf.d/**:
* 10-amdgpu.conf
* 10-quirks.conf
* 10-radeon.conf
* 40-libinput.conf
* 51-synaptics-quirks.conf
* 70-synaptics.conf
* 70-wacom.conf

The number at the beginning simply means Priority.  
10-xxxxxxxx.conf meaning will be applied first.  
* 99-xxxxxxxx.conf meaning will be applied later on and override every conflicting property setuped by 8-xxxxxxxx.conf 
  * 9-xxxxxxxx.conf, 10-xxxxxxxx.conf or 25-xxxxxxxx.conf, 38-xxxxxxxx.conf and so on...

* Fruit
  * Apple
  * Orange
  * Banana
