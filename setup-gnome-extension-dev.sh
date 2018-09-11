#!/bin/bash

# Remember to launch this script using bash and not sh shell.
# bash setup-gnome-extension.sh

## 2>/dev/null       Silence error if the folder already exists


folderNotExist() {

# Check if function argument is not empty
[ -z "$1" ] && exit 1

# Check if argument is a directory
if [ -d $1 ]; then #echo "$1 is a directory"
    return 1;

elif [[ -f $1 ]]; then #echo "$1 is a file"
    return 0

else
    echo "$1 is not valid"
    exit 1
fi
}


# Change current directory to logged-user Gnome extensions folder.
  #Tilde (~) is considered as character if cd command is used without eval.
  #Tilde (~) is the same as $home, path to the current user's home directory.
eval cd "~/.local/share/gnome-shell/extensions"

# Creates new extension's folder, must be same as declared in metadata.json
 #Otherwise, extension won't be loaded after gnome shell refresh.
if folderNotExist "example@extensions.gnome.org"; 
  then mkdir "example@extensions.gnome.org"; 
else echo Folder already exists
fi

# Change directory into newly created extension's folder
cd "example@extensions.gnome.org"
