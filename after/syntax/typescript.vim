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

" this is commented out in leafgarland/typescript-vim
syntax region typescriptFuncBlock
      \ contained
      \ matchgroup=typescriptFuncBlock
      \ start="{"
      \ end="}"
      \ contains=@typescriptAll,typescriptParensErrA,typescriptParensErrB,typescriptParen,typescriptBracket,typescriptBlock,jsxRegion
      \ fold

" <tag key={this.props.key}>
"          s~~~~~~~~~~~~~~e
syntax region jsxEscapeJs
      \ contained
      \ contains=typescriptFuncBlock,jsxRegion
      \ start=+{+
      \ end=++
      \ extend

" because this is autoloaded, when developing you're going to need to source
" the autoload/jsx_pretty.vim file manually, or restart vim
call jsx_pretty#common()

syntax cluster typescriptParens add=jsxRegion


let b:current_syntax = 'typescript.tsx'

let &cpo = s:jsx_cpo
unlet s:jsx_cpo

