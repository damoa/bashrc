if command -v python >/dev/null 2>&1; then
  echo 'oh-my-posh already installed!'
else
  echo "Installing oh-my-posh"
  curl -s https://ohmyposh.dev/install.sh | bash -s

  echo "Downloading themes"
  mkdir -p ~/.poshthemes
  wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
  unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
  chmod u+rw ~/.poshthemes/*.json
  rm ~/.poshthemes/themes.zip

  echo "Set up shell"
  eval "$(oh-my-posh init bash --config ~/.poshthemes/{theme}.omp.json)"
  source ~/.bashrc
fi
