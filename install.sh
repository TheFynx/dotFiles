#!/bin/bash

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
sudo /usr/bin/chef-solo -c solo.rb -j node.json
vim +BundleClean! +BundleInstall! +qall!
