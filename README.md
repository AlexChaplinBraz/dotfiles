# Alexander Chaplin Braz's dotfiles

One of my life goals is to keep my HOME clean and organized, which mostly means that when I run `ls -alh` in HOME
everything fits vertically in my terminal. That's one of the reasons why I chose to go minimal and build my system
from the ground up, avoiding programs that put their junk there without giving any way to change it.

The tool I use for managing my configs is called [trackconf](https://github.com/AlexChaplinBraz/shell-scripts/blob/master/trackconf),
which is a script I wrote myself.

It lets me use `ranger`, which is a terminal file browser, to select the files I wish to add to my dotfiles repository,
copying them here and symlinking them back to where they belong. It also lets me deploy those configs with the same
method but in reverse, selecting the configs from this repo and symlinking them to where they belong, creating any
missing directories.

Due to the creation of this script, I no longer need to delete old configs for programs I no longer use, so some of
these files may be outdated due to not being in use anymore, but I keep them just in case.

# Legal

MIT License.

