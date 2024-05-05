-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Zoom in/out with Ctrl + +/- and Ctrl + scroll
map("n", "<C-=>", ':<C-u>exe "normal! zi"<CR>', { silent = true })
map("n", "<C-->", ':<C-u>exe "normal! zo"<CR>', { silent = true })
