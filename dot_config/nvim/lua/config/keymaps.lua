-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>wv", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>wh", "<C-W>v", { desc = "Split window right", remap = true })

local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root() })
  return "<c-\\><c-n>"
end

map("n", "<M-v>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<M-v>", "<c-\\><c-n><cmd>close<cr>", { desc = "Enter Normal Mode" })
