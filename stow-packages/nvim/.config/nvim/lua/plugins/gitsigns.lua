return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				on_attach = function(bufnr)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end
					map("n", "]h", require("gitsigns").next_hunk, "Next hunk")
					map("n", "[h", require("gitsigns").prev_hunk, "Prev hunk")
					map("n", "<leader>hs", require("gitsigns").stage_hunk, "Stage hunk")
					map("n", "<leader>hr", require("gitsigns").reset_hunk, "Reset hunk")
					map("n", "<leader>hS", require("gitsigns").stage_buffer, "Stage buffer")
					map("n", "<leader>hu", require("gitsigns").undo_stage_hunk, "Undo stage hunk")
					map("n", "<leader>hp", require("gitsigns").preview_hunk, "Preview hunk")
				end,
			})
		end,
	},
}
