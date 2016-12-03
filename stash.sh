#!/bin/bash

if [[ $1 && $2 ]]; then
   folder=$1
   file=$2

   fi0='\033[40m'
   fi1='\033[31m'
   fo1='\033[34m'
   Color_Off='\033[0m'

   echo "Stashing ${fi1}${file}${Color_Off} into ${fo1}${folder}${Color_Off}"

   echo " - copying ${fi0}~/${fi1}${file}${Color_Off} into ${fi0}./${fo1}${folder}/${fi1}${file}${Color_Off}"
   #mkdir -p ./${folder}
   #cp ~/${file} ./${folder}/${file}

   echo " - add ${fi0}./${fo1}${folder}/${fi1}${file}${Color_Off} to git history"
   #git add -i ./${folder}/${file}

   echo " - forcefully symlinking ${fi0}${PWD##*/}/${fo1}${folder}/${fi1}${file}${Color_Off} back to ${fi0}~/${fi1}${file}"${Color_Off}
   #ln -sf ${PWD##*/}/${folder}/${file} ~/${file}
else
   echo "incorrect arguments"
   echo "> sh stash.sh <STASH_FOLDER> [ <FILE_TO_STASH>... ]"
fi
