#!/bin/bash

#install nvim
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
cd /tmp
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

cd -

sudo apt-get update
sudo apt-get install tmux -y

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
