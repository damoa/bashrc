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
