#!/bin/bash

echo 'getting dependicies'
git subtree add --prefix=.zsh_plugins/colored-man https://github.com/adamwong246/heck-yeah-zsh-colored-man.git master

echo 'stow it!'
stow . --ignore='.DS_Store install.sh README.md'