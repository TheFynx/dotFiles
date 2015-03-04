#!/bin/bash

DIR=$(pwd)
cd ~/
HOMEDIR=$(pwd)

# Delete Existing Dotfiles

rm -rf $HOMEDIR/.vim
rm -f $HOMEDIR/.vimrc
rm -f $HOMEDIR/.bashrc
rm -f $HOMEDIR/.bash_profile
rm -f $HOMEDIR/.profile
rm -f $HOMEDIR/.xscreensaver
rm -rf $HOMEDIR/.cinnamon
rm -rf $HOMEDIR/.gconf
rm -rf $HOMEDIR/.config/dconf
rm -rf $HOMEDIR/.config/linuxmint
rm -rf $HOMEDIR/.config/terminator

# Create Symlinks

ln -s $DIR/vimrc $HOMEDIR/.vimrc
ln -s $DIR/vim $HOMEDIR/.vim
ln -s $DIR/bashrc $HOMEDIR/.bashrc
ln -s $DIR/bash_profile $HOMEDIR/.bash_profile
ln -s $DIR/profile $HOMEDIR/.profile
ln -s $DIR/xscreensaver $HOMEDIR/.xscreensaver
ln -s $DIR/cinnamon $HOMEDIR/.cinnamon
ln -s $DIR/gconf $HOMEDIR/.gconf
ln -s $DIR/config/dconf $HOMEDIR/.config/dconf
ln -s $DIR/config/linuxmint $HOMEDIR/.config/linuxmint
ln -s $DIR/config/terminator $HOMEDIR/.config/terminator

# Post Installation Setup

source $HOMEDIR/.bashrc
vim +BundleClean! +BundleInstall! +qall!
