-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 35 },
				renderer = {
					highlight_git = true,
					highlight_opened_files = "name",
				},
				filters = {
					dotfiles = false,
				},
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
			})
		end,
	},
}
