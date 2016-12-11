vim-jsx-pretty
=======

Demo
---

- syntax

|vim-jsx-pretty<br />(add colorful config)|vim-jsx-pretty|mxw/vim-jsx|
|---|---|---|
|![vim-jsx-pretty colorful](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty-colorful.png)|![vim-jsx-pretty](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty.png)|![vim-jsx](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx.png)|

- auto indent (**with vim-javascript**)

![Auto indent demo](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/auto-indent.gif)

Requirement
---

- [**pangloss/vim-javascript**](https://github.com/pangloss/vim-javascript)

or

- [othree/yajs.vim](https://github.com/othree/yajs.vim)

Installation
---

### vim-plug [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

your `~/.vimrc`:

- with: vim-javascript (**Recommendation**)

    ```vim
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    ```

- with: yajs.vim

    ```vim
    Plug 'othree/yajs.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    ```

execute command in vim:

    :so ~/.vimrc
    :PlugInstall

Configuration
---

|name|default|description|
|---|---|---|
|`g:vim_jsx_pretty_enable_jsx_highlight`|1|jsx highlight flag|
|`g:vim_jsx_pretty_colorful_config`|0|colorful config flag|


If you set `g:vim_jsx_pretty_enable_jsx_highlight`, Disable jsx highlight.
But highlight group is setten to jsx syntax. So you should set manual
highlight setting.

```vim
let g:vim_jsx_pretty_enable_jsx_highlight = 0 " default 1
```

Colorful style (**vim-javascript only**)

```vim
let g:vim_jsx_pretty_colorful_config = 1 " default 0
```

### Syntax group list

|name|place|
|---|---|
|jsxTag| `<tag id="sample">`<br />`~~~~~~~~~~~~~~~~~`|
|jsxTagName| `<tag id="sample">`<br />`_~~~_____________`|
|jsxjsxAttrib| `<tag id="sample">`<br />`_____~~__________`|
|jsxEqual| `<tag id="sample">`<br />`_______~_________`|
|jsxString| `<tag id="sample">`<br />`________~~~~~~~~_`|
|jsxCloseTag| `</tag> ｜ <tag />`<br />`~~~~~~ ｜  _____~~` |

Inspiration
---

- [vim-jsx](https://github.com/mxw/vim-jsx)

LICENSE
---
[MIT](./LICENSE.txt)
