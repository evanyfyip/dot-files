return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
      { "<leader>gV", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File History (current file)" },
    },
  },
}
