#!/bin/bash

if command -v ollama >/dev/null 2>&1; then
  echo "ollama is installed: $(ollama --version 2>&1)"
else
  curl -fsSL https://ollama.com/install.sh | sh
fi

ollama serve

# echo 'Installing phi3....'
# # phi-3 requires 1.5GB
# # codellama:7b requires 8GB+ of RAM
# # there is also codellama:34b  that requires 32GB+ RAM
# # codellama:7b-instruct for natural language + code
# # codellama:7b-code for code
# # codellama:7b-python for code
# if command -v ollama >/dev/null 2>&1; then
#   if ollama list | grep -q '^phi-3'; then
#     echo 'phi3 is already pulled'
#   else
#     ollama pull phi3
#   fi
# fi
