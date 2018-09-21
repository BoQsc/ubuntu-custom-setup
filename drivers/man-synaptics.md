```
SYNAPTICS(4)               Kernel Interfaces Manual               SYNAPTICS(4)

NAME
       synaptics - touchpad input driver

SYNOPSIS
       Section "InputDevice"
         Identifier "devname"
         Driver "synaptics"
         Option "Device"   "devpath"
         Option "Path"     "path"
         ...
       EndSection

DESCRIPTION
       synaptics is an Xorg input driver for touchpads.  Even though touchpads
       can be handled by the normal evdev or mouse drivers, this driver allows
       more  advanced features of the touchpad to become available. Some bene‐
       fits would be:

       ·   Movement with adjustable, non-linear acceleration and speed.

       ·   Button events through short touching of the touchpad.
 Manual page synaptics(4) line 1 (press h for help or q to quit)
```
