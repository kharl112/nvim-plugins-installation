#!/bin/bash

#install nvim
sudo apt-get update
sudo apt-get install neovim git -y


#Officially, Vim recommends that each plugin project gets its own directory within ~/.vim/pack. 
mkdir -p ~/.vim/pack/vendor/start

#install nerdtree plugin into the directory
git clone --depth 1 https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
