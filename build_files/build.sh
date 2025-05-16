#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

python3 /ctx/setup-periphery.py --force --factory
echo 'writing tmpfiles.d for periphery default config'
tee /usr/lib/tmpfiles.d/periphery-default-config.conf <<<'C /etc/komodo/periphery.config.toml 0640 root root - /usr/lib/komodo/periphery.config.toml

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

if find /usr/etc ; then
echo AAAAAAAAAAAAAAAA
fi
#### Example for enabling a System Unit File

#systemctl enable podman.socket
