<h1 align="center"> :heart: nvim </h1>

![](https://kicoe-blog.oss-cn-shanghai.aliyuncs.com/JavehjbfLENBoKwZIgFa.jpg)

IDE 打造计划，自用 neovim 配置

终端字体：[Nerd Fonts Lilex](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Lilex)

* defx session: `~/.vim/defx_session`
* vim session: `~/.vim/sessions/*.vim`

## 快捷键

### 基础

Shortcut	|	Action
----------------|-------------------
`,`		|	指令前缀(leader)
`jk`		|	回退命令模式
`Backspace`	|	关闭高亮搜索
`Space` + `Space`	|	打开文件树
`Space` + `w`	|	=`<C-w>` + `w`，用于快速切换浏览与编辑区
`Space` + `<tab>`|	=`<C-^>`，标签快速切换
`,` + `r`	|	重命名变量
`Space` + `t`	|	于右侧打开ctags列表
`;` + `p`	|	= `"0p` (寄存器0永远只存复制数据)
`,` + `y/p` | = `"+y/p` 系统剪贴板

### 标签页

* [airline_extensions_tabline](https://github.com/vim-airline/vim-airline)

Shortcut		|	Action
------------------------|-------------------
`Space` + `[1-9]`	|	跳转指定标签
`<M-x>`		|	关闭标签
`<M-h>`		|	上一个标签
`<M-l>`		|	下一个标签

### 跳转

* [vim-easymotion](https://github.com/easymotion/vim-easymotion)

Shortcut	|	Action
--------|-----------
`;s`	| 双向搜索跳转
`;w`	| 向前跳转
`;b`	| 向后跳转

* [coc](https://github.com/neoclide/coc.nvim)

Shortcut	|	Action
--------|-----------
`gd`	| 跳转定义
`gr`	| 打开可跳转的引用列表

### 文件浏览

* [defx](https://github.com/Shougo/defx.nvim)

Shortcut		|	Action
------------|-----------
`nd`		|	新建目录
`nf`		|	新建文件
`re`		|	重命名
`yy`		|	复制
`p`			|	粘贴
`dd`		|	删除
`hjkl`	|	浏览，移动选择&打开关闭文件夹
`i` | 分屏打开文件

### 搜索

* [fzf](https://github.com/junegunn/fzf.vim)

Shortcut	|	Action
--------|-----------
`<C-f>`	|	搜索buffer区指定词
`<C-p>`	|	文件搜索
`<C-g>`	|	全局搜索(选中模式下)

### Git

* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)

Shortcut	|	Action
--------|-----------
`ga`	|	save: 存储代码块
`gco`	|	undo: 重做
`gs`	|	preview: 预览（可惜gd习惯用来跳转了）

### Others

* [vim-surround](https://github.com/tpope/vim-surround)


Shortcut	|	Action
----------------|-----------
`ysiw"`		|	添加`""`包含当前字符串
`cs"'`		|	替换包含字符为`''`
`ds'`		|	删除包含字符`''`

* [vim-floaterm](https://github.com/voldikss/vim-floaterm/)
* [caw.vim](https://github.com/tyru/caw.vim)
* [coc-translator](https://github.com/voldikss/coc-translator)
* [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
* [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)

Shortcut		|	Action
----------------|-----------
`<C-t>`	|	终端
`,` + `cc`	|	注释
`,` + `t`	|	翻译
`<C-n>`	|	选中下一个相同单词，类似 vs code 中的`Ctrl` + `d`
`,` + `m`	|	预览markdown

## 命令

Command		|	Action
----------------|-----------
`Q`		|	=`:wqa`,用这个不会有session问题
