"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: javascript.jsx
" Maintainer: MaxMellon <maxmellon1994@gmail.com>
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

" check the javascript syntax file and cache it
if !exists('s:js_syntax')
  let s:syntax_list = execute('syntax list')
  if s:syntax_list =~ "jsNoise"   " pangloss/vim-javascript
    let s:js_syntax = "vim-javascript"
  elseif s:syntax_list =~ "javascriptOpSymbols"   " othree/yajs.vim
    let s:js_syntax = "yajs"
  else  " build-in javascript syntax
    let s:js_syntax = "buildin"
  endif
endif

if s:js_syntax == "vim-javascript"   " pangloss/vim-javascript
  syntax cluster jsExpression add=jsxRegion
elseif s:js_syntax == "yajs"   " othree/yajs.vim
  " refine the javascript line comment
  syntax region javascriptLineComment start=+//+ end=/$/ contains=@Spell,javascriptCommentTodo extend keepend
  syntax cluster javascriptValue add=jsxRegion
  syntax cluster javascriptNoReserved add=jsxElement
else    " build-in javascript syntax
  " refine the javascript line comment
  syntax region javaScriptLineComment start=+//+ end=/$/ contains=@Spell,javascriptCommentTodo extend keepend
  " add a javaScriptBlock group for build-in syntax
  syntax region javaScriptBlockBuildIn
        \ contained
        \ matchgroup=javaScriptBraces
        \ start="{"
        \ end="}"
        \ extend
        \ contains=javaScriptBlockBuildIn,@javaScriptEmbededExpr,javaScript.*
        \ fold
  syntax cluster javaScriptEmbededExpr add=jsxRegion
endif

" because this is autoloaded, when developing you're going to need to source
" the autoload/jsx_pretty.vim file manually, or restart vim
call jsx_pretty#common()

let b:current_syntax = 'javascript.jsx'

let &cpo = s:jsx_cpo
unlet s:jsx_cpo
