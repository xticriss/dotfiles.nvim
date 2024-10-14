return {
	"sindrets/diffview.nvim",
	dependencies = {
    "lewis6991/gitsigns.nvim"
  },
  config = function()
		local actions = require("diffview.actions")
    require("diffview").setup({
      keymaps = {
        view = {
          {
            "n", "]c",
            function ()
              local cursor = vim.api.nvim_win_get_cursor(0)
              vim.cmd("norm! ]c")
              if cursor[1] == vim.api.nvim_win_get_cursor(0)[1] then
                -- The cursor didn't move: go to the next entry
                actions.select_next_entry()
              end
            end,
            { desc = "Next hunk / entry" },
          },
        },
  },
    })
		require('gitsigns').setup()


    vim.keymap.set("n", ",,", "<cmd>DiffviewClose<cr>", { desc = "Close Diff" })
    vim.keymap.set("n", ",hh", "<cmd>DiffviewFileHistory<cr>", { desc = "Repo history" })
		vim.keymap.set("n", ",hf", "<cmd>DiffviewFileHistory --follow %<cr>", { desc = "File history" })
		vim.keymap.set("n", ",hl", "<Cmd>.DiffviewFileHistory --follow<CR>", { desc = "Line history" })
		vim.keymap.set("n", ",d", "<cmd>DiffviewOpen<cr>", { desc = "Repo diff" })
		vim.keymap.set("n", ",hM", function()
			vim.cmd("DiffviewOpen HEAD..origin/production")
		end, { desc = "Diff against origin/production" })
		vim.keymap.set("n", ",vh", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
	end,
}
