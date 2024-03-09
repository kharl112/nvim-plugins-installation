#!/bin/bash

#install nvim
sudo apt-get update
sudo apt-get install neovim git curl -y

set -ex
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install conf
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
cat vimrc.conf > ~/.config/nvim/init.vim



