#!/bin/bash
# creates symlinks to config files and dirs in this folder.
DOTFILES=~/dotfiles

#.config
rm -rf ~/.config
ln -sv $DOTFILES/config ~/.config

#.zshrc
rm -rf ~/.zshrc
ln -sv $DOTFILES/zshrc ~/.zshrc

#.gtkrc-2.0
rm -rf ~/.gtkrc-2.0
ln -sv $DOTFILES/gtkrc-2.0 ~/.gtkrc-2.0

#.zshrc
rm -rf ~/.zshrc
ln -sv $DOTFILES/zshrc ~/.zshrc

#bin
rm -rf ~/bin
ln -sv $DOTFILES/bin ~/bin

#.nanorc
rm -rf ~/.nanorc
ln -sv $DOTFILES/nanorc ~/.nanorc
