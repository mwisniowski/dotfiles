-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
-- vim.g.maplocalleader = "\\"

-- Load basic config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Lazy plugin manager
require("config.lazy")
