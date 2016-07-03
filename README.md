vim-jsx-pretty
=======

Demo
---

- maxmellon/vim-jsx-pretty

![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx-pretty.png)

- mxw/vim-jsx

![](https://raw.githubusercontent.com/MaxMEllon/demos/master/vim-jsx-pretty/vim-jsx.png)

Requirement
---

- [othree/yajs.vim](https://github.com/othree/yajs.vim)

##### Optional

- [othree/javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
- [othree/es.next.syntax.vim](https://github.com/othree/es.next.syntax.vim)
l

Installation
---

### vim-plug [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

your `~/.vimrc`:

    Plug 'othree/yajs.vim'
    Plug 'maxmellon/vim-jsx-pretty'

    " optional
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'othree/es.next.syntax.vim'

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

