-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Cmd+s to save (VSCode-style), in normal, insert, and visual mode
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("v", "<D-s>", "<esc><cmd>w<cr>", { desc = "Save file" })
