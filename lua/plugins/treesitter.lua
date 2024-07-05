
  return {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
          ensure_installed = {"lua", "javascript", "html", "angular", "bash", "json", "markdown", "scss", "css", "typescript", "yaml"},
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },
    {
      "nvim-treesitter/nvim-treesitter-angular",
      config = function()
      end
    }
  }
