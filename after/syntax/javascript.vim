"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim syntax file
"
" Language: javascript.jsx
" Maintainer: MaxMellon <maxmellon1994@gmail.com>
" Depends: pangloss/vim-javascript
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

" <tag id="sample">
" s~~~~~~~~~~~~~~~e
" and self close tag
" <tag id="sample"   />
" s~~~~~~~~~~~~~~~~~e
syntax region jsxTag
      \ start=+<\([^/!?<>="':]\+\)\@=+
      \ skip=+</[^ /!?<>"']\+>+
      \ end=+/\@<!>+
      \ end=+\(/>\)\@=+
      \ contained
      \ contains=jsxTag,jsxFragmentStart,jsxError,jsxTagName,jsxAttrib,jsxEqual,jsxString,jsxEscapeJs,
                \jsxCloseString
      \ keepend
      \ extend

syntax match jsxFragmentStart '<>'

" <tag></tag>
" s~~~~~~~~~e
" and self close tag
" <tag/>
" s~~~~e
" A big start regexp borrowed from https://git.io/vDyxc
syntax region jsxRegionNonFragment
      \ start=+\(\((\|{\|}\|\[\|,\|&&\|||\|?\|:\|=\|=>\|\Wreturn\|^return\|\Wdefault\|^\|>\)\_s*\)\@<=<\_s*\z([_\$a-zA-Z]\(\.\?[\$0-9a-zA-Z]\+\)*\)+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</\_s*\z1>+
      \ end=+/>+
      \ fold
      \ contains=jsxRegion,jsxFragment,jsxCloseString,jsxCloseTag,jsxTag,jsxFragmentStart,jsxComment,jsFuncBlock,
                \@Spell
      \ keepend
      \ extend

" <></>
" s~~~e
syntax region jsxFragment
      \ start=+<>+
      \ skip=+<!--\_.\{-}-->+
      \ end=+</>+
      \ fold
      \ contains=jsxRegion,jsxFragment,jsxCloseString,jsxCloseTag,jsxTag,jsxFragmentStart,jsxComment,jsFuncBlock,
                \@Spell
      \ keepend
      \ extend

" Regular tags and fragments
syntax cluster jsxRegion add=jsxRegionNonFragment add=jsxFragment

" </tag>
" ~~~~~~
syntax match jsxCloseTag
      \ +</\_s*[^/!?<>"']\+>+
      \ contained
      \ contains=jsxNamespace

syntax match jsxCloseString
      \ +<\?/>+
      \ contained

" <!-- -->
" ~~~~~~~~
syntax match jsxComment /<!--\_.\{-}-->/ display

syntax match jsxEntity "&[^; \t]*;" contains=jsxEntityPunct
syntax match jsxEntityPunct contained "[&.;]"

" <tag key={this.props.key}>
"  ~~~
syntax match jsxTagName
    \ +<\_s*\zs[^/!?<>"']\++
    \ contained
    \ nextgroup=jsxAttrib
    \ display

" <tag key={this.props.key}>
"      ~~~
syntax match jsxAttrib
    \ +\_s\<[a-zA-Z_][-0-9a-zA-Z_]*\>\(\_s\+\|\_s*[=/>]\)\@=+
    \ contained
    \ display

" <tag id="sample">
"        ~
" syntax match jsxEqual +=+ display

" <tag id="sample">
"         s~~~~~~e
syntax region jsxString contained start=+"+ end=+"+ contains=jsxEntity,@Spell display

" <tag id='sample'>
"         s~~~~~~e
syntax region jsxString contained start=+'+ end=+'+ contains=jsxEntity,@Spell display

" <tag key={this.props.key}>
"          s~~~~~~~~~~~~~~e
syntax region jsxEscapeJs
    \ contained
    \ contains=jsBlock,jsxRegion,jsxFragment
    \ start=+{+
    \ end=++
    \ extend

syntax match jsxIfOperator +?+
syntax match jsxElseOperator +:+

syntax cluster jsExpression add=jsxRegion add=jsxFragment
syntax cluster javascriptNoReserved add=jsxRegion add=jsxFragment

let s:vim_jsx_pretty_enable_jsx_highlight = get(g:, 'vim_jsx_pretty_enable_jsx_highlight', 1)

if s:vim_jsx_pretty_enable_jsx_highlight == 1
  highlight def link jsxTag Function
  highlight def link jsxFragmentStart Function
  highlight def link jsxTagName Function
  highlight def link jsxString String
  highlight def link jsxNameSpace Function
  highlight def link jsxComment Error
  highlight def link jsxAttrib Type
  highlight def link jsxEscapeJs jsxEscapeJs
  highlight def link jsxCloseTag Identifier
  highlight def link jsxCloseString Identifier
endif

let s:vim_jsx_pretty_colorful_config = get(g:, 'vim_jsx_pretty_colorful_config', 0)

if s:vim_jsx_pretty_colorful_config == 1
  highlight def link jsObjectKey Label
  highlight def link jsArrowFuncArgs Type
  highlight def link jsFuncArgs Type
endif


let b:current_syntax = 'javascript.jsx'

let &cpo = s:jsx_cpo
unlet s:jsx_cpo
