vim-jsx-pretty
=======

Demo
---

- syntax

|vim-jsx-pretty<br />(add colorful config)|vim-jsx-pretty|mxw/vim-jsx|
|---|---|---|
|![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty-colorful.png)|![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty.png)|![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx.png)|

- auto indent (**with vim-javascript**)

![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/auto-indent.gif)

Requirement
---

- [**pangloss/vim-javascript**](https://github.com/pangloss/vim-javascript)

or

- [othree/yajs.vim](https://github.com/othree/yajs.vim)

##### Optional

- [othree/javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
- [othree/es.next.syntax.vim](https://github.com/othree/es.next.syntax.vim)
l

Installation
---

### vim-plug [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

your `~/.vimrc`:

- with: vim-javascript (**Recommendation**)

    ```vim
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'

    " optional
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'othree/es.next.syntax.vim'
    ```

- with: yajs.vim

    ```vim
    Plug 'othree/yajs.vim'
    Plug 'maxmellon/vim-jsx-pretty'

    " optional
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'othree/es.next.syntax.vim'
    ```

execute command in vim:

    :so ~/.vimrc
    :PlugInstall

Configuration
---

|name|default|detail|
|---|---|---|
|`g:vim_jsx_pretty_enable_jsx_highlight`|1|jsx highlight flag|
|`g:vim_jsx_pretty_colorful_config`|0|colorful config flag|


- Disable jsx highlight (but highlight group is set to jsx syntax. so this plugin expect to add highlight settings in case of disabled.)

    ```vim
    let g:vim_jsx_pretty_enable_jsx_highlight = 1 " default 1
    ```

- Colorful style (**vim-javascript only**)

    ```vim
    let g:vim_jsx_pretty_colorful_config = 1 " default 0
    ```

### Highlight group list

|name|place|
|---|---|
|jsxTag| `<tag id="sample">`<br />`~~~~~~~~~~~~~~~~~`|
|jsxTagName| `<tag id="sample">`<br />`_~~~_____________`|
|jsxEqual| `<tag id="sample">`<br />`_______~_________`|
|jsxString| `<tag id="sample">`<br />`________~~~~~~~~_`|
|jsxCloseTag| `</tag> ｜ <tag />`<br />`~~~~~~ ｜  _____~~` |

LICENSE
---
[MIT](./LICENSE.txt)
