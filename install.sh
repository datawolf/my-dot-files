#!/usr/bin/env bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/bin
cp -rf bin/* ~/bin/
cp -rf .bashrc ~/
cp -rf .gitconfig ~/
cp -rf .tmux.conf ~/
cp -rf .vim ~/
cp -rf .vimrc ~/
cp -rf .vim/.ycm_extra_conf.py  ~/.vim/
