# .dotfiles
![GitHub License](https://img.shields.io/github/license/marekvospel/.dotfiles)

This repository contains my linux configurations. (aka dotfiles)

GNU Stow is used for linking dotfiles to their directory.  
See [DEPENDENCIES.md](./DEPENDENCIES.md) for list of packages required for
installation / usage.

## Installation
Installation of dotfiles is very simple, all you need to do is clone this
repository to your home folder (`~/.dotfiles`), install all needed packages and
run GNU stow.

```sh
stow --adopt .
```

Now all dotfiles have been linked to the parent directory and you can start
using them. From now on they can be simply updated by pulling from remote.

## Troubleshooting

### Some of my configurations stayed unchanged
If you run `stow --adopt` and some files already exist, they will be linked,
but their content will stay the same. (overwriting the files in this repo)

This can be simply solved by running the following command.
```sh
git reset HEAD -- path/to/.conf/configuration
```
Before running this command, I advise you to check the diff between your old
and new configuration using
```sh
git diff HEAD -- path/to/.conf/configuration
```

## Attributions
Joachim Bauernberger - [waybar config](https://gitlab.com/jbauernberger/dotfiles/-/tree/master/.config/waybar)
