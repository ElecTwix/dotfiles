vim.g.mapleader = " " -- Set leader key before Lazy
vim.opt.termguicolors = true

local config_root = vim.fn.stdpath("config")
vim.env.XDG_STATE_HOME = config_root .. "/.local/state"
local fallback_shada_dir = vim.env.XDG_STATE_HOME .. "/nvim/shada"

local function ensure_dir(dir)
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end
end

ensure_dir(fallback_shada_dir)
vim.opt.shadafile = fallback_shada_dir .. "/main.shada"

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
vim.cmd("colorscheme kanagawa")

-- auto format and import for go
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	group = format_sync_grp,
	callback = function()
		local ok, format = pcall(require, "go.format")
		if ok then
			format.goimports()
		end
	end,
})

-- save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- windows
map("n", "<leader>wv", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>wh", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- copilot

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- floating terminal
map("n", "<leader>ft", function()
	local ok, snacks = pcall(require, "snacks")
	if not ok then
		vim.notify("Snacks terminal unavailable", vim.log.levels.WARN)
		return
	end
	snacks.terminal()
end, { desc = "Terminal (cwd)" })

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

local KeyMap = require("electwix.keymaps")
KeyMap()

vim.opt.signcolumn = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3

vim.api.nvim_create_autocmd("BufAdd", {
	pattern = "*",
	callback = function()
		local bufpath = vim.fn.expand("<afile>")
		local bufnr = vim.fn.bufnr()
		-- Check if buffer has a name, the file doesn't exist,
		-- the buffer is not modified, and it's a normal file buffer (not scratch, terminal, etc.)
		if
			bufpath ~= ""
			and vim.fn.filereadable(bufpath) == 0
			and vim.api.nvim_get_option_value("modified", { scope = "local", buf = bufnr }) == false
			and vim.api.nvim_get_option_value("buftype", { scope = "local", buf = bufnr }) == ""
		then
			vim.cmd("silent! bd " .. bufnr)
		end
	end,
})

if vim.fn.has('wsl') == 1 then
	vim.opt.clipboard = "win32yank.exe"
end
