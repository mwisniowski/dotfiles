return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettier",
					"shfmt",
					"stylua",
					"sqlfluff",
					"eslint_d",
				},
			})

			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Diagnostics
					-- JS/TS/React linting
					require("none-ls.diagnostics.eslint_d"),

					-- JavaScript / TypeScript / React
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "javascript", "typescript", "typescriptreact", "markdown", "markdown.mdx" },
					}),

					-- Shell
					null_ls.builtins.formatting.shfmt,

					-- Lua
					null_ls.builtins.formatting.stylua,

					-- SQL
					null_ls.builtins.formatting.sqlfluff,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						local group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

						vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
						-- Autoformat on save
						-- vim.api.nvim_create_autocmd("BufWritePre", {
						--   group = group,
						--   buffer = bufnr,
						--   callback = function()
						--     vim.lsp.buf.format({ bufnr = bufnr })
						--   end,
						-- })
					end
				end,
			})
		end,
	},
}
