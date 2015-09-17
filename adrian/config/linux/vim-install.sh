#!/bin/sh

# vim
cp .vimrc ~/.vimrc

mkdir ~/.vim
cp .vim/colors ~/.vim/colors
cp .vim/syntax ~/.vim/syntax

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/nelstrom/vim-markdown-folding.git
git clone https://github.com/will133/vim-dirdiff.git

