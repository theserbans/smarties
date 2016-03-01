#!/bin/sh

# bash
mv ~/.bashrc ~/.bashrc.bkp
cp .bashrc ~/.bashrc
mv ~/.profile ~/.profile.bkp
cp .profile ~/.profile
cp .bash_profile ~/.bash_profile


# vim
cp .vimrc ~/.vimrc
cp .config ~/.config

mkdir ~/.vim
cp .vim/colors ~/.vim/colors
cp .vim/syntax ~/.vim/syntax

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/nelstrom/vim-markdown-folding.git
git clone https://github.com/will133/vim-dirdiff.git

