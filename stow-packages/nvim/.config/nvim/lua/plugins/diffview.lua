return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>dv", ":DiffviewOpen<CR>", desc = "Open diff view" },
      { "<leader>df", ":DiffviewFileHistory<CR>", desc = "File history" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function()
    -- 	vim.api.nvim_create_user_command("Gdiff", function()
    -- 		vim.cmd("DiffviewOpen")
    -- 	end, { desc = "Alias for DiffviewOpen" })
    -- end,
  },
}
