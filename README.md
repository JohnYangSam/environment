Development Environment for Mac and Linux
=========================================

## Setup
Setup environment:

```ssh
git clone git@github.com:JohnYangSam/environment.git
cd environment
chmod -R 700 ./
./setup.sh
```
Note: You may need to import settings from the `./init` folder for Android
Studio, Sublime, and other groups.

## Teardown
Teardown environment (this only undoes symlinks):

`./teardown.sh` (under development)

## Update
Update environment:

`./update.sh` (under development)

More effective update is: 

```ssh
git pull --rebase
./setup.sh
```
## Misc
Vim Powerline Fonts: `https://github.com/powerline/fonts`

Inspired and borrowed from the following an other sources around the web:

- [carlhuda/janus](https://github.com/carlhuda/janus)
- [treasonx/environment](https://github.com/treasonx/environment)
- [roneilr/dotfiles](https://github.com/roneilr/dotfiles)
- [cargo8/dotfiles](https://github.com/cargo8/dotfiles)
- [dotfiles-cs184](https://github.com/JohnYangSam/dotfiles-cs184)

When exploring the darkside on Windows, Scott Hasselmans has [some good tips for utilities](https://www.hanselman.com/blog/scott-hanselmans-2021-ultimate-developer-and-power-users-tool-list-for-windows).

## Trouble shooting:
If you run into issues when installing, re-running the broken part of
the script may fix the issue.

## Contributing
Feel free to fork and customize yourself and contribute back fixes. This repo is currently updated less frequently than it should be.

## Contact
You can contact me through an issue or a quick Google online.
