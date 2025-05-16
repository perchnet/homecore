#!/bin/bash

set -ouex pipefail

python3 /ctx/setup-periphery.py --force --factory
echo 'writing tmpfiles.d for periphery default config'
tee /usr/lib/tmpfiles.d/periphery-default-config.conf <<<'C /etc/komodo/periphery.config.toml 0640 root root - /usr/lib/komodo/periphery.config.toml'
