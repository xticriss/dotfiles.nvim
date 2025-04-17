return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"lua",
					"javascript",
					"html",
					"angular",
					"bash",
					"json",
					"markdown",
					"scss",
					"css",
					"typescript",
					"yaml",
				},
				highlight = { 
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Leader>ts",
						node_incremental = "<Leader>ti",
						scope_incremental = "<Leader>tc",
						node_decremental = "<Leader>td",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = true,
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-angular",
		lazy = true,
		ft = { "typescript", "html", "angular" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
