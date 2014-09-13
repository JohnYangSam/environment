=========================================
Development Environment for Mac and Linux
=========================================

Setup environment:

```ssh
git clone git@github.com:JohnYangSam/environment.git
cd environment
chomd 700 -r ./
./setup.sh
```
Note: You may need to import settings from the `./init` folder for Android
Studio, Sublime, and other groups.

Tear down environment (this only undoes symlinks):

`./teardown.sh` (under development)

Update environment:

`./update.sh` (under development)

More effective update is: 

```ssh
git pull --rebase
./setup.sh
```

Inspired and borrowed from the following an other sources around the web:

- [carlhuda/janus](https://github.com/carlhuda/janus)
- [treasonx/environment](https://github.com/treasonx/environment)
- [roneilr/dotfiles](https://github.com/roneilr/dotfiles)
- [cargo8/dotfiles](https://github.com/cargo8/dotfiles)
- [dotfiles-cs184](https://github.com/JohnYangSam/dotfiles-cs184)

Trouble shooting:

If you run into issues when installing, re-running the broken part of
the script may fix the issue.
