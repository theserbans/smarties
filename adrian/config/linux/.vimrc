let g:NERDTreeWinSize = 45
let g:NERDTreeDirArrows=0
let g:NERDTreeBookmarksSort=1
let mapleader=" "

nmap <leader>q <C-^>
nmap <leader>c :noh<CR>
map <leader>p "*p
map <leader>y "*y
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>nt :NERDTreeToggle <CR>
"nmap <leader>w <C-w>w
"nmap <leader><Tab> <C-w>w
nmap <Tab> <C-w>w
nmap <leader>f <C-p>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

set ignorecase smartcase
set cindent shiftwidth=4
set softtabstop=4
set expandtab
set nobackup
set hlsearch
"command C let @/=""            " clear hlsearch highlighting withough affecting the search string
set number
set wildchar=<Tab> wildmenu wildmode=full   "":b [tab] will show all buffers in a menu list
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set mousehide                   " hide mouse while typing
set scrolloff=10                " search scroll offset
syntax on                       " turn syntax highlighting on by default

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    "Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff
      autocmd BufNewFile,BufRead *.diff set filetype=diff

      autocmd Syntax diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

    autocmd Syntax gitcommit setlocal textwidth=74

    "see NERDTree only when I start vim without file arguments
    "if exists("loaded_nerd_tree")
    "    autocmd VimEnter * if !argc() | NERDTree | endif
    "endif

    au BufNewFile,BufRead *.meta set filetype=xml
    au BufNewFile,BufRead *.metadata set filetype=xml
    au BufNewFile,BufRead *.upgrade set filetype=xml
    au BufNewFile,BufRead *.cd set filetype=xml
    au BufNewFile,BufRead *.datasource set filetype=xml
    au BufNewFile,BufRead *.environment set filetype=xml
    au BufNewFile,BufRead *.enum set filetype=xml
    au BufNewFile,BufRead *.workflow set filetype=xml
    au BufNewFile,BufRead *.log set filetype=javalog
    au FileType xml setlocal foldmethod=syntax

endif " has("autocmd")

filetype on
let g:xml_syntax_folding=1


"solarized color scheme
syntax enable
set hlsearch
set background=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"if has('gui_win32')
if has('gui_running')
"    g:solarized_termcolors=   16      |   256
"    g:solarized_termtrans =   0       |   1
"    g:solarized_degrade   =   0       |   1
"    g:solarized_bold      =   1       |   0
"    g:solarized_underline =   1       |   0
"    g:solarized_italic    =   1       |   0
"    g:solarized_contrast  =   "normal"|   "high" or "low"
"    g:solarized_visibility=   "normal"|   "high" or "low"
    colorscheme solarized
    set lines=65
    set columns=220
    set number
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=Consolas:h10":cANSI
    "autocmd BufEnter * lcd %:p:h  "sets the working directory to the current file's directory; do :NERDTreeToggle
    "map <C-o> :NERDTreeToggle %<CR>  " toggle nerdtree in the dir of the current buffer
endif

"pathogen
execute pathogen#infect()

"Block cursor for n-v-c, iCursor for i
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

