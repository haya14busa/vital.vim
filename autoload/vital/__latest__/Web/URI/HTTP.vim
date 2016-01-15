let s:save_cpo = &cpo
set cpo&vim

" The following four URIs are equivalent:
" * http://example.com
" * http://example.com/
" * http://example.com:/
" * http://example.com:80/
"
" https://tools.ietf.org/html/rfc3986#section-6.2.3
function! s:canonicalize(uriobj) dict abort
  if a:uriobj.path() ==# ''
    call a:uriobj.path('/')
  endif
  if a:uriobj.port() ==# self.default_port(a:uriobj)
    call a:uriobj.port('')
  endif
endfunction

function! s:default_port(uriobj) dict abort
  return '80'
endfunction

" vim:set et ts=2 sts=2 sw=2 tw=0:fen:
