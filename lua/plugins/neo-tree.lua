return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-m>", ":Neotree filesystem reveal float toggle <CR>", {})
		vim.keymap.set("n", "<C-n", ":Neotree filesystem reveal float <CR>")
		vim.keymap.set("n", "<C-n>", ":Neotree right focus <CR>", {})
		vim.keymap.set("n", "<C-b>", ":Neotree buffers reveal float <CR>", {})
		vim.keymap.set("n", "<leader>ge", ":Neotree git_status reveal float <CR>", {})
		require("neo-tree").setup({
			filesystem = {
				commands = {
					avante_add_files = function(state)
						local node = state.tree:get_node()
						local filepath = node:get_id()
						local relative_path = require("avante.utils").relative_path(filepath)

						local sidebar = require("avante").get()

						local open = sidebar:is_open()
						-- ensure avante sidebar is open
						if not open then
							require("avante.api").ask()
							sidebar = require("avante").get()
						end

						sidebar.file_selector:add_selected_file(relative_path)

						-- remove neo tree buffer
						if not open then
							sidebar.file_selector:remove_selected_file("neo-tree filesystem [1]")
						end
					end,
				},
				window = {
					mappings = {
						["<C-a>"] = "avante_add_files",
					},
				},
			},
			popup_border_style = "rounded",
			window = {
				position = "float",
				popup = { -- settings that apply to float position only
					size = { height = "65%", width = "35%" },
					position = "50%", -- 50% means center it
					border = {
						style = "rounded",
					},
				},
			},
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					-- expander config, needed for nesting files
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		})
	end,
}
