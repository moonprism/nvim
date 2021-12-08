#!/bin/bash

# 依赖 neovim0.6+|python3.6.1+

brew install ctags fzf

pip3 install --user pynvim

mkdir -p ~/.config/nvim
ln -s ${PWD}/init.vim ~/.config/nvim/init.vim
ln -s ${PWD}/coc-settings.json ~/.config/nvim/coc-settings.json
