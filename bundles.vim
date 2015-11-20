set nocompatible
filetype off " Reset if set by a system-wide config

call plug#begin('~/.vim/bundle')

Plug 'hynek/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'Lokaltog/vim-easymotion'
Plug 'Lokaltog/vim-powerline'
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
Plug 'jimenezrick/vimerl'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/VimClojure'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/taglist.vim'

call plug#end()

filetype plugin indent on " Enable filetype specific things
