#!/bin/bash

# Make SWAP on Ubuntu in seconds
#
# See https://github.com/igormukhingmailcom/digitalocean-make-swap-on-ubuntu.git
# for more information

file="$1" # Filename. "/swapfile" for example
size="$2" # Swap size. "4G" for example

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ -e "$file" ]; then
    echo "Swap file exists" 1>&2
    exit 2;
fi

fallocate -l "$size" "$file"
chmod 600 "$file"
mkswap "$file"
swapon "$file"

echo "$file   none    swap    sw    0   0" >> /etc/fstab

sysctl vm.swappiness=10
echo -e "\nvm.swappiness=10" >> /etc/sysctl.conf

sysctl vm.vfs_cache_pressure=50
echo -e "\nvm.vfs_cache_pressure = 50" >> /etc/sysctl.conf
