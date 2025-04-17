return {
	"pocco81/auto-save.nvim",
	event = { "InsertLeave", "TextChanged" },
	config = function()
		require("auto-save").setup({
			enabled = true,
			execution_message = {
				message = function()
					return "" -- Disable the execution message for cleaner UI
				end,
			},
			trigger_events = { "InsertLeave", "TextChanged" },
			conditions = {
				exists = true,
				filetype_is_not = {
					"neo-tree",
					"TelescopePrompt",
					"lazy",
					"mason",
				},
				modifiable = true,
			},
			write_all_buffers = false,
			on_off_commands = true,
			clean_command_line_interval = 0,
			debounce_delay = 135,
		})
	end,
}
