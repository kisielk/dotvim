

" Vim color file
" Maintainer:   
" Last Change:  
" URL:			 


" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="kate"

hi Normal	guifg=#000000 guibg=#FFFFFF

" highlight groups
hi Cursor	guibg=#0000ff guifg=#FFFFFF
hi ErrorMsg	guibg=salmon guifg=bg gui=bold
hi Folded	guibg=#678DB2 guifg=white gui=bold
hi FoldColumn	guibg=#678DB2 guifg=tan
hi IncSearch	guifg=slategrey guibg=yellow
hi ModeMsg 	guifg=#404040 guibg=#C0C0C0
hi MoreMsg 	guifg=darkturquoise guibg=#188F90
"hi NonText guibg=#334C75 guifg=#9FADC5
hi NonText 	guibg=#AAAAAA guifg=#FFFFFF
hi Question	guifg=#F4BB7E
hi Search 	guibg=salmon guifg=bg 
hi SpecialKey	guifg=#BF9261
hi StatusLine	guibg=#808080 guifg=#ffffff gui=bold
hi StatusLineNC	guibg=#808080 guifg=#ffffff gui=none
hi Title	guifg=#8DB8C3
hi VertSplit 	guibg=#FFFFFF guifg=#808080 gui=none
hi Visual 	gui=bold guifg=black guibg=#678DB2
hi WarningMsg	guifg=#F60000 gui=underline

" syntax highlighting groups
hi Comment 	gui=italic guifg=#808080
hi Constant 	guifg=#008080
hi Identifier	guifg=#0000FF
hi Statement 	gui=none guifg=#800000
hi PreProc 	guifg=#008000 gui=none
hi Type		guifg=#800000
hi Special 	guifg=#000000
hi Ignore	guifg=grey60
hi Todo		guibg=yellow guifg=black
hi Label 	guifg=#000000 gui=bold

"vim: ts=4
