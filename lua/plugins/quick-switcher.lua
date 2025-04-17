return {
	"Everduin94/nvim-quick-switcher",
	config = function()
		local opts = { noremap = true, silent = true }

		local function find(file_regex, opts)
			return function()
				require("nvim-quick-switcher").find(file_regex, opts)
			end
		end

		local function inline_ts_switch(file_type, scheme)
			return function()
				require("nvim-quick-switcher").inline_ts_switch(file_type, scheme)
			end
		end

		local function find_by_fn(fn, opts)
			return function()
				require("nvim-quick-switcher").find_by_fn(fn, opts)
			end
		end

		-- Styles
		vim.keymap.set("n", "<leader>oi", find(".+css|.+scss|.+sass|.+less", { regex = true, prefix = "full" }), opts)

		-- Types
		vim.keymap.set("n", "<leader>orm", find(".+model.ts|.+models.ts|.+types.ts", { regex = true }), opts)

		-- Project Specific Keymaps
		-- * Maps keys based on project using an auto command. Ideal for reusing keymaps based on context.
		-- * Example: In Angular, `oo` switches to .component.html. In Svelte, `oo` switches to *page.svelte
		vim.api.nvim_create_autocmd({ "UIEnter" }, {
			callback = function(event)
				local is_angular = next(vim.fs.find({ "angular.json", "nx.json" }, { upward = true }))

				-- Angular
				if is_angular then
					print("Angular")
					vim.keymap.set("n", "<leader>oo", find(".component.html"), opts)
					vim.keymap.set("n", "<leader>ou", find(".component.ts"), opts)
					vim.keymap.set("n", "<leader>op", find(".module.ts"), opts)
					vim.keymap.set("n", "<leader>oy", find(".service.ts"), opts)
				end
			end,
		})
	end,
}
