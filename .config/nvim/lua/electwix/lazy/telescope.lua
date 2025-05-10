return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		terminal = { enabled = true },

		pickers = {
			find_files = {

				hidden = true,
			},
		},
	},
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },

	{ "nvim-telescope/telescope-ui-select.nvim" },
}
