"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: javascript.jsx
" Maintainer: MaxMellon <maxmellon1994@gmail.com>
" Depends:  leafgarland/typescript-vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:jsx_cpo = &cpo
set cpo&vim

syntax case match

if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
endif

" refine the typescript line comment
syntax region typescriptLineComment start=+//+ end=/$/ contains=@Spell,typescriptCommentTodo,typescriptRef extend keepend

" add a typescriptBlock group for typescript
syntax region typescriptBlock
      \ contained
      \ matchgroup=typescriptBraces
      \ start="{"
      \ end="}"
      \ extend
      \ contains=@typescriptAll,@typescriptExpression,typescriptBlock
      \ fold

runtime syntax/jsx_pretty.vim

syntax cluster typescriptExpression add=jsxRegion

let b:current_syntax = 'typescript.tsx'

let &cpo = s:jsx_cpo
unlet s:jsx_cpo
