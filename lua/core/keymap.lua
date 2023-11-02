local keymaps = {
  ["i jk"] = "<ESC>",
  ["n <C-[>"] = ":<C-u>nohl<CR>",

  ["n <Leader>w"] = "<Cmd>wincmd w<CR>",
  ["n <Leader>h"] = "<Cmd>wincmd h<CR>",
  ["n <Leader>j"] = "<Cmd>wincmd j<CR>",
  ["n <Leader>k"] = "<Cmd>wincmd k<CR>",
  ["n <Leader>l"] = "<Cmd>wincmd l<CR>",

  ["v <Leader>y"] = '"+y',
  ["v <Leader>p"] = '"0p',
}

for k, v in pairs(keymaps) do
  vim.keymap.set(k:sub(0, 1), k:sub(3), v, { silent = true })
end

for i = 1, 9 do
  vim.keymap.set("n", string.format("<Leader>%d", i), function()
    require("bufferline").go_to(i)
  end, { silent = true })
end
