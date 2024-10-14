return {
  "zaldih/themery.nvim",
  config = function ()
    require("themery").setup({
      themes = {"gruvbox", "ayu", "catppuccin"}, -- Your list of installed colorschemes.
      livePreview = true, -- Apply theme while picking. Default to true.
    })
  end
}
