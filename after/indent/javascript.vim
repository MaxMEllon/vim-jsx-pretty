"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim indent file
"
" Language: javascript.jsx
" Maintainer: MaxMellon <maxmellon1994@gmail.com>
" Depends: pangloss/vim-javascript
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('b:did_indent')
  let s:did_indent = b:did_indent
  unlet b:did_indent
endif

runtime! indent/xml.vim

let s:keepcpo = &cpo
set cpo&vim

if exists('s:did_indent')
  let b:did_indent = s:did_indent
endif

setlocal indentexpr=GetJsxIndent()
setlocal indentkeys=0{,0},0),0],0\,,!^F,o,O,e,*<Return>,<>>,<<>,/

if exists('*shiftwidth')
  function! s:sw()
    return shiftwidth()
  endfunction
else
  function! s:sw()
    return &sw
  endfunction
endif

let s:starttag = '^\s*<'
let s:endtag = '^\s*\/\?>\s*;\='
let s:real_endtag = '\s*<\/\+[A-Za-z]*>'

let s:has_vim_javascript = exists('*GetJavascriptIndent')

let s:true = !0
let s:false = 0

function! s:syn_sol(lnum)
  return map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")')
endfunction

function! s:syn_eol(lnum)
  let lnum = prevnonblank(a:lnum)
  let col = strlen(getline(lnum))
  return map(synstack(lnum, col), 'synIDattr(v:val, "name")')
endfunction

function! s:syn_attr_jsx(synattr)
  return a:synattr =~ "^jsx"
endfunction

function! s:syn_xmlish(syns)
  return s:syn_attr_jsx(get(a:syns, -1))
endfunction

function! s:syn_jsx_block_end(syns)
  return get(a:syns, -1) =~ '\%(js\|javascript\)Braces' ||
      \  s:syn_attr_jsx(get(a:syns, -2))
endfunction

function! s:syn_jsx_region(syns)
  return len(filter(copy(a:syns), 'v:val ==# "jsxRegion"'))
endfunction

function! s:syn_js_repeat_braces(syns)
  return len(filter(copy(a:syns), 'v:val ==# "jsRepeatBraces"'))
endfunction

function! s:syn_jsx_else_block(syns)
  return len(filter(copy(a:syns), 'v:val ==# "jsIfElseBlock"'))
endfunction

function! s:syn_jsx_close_tag(syns)
  return len(filter(copy(a:syns), 'v:val ==# "jsxCloseTag"'))
endfunction

function! s:syn_jsx_escapejs(syns)
  return len(filter(copy(a:syns), 'v:val ==# "jsxEscapeJs"'))
endfunction

function! s:syn_jsx_continues(cursyn, prevsyn)
  let curdepth = s:syn_jsx_region(a:cursyn)
  let prevdepth = s:syn_jsx_region(a:prevsyn)

  return prevdepth == curdepth ||
      \ (prevdepth == curdepth + 1 && get(a:cursyn, -1) ==# 'jsxRegion')
endfunction

function! GetJsxIndent()
  let cursyn  = s:syn_sol(v:lnum)
  let prevsyn = s:syn_eol(v:lnum - 1)
  let nextsyn = s:syn_eol(v:lnum + 1)

  if (s:syn_xmlish(prevsyn) || s:syn_jsx_block_end(prevsyn)) &&
        \ s:syn_jsx_continues(cursyn, prevsyn)
    let ind = XmlIndentGet(v:lnum, 0)

    if getline(v:lnum) =~? s:endtag
      let ind = ind - s:sw()
    endif

    if getline(v:lnum - 1) =~? s:endtag
      let ind = ind + s:sw()
    endif

    " <div           | <div
    "   hoge={       |   hoge={
    "   <div></div>  |   ##<div></div>
    if s:syn_jsx_escapejs(prevsyn) && !(getline(v:lnum - 1) =~? '}')
          \&& getline(v:lnum - 1) =~? '{'
      let ind = ind + s:sw()
    endif

    if getline(v:lnum) =~? s:starttag
          \&& !getline(v:lnum) =~? '}' && getline(v:lnum) =~? '{'
      let ind = ind + s:sw()
    endif

    " <div            | <div
    "   hoge={        |   hoge={
    "     <div></div> |     <div></div>
    "     }           |   }##
    if s:syn_jsx_escapejs(cursyn) && getline(v:lnum) =~? '}'
          \&& !(getline(v:lnum) =~? '{')
      let ind = ind - s:sw()
    endif

    " return ( | return (
    "   <div>  |   <div>
    "   </div> |   </div>
    " ##);     | ); <--
    if getline(v:lnum) =~? ');\?' && s:syn_jsx_close_tag(prevsyn)
      let ind = ind - s:sw()
    endif

    if (s:syn_jsx_else_block(cursyn) || s:syn_js_repeat_braces(cursyn))
          \&& s:syn_jsx_close_tag(prevsyn)
      let ind = ind - s:sw()
    endif
  else
    if s:has_vim_javascript ==# s:true
      let ind = GetJavascriptIndent()
    else
      let ind = cindent(v:lnum)
    endif
  endif

  return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
