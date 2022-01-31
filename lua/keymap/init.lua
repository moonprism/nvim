local plugin_map = {
  ["n <space>d"] = ":NvimTreeToggle<CR>",

  ["n j"] = "<Plug>(accelerated_jk_gj)",
  ["n k"] = "<Plug>(accelerated_jk_gk)",

  ["n <space>w"] = "<C-w>w",
  ["i jk"]       = "<ESC>",
  ["n <space>q"] = ":qa<CR>",
  ["n <C-[>"]    = ":<C-u>nohl<CR>",

  ["n <space>o"] = "o<ESC>",

  ["n <C-l>"] = ":BufferLineCycleNext<CR>",
  ["n <C-s>"] = ":BufferLineCyclePrev<CR>",
  ["i <C-l>"] = "<C-o>:BufferLineCycleNext<CR>",
  ["i <C-s>"] = "<C-o>:BufferLineCyclePrev<CR>",
  ["n <C-x>"] = ":call ExitTab()<CR>",

  ["n <C-p>"] = ":Telescope find_files<CR>",
  ["n <C-g>"] = ":Telescope live_grep<CR>",
  ["v <C-g>"] = ":Telescope grep_string<CR>",

  ["n <space>z"] = ":tab split<CR>",
  ["n <space>f"] = "<Plug>(easymotion-overwin-w)",
  ["v <space>f"] = "<Plug>(easymotion-bd-w)",

  ["v <space>y"] = "\"+y",
  ["v <space>p"] = "\"0p",

  ["n gs"]        = ":Gitsign preview_hunk<CR>",
  ["n gco"]       = ":Gitsign reset_hunk<CR>",
  ["n <space>gn"] = ":Gitsign next_hunk<CR>",
  ["n <space>gp"] = ":Gitsign prev_hunk<CR>",

  ["x ga"] = "<Plug>(EasyAlign)",
  ["n ga"] = "<Plug>(EasyAlign)",

  ["n gd"] = "<Plug>(coc-definition)",
  ["n gr"] = "<Plug>(coc-references)",

  ["n <space>c"] = "<Plug>(caw:hatpos:toggle)",
  ["x <space>c"] = "<Plug>(caw:hatpos:toggle)",

  ["n <C-q>"] = "<Plug>Translate",
  ["x <C-q>"] = "<Plug>TranslateV",
}

for key, value in pairs(plugin_map) do
  vim.api.nvim_set_keymap(string.sub(key, 0, 1), string.sub(key, 3), value, {silent = true})
end
