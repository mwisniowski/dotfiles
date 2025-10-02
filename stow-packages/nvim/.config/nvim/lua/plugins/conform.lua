return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		dependencies = {
			"mason-org/mason.nvim",
		},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					markdown = { "prettier" },
					["markdown.mdx"] = { "prettier" },
					lua = { "stylua" },
					sh = { "shfmt" },
					bash = { "shfmt" },
					sql = { "sqlfluff" },
					python = { "ruff_format" },
					["*"] = { "trim_whitespace", "trim_newlines" },
				},
				-- format_on_save = {
				-- 	timeout_ms = 500,
				-- 	lsp_format = "fallback",
				-- },
			})

			-- Ensure formatters are installed via Mason
			local ensure_installed = {
				"prettier",
				"stylua",
				"shfmt",
				"sqlfluff",
				"ruff",
			}

			local mason_registry = require("mason-registry")
			for _, tool in ipairs(ensure_installed) do
				local p = mason_registry.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
}
