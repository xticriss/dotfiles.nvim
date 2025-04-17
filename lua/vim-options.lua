-- Set tab-related options (using vim.opt instead of vim.cmd for better performance)
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.tabstop = 2            -- Set tab width to 2 spaces
vim.opt.softtabstop = 2        -- Set soft tab width to 2 spaces
vim.opt.shiftwidth = 2         -- Set shift width to 2 spaces

-- Set line numbering options
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.number = true          -- Show absolute line number for current line

-- Set clipboard and mouse options
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.mouse = "a"                -- Enable mouse support in all modes

-- Set command line height
vim.opt.cmdheight = 0          -- Hide command line when not in use

-- Set color scheme
vim.opt.background = "light"   -- Set light background for color schemes

-- Views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Faster UI rendering
vim.opt.cursorline = false     -- Disable cursor line highlighting
vim.opt.title = true           -- Set terminal title
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.signcolumn = "yes"     -- Always show sign column

-- Faster file handling
vim.opt.hidden = true          -- Allow switching buffers without saving
vim.opt.autoread = true        -- Auto reload files changed outside vim
