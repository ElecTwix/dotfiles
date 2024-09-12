local sql_ft = { "sqlx" }
return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    for _, ft in ipairs(sql_ft) do
      opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
      table.insert(opts.formatters_by_ft[ft], "sql_formatter")
    end
  end,
}
