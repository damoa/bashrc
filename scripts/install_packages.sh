sudo apt install bat curl direnv jq

if command -v python >/dev/null 2>&1; then
  echo "zoxide is already installed"
else
  sudo apt install zoxide
  echo "eval \"\$(zoxide init bash)\"" >> ~/bashrc/.bashrc
fi
