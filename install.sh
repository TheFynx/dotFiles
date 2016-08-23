#!/bin/bash

#!/usr/bin/env bash

set -o nounset -o pipefail

bootstrapCookbook='bootstrap-osx'
tempInstallDir="mktemp -d -t ${bootstapCookbook}"

# create Berksfile so that we can install the correct cookbook dependencies
cat > "${tempInstallDir}/Berksfile" <<EOF
source 'https://supermarket.chef.io'
cookbook '$bootstrapCookbook';
cookbook '$dotfiles';
EOF

# create client.rb file so that Chef client can find its dependant cookbooks
cat > "${tempInstallDir}/client.rb" <<EOF
cookbook_path File.join(Dir.pwd, 'berks-cookbooks')
EOF

cat <<EOF
** Installing ChefDK
EOF

if [[ "$INSTALL_CHEFDK" -eq 1 ]]
then
  echo "Installing ChefDK ${CHEFDK_TARGET_VERSION}"
  curl --silent --show-error https://omnitruck.chef.io/install.sh | \
    sudo -E bash -s -- -c stable -P chefdk || prompt_continue
fi

echo "Downloading cookbook dependencies with Berkshelf"
cd "$tempInstallDir" || prompt_continue
chef exec berks vendor || prompt_continue

# Pass optional attributes to chef-client
# This is a temporary interface and will change in 2.0 when we support named parameters (Issue #74)
if [ -n "${BOOTSTRAP_JSON_ATTRIBUTES:-}" ]
then
  attributeParameter=" --json-attributes $CHEFDK_BOOTSTRAP_JSON_ATTRIBUTES"
fi

echo "Running chef-client (installed by ChefDK) to bootstrap this machine"
sudo -E chef-client -z -l error -c "${tempInstallDir}/client.rb" -o "$bootstrapCookbook" ${attributeParameter:-} || prompt_continue

# cleanup
cd - || prompt_continue
sudo rm -rf "$tempInstallDir"

# End message to direct Mac users to last step in set up
cat <<EOF
You're almost done!!! You just need to edit your shell startup script to set up
chefdk environment variables for each login. See this page:
https://github.com/chef/chef-dk#using-chefdk-as-your-primary-development-environment
EOF

