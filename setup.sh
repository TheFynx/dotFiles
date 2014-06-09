#!/bin/bash

DIR=`pwd`
cd ~/
HOMEDIR=`pwd`

# Delete Existing Dotfiles

rm -rf $HOMEDIR/.vim
rm -f $HOMEDIR/.vimrc
rm -f $HOMEDIR/.bashrc
rm -f $HOMEDIR/.bash_profile

# Create Symlinks

ln -s $DIR/vimrc $HOMEDIR/.vimrc
ln -s $DIR/vim $HOMEDIR/.vim
ln -s $DIR/bashrc $HOMEDIR/.bashrc
ln -s $DIR/bash_profile $HOMEDIR/.bash_profile

# Post Installation Setup

source $HOMEDIR/.bashrc
vim +BundleClean! +BundleInstall! +qall!
