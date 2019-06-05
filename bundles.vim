set nocompatible
filetype off " Reset if set by a system-wide config

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Shougo/neocomplete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jimenezrick/vimerl'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mileszs/ack.vim'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'sophacles/vim-processing'
Plugin 'supercollider/scvim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vhdirk/vim-cmake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'vim-scripts/taglist.vim'

call vundle#end()

filetype plugin indent on " Enable filetype specific things
