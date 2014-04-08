setlocal noexpandtab
setlocal nolist

nmap gd <Plug>(go-def-vertical)
let g:go_fmt_fail_silently = 1
let go_highlight_extra_types = 0
let go_highlight_operators = 0
let go_highlight_functions = 0
let go_highlight_methods = 0
let go_highlight_structs = 0

if executable('goimports')
  let g:gofmt_command = 'goimports'
endif
