return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- always show dotfiles/dotdirs (e.g. .github)
            ignored = true, -- always show gitignored files (e.g. .env)
          },
        },
      },
    },
    init = function()
      -- Make the "follow current file" row in the explorer/picker list more
      -- prominent. Scoped to the picker's own filetype so it doesn't affect
      -- cursorline in regular editing windows.
      --
      -- Snacks reuses the same picker-list buffer across opens, so `FileType`
      -- only fires once; `BufWinEnter` fires every time the buffer is shown
      -- in a (re)created window, which is what we need to re-apply the ns.
      local ns = vim.api.nvim_create_namespace("snacks_picker_follow_cursorline")
      vim.api.nvim_set_hl(ns, "CursorLine", { link = "Substitute" })

      -- Hidden/gitignored entries are shown (hidden/ignored = true above) but
      -- Snacks still dims them via PathHidden/PathIgnored (linked to NonText).
      -- Render them like normal file/dir text instead of faded.
      local function unfade_hidden_paths()
        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "SnacksPickerFile" })
        vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "SnacksPickerFile" })
      end
      unfade_hidden_paths()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = unfade_hidden_paths })

      vim.api.nvim_create_autocmd("BufWinEnter", {
        callback = function(ev)
          if vim.bo[ev.buf].filetype ~= "snacks_picker_list" then
            return
          end
          local win = vim.fn.bufwinid(ev.buf)
          if win ~= -1 then
            vim.api.nvim_win_set_hl_ns(win, ns)
          end
        end,
      })
    end,
  },
}
