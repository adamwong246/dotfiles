# My dotfiles

## features
- A means of managing common linux configs with git and stow
- A means of managing a etc/hosts file. This cannot be accomplished with stow and must be done manually. I use this to block platforms of which I refuse to participate.

## dependencies
- git
- stow

## example usage

```sh

# getting started
cd ~
git clone https://github.com/adamwong246/dotfiles.git
cd dotfiles/
git checkout -b this-machines-branch

# Add files to stow
stow --adopt bash

# Apply stowed files to this machine
stow zsh

# commit your changes
git add --all
git commit
```

Powered by [GNU stow](http://www.gnu.org/software/stow/) and Brandon Invergo http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two