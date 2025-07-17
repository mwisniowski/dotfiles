return {
	-- lualine: modern statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox",
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_c = {
            function ()
              local filename = vim.fn.expand('%:~:.')
              if filename == '' then return '' end
              return vim.fn.pathshorten(filename)
            end
					},
				},
			})
		end,
	},
}
