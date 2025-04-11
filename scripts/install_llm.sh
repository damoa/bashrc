echo $(which python3)
if command -v python >/dev/null 2>&1; then
  echo "Python is installed: $(python --version 2>&1)"
else
  sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt update && sudo apt install python3.12
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
  python -m venv ~/venvs/base
  source ~/venvs/base/bin/activate
  echo "source ~/venvs/base/bin/activate" >> ~/.bashrc
  source ~/.bashrc
fi

echo "Installing llm with openai setup"
if command -v llm >/dev/null 2>&1; then
  "llm and llm-cmd already installed!"
else
  pip install llm
  llm keys set openai
  llm install llm-cmd
fi
