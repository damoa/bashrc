# Make a bin folder in your home directory
mkdir ~/bin

# Add the bin folder to your PATH in your bashrc
echo '[[ -e ~/bin ]] && export PATH=$PATH:~/bin' >> ~/.bashrc

# Download the script to a file named 'wsl-open'
curl -o ~/bin/wsl-open https://raw.githubusercontent.com/4U6U57/wsl-open/master/wsl-open.sh
chmod +x ~/bin/wsl-open
