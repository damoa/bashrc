#!/bin/bash

# For system-wide installation, copy the downloaded font files to /usr/share/fonts/
sudo wget -P /usr/share/fonts/ https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/CascadiaCode/Bold/CaskaydiaCoveNerdFont-Bold.ttf

fc-cache -f -v

#Edit ~/.config/xfce4/terminal/terminalrc and add "FontName=CaskaydiaCove Nerd Font 11"
echo 'FontName=CaskaydiaCove Nerd Font,CaskaydiaCove NF:style=Bold 12' >> ~/.config/xfce4/terminal/terminalrc
