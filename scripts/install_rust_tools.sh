if command -v rustc >/dev/null 2>&1; then
  echo "Rust already installed"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if command -v tokei >/dev/null 2>&1; then
  echo "tokei already installed"
else
  cargo install tokei
fi
