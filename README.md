# Bryley's dotfiles

This is a collection of my dotfiles that I use on my Unix setup.
Below is a list of all the programs.

## Setup

To setup this repo simply clone this repo somewhere on your computer (I chose in my home dir) and follow these steps.

1. Go into the repo dir `cd dotfiles`
1. Next retrieve all the submodules `git submodule update --init --recursive`.
1. You need to follow the instructions to install the following packages:
[ZSH-Syntax-Highlighting](https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-syntax-highlighting&package=zsh-syntax-highlighting)
[ZSH-Autosuggestions](https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-autosuggestions&package=zsh-autosuggestions)
4. Run `setup.sh` script with `bash ./setup.sh`, WARNING this may delete files/directories within `~/.config` so if there are any configurations in neovim, fish, alacritty or tmux you may want to keep make sure you create backups first.
1. This script will do the following things:
	1. Create simlinks with `~/./config` directiories linking them to this directory.
	1. Install all the required fonts used by my terminal emulator (Hack Nerd Font)
	1. Remove any instances of vim or neovim on the system and install the latest version of neovim.
	1. Setup neovim plugins, language servers and tree sitter parsers.
1. Once `setup.sh` has executed close and reopen your terminal emulator (Should be alacritty).
1. TODO maybe remove: For the python language server install the type checker with the following in the cmd line:

`~/.local/share/nvim/lsp_servers/pylsp/venv/bin/pip install pylsp-mypy`


TODO - How to create and activate python env
1. Type `python3 -m venv .venv` to create venv inside current project. (Replace `python3` with `python3.8` for python 3.8)
1. This will create a folder called `.venv` inside project (Make sure to add this to `.gitignore` before continuing)
1. To activate type `source .venv/bin/activate.fish`
1. To deactivate type `deactivate`


## Neovim

The most useful of the bunch, this includes my vimrc with a built-in version of the vim-plug plugin manager.
It has a few plugins pre-installed that can be swapped out fairly easily.


## Tmux

This is a really basic version of tmux with the dracula themed taskbar.
Note that this has some submodules in it that are being used.


## Fish

Fish is my shell of choice due to it being comfortable out of the box.
It has a couple of my fish configurations and my theme of choice.

Note that in future I might swap to ZSH

## Alacritty

My terminal emulator of choice is alacritty, my config file is really basic with a few features using the Hack Nerd Font.
