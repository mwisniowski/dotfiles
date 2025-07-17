return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED: setup harpoon
		harpoon:setup()

		-- Add telescope extension if available
		local has_telescope, telescope = pcall(require, "telescope")
		if has_telescope then
			telescope.load_extension("harpoon")
		end

		-- UI enhancements
		harpoon:extend({
			UI_CREATE = function(cx)
				-- Add keymaps for opening files in splits/tabs from harpoon menu
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr, desc = "Open in vertical split" })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr, desc = "Open in horizontal split" })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr, desc = "Open in new tab" })
			end,
		})

		-- Highlight current file in harpoon menu
		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
	end,
}
