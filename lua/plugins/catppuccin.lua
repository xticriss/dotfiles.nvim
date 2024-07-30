return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 999,
  config = function()
    vim.cmd.colorscheme("catppuccin")
    require("catppuccin").setup({
      flavour = "latte", -- latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
  end,
}
