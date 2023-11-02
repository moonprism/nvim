return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Actions
        map("n", "]g", gs.next_hunk)
        map("n", "[g", gs.prev_hunk)

        map("n", "gco", gs.reset_hunk)
        map("n", "gs", gs.preview_hunk)

        map("n", "<Leader>gl", gs.blame_line)
        map("n", "<Leader>ga", gs.stage_hunk)
        map("v", "<Leader>ga", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<Leader>gr", gs.undo_stage_hunk)
        map("v", "<Leader>gr", function()
          gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
      end,
    },
  },
}
