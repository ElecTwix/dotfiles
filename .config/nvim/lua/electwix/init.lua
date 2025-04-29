vim.g.mapleader = " " -- Set leader key before Lazy
vim.opt.termguicolors = true

function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	local modes = type(mode) == "string" and { mode } or mode

	---@param m string
	modes = vim.tbl_filter(function(m)
		return not (keys.have and keys:have(lhs, m))
	end, modes)

	-- do not create the keymap if a lazy keys handler exists
	if #modes > 0 then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		if opts.remap and not vim.g.vscode then
			---@diagnostic disable-next-line: no-unknown
			opts.remap = nil
		end
		vim.keymap.set(modes, lhs, rhs, opts)
	end
end

require("electwix.lazy_init")
--require("electwix.keymap")
require("bufferline").setup({})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

--[[
local Terminal = require('toggleterm.terminal').Terminal

local terminals = {}
local chars = {'a', 's', 'd', 'f', 'g'}
for i, char in ipairs(chars) do
    terminals[char] = Terminal:new({ display_name = 'term ' .. char .. i, hidden = true })
end

local function _term_toggle(char)
    return function()
        terminals[char]:toggle()
    end
end

-- term
for _, char in ipairs(chars) do
    vim.keymap.set('n', '<leader>T' .. char, _term_toggle(char), { desc = 'term ' .. char })
    vim.keymap.set('t', '<leader>T' .. char, _term_toggle(char), { desc = 'term ' .. char })
end

vim.keymap.set('n', '<leader>t', _term_toggle(chars[1]), { desc = 'Term' })
vim.keymap.set('t', '<leader>t', _term_toggle(chars[1]), { desc = 'Term' })
--]]

-- exit all nvim
vim.keymap.set("n", "<leader>q", function()
	vim.cmd("qa")
end, { desc = "Quit all" })

--require('mini.completion').setup()
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.cmd("colorscheme kanagawa")

-- auto format and import for go
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})

-- save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- windows
map("n", "<leader>wv", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>wh", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

map("n", "<leader>wv", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>wh", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- copilot

-- clipboard
vim.opt.clipboard = "unnamedplus"

require("telescope").load_extension("ui-select")

-- floating terminal
map("n", "<leader>ft", function()
	Snacks.terminal()
end, { desc = "Terminal (cwd)" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({ indent = { highlight = highlight } })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

local KeyMap = require("electwix.keymaps")
KeyMap()

vim.api.nvim_create_autocmd("BufRead", {
	callback = function(ev)
		if vim.bo[ev.buf].buftype == "quickfix" then
			vim.schedule(function()
				vim.cmd([[cclose]])
				vim.cmd([[Trouble qflist open]])
			end)
		end
	end,
})
