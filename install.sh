#!/bin/bash

#install nvim
sudo apt-get update
sudo apt-get install neovim git curl -y

set -ex
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install conf
cat vimrc.conf > ~/.vimrc



