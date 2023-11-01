local keymaps = {
  ["n <space>d"] = function()
    require("nvim-tree.api").tree.toggle()
  end,

  ["i jk"]       = "<ESC>",
  ["n <C-[>"]    = ":<C-u>nohl<CR>",

  ["n <space>o"] = "o<ESC>",

  ["n <Leader>w"] = "<cmd>wincmd w<cr>",
  ["n <Leader>h"] = "<cmd>wincmd h<cr>",
  ["n <Leader>j"] = "<cmd>wincmd j<cr>",
  ["n <Leader>k"] = "<cmd>wincmd k<cr>",
  ["n <Leader>l"] = "<cmd>wincmd l<cr>",

  ["n <C-l>"] = ":BufferLineCycleNext<CR>",
  ["n <C-s>"] = ":BufferLineCyclePrev<CR>",
  ["i <C-l>"] = "<C-o>:BufferLineCycleNext<CR>",
  ["i <C-s>"] = "<C-o>:BufferLineCyclePrev<CR>",

  ["n <C-x>"] = function()
    local n = vim.fn.buffer_number()
    vim.cmd.bprevious()
    vim.cmd.bdelete(n)
  end,

  ["n <Leader>sl"] = function()
    require("persistence").load()
  end,

  ["n <leader>fe"] = function()
    require("neo-tree.command").execute({ toggle = true })
  end,

  ["n <C-p>"] = "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",

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

  ["n gl"] = function()
    require("gitsigns").blame_line()
  end,
}

for k, v in pairs(keymaps) do
  vim.keymap.set(k:sub(0, 1), k:sub(3), v, {silent = true})
end

for i=1,9 do
  vim.keymap.set("n", string.format("<space>%d", i), function ()
    require("bufferline").go_to(i)
  end, {silent = true})
end
