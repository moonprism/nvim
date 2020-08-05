# :heart: nvim

![](https://kicoe-blog.oss-cn-shanghai.aliyuncs.com/eoyjbdQVQICwhKIwepkg.jpg)

vim ide 打造计划，自用 nvim 配置

推荐字体：[Space Mono](https://fonts.google.com/specimen/Space+Mono)

## 快捷键

### 基础

Shortcut		|	Action
------------|-------------------
`,`			|	指令前缀(leader)
`jk`		|	回退命令模式
`backspace`	|	关闭高亮搜索
`Space` + `w`	|	=`Ctrl` + `ww`，用于快速切换浏览与编辑区

### 标签页

[airline extensions tabline](https://github.com/vim-airline/vim-airline)

Shortcut			|	Action
----------------|-------------------
`Space` + `[0-9]`	|	跳转指定标签
`Space` + `q`		|	关闭标签
`Ctrl` + `h`		|	上一个标签
`Ctrl` + `l`		|	下一个标签

### 跳转

[coc](https://github.com/neoclide/coc.nvim)

Shortcut	|	Action
--------|-----------
`gd`	| 打开可跳转的定义列表
`gy`	| 打开可跳转的引用列表

### 文件浏览

[defx](https://github.com/Shougo/defx.nvim)

Shortcut		|	Action
------------|-----------
`-`			|	在左侧分屏打开文件树
`nd`		|	新建目录
`nf`		|	新建文件
`yy`		|	复制
`p`			|	粘贴
`dd`		|	删除
`hjkl`	|	浏览，移动选择&打开关闭文件夹
`t`			|	在新标签中打开文件

### 搜索

[fzf](https://github.com/junegunn/fzf.vim)

Shortcut	|	Action
--------|-----------
`Ctrl` + `f`	|	搜索buffer区指定词
`Ctrl` + `p`	|	文件搜索
`Ctrl` + `g`  | 全局搜索

### Git

[vim-gitgutter](https://github.com/airblade/vim-gitgutter)

Shortcut	|	Action
--------|-----------
`ghs`	|	save: 存储代码块, ga
`ghu`	|	undo: 重做, gco
`ghp`	|	preview: 预览, gs

### Others

Shortcut	|	Action
--------|-----------
`,cc`	|	注释, nerdcommenter
`,t`	|	翻译, [coc-translator](https://github.com/voldikss/coc-translator)
