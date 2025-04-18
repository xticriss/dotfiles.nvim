return {
	{
		"nvim-telescope/telescope.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local utils = require("telescope.utils")

			-- Configure Telescope itself
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					buffers = {
						show_all_buffers = true,
						sort_lastused = true,
						theme = "dropdown",
						previewer = false,
						mappings = {
							i = {
								["<c-d>"] = require("telescope.actions").delete_buffer, -- Use the action function directly
							},
							n = {
								["<c-d>"] = require("telescope.actions").delete_buffer, -- Also add for normal mode if desired
							},
						},
					},
				},
			})

			-- Load extensions
			telescope.load_extension("ui-select")

			-- Set keymaps
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ cwd = utils.buffer_dir() })
			end, { desc = "Find Files (Buffer Dir)" }) -- Added description
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
			vim.keymap.set("n", "<leader>b", function()
				builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
			end, { desc = "Find Buffers (MRU)" }) -- Moved desc to outer table for consistency
			vim.keymap.set("n", "<leader>o", builtin.oldfiles, { desc = "Find Old Files" })
			vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Show Keymaps" })
			vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Show Keymaps" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Find Git Files" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
		end,
	},
}
