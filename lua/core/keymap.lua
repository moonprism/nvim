local function map(mode, l, r, opts)
  vim.keymap.set(mode, l, r, opts)
end

map("i", "jk", '<ESC>')

map({ "n", "i" }, "<ESC>", "<Cmd>nohl<CR><ESC>")

map("n", "<Leader>w", "<Cmd>wincmd w<CR>")
map("n", "<Leader>h", "<Cmd>wincmd h<CR>")
map("n", "<Leader>j", "<Cmd>wincmd j<CR>")
map("n", "<Leader>k", "<Cmd>wincmd k<CR>")
map("n", "<Leader>l", "<Cmd>wincmd l<CR>")

map({ "v", "n" }, "<Leader>y", '"+y')
map("n", "<Leader>p", '"+p')

for i = 1, 9 do
  map("n", string.format("<Leader>%d", i), function()
    require("bufferline").go_to(i)
  end, { silent = true })
end
