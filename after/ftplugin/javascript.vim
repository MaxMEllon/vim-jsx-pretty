"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftplugin file
"
" Language: typescript.jsx
" Maintainer: MaxMEllon <maxmellon1994@gmail.com>
" Depends: leafgarland/typescript-vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" modified from html.vim
if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words = '(:),\[:\],{:},<:>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

setlocal suffixesadd+=.jsx
