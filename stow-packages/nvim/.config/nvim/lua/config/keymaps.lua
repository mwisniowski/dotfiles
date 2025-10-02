-- KEYMAPS --------------------------------------------------------------
-- Note: <leader> is set in init.lua

local nmap = function(key, command, opts)
	vim.keymap.set("n", key, command, opts)
end

-- ========== GENERAL ========== --

nmap("<CR>", ":noh<CR><CR>", { desc = "Clear search highlight", silent = true })
nmap("<leader>h", ":noh<CR><CR>", { desc = "Clear search highlight", silent = true })

nmap("<leader>q", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Quickfix List", silent = true })

nmap("<leader>l", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List", silent = true })

-- ========== LSP ========== --

nmap("gd", vim.lsp.buf.definition, { desc = "Go to definition" })
nmap("gr", vim.lsp.buf.references, { desc = "Find references" })
nmap("gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
nmap("gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
nmap("K", vim.lsp.buf.hover, { desc = "Hover documentation" })
nmap("gs", vim.lsp.buf.signature_help, { desc = "Signature help" })
nmap("gl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
nmap("<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
nmap("<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- ========== WINDOW MANAGEMENT ========== --

nmap("<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
nmap("<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
nmap("<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
nmap("<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

nmap("<C-Up>", ":resize -2<CR>", { desc = "Shrink window height", silent = true })
nmap("<C-Down>", ":resize 2<CR>", { desc = "Grow window height", silent = true })
nmap("<C-Left>", ":vertical resize -2<CR>", { desc = "Shrink window width", silent = true })
nmap("<C-Right>", ":vertical resize 2<CR>", { desc = "Grow window width", silent = true })

-- Window splitting
nmap("<leader>-", ":split<CR>", { desc = "Split window below", silent = true })
nmap("<leader>\\", ":vsplit<CR>", { desc = "Split window right", silent = true })
nmap("<leader>wd", "<C-w>c", { desc = "Close window", silent = true })

-- Buffer navigation
nmap("<S-h>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
nmap("<S-l>", ":bnext<CR>", { desc = "Next buffer", silent = true })

-- ========== TELESCOPE ========== --

nmap("<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
nmap("<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Open buffers" })
nmap("<C-p>", "<cmd>Telescope buffers<CR>", { desc = "Open buffers" })
nmap("<leader>r", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
nmap("<leader>g", "<cmd>Telescope live_grep<CR>", { desc = "Grep text" })
nmap("<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })
nmap("<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
nmap("<leader>pS", "<cmd>Telescope lazy<CR>", { desc = "List plugins" })
nmap("<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics" })
nmap("<leader>dD", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })

-- ========== UI / CONFIG ========== --

nmap("<leader>;", "<cmd>Alpha<CR>", { desc = "Dashboard" })
nmap("<leader>Lc", "<cmd>edit $MYVIMRC<CR>", { desc = "Edit Neovim config" })

-- ========== FILE EXPLORER ========== --

nmap("<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- ========== TERMINAL ========== --

nmap("<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
nmap("<M-1>", "<cmd>1ToggleTerm<CR>", { desc = "Toggle terminal 1" })
nmap("<M-2>", "<cmd>2ToggleTerm<CR>", { desc = "Toggle terminal 2" })
nmap("<M-3>", "<cmd>3ToggleTerm<CR>", { desc = "Toggle terminal 3" })

-- ========== FORMAT ========== --

nmap("<leader>af", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer", silent = true })

-- ========== TESTING ========== --
nmap("<leader>tn", function()
	require("neotest").run.run()
end, { desc = "Test Nearest" })
nmap("<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test File" })
nmap("<leader>ts", function()
	require("neotest").run.run({ suite = true })
end, { desc = "Test Suite" })
nmap("<leader>to", function()
	require("neotest").output.open({ enter = true })
end, { desc = "Open Test Output" })
nmap("<leader>tS", function()
	require("neotest").summary.toggle()
end, { desc = "Toggle Test Summary" })

-- ========== HARPOON ========== --
nmap("<leader>a", function()
	require("harpoon"):list():add()
end, { desc = "Add file to harpoon" })

nmap("<leader>m", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toggle harpoon menu" })

-- Quick navigation to first 4 files
nmap("<leader>1", function()
	require("harpoon"):list():select(1)
end, { desc = "Harpoon file 1" })
nmap("<leader>2", function()
	require("harpoon"):list():select(2)
end, { desc = "Harpoon file 2" })
nmap("<leader>3", function()
	require("harpoon"):list():select(3)
end, { desc = "Harpoon file 3" })
nmap("<leader>4", function()
	require("harpoon"):list():select(4)
end, { desc = "Harpoon file 4" })

-- Navigate through the list
nmap("<leader>hp", function()
	require("harpoon"):list():prev()
end, { desc = "Previous harpoon file" })
nmap("<leader>hn", function()
	require("harpoon"):list():next()
end, { desc = "Next harpoon file" })

-- Telescope integration
nmap("<leader>fh", "<cmd>Telescope harpoon marks<CR>", { desc = "Find harpoon marks" })

-- ========== FOLDING (UFO) ========== --

nmap("zR", function()
	require("ufo").openAllFolds()
end, { desc = "Open all folds" })
nmap("zM", function()
	require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
nmap("zr", function()
	require("ufo").openFoldsExceptKinds()
end, { desc = "Open folds except kinds" })
nmap("zm", function()
	require("ufo").closeFoldsWith()
end, { desc = "Close folds with" })
nmap("zK", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Peek fold" })

-- ========== QUICKSCOPE ========== --

nmap("f", "v:lua.QuickScopeWrap('f')", { expr = true, silent = true, desc = "Enhanced f motion" })
nmap("F", "v:lua.QuickScopeWrap('F')", { expr = true, silent = true, desc = "Enhanced F motion" })
nmap("t", "v:lua.QuickScopeWrap('t')", { expr = true, silent = true, desc = "Enhanced t motion" })
nmap("T", "v:lua.QuickScopeWrap('T')", { expr = true, silent = true, desc = "Enhanced T motion" })

-- ========== GIT (GITSIGNS) ========== --

nmap("]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next hunk" })
nmap("[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous hunk" })
nmap("<leader>hs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
nmap("<leader>hr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
nmap("<leader>hS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
nmap("<leader>hu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
nmap("<leader>hp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
