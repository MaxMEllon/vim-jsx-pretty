function! jsx_pretty#common()

  " <tag id="sample">
  " ~~~~~~~~~~~~~~~~~
  " and self close tag
  " <tag id="sample"   />
  " ~~~~~~~~~~~~~~~~~~~
  syntax region jsxTag
        \ start=+<+
        \ matchgroup=jsxPunct
        \ end=+>+
        \ matchgroup=NONE
        \ end=+\(/\_s*>\)\@=+
        \ contained
        \ contains=jsxOpenTag,jsxEscapeJs,jsxAttrib,jsComment,@javascriptComments,javaScriptLineComment,javaScriptComment,typescriptLineComment,typescriptComment
        \ keepend
        \ extend

  " <tag></tag>
  " ~~~~~~~~~~~
  " and fragment
  " <></>
  " ~~~~~
  " and self close tag
  " <tag />
  " ~~~~~~~
  syntax region jsxElement
        \ start=+<\_s*\(>\|\z(\<[-:_\.\$0-9A-Za-z]\+\>\)\)+
        \ end=+/\_s*>+
        \ end=+<\_s*/\_s*\z1\_s*>+
        \ contains=jsxElement,jsxEscapeJs,jsxTag,jsxCloseString,jsxCloseTag,@Spell
        \ keepend
        \ extend
        \ contained
        \ fold

  " detect jsx region
  syntax region jsxRegion
        \ start=+\(\(\_[([,?:=+\-*/<>{}]\|&&\|||\|=>\|\<return\|\<default\|\<await\|\<yield\)\_s*\)\@<=<\_s*\(>\|\z(\<[_\$A-Za-z][-:_\.\$0-9A-Za-z]*\>\)\(\_s*\([-+*)\]}&|?]\|/\(\_s*>\)\@!\)\)\@!\)+
        \ end=++
        \ contains=jsxElement

  " <tag key={this.props.key}>
  "          ~~~~~~~~~~~~~~~~
  syntax region jsxEscapeJs
        \ start=+{+
        \ end=++
        \ extend
        \ contained
        \ contains=jsBlock,javascriptBlock,javaScriptBlockBuildIn,typescriptBlock

  " <tag key={this.props.key}>
  " ~~~~
  " and fragment start tag
  " <>
  " ~~
  syntax region jsxOpenTag
        \ matchgroup=jsxPunct
        \ start=+<+
        \ end='>'
        \ matchgroup=NONE
        \ end=+\>+
        \ contained
        \ contains=jsxTagName
        \ nextgroup=jsxAttrib
        \ skipwhite
        \ skipempty

  " <foo.bar>
  "     ~
  syntax match jsxDot +\.+ contained display

  " <foo:bar>
  "     ~
  syntax match jsxNamespace +:+ contained display

  " <tag id="sample">
  "        ~
  syntax match jsxEqual +=+ contained display nextgroup=jsxString,jsxEscapeJs,jsxRegion skipwhite

  " <tag />
  "      ~~
  syntax match jsxCloseString +/\_s*>+ contained 

  " </tag>
  " ~~~~~~
  " and fragment close tag
  " </>
  " ~~~
  syntax region jsxCloseTag
        \ matchgroup=jsxPunct
        \ start=+<\_s*/+
        \ end=+>+
        \ contained
        \ contains=jsxTagName

  " <tag key={this.props.key}>
  "      ~~~
  syntax match jsxAttrib
        \ +\<[-A-Za-z_][-:_\$0-9A-Za-z]*\>+
        \ contained
        \ nextgroup=jsxEqual
        \ skipwhite
        \ skipempty
        \ display

  " <MyComponent ...>
  "  ~~~~~~~~~~~
  " NOT
  " <someCamel ...>
  "      ~~~~~
  syntax match jsxComponentName
        \ +\<[A-Z][\$0-9A-Za-z]\+\>+
        \ contained
        \ display

  " <tag key={this.props.key}>
  "  ~~~
  syntax match jsxTagName
        \ +\<[-:_\.\$0-9A-Za-z]\+\>+
        \ contained
        \ contains=jsxComponentName,jsxDot,jsxNamespace
        \ nextgroup=jsxAttrib
        \ skipempty
        \ skipwhite
        \ display

  " <tag id="sample">
  "         ~~~~~~~~
  " and 
  " <tag id='sample'>
  "         ~~~~~~~~
  syntax region jsxString start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1+ contained contains=@Spell display

  let s:vim_jsx_pretty_enable_jsx_highlight = get(g:, 'vim_jsx_pretty_enable_jsx_highlight', 1)

  if s:vim_jsx_pretty_enable_jsx_highlight == 1
    highlight def link jsxTag Function
    highlight def link jsxTagName Identifier
    highlight def link jsxComponentName Function
    highlight def link jsxAttrib Type
    highlight def link jsxEqual Operator
    highlight def link jsxString String
    highlight def link jsxDot Operator
    highlight def link jsxNamespace Operator
    highlight def link jsxCloseString Comment
    highlight def link jsxPunct jsxCloseString
  endif

  let s:vim_jsx_pretty_colorful_config = get(g:, 'vim_jsx_pretty_colorful_config', 0)

  if s:vim_jsx_pretty_colorful_config == 1
    highlight def link jsObjectKey Label
    highlight def link jsArrowFuncArgs Type
    highlight def link jsFuncArgs Type
  endif

endfunction
