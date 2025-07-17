return {
	{
		"unblevable/quick-scope",
		event = "BufReadPost",
		init = function()
			vim.g.qs_enable = 0
			vim.g.qs_enable_char_list = { "f", "F", "t", "T" }
		end,
		config = function()
			vim.keymap.set("n", "f", "v:lua.QuickScopeWrap('f')", { expr = true, silent = true })
			vim.keymap.set("n", "F", "v:lua.QuickScopeWrap('F')", { expr = true, silent = true })
			vim.keymap.set("n", "t", "v:lua.QuickScopeWrap('t')", { expr = true, silent = true })
			vim.keymap.set("n", "T", "v:lua.QuickScopeWrap('T')", { expr = true, silent = true })

			_G.QuickScopeWrap = function(key)
				if not vim.g.qs_enable then
					vim.cmd("QuickScopeToggle")
				end
				local c = vim.fn.nr2char(vim.fn.getchar())
				vim.schedule(function()
					if vim.g.qs_enable then
						vim.cmd("QuickScopeToggle")
					end
				end)
				return key .. c
			end
		end,
	},
}
