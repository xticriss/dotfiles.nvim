-- Duplicate current line
vim.keymap.set('n', '<C-D>', ':t. <CR>', { noremap = true, silent = true })

-- Navigate vim panes better (using silent and noremap for better performance)
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Fast buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true, desc = "Delete buffer" })
