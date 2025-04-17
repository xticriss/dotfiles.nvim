return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  config = function()
    require('gitsigns').setup()
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
