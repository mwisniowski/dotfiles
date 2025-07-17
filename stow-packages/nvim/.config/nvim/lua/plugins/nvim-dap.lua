return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			require("mason-nvim-dap").setup({ automatic_setup = true })
			require("dapui").setup()
			require("nvim-dap-virtual-text").setup()

			-- Python (debugpy)
			dap.adapters.python = {
				type = "executable",
				command = "python",
				args = { "-m", "debugpy.adapter" },
			}

			-- Node.js (node2)
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = {
					vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
				},
			}
		end,
	},
}
