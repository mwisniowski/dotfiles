return {
  {
    "morhetz/gruvbox",
    priority = 1000, -- Load first
    config = function()
      local ok = pcall(function()
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
        -- override highlight groups
        vim.api.nvim_set_hl(0, "Visual", { bg = "#504945" })
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#323300", fg = "NONE", underline = false })
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "NONE", fg = "NONE", underline = false })
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f2e29", fg = "NONE", underline = false })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#1f2e29", fg = "NONE", underline = false })
        vim.api.nvim_set_hl(0, "DiagnosticError", { link = "GruvboxRed" })
        vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "GruvboxOrange" })
        vim.api.nvim_set_hl(0, "DiagnosticInfo", { link = "GruvboxBlue" })
        vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "GruvboxAqua" })
        vim.api.nvim_set_hl(0, "DiagnosticOk", { link = "GruvboxGreen" })
        vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment"})
        -- Search highlight overrides
        vim.api.nvim_set_hl(0, "Search", { link = "GruvboxYellowSign" }) -- All matches
        vim.api.nvim_set_hl(0, "IncSearch", { fg = "#fabd2f", bg = "#282828", reverse = true }) -- GruvboxYellow on GruvboxBg0
        vim.api.nvim_set_hl(0, "CurSearch", { fg = "#282828", bg = "#fabd2f", bold = true }) -- GruvboxBg0 on GruvboxYellow
      end)
      if not ok then
        vim.notify("Failed to load Gruvbox or apply highlights", vim.log.levels.ERROR)
      end
    end,
  },
}
