-- Performance optimizations for Neovim
local M = {}

M.setup = function()
	-- Disable unused built-in plugins
	local disabled_built_ins = {
		"netrw",
		"netrwPlugin",
		"netrwSettings",
		"netrwFileHandlers",
		"gzip",
		"zip",
		"zipPlugin",
		"tar",
		"tarPlugin",
		"getscript",
		"getscriptPlugin",
		"vimball",
		"vimballPlugin",
		"2html_plugin",
		"logipat",
		"rrhelper",
		"spellfile_plugin",
		"matchit",
	}

	for _, plugin in pairs(disabled_built_ins) do
		vim.g["loaded_" .. plugin] = 1
	end

	-- Reduce updatetime for faster response
	vim.opt.updatetime = 250
	vim.opt.timeout = true
	vim.opt.timeoutlen = 300

	-- Disable swap and backup files
	vim.opt.swapfile = false
	vim.opt.backup = false
	vim.opt.writebackup = false

	-- Removed lazyredraw as it causes issues with Noice plugin
	-- vim.opt.lazyredraw = true

	-- Faster scrolling
	vim.opt.ttyfast = true

	-- Reduce displayed messages
	vim.opt.shortmess:append("c")

	-- Optimize syntax highlighting
	vim.opt.synmaxcol = 240

	-- Optimize for modern terminals
	vim.opt.ttimeoutlen = 10

	-- Optimize UI rendering
	vim.opt.showcmd = false
	vim.opt.ruler = false

	-- Optimize for faster startup
	vim.g.matchparen_timeout = 20
	vim.g.matchparen_insert_timeout = 20

	-- Optimize for faster completion
	vim.opt.complete:remove({ "i" })
	vim.opt.completeopt = "menuone,noselect"

	-- Optimize for faster LSP
	vim.lsp.set_log_level("ERROR")
end

return M
