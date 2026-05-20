return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = { preview_width = 0.5 },
          },
          file_ignore_patterns = { ".git/", "node_modules" },
          preview = { treesitter = false },
          mappings = {
            i = {
              ["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"]   = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-l>"]   = actions.toggle_all,
            },
            n = {
              ["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"]   = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-l>"]   = actions.toggle_all,
            }
          }
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            sort_lastused = true
          }
        },
      })
    end,
  },
}
