#!/bin/bash

#!/usr/bin/env bash

set -o nounset -o pipefail

# dotFile config
dotFilesCookbook="dotfiles"
dotfilesGit="https://github.com/thefynx/${dotFilesCookbook}.git"

tempInstallDir="/tmp/chef"

mkdir -p /tmp/chef

function prompt_continue () {
  echo "!!!!!!!!!!!!!!!!!!!!!!!"
  echo "dotFiles encountered an error in the previous step."
  read -p "Ignore the error and contine with installation? [yN] " </dev/tty
  case "$REPLY" in
    [yY]*) return
      ;;
    *) echo "Not cleaning up $tempInstallDir; exiting."
      exit 2
      ;;
  esac
}


# create Berksfile so that we can install the correct cookbook dependencies
cat > "${tempInstallDir}/Berksfile" <<EOF
source 'https://supermarket.chef.io'
cookbook "${dotFilesCookbook}", git: '${dotfilesGit}'
EOF

read -p ">>> dotFile Install -- Do you wish to bootstrap the system at this time?; y/n (default n)" bootstrapAnswer

shopt -s nocasematch
# If bootstrapping, adding bootstrap to deps
if [ "${bootstrapAnswer}" == "y" ]; then
    echo "cookbook "${bootstrapCookbook}", git: '${bootstrapGit}'" >> ${tempInstallDir}/Berksfile
    echo ">>> Bootstrap added to dependencies and runlist"
fi

# create client.rb file so that Chef client can find its dependant cookbooks
cat > "${tempInstallDir}/client.rb" <<EOF
cookbook_path "${tempInstallDir}/berks-cookbooks"
local_mode true
chef_zero.enabled
json_attribs "${tempInstallDir}/attributes.json"
EOF

if [ -f '/etc/*-release' ]; then
    platform=$(cat /etc/*-release | awk 'NR==1{print $1}')
elif [ -n $(command -v lsb_release) ]; then
    platform=$(lsb_release -a)
else
    platform=
fi

if [ -z $(command -v chef) ]; then
    if [ "${platform}" != "Antergos" ]; then
        echo ">>> Installing ChefDK"
        curl --silent --show-error https://omnitruck.chef.io/install.sh | \
        sudo -E bash -s -- -c stable -P chefdk || prompt_continue
    else
        yaourt -Sy chef-dk
    fi
fi

echo ">>> Downloading cookbook dependencies with Berkshelf"
cd "$tempInstallDir" || prompt_continue
chef exec berks vendor || prompt_continue


cat > "${tempInstallDir}/attributes.json" << EOF
{ "run_list": [ "recipe[${dotFilesCookbook}::default]" ] }
EOF

echo ">>> Running chef-client (installed by ChefDK) to bootstrap these dotFiles"
sudo -E chef-client -c "${tempInstallDir}/client.rb" || prompt_continue

# cleanup
cd - || prompt_continue
sudo rm -rf "$tempInstallDir"

# End message
cat <<EOF
>>> dotFiles Installation Complete!
EOF
