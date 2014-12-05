Powered by [GNU stow](http://www.gnu.org/software/stow/)

```
git clone git@github.com:adamwong246/dotfiles.git
sh dotfiles/install.sh
```

### about
This is my personal approach to managing my dotfiles. It aims to replace things things like Homesick or Oh-my-zsh. It add nothing you don't need- there are no themes or plugins unless you add. It requires nothing more than git and stow. Git is used for versioning and for package management. You are expected to know git, as there are no helpers to make things easy. 

To add plugins, modify the install.sh script

### borrowing from oh-my-zsh
Oh-My-Zsh is a fantastic tool- for newbies. While there's lots of good stuff, it's made easier for beginners by including *everything*, whether you need it or not. This is less than optimal. If there's a plugin you want...

1. `git submodule add -b master git@github.com:robbyrussell/oh-my-zsh.git <PLUGIN_NAME>`

2. 'cd <PLUGIN_NAME>'
3. 'git filter-branch --prune-empty --subdirectory-filter plugins/<PLUGIN_NAME master'

Thanks to Brandon Invergo http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two

                          ███████████████████████
                    ███████████████████████████████████
                    ███████████████████████████████████
                ██████████████               █████████████
             █████████████████               █████████████████
             █████████████                      ██████████████
          █████████████      ████         ████      █████████████
          █████████████      ████         ████      █████████████
          ██████████      ███████         ███████      ██████████
       █████████████      ███████         ███████      █████████████
       █████████████      ███████         ███████      █████████████
       █████████████                                   █████████████
       ████████████████                             ████████████████
       ████████████████                             ████████████████
       ████████████████      ████   ███   ████      ████████████████
       ████████████████      ████   ███   ████      ████████████████
       █████████████████████████████████████████████████████████████
          █████████████░░░████░░░░░░░░░░░░░░░████░░░█████████████
          █████████████░░░████░░░░░░░░░░░░░░░████░░░█████████████
             ███████░░░░░░███████░░░░░░░░░███████░░░░░░███████
             ███████░░░░░░░██████░░░░░░░░░██████░░░░░░░███████
                ████░░░░░░░░░████░░░░░░░░░████░░░░░░░░░███
                ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
                ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
                ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
                    ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
                    ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
                       █████████████████████████████
                       █████████████████████████████
