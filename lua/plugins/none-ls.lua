return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "NullLsInfo", "NullLsLog" },
	keys = {
		{ "<leader>bf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format buffer" },
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.eslint_d
			},
			-- Automatically format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false, bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
