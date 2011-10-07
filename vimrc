" Basic Vim settings "{{{
set nocompatible
filetype off " Reset if set by a system-wide config
call pathogen#runtime_append_all_bundles() " Load plugins from pathogen
call pathogen#helptags()
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
set statusline=%f\ b%n%(\ [%M%R%W]%)\ %Y\ %=\ %-14B\ %-24(%l/%L,%c%V%)\ %p%%

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
if has("gui_running")
  colorscheme xoria256
else
  set bg=dark
  colorscheme enzyme
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " How to format invisible chars
"}}}

" Keybindings "{{{
set pastetoggle=<F10>
let mapleader=","
map <leader>nt :NERDTreeToggle<cr>
map <leader>nh :nohl<cr>
nmap <leader><c-t>n :tabnew<cr>
nmap <leader>tp :tabp<cr>
nmap <leader>tn :tabn<cr>
nmap <leader>tw :%s/\s\+$//<cr>

""" Diffs
map <leader>sd :new<cr>:read !svn diff<cr>:set syntax=diff buftype=nofile<CR>gg
map <leader>hd :new<cr>:read !hg diff<cr>:set ft=diff buftype=nofile<CR>gg
map <leader>hqd :new<cr>:read !hg qdiff<cr>:set ft=diff buftype=nofile<CR>gg

map <leader>pl !pylint
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle

nnoremap <leader>ut :GundoToggle<cr>

map <leader>vr :e $HOME/.vimrc<cr>
"}}}

" Printing "{{{
set printoptions="syntax:n,paper:letter"
"}}}

" Other "{{{

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
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
"}}}

" OS-Specific "{{{
if has("win32")
  command Eb browse e
  command Ew browse w
endif
"}}}

" Machine-Specific "{{{
if $HOSTNAME == "fraser"
  set t_kb
  fixdel
endif
"}}}


" vim: foldmethod=marker:ts=2:expandtab:sw=2