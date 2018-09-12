#!/bin/bash
#
# Generate the new Gnome Extension barebones
#
# Style Guide: https://google.github.io/styleguide/shell.xml
#
# References for development:
# https://www.gnu.org/software/bash/manual/html_node/Shell-Builtin-Commands.html
#
# Remember to launch this script using bash and not sh shell.
# bash setup-gnome-extension.sh
#
# Useful tested ideas:
# 2>/dev/null       Silence error if the folder already exists


# Function that checks if given path last element is a folder.
function folderNotExist() {
  declare argument=$1;
  
  # Check if function argument is not empty
  [ -z "$argument" ] && exit 1

  # Check if argument is a directory
  if [ -d $argument ]; then #echo "$argument is a directory"
    return 1;

  elif [[ -f $argument ]]; then #echo "$argument is a file"
    return 0;

  else
      #echo "$argument does not exist"
      #echo "$argument is not valid"
      return 0;
      #exit 1
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
else 
  echo "Folder already exists";
fi


# Change directory into newly created extension's folder
cd "example@extensions.gnome.org"
