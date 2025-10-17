--luacheck: globals Difft

return {
	"ahkohd/difft.nvim",
	keys = {
		{
			"<leader>d",
			function()
				if Difft.is_visible() then
					Difft.hide()
				else
					Difft.diff()
				end
			end,
			desc = "Toggle Difft",
		},
	},
	config = function()
		require("difft").setup({
			command = "jj diff --no-pager", -- or "git diff"
			layout = "float", -- nil (buffer), "float", or "ivy_taller"
		})
	end,
}
