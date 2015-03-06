setlocal noexpandtab
setlocal nolist

nmap gd <Plug>(go-def-vertical)<cr>
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let go_highlight_extra_types = 0
let go_highlight_operators = 0
let go_highlight_functions = 0
let go_highlight_methods = 0
let go_highlight_structs = 0

if executable('goimports')
  let g:gofmt_command = 'goimports'
endif
