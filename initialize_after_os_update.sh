#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"

# Disable SteamOS Readonly mode
sudo steamos-readonly disable

# Update archlinux-keyring
# See: https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly
sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Su --noconfirm

# Refresh Keys
sudo pacman-key --init
sudo pacman-key --populate archlinux 
sudo pacman-key --refresh-keys

# Upgrade all packages
sudo pacman -Syu --noconfirm

# Purge old config file
sudo rm -f /etc/vpnc/vpnc-script
sudo rm -f /etc/skel/.screenrc

# Janky ass temp fix for outdated arch keyring
sudo pacman-key --refresh-keys 6C7F7F22E0152A6FD5728592DAD6F3056C897266

# Install custom packages
./install_pacman_packages.sh
# Set up sudoers
sudo cp ./zz10_deckpad /etc/sudoers.d/zz10_deckpad

# enableSteamOS Readonly mode
sudo steamos-readonly enable

cd - >/dev/null
