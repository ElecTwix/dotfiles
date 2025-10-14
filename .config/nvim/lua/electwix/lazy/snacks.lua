return {
	{
		"folke/snacks.nvim",
		event = "VeryLazy",
		---@type snacks.Config
		opts = {
			terminal = { enabled = true },
		},
		keys = {
			{
				"<leader>cl",
				function()
					require("snacks.picker").lsp_config()
				end,
				desc = "Lsp Info",
			},
			{
				"<leader>cR",
				function()
					require("snacks.rename").rename_file()
				end,
				desc = "Rename File",
			},
			{
				"]]",
				function()
					local words = require("snacks.words")
					if words.is_enabled() then
						words.jump(vim.v.count1)
					end
				end,
				desc = "Next Reference",
			},
			{
				"[[",
				function()
					local words = require("snacks.words")
					if words.is_enabled() then
						words.jump(-vim.v.count1)
					end
				end,
				desc = "Prev Reference",
			},
			{
				"<A-n>",
				function()
					local words = require("snacks.words")
					if words.is_enabled() then
						words.jump(vim.v.count1, true)
					end
				end,
				desc = "Next Reference",
			},
			{
				"<A-p>",
				function()
					local words = require("snacks.words")
					if words.is_enabled() then
						words.jump(-vim.v.count1, true)
					end
				end,
				desc = "Prev Reference",
			},
		},
	},
}
