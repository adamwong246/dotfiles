```
dotphile.sh - a really simple dotfile manager.
A dotfile is a configuration file in the user's HOME dir.
A dotpile is a collection of dotfiles, mirroring their position relative the the HOME dir.
Dotphile can be used in 2 ways:
sh dotphile.sh <pile>
  -> symlinks a whole dotpile
sh dotphile.sh <pile> <file>
  -> adds a dotfile to a dotpile, prompts the user to git-commit changes to dotfiles and finally establishes a symlink.
```

Powered by [GNU stow](http://www.gnu.org/software/stow/) and Brandon Invergo http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two
