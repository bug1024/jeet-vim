#!/bin/bash

install_path="~/.jeet-vim"

echo -e "download jeet-vim...\n"
git clone https://github.com/bug1024/jeet-vim.git $install_path

echo -e "download vundle...\n"
git clone https://github.com/gmarik/vundle.git "${install_path}/vim/bundle/Vundle.vim"

echo -e "backup vimrc\n"
mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vim.bak

echo -e "set new vimrc\n"
ln "${install_path}"/vimrc ~/.vimrc
ln "${install_path}"/vimrc.bundles ~/.vimrc.bundles
ln -s "${install_path}/vim/" ~/.vim

echo -e "install vim plugins...\n"
vim +BundleInstall +BundleClean
