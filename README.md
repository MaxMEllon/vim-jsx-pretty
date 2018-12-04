vim-jsx-pretty
=======

The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.

Demo
---

- syntax

|vim-jsx-pretty<br />(add colorful config)|vim-jsx-pretty|mxw/vim-jsx|
|---|---|---|
|![vim-jsx-pretty colorful](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty-colorful.png)|![vim-jsx-pretty](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty.png)|![vim-jsx](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx.png)|

- auto indent

![Auto indent demo](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/auto-indent.gif)

- support typescript

![typescript demo](https://user-images.githubusercontent.com/9594376/32855974-beb2432a-ca86-11e7-99a4-85c2630aa5d5.png)

Optional Dependencies
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

- if you want to highlight tsx files.

    ```vim
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    ```

- with: yajs.vim 

    ```vim
    Plug 'othree/yajs.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    ```

- Execute command in vim:

    ```vim
    :so ~/.vimrc
    :PlugInstall
    ```

Configuration
---

|name|default|description|
|---|---|---|
|`g:vim_jsx_pretty_enable_jsx_highlight`|1|jsx highlight flag|
|`g:vim_jsx_pretty_colorful_config`|0|colorful config flag|


If you set `g:vim_jsx_pretty_enable_jsx_highlight`, Disable jsx highlight.
But highlight group is set to jsx syntax. So you should set manual
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
|jsxAttrib| `<tag id="sample">`<br />`_____~~__________`|
|jsxEqual| `<tag id="sample">`<br />`_______~_________`|
|jsxString| `<tag id="sample">`<br />`________~~~~~~~~_`|
|jsxCloseTag| `</tag>`<br />`~~~~~~` |
|jsxCloseString| `<tag />`<br />`_____~~` |
|jsxComponentName| `<Capitals>`<br />`_~~~~~~~~_` |
|jsxDot| `<Parent.Child>`<br />`_______~______` |
|jsxNamespace| `<foo:bar>`<br />`____~____` |
|jsxPunct| `<tag></tag>`<br />`~___~~~___~` |

Inspiration
---

- [vim-jsx](https://github.com/mxw/vim-jsx)

LICENSE
---
[MIT](./LICENSE.txt)
