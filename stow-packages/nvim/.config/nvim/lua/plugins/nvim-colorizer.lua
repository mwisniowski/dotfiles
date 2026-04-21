return {
	{
		"catgoose/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				filetypes = { "css", "tsx" },
				user_default_options = {
					mode = "virtualtext",
					tailwind = true,
					oklch_fn = true,
				},
			})
		end,
	},
}
