return {
  -- Enable blink.cmp
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter", "CmdlineEnter" },

    ---@module 'blink.cmp'
    opts = {
      -- Use built-in snippet expansion
      snippets = {
        expand = function(snippet)
          return vim.snippet.expand(snippet)
        end,
        active = function(filter)
          return vim.snippet.active(filter)
        end,
        jump = function(direction)
          vim.snippet.jump(direction)
        end,
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = false, -- Enable if you want ghost text
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      keymap = {
        preset = "enter",
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },
    },
  },
}
