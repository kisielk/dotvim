setlocal noexpandtab
setlocal nolist
setlocal omnifunc=gocomplete#Complete
autocmd BufWritePre *.go :silent Fmt
