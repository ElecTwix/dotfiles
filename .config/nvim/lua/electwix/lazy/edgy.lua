return {
	{
		"folke/edgy.nvim",
		keys = {
			-- increase width
			["<c-Right>"] = function(win)
				win:resize("width", 2)
			end,
			-- decrease width
			["<c-Left>"] = function(win)
				win:resize("width", -2)
			end,
			-- increase height
			["<c-Up>"] = function(win)
				win:resize("height", 2)
			end,
			-- decrease height
			["<c-Down>"] = function(win)
				win:resize("height", -2)
			end,
		},

		---@module 'edgy'
		---@param opts Edgy.Config
		opts = function(_, opts)
			for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
				opts[pos] = opts[pos] or {}
				table.insert(opts[pos], {
					ft = "snacks_terminal",
					size = { height = 0.4 },
					title = "%{b:snacks_terminal.id}: %{b:term_title}",
					filter = function(_buf, win)
						return vim.w[win].snacks_win
							and vim.w[win].snacks_win.position == pos
							and vim.w[win].snacks_win.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				})
			end
		end,
	},
}
