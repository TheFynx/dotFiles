#!/bin/bash
###
#Usage
# ./install.sh personal (for personal setup)
# ./install.sh work (for work setup)
# ./install.sh (for vagrant setup)
###
# Install Chef
if [ ! -f /usr/bin/chef-solo ]; then
  curl -L https://www.opscode.com/chef/install.sh -o install_chef.sh
  sudo bash install_chef.sh
  rm install_chef.sh
fi

# Copy over the cookbooks
sudo mkdir -p /var/chef/cookbooks
sudo rm -rf /var/chef/cookbooks/dotfiles
sudo cp -R . /var/chef/cookbooks/dotfiles

# Run Chef
if [ "${1}" == 'work' ]; then
    sudo /usr/bin/chef-solo -c solo.rb -j work.json
elif [ "${1}" == 'personal' ]; then
    sudo /usr/bin/chef-solo -c solo.rb -j personal.json
else
    sudo /usr/bin/chef-solo -c solo.rb -j default.json
fi

vim +BundleClean! +BundleInstall! +qall!
