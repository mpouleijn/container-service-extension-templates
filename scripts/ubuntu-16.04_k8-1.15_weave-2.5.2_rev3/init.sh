#!/usr/bin/env bash
set -e

### root password access is dangerous; ssh-key access is recommended
### Uncomment below line if you want to enable root password access
# sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config

sed -i -e 's/^PasswordAuthentication yes/PasswordAuthentication no/' -e 's/^PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
apt remove -y cloud-init
dpkg-reconfigure openssh-server
sync
sync
