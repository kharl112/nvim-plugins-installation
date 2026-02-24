#!/bin/bash

#install nvim
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen zstd
if ! command -v nvim --version >/dev/null 2>&1; then
  current_dir=$PWD
  cd /tmp
  git clone https://github.com/neovim/neovim.git
  cd neovim
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  nvim --version
  cd $current_dir 
fi


sudo apt-get update
sudo apt-get install tmux -y
sudo apt autoremove -y


# Check if Ollama is installed
if ! command -v ollama >/dev/null 2>&1; then
  read -p "Ollama not found. Install it? (y/n): " confirm
  if [ "$confirm" != "y" ]; then
     curl -fsSL https://ollama.com/install.sh | sh
     reset 
     deepcoder:1.5b
  fi
fi

set -ex
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install conf
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
cat nvim.init.conf > ~/.config/nvim/init.vim
nvim +PlugInstall +qall


cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
tmux-killserver
