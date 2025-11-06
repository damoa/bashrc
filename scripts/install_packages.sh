sudo apt install bat curl direnv jq xmlstarlet

if command -v python >/dev/null 2>&1; then
  echo "zoxide is already installed"
else
  sudo apt install zoxide
  echo "eval \"\$(zoxide init bash)\"" >> ~/bashrc/.bashrc
fi

if command -v fzf >/dev/null 2>&1; then
  echo "fzf is already installed"
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

if command -v rg >/dev/null 2>&1; then
  echo "ripgrep is already installed"
else
  arch=$(uname -m)

  if [ "$arch" = "armv7l" ]; then
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_armv7.deb
    sudo dpkg -i ripgrep_14.1.0-1_armv7.deb
  elif [ "$arch" = "aarch64" ]; then
    sudo apt install ripgrep
    # wget http://ftp.de.debian.org/debian/pool/main/r/rust-ripgrep/ripgrep_15.1.0-1+b4_arm64.deb
    # sudo dpkg -i ripgrep_14.1.1-1+b4_arm64.deb
  else
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
    sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
  fi
fi

if command -v newsboat >/dev/null 2>&1; then
  echo "newsboat is already installed"
else
  sudo apt install newsboat
fi
