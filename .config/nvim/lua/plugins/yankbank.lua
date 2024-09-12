return {}

--[[
return {
  "ptdewey/yankbank-nvim",
  dependencies = "kkharji/sqlite.lua",
  config = function()
    require("yankbank").setup({
      max_entries = 9,
      sep = "-----",
      num_behavior = "prefix",
      focus_gain_poll = true,
      persist_type = "sqlite",
      keymaps = {
        paste = "<CR>",
      },
      registers = {
        yank_register = "+",
      },
    })
  end,
}
--]]
