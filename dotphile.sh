#!/bin/bash
# a really simple dotfile manager

if [ $# -eq 0 ]; then
  echo "dotfile: configuration file in the user's HOME dir"
  echo "dotpile: collection of dotfiles, mirroring their position relative the the HOME dir"
  echo "Usage:"
  echo "sh dotphile.sh <pile>            symlinks a whole dotpile into HOME"
  echo "sh dotphile.sh <pile> <file>     adds a dotfile to a dotpile,"
  echo "                                 prompts the user to git-commit changes"
  echo "                                 and finally symlinks the file into HOME"
fi

if [ $# -eq 1 ]; then
  pile=$1
  echo "unpacking ${pile}..."
  files="$(find -L "$pile" -type f ! -name '*.DS_Store')"
  for file in $files; do
    base=${file#$pile/}
    seed=~/${PWD##*/}/${file}
    target=${HOME}/${base}

    if [ -L ${target} ] ; then # file is good or bad symlink?

      readlink="$(readlink $target)"
      if [ $readlink = "$seed" ]; then
        echo "${base} ✓"
      else
        echo "base: ${base}"
        echo "seed: ${seed}"
        echo "target: ${target}"
        echo "readlink: ${readlink}"
        echo "${base} ✗ ${seed} is symlinked to $(readlink $target), which is not managed by dotphile."
        echo "a) add $(readlink $target) to ${pile} as ${seed},"
        echo "   git-commit the changes made to ${base},"
        echo "   and finally forcibly symlink ${file} to ${target}"
        echo "b) overwrite ${base} by forcibly symlinking ${file} to ${target}"
        echo "c) do nothing"
        # TODO:
        # read -r -p "What to do? [y/N]" response
        # case $response in
        #   [yY][eE][sS]|[yY])
        #     true
        #     ;;
        #   *)
        #     false
        #     ;;
        # esac

      fi
    elif [ -e ${target} ] ; then # file is not a symlink?
      echo "${target} already exists"
      echo "a) add $target to ${pile} as ${seed},"
      echo "   git-commit the changes made to ${base},"
      echo "   and finally forcibly symlink ${file} to ${target}"
      echo "b) overwrite ${base} by forcibly symlinking ${file} to ${target}"
      echo "c) do nothing"
      # TODO:

    else # file is missing!
      echo "${target} doesn't exist. Symlinking ${target} to ${seed}"
      ln -sv ~/${PWD##*/}/${file} ${target}
      echo "${base} ✓"
    fi
  done
fi

if [ $# -eq 2 ]; then
  pile=$1
  file=$2
  relativeSeed="./${pile}/${file#$HOME/}"
  absoluteSeed=~/${PWD##*/}/${pile}/${file#$HOME/}

  echo "adding ${file} to ${pile} as ${relativeSeed}..."

  if [ -L ${file} ] ; then # file is good or bad symlink?
    if [ "$(readlink $file)" = "$absoluteSeed" ]; then
      echo "${relativeSeed} ✓"
    else
      echo "it's a symlink but it doesn't match: ${absoluteSeed}"
    fi
  elif [ -e ${file} ] ; then # file is not a symlink?
     echo "${file} exists and it isn't a symlink"
     mkdir -p ./${pile}
     cp ${file} ${pile}

     echo "adding ${relativeSeed} to git. ${file} *will* be forcefully overwritten!"
     git add -i $relativeSeed

     echo "forcefully symlinking ${relativeSeed} back to ${file}"
     ln -sf $absoluteSeed ${file}
  else
    echo "${file} doesn't exist!"
  fi

fi
