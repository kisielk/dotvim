" Basic Vim settings "{{{
set nocompatible
filetype off " Reset if set by a system-wide config

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles "{{{
Bundle 'gmarik/vundle'
Bundle 'jimenezrick/vimerl'
Bundle 'kien/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'vim-scripts/VimClojure'
"}}}


filetype plugin indent on " Enable filetype specific things
"}}}

" Indenting and Formatting "{{{
set nowrap "don't wrap
set ts=4
set sw=4
set expandtab
set shiftround "Round shifts to multiples of sw

set modeline "Enable modeline parsing
set modelines=1
set autoindent
set copyindent "Copy previous line's indent
set number
set bs=2 " Backspace behavior
set whichwrap +=<,>,h,l " Cursor key wrapping
set smarttab " Insert tabs on the start of a line according to sw not ts
" Syntax highlighting
set syntax=on
syn on
"}}}

" File Handling "{{{
set nobackup " Backup file while writing but don't keep it
set writebackup
set dir=~/.vim/swap
set diffopt="filler,context:4" " Set some options for diffs
set viminfo='1000,f1,:20,rA:,rB:,h
"}}}

" GUI "{{{
if has("gui_running")
  set guioptions=acie
  if has("gui_win32")
    set guifont=..\ ....:h10:cSHIFTJIS
  elseif has("x11")
    set guifont=DejaVu\ Sans\ Mono\ 10
  elseif has("gui_macvim")
    set guifont=Envy\ Code\ R:h13
    set fuopt=maxvert,maxhorz
  endif
  set mousehide " Hide the mouse when typing
  set guitablabel=%N\ %f
endif
"}}}

" Searching "{{{
set hlsearch " Turn on search highlight
set incsearch " Incremental search
set showmatch " Show matching brackets
set ignorecase "Ignore case by default
set smartcase "Don't ignore case if capitals are in the pattern
"}}}

" Interface "{{{
set confirm "Confirm operations that would normally fail
set splitbelow
set splitright
set laststatus=2 "Always show status line in the last window
set ruler "Show cursor position
set statusline=%f\ b%n%(\ [%M%R%W]%)\ %Y\ %{fugitive#statusline()}\ %=\ %-14B\ %-24(%l/%L,%c%V%)\ %p%%

set history=1000 "Command history size
set undolevels=1000 "Many undos

set vb "Visual bell instead of beep
set scrolloff=5 "Lines of context when scrolling
set shortmess="a" "Shorten common messages
set sbr=">" "Line wrapping indicator
set sft "Show full tag for completion
set wildmenu "Turn on the 'wildmenu', extended menu for tab completion
set wildmode=longest:full
set wildignore+=*.pyc,*.pyo,*.swp,*.bak,*.o
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/build/*
if has("gui_running")
  colorscheme xoria256
else
  set bg=dark
  colorscheme enzyme
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " How to format invisible chars

" Function for toggling relative line numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc


"}}}

" Additional Commands "{{{
" Diff the current buffer with the original file
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"}}}

" Keybindings "{{{
set pastetoggle=<F10>
let mapleader=","
let maplocalleader=","
map <leader>nh :nohl<cr>
nmap <leader><c-t>n :tabnew<cr>
nmap <leader>tp :tabp<cr>
nmap <leader>tn :tabn<cr>
nmap <leader>tw :%s/\s\+$//<cr>
map <leader>vr :e $HOME/.vimrc<cr>
nnoremap <leader>nn :call NumberToggle()<cr>

""" Diffs
map <leader>sd :new<cr>:read !svn diff<cr>:set syntax=diff buftype=nofile<CR>gg
map <leader>hd :new<cr>:read !hg diff<cr>:set ft=diff buftype=nofile<CR>gg
map <leader>hqd :new<cr>:read !hg qdiff<cr>:set ft=diff buftype=nofile<CR>gg
map <leader>do :DiffOrig

""" Plugins
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle
map <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>ud :GundoToggle<cr>
map <leader>td <plug>TaskList

"}}}

" Printing "{{{
set printoptions="syntax:n,paper:letter"
"}}}

" Autocommands "{{{

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd! BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Reload vimrc after editing
au! BufWritePost $MYVIMRC source $MYVIMRC
""}}}

" Folding "{{{
set foldlevelstart=0 " Close all folds by default.
"}}}

" Abbreviations {{{
iabbr teh the
iabbr retrun return
iabbr dopdb import pdb;pdb.set_trace()
"}}}

" Plugin settings "{{{
let python_highlight_all = 1
let NERDCreateDefaultMappings = 0
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0
let g:syntastic_python_checker = 'pyflakes'
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:vimclojure#WantNailgun = 1
let grvimclojure#ParenRainbow = 1
"}}}

" OS-Specific "{{{
if has("win32")
  command Eb browse e
  command Ew browse w
endif
"}}}

" vim: foldmethod=marker:ts=2:expandtab:sw=2
