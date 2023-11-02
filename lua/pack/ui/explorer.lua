local filter_entries = {
  ".git",
  "vendor",
  "node_modules",
  "composer.lock",
  "package-lock.json",
  "go.sum",
}

return {
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    opts = {
      windows = {
        preview = false,
        width_focus = 40,
        width_nofocus = 15,
        width_preview = 25,
      },
      content = {
        filter = function(fs_entry)
          for _, v in pairs(filter_entries) do
            if v == fs_entry.name then
              return false
            end
          end
          return true
        end,
      },
      mappings = {
        go_in_plus = "l",
      },
    },
    keys = {
      {
        "<leader>d",
        function()
          require("mini.files").open()
        end,
      },
    },
  },
}
