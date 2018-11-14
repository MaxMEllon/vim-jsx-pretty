if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words = '(:),\[:\],{:},<:>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

setlocal suffixesadd+=.tsx

" only so other plugins can use &filetype, e.g. for languageId in a language
" client
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
