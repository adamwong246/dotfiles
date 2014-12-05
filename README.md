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

1) clone oh-my-zsh https://github.com/robbyrussell/oh-my-zsh
2) use the sub-tree split technique to filter the files you want https://help.github.com/articles/splitting-a-subfolder-out-into-a-new-repository/
3) host it one github
4) modify the install.sh script to include this repo as a subtree within your dotfiles
5) make sure you gitignore the subtree!
6) `sh sh.install`
7) ....
8) profit!


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
