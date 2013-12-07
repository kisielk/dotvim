set nocompatible
filetype off " Reset if set by a system-wide config

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "hynek/vim-python-pep8-indent"
Bundle "pangloss/vim-javascript"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'dgryski/vim-godef'
Bundle 'gmarik/vundle'
Bundle 'jimenezrick/vimerl'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'vim-scripts/taglist.vim'

filetype plugin indent on " Enable filetype specific things
