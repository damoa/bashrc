if command -v typescript >/dev/null 2>&1; then
  echo "typescript is installed: $(typescript --version 2>&1)"
else
  echo "installing typescript..."
  npm install -g typescript
fi

if command -v typescript-language-server >/dev/null 2>&1; then
  echo "typescript-language-server is installed: $(typescript-language-server --version 2>&1)"
else
  echo "installing typescript-language-server..."
  npm install -g typescript-language-server
fi
