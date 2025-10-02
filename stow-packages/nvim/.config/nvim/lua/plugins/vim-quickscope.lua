return {
	{
		"unblevable/quick-scope",
		event = "BufReadPost",
		init = function()
			vim.g.qs_enable = 0
			vim.g.qs_enable_char_list = { "f", "F", "t", "T" }
		end,
		config = function()
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
