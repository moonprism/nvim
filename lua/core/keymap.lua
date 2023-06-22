local keymaps = {
  ["n <space>d"] = function()
    require("nvim-tree.api").tree.toggle()
  end,

  ["n j"] = "<Plug>(accelerated_jk_gj)",
  ["n k"] = "<Plug>(accelerated_jk_gk)",

  ["n <space>w"] = "<C-w>w",
  ["i jk"]       = "<ESC>",
  ["n <C-[>"]    = ":<C-u>nohl<CR>",

  ["n <space>o"] = "o<ESC>",

  ["n <C-l>"] = ":BufferLineCycleNext<CR>",
  ["n <C-s>"] = ":BufferLineCyclePrev<CR>",
  ["i <C-l>"] = "<C-o>:BufferLineCycleNext<CR>",
  ["i <C-s>"] = "<C-o>:BufferLineCyclePrev<CR>",

  ["n <C-x>"] = function()
    local n = vim.fn.buffer_number()
    vim.cmd.bprevious()
    vim.cmd.bdelete(n)
  end,

  ["n <C-p>"] = ":Telescope find_files<CR>",
  ["n <C-g>"] = ":Telescope live_grep<CR>",
  ["v <C-g>"] = ":Telescope grep_string<CR>",

  ["n <space>f"] = "<Plug>(easymotion-overwin-w)",
  ["v <space>f"] = "<Plug>(easymotion-bd-w)",

  ["v <space>y"] = "\"+y",
  ["v <space>p"] = "\"0p",

  ["n gs"]  = ":Gitsign preview_hunk<CR>",
  ["n gco"] = ":Gitsign reset_hunk<CR>",
  ["n [g"]  = ":Gitsign prev_hunk<CR>",
  ["n ]g"]  = ":Gitsign next_hunk<CR>",

  ["n ga"] = "<Plug>(EasyAlign)",
  ["x ga"] = "<Plug>(EasyAlign)",
}

for k, v in pairs(keymaps) do
  vim.keymap.set(k:sub(0, 1), k:sub(3), v, {silent = true})
end
