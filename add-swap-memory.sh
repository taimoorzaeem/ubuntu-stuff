# Add swap memory for memory intensive processes like nixpkgs-review and builds.
# This resets on reboot.

set -e

sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
free -h
