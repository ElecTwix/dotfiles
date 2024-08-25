return {
  "stevearc/conform.nvim",
  optional = false,
  opts = function(_, opts)
    opts.formatters.sqlfluff = {
      args = { "lint", "--dialect=sqlite", "-" },
    }
  end,
}
