" Basic Vim settings "{{{
filetype on " workaround for OS X vim in case filetype is off later. Prevents it from exiting with non-0 status.

set nocompatible
filetype off

" Enable go plugins
if exists("$GOROOT")
  set rtp+=$GOROOT/misc/vim/
endif

source ~/.vim/bundles.vim

"}}}

" Indenting and Formatting "{{{
set nowrap "don't wrap
set ts=4
set sw=4
set shiftround "Round shifts to multiples of sw

set modeline "Enable modeline parsing
set modelines=5
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
set dir=~/.vim/swap//
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
    set macligatures
    set guifont=Go\ Mono\ for\ Powerline:h12,Go\ Mono:h12,Menlo\ Regular:h12
    " set guifont=Monaco:h11
    " set guifont=Envy\ Code\ R:h13
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
set shortmess="aI" "Shorten common messages
set sbr=">" "Line wrapping indicator
set sft "Show full tag for completion
set wildmenu "Turn on the 'wildmenu', extended menu for tab completion
set wildmode=longest:full
set wildignore+=*.pyc,*.pyo,*.swp,*.bak,*.o
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/build/*,*/dist/*

colorscheme solarized
set bg=light
if $COLORTERM == "gnome-terminal"
  set t_Co=16
  set bg=dark
endif

"}}}

" Keybindings "{{{
set pastetoggle=<F10>
let mapleader=","
let maplocalleader=","

" Error checking
nnoremap <leader>E :Errors<cr>
nnoremap <leader>ll :ll<cr>
nnoremap <leader>nn :lnext<cr>
nnoremap <leader>pp :lprev<cr>

noremap <leader>nh :nohl<cr>
nnoremap <leader>tw :%s/\s\+$//<cr>
noremap <leader>vr :vsplit $MYVIMRC<cr>
nnoremap <leader>nu :set relativenumber!<cr>

" Font resizing
nnoremap <C-Up> :silent! let &guifont = substitute( &guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', '')<CR>
nnoremap <C-Down> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR>

""" Diffs
noremap <leader>sd :new<cr>:read !svn diff<cr>:set syntax=diff buftype=nofile<CR>gg
noremap <leader>hd :new<cr>:read !hg diff<cr>:set ft=diff buftype=nofile<CR>gg
noremap <leader>hqd :new<cr>:read !hg qdiff<cr>:set ft=diff buftype=nofile<CR>gg
noremap <leader>do :DiffOrig

""" Plugins
"nnoremap <leader>c <plug>NERDCommenterToggle
"vnoremap <leader>c <plug>NERDCommenterToggle
noremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>ud :GundoToggle<cr>
noremap <leader>st :SyntasticToggleMode<cr>
noremap <leader>td <plug>TaskList
nnoremap <leader>tl :TlistToggle<cr>

noremap <leader>gs :Gstatus<cr>
noremap <leader>gca :Gcommit -a<cr>
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

autocmd FileType javascript noremap <buffer>  <leader>f :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <leader>f :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <leader>f :call JsxBeautify()<cr>
autocmd FileType javascript.jsx noremap <buffer>  <leader>f :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>f :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>f :call CSSBeautify()<cr>

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
let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
let NERDSpaceDelims = 1

let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0

let g:gundo_preview_bottom = 1

let g:syntastic_aggregate_errors = 1
let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_mode_map = { 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html'] }
let g:syntastic_go_checkers = ['govet', 'go']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--config ' . expand('~/.eslintrc')

let g:vimclojure#WantNailgun = 1
let grvimclojure#ParenRainbow = 1

let g:ackprg = 'ag --nogroup --nocolor --column'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:clang_format#auto_format = 1
let g:clang_format#auto_formatexpr = 1

let g:go_auto_sameids = 1

if has("gui_running")
  let g:airline_powerline_fonts = 1
endif

"}}}

" OS-Specific "{{{
if has("win32")
  command Eb browse e
  command Ew browse w
endif
"}}}

" Additional commands "{{{
function! Rex(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command Rex call Rex(<q-args>)

command! Columns %! column -t
command! -nargs=+ Ag Ack <args>
"}}}

" vim: foldmethod=marker:ts=2:expandtab:sw=2
