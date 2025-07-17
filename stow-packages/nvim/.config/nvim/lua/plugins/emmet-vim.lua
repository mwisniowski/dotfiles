return {
	-- Emmet for JSX/HTML
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
		init = function()
			vim.g.user_emmet_mode = "a"
			vim.g.user_emmet_settings = {
				javascript = { extends = "jsx,tsx" },
			}
		end,
	},
}
