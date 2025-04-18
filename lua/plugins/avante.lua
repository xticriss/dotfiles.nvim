return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		provider = "claude",
		auto_suggestions_provider = "claude",
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "o3-mini",
			timeout = 30000,
			temperature = 0,
			max_tokens = 4096,
		},
		claude = {
			endpoint = "https://api.anthropic.com",
			-- claude-3-5-sonnet-20241022 -- claude-3-7-sonnet-20250219
			model = "claude-3-5-sonnet-20241022",
			temperature = 0,
			max_tokens = 8096,
		},
		gemini = {
			-- @see https://ai.google.dev/gemini-api/docs/models/gemini
			model = "gemini-2.5-pro-exp-03-25",
			-- model = "gemini-1.5-flash",
			temperature = 0,
			max_tokens = 8096,
		},
		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = false,
			minimize_diff = true,
			enable_token_counting = true,
			enable_cursor_planning_mode = true,
			enable_claude_text_editor_tool_mode = true,
		},
		mappings = {
			sidebar = {
				switch_windows = "<C-Tab>",
			},
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{ "echasnovski/mini.pick", lazy = true },
		{ "nvim-telescope/telescope.nvim", lazy = true },
		"hrsh7th/nvim-cmp",
		{ "ibhagwan/fzf-lua", lazy = true },
		"nvim-tree/nvim-web-devicons",
		{ "zbirenbaum/copilot.lua", lazy = true },
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
