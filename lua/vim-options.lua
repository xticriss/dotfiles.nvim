-- Set tab-related options
vim.cmd("set expandtab")       -- Use spaces instead of tabs
vim.cmd("set tabstop=2")       -- Set tab width to 2 spaces
vim.cmd("set softtabstop=2")   -- Set soft tab width to 2 spaces
vim.cmd("set shiftwidth=2")    -- Set shift width to 2 spaces

-- Set line numbering options
vim.cmd("set relativenumber")  -- Show relative line numbers
vim.wo.number = true           -- Show absolute line number for current line

-- Set clipboard and mouse options
vim.cmd("set clipboard+=unnamedplus")  -- Use system clipboard
vim.cmd(":set mouse=a")                -- Enable mouse support in all modes

-- Set command line height
vim.cmd(":set cmdheight=0")    -- Hide command line when not in use

-- Set leader key and color scheme
vim.g.mapleader = " "          -- Set leader key to space
vim.g.background = "light"     -- Set light background for color schemes
