local parsers = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "python",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "yaml",
  "markdown",
  "markdown_inline",
}

local ts_filetypes = {
  "lua",
  "vim",
  "help",
  "query",
  "python",
  "javascript",
  "typescript",
  "typescriptreact",
  "json",
  "yaml",
  "markdown",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      if vim.fn.executable("tree-sitter") == 0 then
        vim.notify(
          "nvim-treesitter needs the `tree-sitter` CLI on PATH. macOS: brew install tree-sitter-cli",
          vim.log.levels.WARN,
          { title = "nvim-treesitter" }
        )
      else
        require("nvim-treesitter").install(parsers)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ts_filetypes,
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          include_surrounding_whitespace = false,
        },
        move = { set_jumps = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local map = function(lhs, query)
        vim.keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(query, "textobjects")
        end, { desc = "Select " .. query })
      end

      map("af", "@function.outer")
      map("if", "@function.inner")
      map("ac", "@class.outer")
      map("ic", "@class.inner")
      map("aa", "@parameter.outer")
      map("ia", "@parameter.inner")
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
}
