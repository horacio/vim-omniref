" vim-omniref - Basic Omniref lookup for VIm.

if exists("g:loaded_vim_omniref") || &cp || v:version < 700
  finish
endif

let g:loaded_vim_omniref = 1

if !exists("g:vim_omniref_open_command")
  if substitute(system('uname'), "\n", "", "") == 'Darwin'
    let g:vim_omniref_open_command = "open"
  else
    let g:vim_omniref_open_command = "xdg-open"
  endif
endif

if !exists("g:vim_omniref_perl_command")
  let g:vim_omniref_perl_command = "perl"
endif

if !exists("g:vim_omniref_search_url")
  let g:vim_omniref_search_url = "https://www.omniref.com/?q="
endif

if !exists("g:vim_omniref_command")
  let g:vim_omniref_command = "Omniref"
endif

execute "command! -nargs=* -range ". g:vim_omniref_command  ." :call s:omniref('', <f-args>)"

fun! s:omniref(ft,...)
  let selection = getpos('.') == getpos("'<") ? getline("'<")[getpos("'<")[2] - 1:getpos("'>")[2] - 1] : ''
  let words = [empty(selection) ? expand("<cword>") : selection]

  if a:0 == 0
    let words = [a:ft, empty(selection) ? expand("<cword>") : selection]
  else
    let query = join(a:000, " ")
    let quotes = len(substitute(query, '[^"]', '', 'g'))
    let words = [a:ft, query, selection]

    if quotes > 0 && quotes % 2 != 0
      call add(words, '"')
    endif

    call filter(words, 'len(v:val)')
  endif

  let query = substitute(join(words, " "), '^\s*\(.\{-}\)\s*$', '\1', '')
  let query = substitute(query, '"', '\\"', 'g')

  silent! execute "! omniref_query=\"$(" . g:vim_omniref_perl_command .
    \" -MURI::Escape -e 'print uri_escape($ARGV[0]);' \"" . query . "\")\" && " .
    \g:vim_omniref_open_command . ' "' . g:vim_omniref_search_url . "$omniref_query" . '" > /dev/null 2>&1 &'

  redraw!
endfun
