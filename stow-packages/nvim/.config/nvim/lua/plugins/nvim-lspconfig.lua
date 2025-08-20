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
					"ts_ls",
				},
				automatic_installation = true,
				automatic_enable = {
					exclude = { "basedpyright" },
				},
			})

			-- Configure basedpyright for uv environments
			local lspconfig = require("lspconfig")
			lspconfig.basedpyright.setup({
				before_init = function(_, config)
					-- Try to find uv python interpreter
					local handle = io.popen("uv python find 2>/dev/null")
					if handle then
						local result = handle:read("*a")
						handle:close()
						if result and result ~= "" then
							config.settings.python = config.settings.python or {}
							config.settings.python.pythonPath = vim.trim(result)
						end
					end
				end,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			-- Disable hover for ruff in favor of basedpyright
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == "ruff" then
						-- Disable hover in favor of basedpyright
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = "LSP: Disable hover capability from Ruff",
			})
		end,
	},
}
