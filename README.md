vim-jsx-pretty
=======

Demo
---

|maxmellon/vim-jsx-pretty|mxw/vim-jsx|
|---|---|
|![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty.png)|![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx.png)|

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

- Colorful style (**vim-javascript only**)

    ```vim
    augroup VimJsxPretty
      autocmd!
      autocmd VimEnter * highlight jsNoise ctermfg=197 cterm=bold guifg=#F92672 gui=bold
      autocmd VimEnter * highlight jsArrowFunction ctermfg=197 cterm=bold guifg=#F92672 gui=bold
      autocmd VimEnter * highlight jsObjectBraces ctermfg=197 cterm=bold guifg=#F92672 gui=bold
      autocmd VimEnter * highlight jsFuncBraces ctermfg=118 guifg=#A6E22E
      autocmd VimEnter * highlight jsFuncCall ctermfg=228 guifg=#A6A5AE
      autocmd VimEnter * highlight jsBrackets cterm=bold gui=bold
    augroup END
    ```

execute command in vim:

    :so ~/.vimrc
    :PlugInstall

Manual Installation
---

```
mkdir -p ~/.vim/after/syntax/javascript
wget https://raw.githubusercontent.com/MaxMEllon/vim-jsx-pretty/master/after/syntax/javascript.vim
cp javascript.vim ~/.vim/after/syntax/javascript/javascript.vim
```

LICENSE
---
[MIT](./LICENSE.txt)
