---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-j>"] = { "10j", "SuperJump" },
    ["<C-h>"] = { "10h", "SuperJump" },
    ["<C-k>"] = { "10k", "SuperJump" },
    ["<C-l>"] = { "10l", "SuperJump" },
  },
}

-- more keybinds!

return M
