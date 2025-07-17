return {
	{
		"rhysd/conflict-marker.vim",
		event = "BufReadPost",
		config = function()
			vim.g.conflict_marker_enable_mappings = 0
		end,
	},
}
