-- Set leader key before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Apply performance optimizations first
require("performance").setup()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Load configurations
require("vim-options")
require("keybindings")

-- Configure lazy.nvim with performance options
require("lazy").setup({
  spec = { { import = "plugins" } },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    cache = {
      enabled = true,
    },
    checker = {
      enabled = false, -- disable automatic checks
    },
    change_detection = {
      enabled = false, -- disable change detection
    },
  },
})

