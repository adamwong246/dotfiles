#!/bin/bash

if [ $# -eq 0 ]; then
  echo "dotphile.sh - a really simple dotfile manager."
  echo "A dotfile is a configuration file in the user's HOME dir."
  echo "A dotpile is a collection of dotfiles, mirroring their position relative the the HOME dir."
  echo "Dotphile can be used in 2 ways:"
  echo "sh dotphile.sh <pile>"
  echo "  -> symlinks a whole dotpile"
  echo "sh dotphile.sh <pile> <file>"
  echo "  -> adds a dotfile to a dotpile, prompts the user to git-commit changes to dotfiles and finally establishes a symlink."
fi

if [ $# -eq 1 ]; then
   folder=$1
   echo "stowing ${fi1}${fo1}${folder}${Color_Off}"
   # stow ${folder}
   # files="$(find -L "$folder" -type f ! -name '*.DS_Store')"
   # for file in $files; do
   #    stippedFile=${file#$folder}
   #    echo ~/${PWD##*/}/${file} ~${stippedFile}
   #    sudo ln -s ~/${PWD##*/}/${file} ~${stippedFile}
   # done
fi

if [ $# -eq 2 ]; then
   folder=$1
   file=$2
   echo "Stashing ${file} into ${folder}"
   mkdir -p ./${folder}
   copiedFile=$(cp -v ${file} ${folder} | awk '{printf $3}')
   if [ "${copiedFile}" != "" ]; then
      echo "adding ${copiedFile} to git history"
      git add -i $copiedFile
      echo "forcefully symlinking ${PWD##*/}/${copiedFile} back to ${file}"
      ln -sf ${PWD##*/}/${copiedFile} ${file}
   else
      echo "halted permaturely"
   fi
fi
