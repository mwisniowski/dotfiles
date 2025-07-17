return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim", -- recommended for async
    },
    config = function()
      require("neotest").setup({
        adapters = {
          -- Python via pytest
          require("neotest-python")({
            -- pass extra args to pytest if you like:
            -- args = { "--log-level=DEBUG" },
            dap = { justMyCode = false },
          }),

          -- Jest for JS/TS (React, etc)
          require("neotest-jest")({
            -- adjust if your test script is custom:
            jestCommand = "bun run test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
          }),
        },
        -- optional: floating win settings
        summary = { border = "rounded" },
        floating = { border = "rounded" },
      })
    end,
  },

}
