return {
	--[[
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		enabled = true,
		opts = {
			display = {
				chat = {
					intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
					show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
					auto_scroll = false,
				},
			},
			strategies = {
				chat = {
					adapter = "gemini",
					roles = {
						llm = "CodeCompanion",
						user = "Me",
					},
					keymaps = {
						close = {
							modes = {
								n = "q",
							},
							index = 3,
							callback = "keymaps.close",
							description = "Close Chat",
						},
						stop = {
							modes = {
								n = "<C-c",
							},
							index = 4,
							callback = "keymaps.stop",
							description = "Stop Request",
						},
					},
				},
			},
			inline = {
				adapter = "anthropic",
			},
		},
		keys = {
			{
				"<leader>ac",
				"<cmd>CodeCompanionActions<cr>",
				mode = { "n", "v" },
				noremap = true,
				silent = true,
				desc = "CodeCompanion actions",
			},
			{
				"<leader>aa",
				"<cmd>CodeCompanionChat Toggle<cr>",
				mode = { "n", "v" },
				noremap = true,
				silent = true,
				desc = "CodeCompanion chat",
			},
			{
				"<leader>ad",
				"<cmd>CodeCompanionChat Add<cr>",
				mode = "v",
				noremap = true,
				silent = true,
				desc = "CodeCompanion add to chat",
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
	{
		"saghen/blink.cmp",
		dependencies = { "olimorris/codecompanion.nvim", "saghen/blink.compat" },
		event = "InsertEnter",
		opts = {
			enabled = function()
				return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
			end,
			completion = {
				accept = {
					auto_brackets = {
						kind_resolution = {
							blocked_filetypes = { "typescriptreact", "javascriptreact", "vue", "codecompanion" },
						},
					},
				},
			},
			sources = {
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
			},
		},
	},
	--]]
}
