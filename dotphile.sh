#!/bin/bash
# a really simple dotfile manager

if [ $# -eq 0 ]; then
  echo "usage example:"
  echo "dotphile.sh <pile>            symlinks a whole dotpile into HOME"
  echo
  echo "dotphile.sh <pile> <file>     adds a dotfile to a dotpile,"
  echo "                              prompts the user to git-commit changes"
  echo "                              and finally symlinks the file into HOME"
  echo "dotfile: configuration file in the user's HOME dir"
  echo "dotpile: collection of dotfiles, mirroring their position relative the the HOME dir"
fi

if [ $# -eq 1 ]; then
  pile=$1
  files="$(find -L "$pile" -type f ! -name '*.DS_Store')"
  for file in $files; do
    base=${file#$pile/}
    seed=~/${PWD##*/}/${file}
    target=${HOME}/${base}
    if ! [ -e "$target" ]; then
      ln -sv ~/${PWD##*/}/${file} ${target}
    else
      if [ -L ${target} ] && [ $(readlink $target) = "$seed" ]; then
        echo "${base} ✓"
      elif [ -L ${target} ]; then
        echo "${target} already exists"
        echo "a) add $target to ${pile}"
        echo "b) overwrite ${base} by forcibly symlinking ${file} to ${target}"
        echo "c) do nothing"
        read -r -p "What to do? [a/b/*]" response
        case $response in
          [a]) sh dotphile.sh $pile $target ;;
          [b]) ln -svf ~/${PWD##*/}/${file} ${target} ;;
          *) echo "!?" ;;
        esac
      fi
    fi
  done
fi

if [ $# -eq 2 ]; then
  pile=$1
  file=$2
  relativeSeed="./${pile}/${file#$HOME/}"
  absoluteSeed=~/${PWD##*/}/${pile}/${file#$HOME/}
  echo "adding ${file} to ${pile} as ${relativeSeed}..."
  if [ -L ${file} ] && [ "$(readlink $file)" = "$absoluteSeed" ]; then
    echo "${relativeSeed} ✓"
  elif [ -e ${file} ] ; then # file is not a symlink?
     mkdir -p ./${pile}
     cp ${file} ${pile}
     echo "adding ${relativeSeed} to git. ${file} *will* be overwritten after staging changes!"
     git add -i $relativeSeed
     ln -sfv $absoluteSeed ${file}
  else
    echo "${file} doesn't exist!"
  fi
fi
