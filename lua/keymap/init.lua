local n_map = {
  ["<space>x"] = ":NvimTreeToggle<CR>"
}

for key, value in pairs(n_map) do
  vim.api.nvim_set_keymap('n', key, value, {})
end
