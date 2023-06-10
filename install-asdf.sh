# !/bin/bash

sudo apt install curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
source ~/.bashrc
