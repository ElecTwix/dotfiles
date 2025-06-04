return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load() -- load friendly-snippets
					require("luasnip").filetype_extend("all", { "loremipsum" }) -- load loremipsum snippets from friendly-snippets
				end,
			},
		},
		build = "make install_jsregexp",
	},

	-- luasnip integration
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"Kaiser-Yang/blink-cmp-avante",
			-- ... Other dependencies
		},
		opts = {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},
			snippets = {
				preset = "luasnip",
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			fuzzy = {
				prebuilt_binaries = {
					download = true,
				},
			},
			sources = {
				-- Add 'avante' to the list
				default = { "avante", "lsp", "path", "buffer" },
				providers = {
					avante = {
						module = "blink-cmp-avante",
						name = "Avante",
						opts = {
							-- options for blink-cmp-avante
						},
					},
				},
			},
		},
	},
}
