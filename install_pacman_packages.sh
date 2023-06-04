#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"


sudo pacman -S --noconfirm xorg-xinput
sudo pacman -S --noconfirm figlet
sudo pacman -S --noconfirm --needed networkmanager-openconnect screen tmux


cd - >/dev/null 
