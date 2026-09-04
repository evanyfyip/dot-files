return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
      override = function(scheme)
        -- Fix mismatched background on folder rows in the Snacks explorer:
        -- SnacksPickerDirectory links to core `Directory`, which this theme
        -- sets to editorGroupHeader.tabsBackground (a tab-bar color), so
        -- folders end up a different shade than files in the file tree.
        return {
          SnacksPickerDirectory = { fg = scheme.sideBar.foreground, bg = scheme.sideBar.background },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
