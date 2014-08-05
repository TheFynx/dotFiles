#!/bin/bash

DIR=`pwd`
cd ~/
HOMEDIR=`pwd`

# Delete Existing Dotfiles

rm -rf $HOMEDIR/.vim
rm -f $HOMEDIR/.vimrc
rm -f $HOMEDIR/.bashrc
rm -f $HOMEDIR/.bash_profile
rm -rf $HOMEDIR/.config/terminator

# Create Symlinks

ln -s $DIR/vimrc $HOMEDIR/.vimrc
ln -s $DIR/vim $HOMEDIR/.vim
ln -s $DIR/bashrc $HOMEDIR/.bashrc
ln -s $DIR/bash_profile $HOMEDIR/.bash_profile
ln -s $DIR/config/terminator $HOMEDIR/.config/terminator

# Post Installation Setup

source $HOMEDIR/.bashrc
vim +BundleClean! +BundleInstall! +qall!
