return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      debounce = 75,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-ç>",
        prev = "<M-ö>",
        dismiss = "<M-ğ>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_prev = "öö",
        jump_next = "çç",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
