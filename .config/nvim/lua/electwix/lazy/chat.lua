return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		cmd = "CopilotChat",
		build = "make tiktoken",
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				model = "gemini-2.5-flash-preview-04-17",
				agent = "copilot",
				chat_autocomplete = true,
				auto_insert_mode = true,
				references_display = "write",
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.4,
				},
				providers = {
					gemini = {
						prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
						prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

						get_headers = function()
							local api_key = assert(os.getenv("GEMINI_API_KEY"), "GEMINI_API_KEY env not set")
							return {
								Authorization = "Bearer " .. api_key,
								["Content-Type"] = "application/json",
							}
						end,

						get_models = function(headers)
							local response, err = require("CopilotChat.utils").curl_get(
								"https://generativelanguage.googleapis.com/v1beta/openai/models",
								{
									headers = headers,
									json_response = true,
								}
							)

							if err then
								error(err)
							end

							return vim.tbl_map(function(model)
								local id = model.id:gsub("^models/", "")
								return {
									id = id,
									name = id,
								}
							end, response.body.data)
						end,

						embed = function(inputs, headers)
							local response, err = require("CopilotChat.utils").curl_post(
								"https://generativelanguage.googleapis.com/v1beta/openai/embeddings",
								{
									headers = headers,
									json_request = true,
									json_response = true,
									body = {
										input = inputs,
										model = "text-embedding-004",
									},
								}
							)

							if err then
								error(err)
							end

							return response.body.data
						end,

						get_url = function()
							return "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions"
						end,
					},
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
				"<leader>cc",
				function()
					return require("CopilotChat").toggle()
				end,
				desc = "Toggle (CopilotChat)",
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
