local plugin_map = {
  ["n <space>d"] = ":Defx -session-file="..os.getenv("HOME").."/.vim/defx_session<CR>",

  ["n j"] = "<Plug>(accelerated_jk_gj)",
  ["n k"] = "<Plug>(accelerated_jk_gk)",

  ["n <space>w"] = "<C-w>w",
  ["i jk"] = "<ESC>",
  ["n <space>q"] = ":xa<CR>",
  ["n <space>s"] = ":<C-u>nohl<CR>:w<CR>",

  ["n <space>o"] = "o<ESC>",

  ["n <C-l>"] = ":BufferLineCycleNext<CR>",
  ["n <C-s>"] = ":BufferLineCyclePrev<CR>",
  ["i <C-l>"] = "<C-o>:BufferLineCycleNext<CR>",
  ["i <C-s>"] = "<C-o>:BufferLineCyclePrev<CR>",
  ["n <C-x>"] = ":call ExitTab()<CR>",

  ["n <C-p>"] = ":Telescope find_files theme=dropdown<CR>",

  ["n <space>z"] = ":tab split<CR>",
  ["n <space>f"] = "<Plug>(easymotion-overwin-w)",
  ["v <space>f"] = "<Plug>(easymotion-bd-w)",

  ["v <space>y"] = "\"+y",
  ["v <space>p"] = "\"0p",

  ["n gs"] = ":Gitsign preview_hunk<CR>",
  ["n gco"] = ":Gitsign reset_hunk<CR>",
  ["n <space>gn"] = ":Gitsign next_hunk<CR>",
  ["n <space>gp"] = ":Gitsign prev_hunk<CR>",
}

for key, value in pairs(plugin_map) do
  vim.api.nvim_set_keymap(string.sub(key, 0, 1), string.sub(key, 3), value, {silent = true})
end
