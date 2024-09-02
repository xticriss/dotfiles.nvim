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
	end,
}
