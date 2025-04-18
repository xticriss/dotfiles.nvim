-- lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Trigger format_on_save on BufWritePre
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Add keymap for manual formatting in Normal mode
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n", -- Explicitly set for Normal mode
			desc = "Format buffer (Normal)",
		},
		-- Optional: Add a separate keymap for Visual mode if needed
		-- {
		--   "<leader>bf",
		--   function()
		--     require("conform").format({ async = true, lsp_fallback = true })
		--   end,
		--   mode = "v", -- Explicitly set for Visual mode
		--   desc = "Format selection (Visual)",
		-- },
	},
	opts = {
		-- Define your formatters here
		formatters_by_ft = {
			lua = { "stylua" },
			-- Use biome for these filetypes
			javascript = { "biome" },
			typescript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			json = { "biome", "prettier" }, -- Try biome first, then prettier
			yaml = { "prettier" },
			markdown = { "prettier" },
			-- Add other filetypes and formatters as needed
			["*"] = { "prettier" }, -- Fallback to prettier for unconfigured filetypes
		},

		-- Configure format-on-save
		format_on_save = {
			-- Recommended async=true for responsiveness
			-- Set async=false if you absolutely need synchronous formatting like in none-ls
			async = true,
			timeout_ms = 500, -- Stop formatting if it takes too long
			lsp_fallback = true, -- Use LSP formatter if conform fails
		},

		-- Optional: Customize formatter options
		formatters = {
			-- stylua = { -- Remove this section for stylua
			--   -- Optional: Add args like --indent-width 2
			--   args = {},
			-- },
			biome = {
				-- Optional: Specify config path or other args
				-- args = { "--config-path", "./biome.json" },
			},
			prettier = {
				-- Optional: Add args like --single-quote
				args = {},
				-- Prettier needs node_modules installed locally in the project
			},
		},
	},
	init = function()
		-- Optional: Set LazyVim formatter preference
		-- If you are using LazyVim, this tells it to use conform for formatting
		-- vim.g.lazyvim_format_on_save = false -- Disable LazyVim's default format on save
	end,
}
