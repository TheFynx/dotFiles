#!/bin/bash

DIR=`pwd`
cd ~/
HOMEDIR=`pwd`

# Delete Existing Dotfiles

#rm -rf /usr/bin/lock
#rm -rf /usr/bin/aerosnap
rm -rf $HOMEDIR/.vim
rm -f $HOMEDIR/.vimrc
rm -f $HOMEDIR/.bashrc
rm -f $HOMEDIR/.bash_profile
rm -f $HOMEDIR/.profile
rm -f $HOMEDIR/.conkyrc
rm -f $HOMEDIR/.xscreensaver
rm -rf $HOMEDIR/.config/conky
rm -rf $HOMEDIR/.config/terminator
rm -rf $HOMEDIR/.config/tint2
rm -rf $HOMEDIR/.config/openbox
rm -rf $HOMEDIR/.config/xfce4/xfconf/xfce-perchannel-xml
#rm -rf $HOMEDIR/.config/nitrogen
#rm -r $HOMEDIR/.config/obmenu-generator/config.pl

# Create Symlinks

#ln -s $DIR/bin/lock /usr/bin/lock
#ln -s $DIR//bin/aerosnap /usr/bin/aerosnap
ln -s $DIR/vimrc $HOMEDIR/.vimrc
ln -s $DIR/vim $HOMEDIR/.vim
ln -s $DIR/bashrc $HOMEDIR/.bashrc
ln -s $DIR/bash_profile $HOMEDIR/.bash_profile
ln -s $DIR/profile $HOMEDIR/.profile
ln -s $DIR/conkyrc $HOMEDIR/.conkyrc
ln -s $DIR/xscreensaver $HOMEDIR/.xscreensaver
ln -s $DIR/config/conky $HOMEDIR/.config/conky
ln -s $DIR/config/terminator $HOMEDIR/.config/terminator
ln -s $DIR/config/tint2 $HOMEDIR/.config/tint2
ln -s $DIR/config/openbox $HOMEDIR/.config/openbox
ln -s $DIR/config/xfce4/xfconf/xfce-perchannel-xml $HOMEDIR/.config/xfce4/xfconf/xfce-perchannel-xml
#ln -s $DIR/config/nitrogen $HOMEDIR/.config/nitrogen
if [ -d $HOMEDIR/.config/obmenu-generator ]; then
    ln -s $DIR/config/obmenu-generator/config.pl $HOMEDIR/.config/obmenu-generator/config.pl
fi

# Post Installation Setup

source $HOMEDIR/.bashrc
vim +BundleClean! +BundleInstall! +qall!
