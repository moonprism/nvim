return {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment = '<Leader>c',
        -- Toggle comment on current line
        comment_line = '<Leader>c',
        -- Toggle comment on visual selection
        comment_visual = '<Leader>c',
        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = '<Leader>c',
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = '<Leader>sa',            -- Add surrounding in Normal and Visual modes
        delete = '<Leader>sd',         -- Delete surrounding
        find = '<Leader>sf',           -- Find surrounding (to the right)
        find_left = '<Leader>sF',      -- Find surrounding (to the left)
        highlight = '<Leader>sh',      -- Highlight surrounding
        replace = '<Leader>sr',        -- Replace surrounding
        update_n_lines = '<Leader>sn', -- Update `n_lines`

        suffix_last = 'l',             -- Suffix to search with "prev" method
        suffix_next = 'n',             -- Suffix to search with "next" method
      },
    },
  }
}
