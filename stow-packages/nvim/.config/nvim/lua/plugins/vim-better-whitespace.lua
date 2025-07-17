return {
	-- Whitespace highlighting
	{
		"ntpeters/vim-better-whitespace",
		event = "BufReadPost",
		config = function()
			vim.g.better_whitespace_guicolor = "gray"
		end,
	},
}
