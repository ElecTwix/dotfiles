-- Helper function to set keymaps
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Setup all keymappings
local function mapKeys()
	-- LSP mappings
	map("n", "<leader>cl", function()
		require("snacks.picker").lsp_config()
	end, { desc = "Lsp Info" })
	map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
	map("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
	map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
	map("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
	map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
	map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
	map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
	map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
	map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
	map("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
	map("n", "<leader>cR", function()
		require("snacks.rename").rename_file()
	end, { desc = "Rename File" })
	map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

	-- Word navigation (only setup when documentHighlight is supported)
	local snacks_words = require("snacks.words")
	if snacks_words.is_enabled() then
		map("n", "]]", function()
			snacks_words.jump(vim.v.count1)
		end, { desc = "Next Reference" })
		map("n", "[[", function()
			snacks_words.jump(-vim.v.count1)
		end, { desc = "Prev Reference" })
		map("n", "<a-n>", function()
			snacks_words.jump(vim.v.count1, true)
		end, { desc = "Next Reference" })
		map("n", "<a-p>", function()
			snacks_words.jump(-vim.v.count1, true)
		end, { desc = "Prev Reference" })
	end

	-- Add custom keymaps
	map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

	-- Windows
	map("n", "<leader>wv", "<C-W>s", { desc = "Split Window Below", remap = true })
	map("n", "<leader>wh", "<C-W>v", { desc = "Split Window Right", remap = true })
	map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
end

return mapKeys
