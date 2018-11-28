" expects a region 'jsxEscapeJs' to be defined with start=+{+ and js or ts-specifics inside
function! jsx_pretty#common()

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
        \ contains=jsxTag,jsxError,jsxStartTag,jsxAttrib,jsxEqual,jsxString,jsxEscapeJs,
                  \jsxCloseString,jsComment,typescriptLineComment,typescriptComment,
        \ keepend
        \ extend

  " match fragment start tag <>
  syntax match jsxTag
        \ +<\_s*>+
        \ contained

  " <tag></tag>
  " s~~~~~~~~~e
  " and self close tag
  " <tag/>
  " s~~~~e
  " A big start regexp borrowed from https://git.io/vDyxc
  syntax region jsxRegion
        \ start=+\(\((\|{\|}\|\[\|,\|&&\|||\|?\|:\|=\|=>\|\Wreturn\|^return\|\Wdefault\|^\|>\|<[^/]*>\_s*.\+\)\_s*\)\@<=<\_s*\(>\|\z([_\$a-zA-Z]\(\.\?[\$0-9a-zA-Z]\+\)*\)\)+
        \ skip=+<!--\_.\{-}-->+
        \ end=+</\_s*\z1>+
        \ end=+/\_s*>+
        \ fold
        \ contains=jsxRegion,jsxCloseString,jsxCloseTag,jsxTag,jsxComment,jsxEscapeJs,
                  \@Spell
        \ keepend
        \ extend

  " <!-- -->
  " ~~~~~~~~
  syntax match jsxComment /<!--\_.\{-}-->/ display

  syntax match jsxEntity "&[^; \t]*;" contains=jsxEntityPunct
  syntax match jsxEntityPunct contained "[&.;]"
  syntax match jsxDot +\.+ contained display

  " <MyComponent ...>
  "  ~~~~~~~~~~~
  " NOT
  "  <someCamel ...>
  "       ~~~~~
  syntax match jsxComponentName
        \ +\<[A-Z][a-zA-Z0-9\$]\+\>+
        \ contained
        \ display

  " <tag key={this.props.key}>
  "  ~~~
  syntax match jsxTagName
        \ +[-a-zA-Z0-9_\.\$]\++
        \ contained
        \ contains=jsxComponentName,jsxDot
        \ display

  " <tag key={this.props.key}>
  " ~~~~
  syntax match jsxStartTag
        \ +\(<\_s*\)\@<=[-a-zA-Z0-9_\.\$]\++
        \ contained
        \ contains=jsxTagName
        \ nextgroup=jsxAttrib
        \ display
    
  " </tag>
  " ~~~~~~
  syntax match jsxCloseTag
        \ +<\_s*/\_s*[^/!?<>"']\+>+
        \ contained
        \ contains=jsxTagName

  " match fragment close tag </>
  syntax match jsxCloseTag
        \ +<\_s*/\_s*>+
        \ contained

  syntax match jsxCloseString
        \ +/\_s*>+
        \ contained

  " <tag key={this.props.key}>
  "      ~~~
  syntax match jsxAttrib
        \ +\_s\<[a-zA-Z_][-0-9a-zA-Z_]*\>\(\_s\+\|\_s*[=/>]\)\@=+
        \ contained
        \ display

  " <tag id="sample">
  "        ~
  syntax match jsxEqual +=+ contained display

  " <tag id="sample">
  "         s~~~~~~e
  syntax region jsxString contained start=+"+ end=+"+ contains=jsxEntity,@Spell display

  " <tag id='sample'>
  "         s~~~~~~e
  syntax region jsxString contained start=+'+ end=+'+ contains=jsxEntity,@Spell display

  syntax match jsxIfOperator +?+
  syntax match jsxElseOperator +:+

  let s:vim_jsx_pretty_enable_jsx_highlight = get(g:, 'vim_jsx_pretty_enable_jsx_highlight', 1)

  if s:vim_jsx_pretty_enable_jsx_highlight == 1
    highlight def link jsxTag Comment
    highlight def link jsxCloseTag jsxTag
    highlight def link jsxCloseString jsxCloseTag
    highlight def link jsxTagName Identifier
    highlight def link jsxComponentName Function
    highlight def link jsxAttrib Type
    highlight def link jsxEqual Operator
    highlight def link jsxDot Operator
    highlight def link jsxString String
    highlight def link jsxComment Error
    highlight def link jsxEscapeJs jsxEscapeJs
  endif

  let s:vim_jsx_pretty_colorful_config = get(g:, 'vim_jsx_pretty_colorful_config', 0)

  if s:vim_jsx_pretty_colorful_config == 1
    highlight def link jsObjectKey Label
    highlight def link jsArrowFuncArgs Type
    highlight def link jsFuncArgs Type
  endif

endfunction
