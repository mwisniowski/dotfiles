return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			-- Mason setup
			require("mason").setup()

			-- Mason-lspconfig setup
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"cssls",
					"dockerls",
					"html",
					"jsonls",
					"lua_ls",
					"basedpyright",
					"ruff",
					"sqlls",
					"yamlls",
          "tailwindcss",
          "ts_ls"
				},
				automatic_installation = true,
				automatic_enable = true,
			})

			-- Disable hover for ruff in favor of basedpyright
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == 'ruff' then
						-- Disable hover in favor of basedpyright
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = 'LSP: Disable hover capability from Ruff',
			})
		end,
	},
}
