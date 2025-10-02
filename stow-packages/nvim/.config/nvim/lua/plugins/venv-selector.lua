return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		keys = {
			{ "<leader>v", "<cmd>VenvSelect<cr>", desc = "Select Python virtual environment" },
		},
		opts = {
			options = {
				activate_venv_in_terminal = true,
				set_environment_variables = true,
				notify_user_on_venv_activation = false,
			},
			search = {
				system = {
					command = "which python",
				},
			},
		},
	},
}
