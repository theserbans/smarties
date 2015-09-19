#!/sh/bin

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# pathogen bundles
cd ~/.vim/bundle
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/nelstrom/vim-markdown-folding.git
git clone https://github.com/will133/vim-dirdiff.git

