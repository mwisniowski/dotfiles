return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gdiff", "Gcommit", "Glog", "Gwrite", "Gread", "Gblame" },
    keys = {
      { "<leader>gs", ":Git status<CR>", desc = "Git status" },
      { "<leader>gd", ":Git diff<CR>", desc = "Git diff" },
      { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
      { "<leader>gl", ":Git log<CR>", desc = "Git log" },
      { "<leader>gc", ":Git commit --verbose<CR>", desc = "Git commit" },
      { "<leader>gam", ":Git commit --amend<CR>", desc = "Amend commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gbr", ":Git branch<CR>", desc = "Git branches" },
      { "<leader>gw", ":Gwrite<CR>", desc = "Git write/stage file" },
    },
  },
}
