set nocompatible
filetype off " Reset if set by a system-wide config

call plug#begin('~/.vim/bundle')

Plug 'Lokaltog/vim-easymotion'
Plug 'Lokaltog/vim-powerline'
Plug 'Shougo/neocomplete'
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jimenezrick/vimerl'
Plug 'kien/ctrlp.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'sophacles/vim-processing'
Plug 'supercollider/scvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/VimClojure'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/taglist.vim'

call plug#end()

filetype plugin indent on " Enable filetype specific things
