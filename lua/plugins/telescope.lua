return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local utils = require("telescope.utils")

			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ cwd = utils.buffer_dir() })
			end, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>b", function()
				builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
			end, {})
			vim.keymap.set("n", "<leader>o", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>k", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
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
								["<c-d>"] = "delete_buffer",
							},
						},
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
