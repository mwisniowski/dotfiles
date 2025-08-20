vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.splitbelow = false
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 300

vim.o.winborder = "rounded"
vim.diagnostic.config({
  virtual_text = false,
	virtual_lines = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
})
