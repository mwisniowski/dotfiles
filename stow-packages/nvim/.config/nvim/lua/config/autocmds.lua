-- save files when focus is lost
vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	command = "silent! wa",
})

-- load LSP diagnostics into loclist
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.diagnostic.setloclist({ open = false })
	end,
})
