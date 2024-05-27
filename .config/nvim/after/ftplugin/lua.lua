local desired_tab_size = 8

vim.opt.tabstop = desired_tab_size
vim.opt.shiftwidth = desired_tab_size
vim.opt.softtabstop = desired_tab_size

require("notify")("Tab Size set to " .. desired_tab_size, "info", { title = "Lua Settings" })
