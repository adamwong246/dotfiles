#!/bin/bash

git subtree add --prefix=.zsh_plugins/colored-man https://github.com/adamwong246/heck-yeah-zsh-colored-man.git master

stow . --ignore='.DS_Store install.sh README.md'