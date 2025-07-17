return {
	-- Highlight and jump through TODO/FIXME/NOTE
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			gui_style = {
				fg = "NONE",
				bg = "NONE",
			},
		},
		event = "BufReadPost",
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next TODO comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Prev TODO comment",
			},
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search TODOs (Telescope)" },
		},
	},
}
