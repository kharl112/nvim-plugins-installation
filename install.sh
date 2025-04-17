#!/bin/bash

#install nvim
add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim tmux -y

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
