# Bryley's dotfiles

This is a collection of my dotfiles that I use on my Unix setup.
Below is a list of all the programs this is setup for and a short description:

## Setup

To setup simply make this repo your .config file and pull with new changes.
When you start vim for the first time make sure you type `:PlugInstall` to install all the plugins.

Also note that you will have to install all the Language Parsers and Language Servers for Tree Sitter and LSP-Config.

Also make sure to download all the variations of the "Hack" font from:
[Hack Nerd Font Github](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)

Here's a list you can copy into vim

`:TSInstall css html javascript json5 python typescript`

`:LspInstall pyright tsserver`

To set up autocomplete type the following commands in:

`COQdeps` to install dependencies.

Then:

`COQnow` to start auto completion


## Neovim

The most useful of the bunch, this includes my vimrc with a built-in version of the vim-plug plugin manager.
It has a few plugins installed that can be swapped out faily easily.


## Tmux

This is a really basic version of tmux with the dracula themed taskbar.
Note that this has some submodules in it that is being used.


## Fish

Fish is my shell of choice due to it being comfortable out of the box.
It has a couple of my fish configurations and my theme of choice.

## Alacritty

My terminal emulator of choice is alacritty, my config file is really basic with a few features.
