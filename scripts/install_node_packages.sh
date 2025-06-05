#!/bin/bash

if command -v tldr >/dev/null 2>&1; then
  echo 'tldr is already installed'
else
  npm install -g tldr
fi

if command -v svgo >/dev/null 2>&1; then
  echo 'svgo is already installed'
else
  npm install -g svgo
fi

# usage: readability <file/url> | w3m -T text/html
if command -v readable >/dev/null 2>&1; then
  echo 'readability-cli is already installed'
else
  npm install -g readability-cli
fi
