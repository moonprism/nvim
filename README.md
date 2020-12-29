<h1 align="center"> nvim </h1>

IDE 打造计划，自用 neovim 配置

终端字体：[Nerd Fonts Lilex](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Lilex)

* defx session: `~/.vim/defx_session`

* vim session: `~/.vim/sessions/{project_dir}.vim`

## 快捷键

### 基础

Shortcut	|	Action
----------------|-------------------
`,`		|	指令前缀(leader)
`jk`		|	回退命令模式
`<C-l>`	|	关闭高亮搜索
`Space` + `Space`	|	打开文件树
`Space` + `w`	|	=`<C-w>` + `w`，用于快速切换浏览与编辑区
`Space` + `h/j/k/l`	|	=`<C-w>` + `h/j/k/l`，选择分屏
`Space` + `<tab>`|	=`<C-^>`，标签快速切换
`Space` + `t`	|	打开ctags列表 `q` 退出
`<M-y>/<M-p>` | = `"+y/p` (关闭vim后系统粘贴板数据将同步丢失...)
`,` + `p`	|	= `"0p` (寄存器0永远只存复制数据)
`<M-q>`		|	= `:wqa` 全退出
`,` + `r`	|	重命名变量
`,` + `a` | = `0"ay$dd` 配合 `:put a` 修改宏a
`C-g` insert | = `C-o` 插入模式下

### 标签页

* [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)

Shortcut		|	Action
-----------------|-------------------
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

### coc

* 补全

Shortcut	|	Action
--------|-----------
`<M-j>`	| 下一个补全项
`<M-k>`	| 上一个补全项

* [coc-translator](https://github.com/voldikss/coc-translator)

Shortcut	|	Action
--------|-----------
`,` + `t`	|	翻译

### 文件浏览

* [defx](https://github.com/Shougo/defx.nvim)

Shortcut		|	Action
------------|-----------
`md`		|	新建目录
`mf`		|	新建文件
`re`		|	重命名
`yy`		|	复制
`p`			|	粘贴
`dd`		|	删除
`hjkl`	|	浏览，移动选择&打开关闭文件夹
`sp/vsp` | 分屏打开文件

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
`gitn`	|	Next Hunk
`gitp`	|	Prev Hunk

### Others

* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-floaterm](https://github.com/voldikss/vim-floaterm/)
* [caw.vim](https://github.com/tyru/caw.vim)
* [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
* [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)

Shortcut		|	Action
----------------|-----------
`<M-s>`	|	保存并打开终端
`,` + `cc`	|	注释
`<C-n>`	|	选中下一个相同单词，类似 vs code 中的`Ctrl` + `d`
`,` + `m`	|	预览markdown

---

![](https://raw.githubusercontent.com/moonprism/cdn/master/image/nvim-a.png)

![](https://raw.githubusercontent.com/moonprism/cdn/master/image/nvim-b.png)

![](https://raw.githubusercontent.com/moonprism/cdn/master/image/nvim-c.png)
