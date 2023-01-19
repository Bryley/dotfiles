# Bryley's dotfiles

This is a collection of my dotfiles that I use on my Unix setup.

- Assumes drivers have already been installed, look into [Xorg](https://wiki.archlinux.org/title/Xorg) page.
- Run `~/.config/awesome/wallpapers/generate_blurry.sh` whenever the wallpaper changes to generate the blurry version of the wallpaper for the lock screen.

## Setup

To setup this repo simply clone this repo somewhere on your computer (I chose in my home dir) and follow these steps.

1. Go into the repo dir `cd dotfiles`
1. Run `setup.sh` script with `bash ./setup.sh`, this will also install all the required packages on arch linux.
WARNING this may delete files/directories within `~/.config` so if there are any configurations in neovim, fish, alacritty or tmux you may want to keep make sure you create backups first.
3. This script will do the following things:
    1. Installs all required packages from pacman and yay.
	1. Create simlinks with `~/./config` directiories linking them to this directory.
1. Once `setup.sh` has executed close and reopen your terminal emulator (Should be alacritty).
1. To download plugins for neovim open up `/.config/nvim/lua/user/plugins.lua` and save the file.
1. For zsh, the plugin `fast-syntax-highlighting` is installed which gives nice colors in the terminal.
There are different themes to choose from using the `fast-theme` command, I believe `base16` goes the best with the other colors `fast-theme base16`.

## Optional Additional Stuff

- To add colored output to pacman and yay go to `/etc/pacman.conf` and uncomment the `Color` line.



## Python

1. Type `python3 -m venv .venv` to create venv inside current project. (Replace `python3` with `python3.8` for python 3.8)
1. This will create a folder called `.venv` inside project (Make sure to add this to `.gitignore` before continuing)
1. To activate type `activate`.
1. To deactivate type `deactivate`

### Debugging

```
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```
