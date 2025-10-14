return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = function(bufnr)
				local disable = { go = true }
				if disable[vim.bo[bufnr].filetype] then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
			notify_on_error = false,
		},
	},
}
