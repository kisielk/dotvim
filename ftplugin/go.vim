set noexpandtab
set nolist
setlocal omnifunc=gocomplete#Complete
autocmd BufWritePre *.go :silent Fmt
