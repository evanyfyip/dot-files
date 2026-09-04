return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.sonokai_style = "andromeda" -- default | atlantis | andromeda | shusia | maia | espresso
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_transparent_background = 0
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
