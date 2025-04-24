return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		cmd = "CopilotChat",
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				auto_insert_mode = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.4,
				},
				prompts = {
					Explain = {
						prompt = "Write an explanation for the selected code as paragraphs of text.",
						system_prompt = "COPILOT_EXPLAIN",
					},
					Review = {
						prompt = "Review the selected code.",
						system_prompt = "COPILOT_REVIEW",
					},
					Fix = {
						prompt = "There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.",
					},
					Optimize = {
						prompt = "Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.",
					},
					Docs = {
						prompt = "Please add documentation comments to the selected code.",
					},
					Tests = {
						prompt = "Please generate tests for my code.",
					},
					Commit = {
						prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block. with like feat({package ( such as server )}/{module name ( such as suser )}: Title  \
					More Info ...	",
						context = "git:staged",
					},
				},
			}
		end,
		keys = {
			{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
			{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
			{
				"<leader>aa",
				function()
					return require("CopilotChat").toggle()
				end,
				desc = "Toggle (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>ax",
				function()
					return require("CopilotChat").reset()
				end,
				desc = "Clear (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>aq",
				function()
					vim.ui.input({
						prompt = "Quick Chat: ",
					}, function(input)
						if input ~= "" then
							require("CopilotChat").ask(input)
						end
					end)
				end,
				desc = "Quick Chat (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>ap",
				function()
					require("CopilotChat").select_prompt()
				end,
				desc = "Prompt Actions (CopilotChat)",
				mode = { "n", "v" },
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			chat.setup(opts)
		end,
	},
}
