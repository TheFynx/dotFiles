#!/bin/bash

#!/usr/bin/env bash

set -o nounset -o pipefail

# All in on bootstrap of OS choice
bootstrapCookbook="clientBootstrap"
bootstrapGit="https://github.com/thefynx/${bootstrapCookbook}.git"

# dotFile config
dotFilesCookbook="dotfiles"
dotfilesGit="https://github.com/thefynx/${dotFilesCookbook}.git"

tempInstallDir="mktemp -d -t bootstrap"

function prompt_continue () {
  echo "!!!!!!!!!!!!!!!!!!!!!!!"
  echo "Bootstrap encountered an error in the previous step."
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

# If bootstrapping, adding bootstrap to deps
if [ ${bootstrapAnswer} == [yY]* ]; then
    echo "cookbook "${bootstrapCookbook}", git: '${bootstrapGit}'" >> ${tempInstallDir}/Berksfile
    echo ">>> Bootstrap added to dependencies and runlist"
fi

# create client.rb file so that Chef client can find its dependant cookbooks
cat > "${tempInstallDir}/client.rb" <<EOF
cookbook_path File.join(Dir.pwd, 'berks-cookbooks')
local_mode true
chef_zero.enabled
json_attribs "${tempInstallDir}/attributes.json"
EOF

cat <<EOF
>>> Installing ChefDK
EOF

if [[ "$INSTALL_CHEFDK" -eq 1 ]]
then
  echo "Installing ChefDK ${CHEFDK_TARGET_VERSION}"
  curl --silent --show-error https://omnitruck.chef.io/install.sh | \
    sudo -E bash -s -- -c stable -P chefdk || prompt_continue
fi

echo ">>> Downloading cookbook dependencies with Berkshelf"
cd "$tempInstallDir" || prompt_continue
chef exec berks vendor || prompt_continue


cat > "${tempInstallDir}/attributes.json" << EOF
{
    "${dotFilesCookbook}": {
        "something": ""
    },
    "run_list": [
        "recipe[${bootstrapCookbook}]",
        "recipe[${dotFilesCookbook}]"
    ]
}
EOF

echo ">>> Running chef-client (installed by ChefDK) to bootstrap this machine"
sudo -E chef-client error -c "${tempInstallDir}/client.rb" || prompt_continue

# cleanup
cd - || prompt_continue
sudo rm -rf "$tempInstallDir"

# End message
cat <<EOF
>>> Bootstrap Complete!
EOF

