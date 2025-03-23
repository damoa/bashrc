#!/bin/bash

# sudo apt-get install dconf-cli git
#
# git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git ~/Downloads/gnome-terminal-colors-solarized
#
#
# cd ~/Downloads/gnome-terminal-colors-solarized
#
# ./install.sh
#
# cd -
cd ~
mkdir solarized && cd solarized
git clone https://github.com/sgerrand/xfce4-terminal-colors-solarized.git

cp ~/solarized/xfce4-terminal-colors-solarized/dark/terminalrc ~/.config/xfce4/terminal/
