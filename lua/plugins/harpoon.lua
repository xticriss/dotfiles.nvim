return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	keys = {
		{ "<S-e>", desc = "Open harpoon window" },
		{ "<leader>a", desc = "Add file to harpoon" },
		{ "<C-l>", desc = "Toggle harpoon quick menu" },
		{ "<C-h>", desc = "Harpoon select 1" },
		{ "<C-t>", desc = "Harpoon select 2" },
		{ "<C-n>", desc = "Harpoon select 3" },
		{ "<C-s>", desc = "Harpoon select 4" },
		{ "<C-S-P>", desc = "Harpoon previous" },
		{ "<C-S-N>", desc = "Harpoon next" },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- basic telescope configuration
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end
			local finder = function()
				local paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(paths, item.value)
				end

				return require("telescope.finders").new_table({
					results = paths,
				})
			end
			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = finder(),
					previewer = false,
					sorter = require("telescope.config").values.generic_sorter({}),
					layout_config = {
						height = 0.4,
						width = 0.5,
						prompt_position = "top",
						preview_cutoff = 120,
					},
					attach_mappings = function(prompt_bufnr, map)
						map("i", "<C-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_bufnr)

							table.remove(harpoon_files.items, selected_entry.index)
							current_picker:refresh(finder())
						end)
						return true
					end,
				})
				:find()
		end

		vim.keymap.set("n", "<S-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
