```
    gsettings set org.gnome.shell enabled-extensions "'[desktop-icons@csoriano]"'
    gsettings list-recursively org.gnome.shell
    gsettings get org.gnome.shell enabled-extensions
    gsettings set org.gnome.shell enabled-extensions "['desktop-icons@csoriano']"
    gsettings set org.gnome.shell enabled-extensions "['desktop-icons@csoriano', 'test']"
    Gnome extensions folder: /usr/share/gnome-shell/extensions
    Appending get array from gsettings, convert array, append new value, and set with gsettings. https://gist.github.com/okelet/8056cf0d1514c375cbbab152ff2431a1
```
