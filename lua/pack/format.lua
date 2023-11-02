return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			-- format_on_save = {
			-- 	timeout_ms = 500,
			-- 	lsp_fallback = true,
			-- },
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			mappings = {
				comment_line = "<Leader>c",
				comment_visual = "<Leader>c",
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		opts = {},
	},
}
